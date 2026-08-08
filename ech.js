(function () {
  'use strict';

  if (window.__CAHIT_PANEL_ENGINE_RUNNING) {
    console.warn('⚠️ Motor zaten çalışıyor!');
    return;
  }
  window.__CAHIT_PANEL_ENGINE_RUNNING = true;
  window.__CAHIT_PANEL_ENGINE_STOPPED = false;

  function log(msg, type = 'info') {
    const styles = {
      info: 'color:#58a6ff',
      success: 'color:#3fb950',
      warn: 'color:#d29922',
      err: 'color:#f85149'
    };
    console.log(`%c[Cahit Panel] ${msg}`, styles[type] || styles.info);
  }

  // User-Agent spoof (mümkün olduğu kadar)
  try {
    const ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Discord/1.0.0 Chrome/120.0.0.0 Electron/28.0.0 Safari/537.36';
    Object.defineProperty(navigator, 'userAgent', { get: () => ua, configurable: true });
    Object.defineProperty(navigator, 'platform', { get: () => 'Win32', configurable: true });
    log('User-Agent spoof aktif', 'info');
  } catch (e) {}

  function waitForWebpack(callback) {
    const checkInterval = 100;
    const maxAttempts = 100;
    let attempts = 0;

    const check = () => {
      if (attempts >= maxAttempts) {
        window.__CAHIT_PANEL_ENGINE_RUNNING = false;
        log('❌ Webpack bulunamadı!', 'err');
        return;
      }

      if (typeof window.webpackChunkdiscord_app === 'undefined') {
        attempts++;
        setTimeout(check, checkInterval);
        return;
      }

      try {
        const originalJQuery = window.$;
        delete window.$;

        const webpackRequire = window.webpackChunkdiscord_app.push([[Symbol()], {}, (require) => require]);
        window.webpackChunkdiscord_app.pop();

        if (originalJQuery) window.$ = originalJQuery;

        if (!webpackRequire || !webpackRequire.c || Object.keys(webpackRequire.c).length < 10) {
          attempts++;
          setTimeout(check, checkInterval);
          return;
        }

        callback(webpackRequire);
      } catch (error) {
        attempts++;
        setTimeout(check, checkInterval);
      }
    };

    check();
  }

  function findModule(webpackRequire, filter) {
    for (const module of Object.values(webpackRequire.c)) {
      if (module?.exports) {
        const exports = module.exports;
        if (exports.A && filter(exports.A)) return exports.A;
        if (exports.Ay && filter(exports.Ay)) return exports.Ay;
        if (exports.ZP && filter(exports.ZP)) return exports.ZP;
        if (filter(exports)) return exports;
      }
    }
    return null;
  }

  function loadStores(webpackRequire) {
    try {
      const QuestsStore = findModule(webpackRequire, m => m.__proto__?.getQuest);
      const ChannelStore = findModule(webpackRequire, m => m.__proto__?.getAllThreadsForParent);
      const GuildChannelStore = findModule(webpackRequire, m => m.getSFWDefaultChannel);
      const api = findModule(webpackRequire, m => m.Bo?.get || m.tn?.get);

      if (!QuestsStore || !api) return null;

      return { QuestsStore, ChannelStore, GuildChannelStore, api: api.Bo || api.tn || api };
    } catch (error) {
      return null;
    }
  }

  function getActiveQuests(QuestsStore) {
    const supportedTasks = ["WATCH_VIDEO", "PLAY_ON_DESKTOP", "STREAM_ON_DESKTOP", "PLAY_ACTIVITY", "WATCH_VIDEO_ON_MOBILE"];

    return [...QuestsStore.quests.values()].filter(quest => {
      const isExpired = new Date(quest.config.expiresAt).getTime() <= Date.now();
      const isCompleted = !!quest.userStatus?.completedAt;
      const isEnrolled = !!quest.userStatus?.enrolledAt;
      const taskConfig = quest.config.taskConfig ?? quest.config.taskConfigV2;
      const hasSupportedTask = supportedTasks.some(type => taskConfig?.tasks?.[type] != null);

      return isEnrolled && !isCompleted && !isExpired && hasSupportedTask;
    });
  }

  function initializeQuestState(quest) {
    const taskConfig = quest.config.taskConfig ?? quest.config.taskConfigV2;
    const supportedTasks = ["WATCH_VIDEO", "PLAY_ON_DESKTOP", "STREAM_ON_DESKTOP", "PLAY_ACTIVITY", "WATCH_VIDEO_ON_MOBILE"];
    const taskType = supportedTasks.find(type => taskConfig.tasks[type] != null);

    const taskData = taskConfig.tasks[taskType];
    const secondsNeeded = taskData?.target ?? 0;
    const currentProgress = quest.userStatus?.progress?.[taskType]?.value ?? quest.userStatus?.streamProgressSeconds ?? 0;

    return {
      quest,
      taskType,
      secondsNeeded,
      currentProgress,
      completed: currentProgress >= secondsNeeded,
      enrolledAt: new Date(quest.userStatus.enrolledAt).getTime(),
      questName: quest.config.messages.questName
    };
  }

  async function processVideoStep(state, api) {
    const { quest, secondsNeeded, currentProgress } = state;
    const speed = 1;
    const nextTime = Math.min(secondsNeeded, currentProgress + speed + Math.random());

    try {
      const res = await api.post({ url: `/quests/${quest.id}/video-progress`, body: { timestamp: nextTime } });
      state.currentProgress = nextTime;
      log(`🎥 Video [${state.questName}]: ${Math.floor(state.currentProgress)} / ${secondsNeeded}s`, 'info');

      if (res.body.completed_at !== null || state.currentProgress >= secondsNeeded) {
        state.completed = true;
        await api.post({ url: `/quests/${quest.id}/video-progress`, body: { timestamp: secondsNeeded } });
        log(`✨ ${state.questName} Tamamlandı!`, 'success');
      }
    } catch (error) {}
  }

  async function processHeartbeatStep(state, stores) {
    const { api, ChannelStore, GuildChannelStore } = stores;
    const { quest, taskType, secondsNeeded } = state;

    let channelId = ChannelStore?.getSortedPrivateChannels()?.[0]?.id;
    if (!channelId && GuildChannelStore) {
      const guilds = Object.values(GuildChannelStore.getAllGuilds());
      const voice = guilds.find(g => g?.VOCAL?.length > 0);
      if (voice) channelId = voice.VOCAL[0].channel.id;
    }

    const streamKey = channelId ? `call:${channelId}:1` : `call:${quest.id}:1`;

    try {
      const response = await api.post({
        url: `/quests/${quest.id}/heartbeat`,
        body: { stream_key: streamKey, terminal: false }
      });

      const serverProgress = response.body?.progress?.[taskType]?.value ?? 0;
      state.currentProgress = serverProgress;
      log(`▶ İlerleme [${state.questName}]: ${Math.floor(state.currentProgress)} / ${secondsNeeded}s`, 'info');

      if (state.currentProgress >= secondsNeeded) {
        await api.post({
          url: `/quests/${quest.id}/heartbeat`,
          body: { stream_key: streamKey, terminal: true }
        });
        state.completed = true;
        log(`✨ ${state.questName} Tamamlandı!`, 'success');
      }
    } catch (error) {}
  }

  async function runQuestCode(webpackRequire) {
    try {
      log('🚀 Cahit Özel Panel Motor başlatılıyor...', 'info');

      const stores = loadStores(webpackRequire);
      if (!stores) {
        log('❌ Discord modülleri bulunamadı!', 'err');
        window.__CAHIT_PANEL_ENGINE_RUNNING = false;
        return;
      }

      const activeQuests = getActiveQuests(stores.QuestsStore);
      if (activeQuests.length === 0) {
        log('🎉 Tamamlanacak aktif görev bulunamadı!', 'info');
        window.__CAHIT_PANEL_ENGINE_RUNNING = false;
        return;
      }

      const questStates = activeQuests.map(quest => initializeQuestState(quest));
      log(`📊 ${activeQuests.length} aktif görev bulundu, işleniyor...`, 'success');

      for (const state of questStates) {
        if (state.completed || window.__CAHIT_PANEL_ENGINE_STOPPED) continue;

        log(`▶ Başladı: ${state.questName} (${state.taskType})`, 'info');

        while (!state.completed && !window.__CAHIT_PANEL_ENGINE_STOPPED) {
          const isVideo = state.taskType.startsWith("WATCH_VIDEO");

          if (isVideo) {
            await processVideoStep(state, stores.api);
            if (!state.completed && !window.__CAHIT_PANEL_ENGINE_STOPPED)
              await new Promise(r => setTimeout(r, 1000 + Math.random() * 500));
          } else {
            await processHeartbeatStep(state, stores);
            if (!state.completed && !window.__CAHIT_PANEL_ENGINE_STOPPED)
              await new Promise(r => setTimeout(r, 20000 + Math.random() * 2000));
          }
        }
      }

      if (window.__CAHIT_PANEL_ENGINE_STOPPED) {
        log('⏸️ Görev motoru durduruldu.', 'warn');
      } else {
        log('🎉 Tüm görevler tamamlandı!', 'success');
      }

      window.__CAHIT_PANEL_ENGINE_RUNNING = false;
    } catch (error) {
      log(`❌ Motor hatası: ${error?.message || 'Bilinmeyen hata'}`, 'err');
      window.__CAHIT_PANEL_ENGINE_RUNNING = false;
    }
  }

  // Durdurmak için konsolda şunu yaz: window.__CAHIT_PANEL_ENGINE_STOPPED = true;
  waitForWebpack(runQuestCode);
})();
