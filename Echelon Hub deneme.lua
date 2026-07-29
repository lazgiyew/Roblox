--functions
local a = game:GetService("Players").LocalPlayer;
repeat
    task.wait()
until game:IsLoaded() and game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character and
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("Animate") and
    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and
    game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("Animator")
local b = game:GetService("Players").LocalPlayer.Character.Animate;
local c = "http://www.roblox.com/asset/?id="
local d;
if not getgenv().OrigLighting then
    getgenv().OrigLighting = game.Lighting.ClockTime
end
getgenv().AlreadyLoaded = false;
game.StarterPlayer.AllowCustomAnimations = true;
workspace:SetAttribute("RbxLegacyAnimationBlending", true)
if not getgenv().OriginalAnimations then
    getgenv().OriginalAnimations = {}
    if b:FindFirstChild("pose") then
        local e = game:GetService("Players").LocalPlayer.Character.Animate.pose:FindFirstChildOfClass("Animation")
        if e then
            OriginalAnimations[3] = e.AnimationId
        end
    end
    OriginalAnimations[1] = b.idle.Animation1.AnimationId;
    OriginalAnimations[2] = b.idle.Animation2.AnimationId;
    OriginalAnimations[4] = b.walk:FindFirstChildOfClass("Animation").AnimationId;
    OriginalAnimations[5] = b.run:FindFirstChildOfClass("Animation").AnimationId;
    OriginalAnimations[6] = b.jump:FindFirstChildOfClass("Animation").AnimationId;
    OriginalAnimations[7] = b.climb:FindFirstChildOfClass("Animation").AnimationId;
    OriginalAnimations[8] = b.fall:FindFirstChildOfClass("Animation").AnimationId;
    if b:FindFirstChild("swim") then
        OriginalAnimations[9] = b.swim:FindFirstChildOfClass("Animation").AnimationId;
        OriginalAnimations[10] = b.swimidle:FindFirstChildOfClass("Animation").AnimationId
    end
end
local function f(g)
    return getgenv().OriginalAnimations[g]
end
local h = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    h:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    h:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
local i = 0;
local j = 0;
getgenv().Settings = {
    Favorite = {},
    Custom = {
        Name = nil,
        Idle = nil,
        Idle2 = nil,
        Idle3 = nil,
        Walk = nil,
        Run = nil,
        Jump = nil,
        Climb = nil,
        Fall = nil,
        Swim = nil,
        SwimIdle = nil,
        Wave = 9527883498,
        Laugh = 507770818,
        Cheer = 507770677,
        Point = 507770453,
        Sit = 2506281703,
        Dance = 507771019,
        Dance2 = 507776043,
        Dance3 = 507777268,
        Weight = 9,
        Weight2 = 1
    },
    Chat = false,
    Day = false,
    Spy = false,
    Player,
    EmoteChat = false,
    Animate = false,
    RandomAnim = false,
    Refresh = false,
    DeathPosition,
    Noclip = false,
    RapePlayer = false,
    TwerkAss = false,
    TwerkAss2 = false,
    RandomEmote = false,
    Goto = false,
    Annoy = false,
    CopyMovement = false,
    SyncAnimations = false,
    PlayAlways = false,
    Platform = false,
    FlySpeed = 50,
    InfJump = false,
    ClickTeleport = false,
    ClickToSelect = false,
    SyncEmote = false,
    PlayerSync,
    AnimationSpeedToggle = false,
    CurrentAnimation = "",
    FreezeAnimation = false,
    FreezeEmote = false,
    EmotePrefix = "/em",
    AnimationPrefix = "/a",
    EmoteSpeed = 1,
    AnimationSpeed = 1,
    ReverseSpeed = -1,
    SelectedAnimation = "",
    LastEmote = "",
    Looped = false,
    Reversed = false,
    Time = false,
    TimePosition = 1
}
if makefolder and not isfile("Eazvy-Hub") then
    makefolder("Eazvy-Hub")
end
if isfile and not isfile("Eazvy-Hub/Animations_Settings.txt") and writefile then
    writefile('Eazvy-Hub/Animations_Settings.txt', game:GetService('HttpService'):JSONEncode(getgenv().Settings))
end
function UpdateFile()
    if writefile then
        writefile('Eazvy-Hub/Animations_Settings.txt', game:GetService('HttpService'):JSONEncode(getgenv().Settings))
    end
end
if readfile and isfile("Eazvy-Hub/Animations_Settings.txt") then
    getgenv().Settings = game:GetService('HttpService'):JSONDecode(readfile('Eazvy-Hub/Animations_Settings.txt'))
    if Settings.EmotePrefix and Settings.EmotePrefix == "/e" then
        Settings.EmotePrefix = "/em"
        UpdateFile()
    end
end
local k = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request;
local l = game:GetService('HttpService')
local function m()
    local n = {}
    local o = k({
        Url = "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId) ..
            "/servers/Public?sortOrder=Desc&limit=100"
    })
    local p = l:JSONDecode(o.Body)
    if p and p.data then
        for q, r in next, p.data do
            if type(r) == "table" and tonumber(r.playing) and tonumber(r.maxPlayers) and r.playing < r.maxPlayers then
                table.insert(n, 1, r.id)
            end
        end
    end
    if #n > 0 then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, n[math.random(1, #n)],
            game.Players.LocalPlayer)
    end
    game:GetService("TeleportService").TeleportInitFailed:Connect(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, n[math.random(1, #n)],
            game.Players.LocalPlayer)
    end)
end
function getPlayersByName(s)
    local s, t, u = string.lower(s), #s, {}
    for v, r in pairs(game:GetService('Players'):GetPlayers()) do
        if r.Name ~= game:GetService('Players').LocalPlayer then
            if s:sub(0, 1) == '@' then
                if string.sub(string.lower(r.Name), 1, t - 1) == s:sub(2) then
                    return r
                end
            else
                if string.sub(string.lower(r.Name), 1, t) == s or string.sub(string.lower(r.DisplayName), 1, t) == s then
                    return r
                end
            end
        end
    end
end



local D = {
    ['Fashion'] = 3333331310,
    ["Baby Dance"] = 4265725525,
    ["Cha-Cha"] = 6862001787,
    ['Monkey'] = 3333499508,
    ['Shuffle'] = 4349242221,
    ["Top Rock"] = 3361276673,
    ["Around Town"] = 3303391864,
    ["Fancy Feet"] = 3333432454,
    ["Hype Dance"] = 3695333486,
    ['Bodybuilder'] = 3333387824,
    ['Idol'] = 4101966434,
    ['Curtsy'] = 4555816777,
    ['Happy'] = 4841405708,
    ["Quiet Waves"] = 7465981288,
    ['Sleep'] = 4686925579,
    ["Floss Dance"] = 5917459365,
    ['Shy'] = 3337978742,
    ['Godlike'] = 3337994105,
    ["Hero Landing"] = 5104344710,
    ["High Wave"] = 5915690960,
    ['Cower'] = 4940563117,
    ['Bored'] = 5230599789,
    ["Show Dem Wrists -KSI"] = 7198989668,
    ['Celebrate'] = 3338097973,
    ['Dash'] = 582855105,
    ['Beckon'] = 5230598276,
    ['Haha'] = 3337966527,
    ["Lasso Turn - Tai Verdes"] = 7942896991,
    ["Line Dance"] = 4049037604,
    ['Shrug'] = 3334392772,
    ['Point2'] = 3344585679,
    ['Stadium'] = 3338055167,
    ['Confused'] = 4940561610,
    ['Side to Side'] = 3333136415,
    ['Old Town Road Dance - Lil Nas X"'] = 5937560570,
    ['Hello'] = 3344650532,
    ['Dolphin Dance'] = 5918726674,
    ['Samba'] = 6869766175,
    ['Break Dance'] = 5915648917,
    ["Hips Poppin' - Zara Larsson"] = 6797888062,
    ['Wake Up Call - KSI'] = 7199000883,
    ['Greatest'] = 3338042785,
    ['On The Outside - Twenty One'] = 7422779536,
    ['Boxing Punch - KSI'] = 7202863182,
    ['Sad'] = 4841407203,
    ['Flowing Breeze'] = 7465946930,
    ['Twirl'] = 3334968680,
    ['Jumping Wave'] = 4940564896,
    ['HOLIDAY Dance - Lil Nas X (LNX)'] = 5937558680,
    ['Take Me Under - Zara Larsson'] = 6797890377,
    ['Shuffle'] = 4349242221,
    ['Dizzy'] = 3361426436,
    ["Dancing' Shoes - Twenty One"] = 7404878500,
    ['Fashionable'] = 3333331310,
    ['Fast Hands'] = 4265701731,
    ['Tree'] = 4049551434,
    ['Agree'] = 4841397952,
    ['Power Blast'] = 4841403964,
    ['Swoosh'] = 3361481910,
    ['Jumping Cheer'] = 5895324424,
    ['Disagree'] = 4841401869,
    ['Rodeo Dance - Lil Nas X (LNX)'] = 5918728267,
    ["It Ain't My Fault - Zara Larsson"] = 6797891807,
    ['Rock On'] = 5915714366,
    ['Block Partier'] = 6862022283,
    ['Dorky Dance'] = 4212455378,
    ['Zombie'] = 4210116953,
    ['AOK - Tai Verdes'] = 7942885103,
    ['T'] = 3338010159,
    ['Cobra Arms - Tai Verdes'] = 7942890105,
    ['Panini Dance - Lil Nas X (LNX)'] = 5915713518,
    ['Fishing'] = 3334832150,
    ['Robot'] = 3338025566,
    ['Around Town'] = 3303391864,
    ['Saturday Dance - Twenty One'] = 7422807549,
    ['Top Rock'] = 3361276673,
    ['Keeping Time'] = 4555808220,
    ['Air Dance'] = 4555782893,
    ['Fancy Feet'] = 3333432454,
    ['Rock Guitar - Royal Blood'] = 6532134724,
    ["Borock's Rage"] = 3236842542,
    ["Ud'zal's Summoning"] = 3303161675,
    ['Y'] = 4349285876,
    ['Swan Dance'] = 7465997989,
    ['Louder'] = 3338083565,
    ['Up and Down - Twenty One'] = 7422797678,
    ['Swish'] = 3361481910,
    ['Drummer Moves - Twenty One'] = 7422527690,
    ['Sneaky'] = 3334424322,
    ['Heisman Pose'] = 3695263073,
    ['Jacks'] = 3338066331,
    ['Cha-Cha 2'] = 3695322025,
    ['BURBERRY LOLA ATTITUDE - NIMBUS'] = 10147821284,
    ['BURBERRY LOLA ATTITUDE - GEM'] = 10147815602,
    ['BURBERRY LOLA ATTITUDE - HYDRO'] = 10147823318,
    ['BURBERRY LOLA ATTITUDE - BLOOM'] = 10147817997,
    ['Superhero Reveal'] = 3695373233,
    ['Air Guitar'] = 3695300085,
    ['Dismissive Wave'] = 3333272779,
    ['Country Line Dance - Lil Nas X'] = 5915712534,
    ['Salute'] = 3333474484,
    ['Applaud'] = 5915693819,
    ['Get Out'] = 3333272779,
    ['Hwaiting (화이팅)'] = 9527885267,
    ['Annyeong (안녕)'] = 9527883498,
    ['Bunny Hop'] = 4641985101,
    ['Sandwich Dance'] = 4406555273,
    ['Hyperfast 5G Dance Move'] = 9408617181,
    ['Victory - 24kGoldn'] = 9178377686,
    ['Tantrum'] = 5104341999,
    ['Rock Star - Royal Blood'] = 10714400171,
    ['Drum Solo - Royal Blood'] = 6532839007,
    ['Drum Master - Royal Blood'] = 6531483720,
    ['High Hands'] = 9710985298,
    ['Tilt'] = 3334538554,
    ['Gashina - SUNMI'] = 9527886709,
    ['Chicken Dance'] = 4841399916,
    ["You can't sit with us - Sunmi"] = 9983520970,
    ["Frosty Flair - Tommy Hilfiger"] = 10214311282,
    ["Floor Rock Freeze - Tommy Hilfiger"] = 10214314957,
    ['Boom Boom Clap - George Ezra'] = 10370346995,
    ['Cartwheel - George Ezra'] = 10370351535,
    ['Chill Vibes - George Ezra'] = 10370353969,
    ['Sidekicks - George Ezra'] = 10370362157,
    ['The Conductor - George Ezra'] = 10370359115,
    ['Super Charge'] = 10478338114,
    ['Swag Walk'] = 10478341260,
    ['Mean Mug - Tommy Hilfiger'] = 10214317325,
    ['V Pose - Tommy Hilfiger'] = 10214319518,
    ['Uprise - Tommy Hilfiger'] = 10275008655,
    ['2 Baddies Dance Move - NCT 127'] = 12259828678,
    ['Kick It Dance Move - NCT 127'] = 12259826609,
    ['Sticker Dance Move - NCT 127'] = 12259825026,
    ['Elton John - Rock Out'] = 11753474067,
    ['Elton John - Heart Skip'] = 11309255148,
    ['Elton John - Still Standing'] = 11444443576,
    ['Elton John - Elevate'] = 11394033602,
    ['Elton John - Cat Man'] = 11444441914,
    ['Elton John - Piano Jump'] = 11453082181,
    ['Alo Yoga Pose - Triangle'] = 12507084541,
    ['Alo Yoga Pose - Warrior II'] = 12507083048,
    ['Alo Yoga Pose - Lotus Position'] = 12507085924,
    ['Alo Yoga Pose - Warrior II'] = 12507083048,
    ['Alo Yoga Pose - Triangle'] = 12507084541,
    ['TWICE-Moonlight-Sunrise'] = 12714233242,
    ['TWICE-Set-Me-Free-Dance-1'] = 12714228341,
    ['TWICE-Set-Me-Free-Dance-2'] = 12714231087,
    ['Ay-Yo-Dance-Move-NCT-127'] = 12804157977,
    ['TWICE-The-Feels'] = 12874447851,
    ['Zombie'] = 10714089137,
    ['Rise-Above-The-Chainsmokers'] = 12992262118,
    ['TWICE-What-Is-Love'] = 13327655243,
    ['Man-City-Bicycle-Kick'] = 13421057998,
    ['TWICE-Fancy'] = 13520524517,
    ['TWICE Pop by Nayeon'] = 13768941455,
    ['Tommy - Archer'] = 13823324057,
    ['TWICE-Pop-by-Nayeon'] = 13768941455,
    ['Man City Backflip'] = 13694100677,
    ['Man-City-Scorpion-Kick'] = 13694096724,
    ['Arm Twist'] = 10713968716,
    ['Tommy - Archer'] = 13823324057,
    ['YUNGBLUD – HIGH KICK'] = 14022936101,
    ['TWICE Like Ooh-Ahh'] = 14123781004,
    ['Baby Queen - Air Guitar & Knee Slide'] = 14352335202,
    ['Baby Queen - Dramatic Bow'] = 14352337694,
    ['Baby Queen - Face Frame'] = 14352340648,
    ['Baby Queen - Bouncy Twirl'] = 14352343065,
    ['Baby Queen - Strut'] = 14352362059,
    ['BLACKPINK Pink Venom - Get em Get em Get em'] = 14548619594,
    ['BLACKPINK Pink Venom - I Bring the Pain Like…'] = 14548620495,
    ['BLACKPINK Pink Venom - Straight to Ya Dome'] = 14548621256,
    ['TWICE LIKEY'] = 14899979575,
    ['TWICE Feel Special'] = 14899980745,
    ['BLACKPINK Shut Down - Part 1'] = 14901306096,
    ['BLACKPINK Shut Down - Part 2'] = 14901308987,
    ["Bone Chillin' Bop"] = 15122972413,
    ['Paris Hilton - Sliving For The Groove'] = 15392759696,
    ['Paris Hilton - Iconic IT-Grrrl'] = 15392756794,
    ['Paris Hilton - Checking My Angles'] = 15392752812,
    ['BLACKPINK JISOO Flower'] = 15439354020,
    ['BLACKPINK JENNIE You and Me'] = 15439356296,
    ['Rock n Roll'] = 15505458452,
    ['Air Guitar'] = 15505454268,
    ['Victory Dance'] = 15505456446,
    ['Flex Walk'] = 15505459811,
    ['Olivia Rodrigo Head Bop'] = 15517864808,
    ['Olivia Rodrigo good 4 u'] = 15517862739,
    ['Olivia Rodrigo Fall Back to Float'] = 15549124879,
    ["Nicki Minaj That's That Super Bass"] = 15571446961,
    ['Nicki Minaj Boom Boom Boom'] = 15571448688,
    ['Nicki Minaj Anaconda'] = 15571450952,
    ['Nicki Minaj Starships'] = 15571453761,
    ['Yungblud Happier Jump'] = 15609995579,
    ['Festive Dance'] = 15679621440,
    ['BLACKPINK LISA Money'] = 15679623052,
    ['BLACKPINK ROSÉ On The Ground'] = 15679624464,
    ['Imagine Dragons - “Bones” Dance'] = 15689279687,
    ['GloRilla - "Tomorrow" Dance'] = 15689278184,
    ['d4vd - Backflip'] = 15693621070,
    ['ericdoa - dance'] = 15698402762,
    ['Cuco - Levitate'] = 15698404340,
    ['Mean Girls Dance Break'] = 15963314052,
    ['Paris Hilton Sanasa'] = 16126469463,
    ['BLACKPINK Ice Cream'] = 16181797368,
    ['BLACKPINK Kill This Love'] = 16181798319,
    ['TWICE I GOT YOU part 1'] = 16215030041,
    ['TWICE I GOT YOU part 2'] = 16256203246,
    ["Dave's Spin Move - Glass Animals"] = 16272432203,
    ['Sol de Janeiro - Samba'] = 16270690701,
    ['Beauty Touchdown'] = 16302968986,
    ['Skadoosh Emote - Kung Fu Panda 4'] = 16371217304,
    ['Jawny - Stomp'] = 16392075853,
    ['Mae Stephens - Piano Hands'] = 16553163212,
    ['BLACKPINK Boombayah Emote'] = 16553164850,
    ['BLACKPINK DDU-DU DDU-DU'] = 16553170471,
    ['HIPMOTION - Amaarae'] = 16572740012,
    ['Mae Stephens – Arm Wave'] = 16584481352,
    ['Wanna play?'] = 16646423316,
    ['BLACKPINK-How-You-Like-That'] = 16874470507,
    ['BLACKPINK - Lovesick Girls'] = 16874472321,
    ['Mini Kong'] = 17000021306,
    ["HUGO Let's Drive!"] = 17360699557,
    ['Wisp - air guitar'] = 17370775305,
    ['Vans Ollie'] = 18305395285,
    ['Sturdy Dance - Ice Spice'] = 17746180844,
    ['Shuffle'] = 17748314784,
    ['Rolling Stones Guitar Strum'] = 18148804340,
    ['Rock Out - Bebe Rexha'] = 18225053113,
    ['SpongeBob Imaginaaation 🌈'] = 18443237526,
    ['SpongeBob Dance'] = 18443245017,
    ['Shrek Roar'] = 18524313628,
    ['Team USA Breaking Emote'] = 18526288497,
    ['NBA WNBA Fadeaway'] = 18526362841,
    ['Vroom Vroom'] = 18526397037,
    ['TMNT Dance'] = 18665811005,
    ['Olympic Dismount'] = 18665825805
}
local E = {
    Emotes = {
        Weight = 9,
        Weight2 = 1
    },

["adidas Community Animation Pack"]={
    Idle=126354114956642,
    Walk=106810508343012,
    Run=124765145869332,
    Jump=115715495289805,
    Fall=93993406355955,
    Climb=123695349157584,
    Swim=106537993816942,
    Weight=9,
    Weight2=1
},
["adidas aura animation pack"]={
    Idle=73137983344853,
    Walk=75183215343859,
    Run=123973978164540,
    Jump=129527230938281,
    Fall=99457463463495,
    Climb=140398319728398,
    Swim=119007025452432,
    Weight=9,
    Weight2=1
},
["Oldschool Animation Pack"]={
    Idle=5319922112,
    Walk=5319909330,
    Run=5319900634,
    Jump=5319917561,
    Fall=5319914476,
    Climb=5319931619,
    Swim=5319927054,
    Weight=9,
    Weight2=1
},
["Glow Motion Animation Pack"]={
    Idle=72213510878866,
    Walk=124733969277188,
    Run=91745899537026,
    Jump=126137138096765,
    Fall=76868289213402,
    Climb=122281742555667,
    Swim=78813763153341,
    Weight=9,
    Weight2=1
},
["Werewolf Animation Pack"]={
    Idle=1113752682,
    Walk=1113751657,
    Run=1113750642,
    Jump=1113752285,
    Fall=1113751889,
    Climb=1113754738,
    Swim=1113752975,
    Weight=9,
    Weight2=1
},
["Cute Girl Animation Pack"]={
    Idle=100321373375795,
    Walk=101031980656132,
    Run=72578803399745,
    Jump=85207650414717,
    Fall=130101353448515,
    Climb=107557350183906,
    Swim=138218676415236,
    Weight=9,
    Weight2=1
},
["Susie Dark World Animation Pack"]={
    Idle=112794090074764,
    Walk=106015134341100,
    Run=74543075858417,
    Jump=112875033007317,
    Fall=129485390390342,
    Climb=81122788219295,
    Swim=123522268615343,
    Weight=9,
    Weight2=1
},
["✋ Hand Stand Animation Pack"]={
    Idle=77586125583750,
    Walk=72832089418939,
    Run=114851273509397,
    Jump=138338185686443,
    Fall=71860660728173,
    Climb=97117016358828,
    Swim=105868279111567,
    Weight=9,
    Weight2=1
},
["Epic Hedge Hog Rolling Forward Animation Pack"]={
    Idle=97327338928447,
    Walk=96507846350786,
    Run=70602751410624,
    Jump=104743717325427,
    Fall=119958864841580,
    Climb=130457601474893,
    Swim=82185007970036,
    Weight=9,
    Weight2=1
},
["Angel Animation Pack"]={
    Idle=119395643858584,
    Walk=86895125963736,
    Run=121818096420255,
    Jump=118978644954562,
    Fall=122674195856309,
    Climb=89264725336081,
    Swim=75965048001352,
    Weight=9,
    Weight2=1
},
["Backwards Animation Pack"]={
    Idle=90276669150481,
    Walk=96019727982649,
    Run=136185047758383,
    Jump=117444169940248,
    Fall=132017731312442,
    Climb=128075707953485,
    Swim=132521431141455,
    Weight=9,
    Weight2=1
},
["🔵 Locked Animation Pack"]={
    Idle=98414099632236,
    Walk=103028790005061,
    Run=122742483287963,
    Jump=78861800624767,
    Fall=97874815239500,
    Climb=86909901225450,
    Swim=90853833201970,
    Weight=9,
    Weight2=1
},
["Cart racer animation pack"]={
    Idle=125247501335097,
    Walk=82882925322919,
    Run=93341051236223,
    Jump=91114053098844,
    Fall=80477334228206,
    Climb=138032701813934,
    Swim=101331144079019,
    Weight=9,
    Weight2=1
},
["Cosmonaut Animation Pack"]={
    Idle=128712377372686,
    Walk=102768966293272,
    Run=71737217064394,
    Jump=126271418849136,
    Fall=107620149289623,
    Climb=130402200579287,
    Swim=95588093036127,
    Weight=9,
    Weight2=1
},
["Hoverboard Animation Pack"]={
    Idle=108245861361861,
    Walk=125652156390898,
    Run=109690860086405,
    Jump=133536844401966,
    Fall=97891864406613,
    Climb=95950325569934,
    Swim=74062468055195,
    Weight=9,
    Weight2=1
},
["SUPER OMEGA AURA AWESOME FLOATING ANIMATION PACK"]={
    Idle=83841585042832,
    Walk=139357767876346,
    Run=113443686144533,
    Jump=72562912492586,
    Fall=138520969859341,
    Climb=134824296303247,
    Swim=76714881956458,
    Weight=9,
    Weight2=1
},
["diva catwalk animation pack"]={
    Idle=80471876212741,
    Walk=121117929456426,
    Run=137832716197852,
    Jump=132918063512911,
    Fall=106335314453017,
    Climb=127445038982197,
    Swim=88474653456506,
    Weight=9,
    Weight2=1
},
["Sassy Diva Animation Pack"]={
    Idle=82676133337668,
    Walk=117458499882006,
    Run=81806705813860,
    Jump=124771943794060,
    Fall=122718400223238,
    Climb=127561976736578,
    Swim=109639509104399,
    Weight=9,
    Weight2=1
},
["Zero Gravity Animation Pack"]={
    Idle=98526019953403,
    Walk=115027527253230,
    Run=127204619549531,
    Jump=92968984490614,
    Fall=98751413506464,
    Climb=138324405517159,
    Swim=87651028564775,
    Weight=9,
    Weight2=1
},
["🐾 Kitten Animation Pack"]={
    Idle=115112614535857,
    Walk=125603868808448,
    Run=72519484210816,
    Jump=88512474381520,
    Fall=97284688588313,
    Climb=129357992284484,
    Swim=101503131298553,
    Weight=9,
    Weight2=1
},
["Runway Animation Pack"]={
    Idle=70479328838052,
    Walk=97659754842454,
    Run=119322612899575,
    Jump=101222055898042,
    Fall=117602500262728,
    Climb=97122310777804,
    Swim=92071835653294,
    Weight=9,
    Weight2=1
},
["Cowboy Animation Pack"]={
    Idle=108273439270354,
    Walk=96753592812311,
    Run=125220380393037,
    Jump=94556015652293,
    Fall=119967896252316,
    Climb=98929849713480,
    Swim=135897932675161,
    Weight=9,
    Weight2=1
},
["Boxer Animation Pack"]={
    Idle=111168328963693,
    Walk=98583540728085,
    Run=117523685696784,
    Jump=76953204899202,
    Fall=99993371979422,
    Climb=117064830351938,
    Swim=78190861303168,
    Weight=9,
    Weight2=1
},
["Steady Animation Pack"]={
    Idle=112217471910022,
    Walk=114027290499359,
    Run=102864966716635,
    Jump=140734567392062,
    Fall=90318343545499,
    Climb=121119658724899,
    Swim=132835004091957,
    Weight=9,
    Weight2=1
},
["Gojo Animation Pack"]={
    Idle=134813682089224,
    Walk=87821304228339,
    Run=104995016710777,
    Jump=122382654252767,
    Fall=85276348290613,
    Climb=96652786730982,
    Swim=91931263516971,
    Weight=9,
    Weight2=1
},
["Endless Aura Animation Pack"]={
    Idle=72370291265693,
    Walk=100590428856100,
    Run=123264174003256,
    Jump=79652918388064,
    Fall=93289495565458,
    Climb=80570157540129,
    Swim=88619827935968,
    Weight=9,
    Weight2=1
},
["🛹Skater Animation Pack"]={
    Idle=94910599998393,
    Walk=136750898054727,
    Run=73280209872250,
    Jump=72883750852520,
    Fall=80566602616169,
    Climb=109510347698976,
    Swim=109468717300474,
    Weight=9,
    Weight2=1
},
["⛩️ Anime Ninja Animation Pack"]={
    Idle=117322572778283,
    Walk=107322817236908,
    Run=116399984119263,
    Jump=102534015865179,
    Fall=113183813313325,
    Climb=80366187739176,
    Swim=111697249639716,
    Weight=9,
    Weight2=1
},
["Sprinter Animation Pack"]={
    Idle=129794821448421,
    Walk=102423799534100,
    Run=120741731730819,
    Jump=139321637247351,
    Fall=76408670644983,
    Climb=123076402162196,
    Swim=94399444567795,
    Weight=9,
    Weight2=1
},
["Sukuna Animation Pack"]={
    Idle=130957634981411,
    Walk=128494300834784,
    Run=78528647678239,
    Jump=84377083621312,
    Fall=118855365966201,
    Climb=80376862285946,
    Swim=119301986028045,
    Weight=9,
    Weight2=1
},
["Superhero Animation Pack"]={
    Idle=84892242230776,
    Walk=104175024377272,
    Run=82091359886413,
    Jump=77146831119762,
    Fall=137988445099706,
    Climb=74966878708213,
    Swim=74586399162159,
    Weight=9,
    Weight2=1
},
["Jetpack Animation Pack"]={
    Idle=84390534059629,
    Walk=79684320300561,
    Run=134477770223842,
    Jump=140494241583728,
    Fall=76714850705040,
    Climb=110220080281015,
    Swim=114124764773919,
    Weight=9,
    Weight2=1
},
["⚔️ Sword Animation Pack"]={
    Idle=91612928120390,
    Walk=93828319908581,
    Run=100899869864325,
    Jump=139670330439968,
    Fall=71123699431770,
    Climb=97101810795146,
    Swim=107665132941282,
    Weight=9,
    Weight2=1
},
["R6 Classic Animation Pack"]={
    Idle=112610997414914,
    Walk=70576214948089,
    Run=94880650736139,
    Jump=126682008313389,
    Fall=104660521123955,
    Climb=97066738320834,
    Swim=70457868004085,
    Weight=9,
    Weight2=1
},
["Zombie Animation Pack"]={
    Idle=85530381330553,
    Walk=93884559463388,
    Run=92313972108138,
    Jump=87765049977647,
    Fall=76168312336441,
    Climb=94699622948217,
    Swim=82436897857181,
    Weight=9,
    Weight2=1
},
["Cute Kawaii Joyful Skipping Animation Pack"]={
    Idle=136652902186247,
    Walk=124508054178821,
    Run=89508416031639,
    Jump=117707477133337,
    Fall=70885465697468,
    Climb=71889027123289,
    Swim=116293732997630,
    Weight=9,
    Weight2=1
},
["No Animations Pack"]={
    Idle=125181193511446,
    Walk=98277462212808,
    Run=114909951212740,
    Jump=84385111200080,
    Fall=123565201644193,
    Climb=128704251886648,
    Swim=104642998429173,
    Weight=9,
    Weight2=1
},
["Floating Monk Animation Pack"]={
    Idle=114409046820886,
    Walk=109226229056481,
    Run=126631872419123,
    Jump=118228669756060,
    Fall=92833512327643,
    Climb=89999932938208,
    Swim=105107929301270,
    Weight=9,
    Weight2=1
},
["Moonwalk Animation Pack"]={
    Idle=76121318049646,
    Walk=99725042814253,
    Run=113834833641827,
    Jump=130295050149632,
    Fall=118482507432907,
    Climb=93633010763326,
    Swim=93035241967175,
    Weight=9,
    Weight2=1
},
["R6 Glitch Animation Pack"]={
    Idle=120460525592054,
    Walk=117987624842957,
    Run=127873314642157,
    Jump=126842611421463,
    Fall=89092455777109,
    Climb=139971034720754,
    Swim=111305807083093,
    Weight=9,
    Weight2=1
},
["Spiderman Animation Pack"]={
    Idle=128833802999916,
    Walk=123327231874170,
    Run=123290416873882,
    Jump=84470935054779,
    Fall=70468721069837,
    Climb=84370526685426,
    Swim=111854328223488,
    Weight=9,
    Weight2=1
},
["♡ kawaii anime girl pack"]={
    Idle=118402733965469,
    Walk=137873085101178,
    Run=130849350236070,
    Jump=94640150317449,
    Fall=125678285855898,
    Climb=72639448259486,
    Swim=78062527010701,
    Weight=9,
    Weight2=1
},
["😇🪽 Angel Animation Pack"]={
    Idle=85043173762737,
    Walk=89201769650144,
    Run=138287417917411,
    Jump=106183812356921,
    Fall=104600877757491,
    Climb=104660563121727,
    Swim=118177131718784,
    Weight=9,
    Weight2=1
},
["Viltrumites Flying Animation Pack"]={
    Idle=130187262756908,
    Walk=108331223894433,
    Run=127269720003300,
    Jump=139136362773426,
    Fall=85857437566559,
    Climb=95946966360302,
    Swim=85354374007735,
    Weight=9,
    Weight2=1
},
["Werewolf Animation Pack"]={
    Idle=112448597243776,
    Walk=88111482500436,
    Run=72633315151485,
    Jump=132072928509915,
    Fall=115326886898873,
    Climb=108808610194034,
    Swim=128882929872548,
    Weight=9,
    Weight2=1
},
["Kawaii Cute Sitting Crawling Animation Pack"]={
    Idle=85043259763997,
    Walk=72714357447931,
    Run=78030318702661,
    Jump=111874591484608,
    Fall=125317210954532,
    Climb=116094552115400,
    Swim=88492358919461,
    Weight=9,
    Weight2=1
},
["Submarine Animation Pack"]={
    Idle=139278328842324,
    Walk=138609648295837,
    Run=123266184961467,
    Jump=120378493328114,
    Fall=74520045155068,
    Climb=84718102996359,
    Swim=95052651456580,
    Weight=9,
    Weight2=1
},
["Retro Animation Pack"]={
    Idle=125039955341622,
    Walk=102108318439775,
    Run=127448876566162,
    Jump=136380925724923,
    Fall=93494309257306,
    Climb=97666101434286,
    Swim=123849769654965,
    Weight=9,
    Weight2=1
},
["Scene Animation Pack"]={
    Idle=99263121617065,
    Walk=72816308663861,
    Run=70506866937360,
    Jump=133573771890558,
    Fall=76401681795596,
    Climb=87721445723826,
    Swim=83466165615244,
    Weight=9,
    Weight2=1
},
["Bold Animation Pack by e.l.f."]={
    Idle=16744209868,
    Walk=16744219182,
    Run=16744214662,
    Jump=16744212581,
    Fall=16744207822,
    Climb=16744204409,
    Swim=16744217055,
    Weight=9,
    Weight2=1
},
["🤸 Gymnast Animation Pack"]={
    Idle=104935522082137,
    Walk=94059966044848,
    Run=73268079758945,
    Jump=86180233095126,
    Fall=89605916565618,
    Climb=72825837871411,
    Swim=124265588539311,
    Weight=9,
    Weight2=1
},
["Pixel Animation Pack"]={
    Idle=83601414977099,
    Walk=106101575736428,
    Run=113950930823127,
    Jump=74062611936902,
    Fall=117046113390979,
    Climb=128920161052741,
    Swim=128542030855171,
    Weight=9,
    Weight2=1
},
["Hero Animation Pack"]={
    Idle=116964893825084,
    Walk=105255164324490,
    Run=92892592310259,
    Jump=136260092234420,
    Fall=119899721683500,
    Climb=125040098002810,
    Swim=70808630477267,
    Weight=9,
    Weight2=1
},
["Godly Aura Float Effortless Animation Pack"]={
    Idle=87916455231416,
    Walk=99553849056621,
    Run=87070531998863,
    Jump=78851716703713,
    Fall=97042205482706,
    Climb=119672688948581,
    Swim=105461696576293,
    Weight=9,
    Weight2=1
},
["Lazy Animation Pack"]={
    Idle=100974800346161,
    Walk=81770058409628,
    Run=119937539407986,
    Jump=123835547151716,
    Fall=83594545888895,
    Climb=97305823889936,
    Swim=123549671785958,
    Weight=9,
    Weight2=1
},
["Retro R6 Animation Pack"]={
    Idle=83266176750359,
    Walk=78004393680195,
    Run=133634785056012,
    Jump=135436214508514,
    Fall=99407951670693,
    Climb=86171209304000,
    Swim=95143679139573,
    Weight=9,
    Weight2=1
},
["Kawaii Animation Pack"]={
    Idle=139284113672221,
    Walk=122146776836501,
    Run=114307772322044,
    Jump=121481289336077,
    Fall=119438473051601,
    Climb=98018800506974,
    Swim=90908339375985,
    Weight=9,
    Weight2=1
},
["Amazon Unboxed Animation Pack"]={
    Idle=82219139681769,
    Walk=128339543796138,
    Run=114998633936467,
    Jump=110418911914024,
    Fall=125108870423182,
    Climb=117011755848398,
    Swim=137392271797713,
    Weight=9,
    Weight2=1
},
["Skater Skate Skateboarding Animation Pack"]={
    Idle=92534282716804,
    Walk=112824118553253,
    Run=138473436115517,
    Jump=104591549489971,
    Fall=105483302176427,
    Climb=107605713236468,
    Swim=80901582984093,
    Weight=9,
    Weight2=1
},
["Cute Anime Girl Animation Pack"]={
    Idle=97636480239910,
    Walk=82514238498381,
    Run=82112908603309,
    Jump=100614095490184,
    Fall=87121667972235,
    Climb=89201279816818,
    Swim=129088619729011,
    Weight=9,
    Weight2=1
},
["🏀 Basketball Player Animation Pack"]={
    Idle=101368318030325,
    Walk=113951843125588,
    Run=132106179025149,
    Jump=90241793371893,
    Fall=104876155300412,
    Climb=123987814367405,
    Swim=82651970143356,
    Weight=9,
    Weight2=1
},
["Cute Doll Animation Pack"]={
    Idle=114032238613984,
    Walk=122990988292458,
    Run=112458319098341,
    Jump=93270740886634,
    Fall=107809460133949,
    Climb=118218893695068,
    Swim=134208912931228,
    Weight=9,
    Weight2=1
},
["Caveman Animation Pack"]={
    Idle=136169159286474,
    Walk=100596773427759,
    Run=139255138074135,
    Jump=109573345855867,
    Fall=78843930530957,
    Climb=83798007059475,
    Swim=98354942450414,
    Weight=9,
    Weight2=1
},
["Omni-Man Animation Pack"]={
    Idle=76963483989712,
    Walk=131688505226808,
    Run=91337944548015,
    Jump=125089927748581,
    Fall=126526688471731,
    Climb=79988767789057,
    Swim=115805321234365,
    Weight=9,
    Weight2=1
},
["Frieza Animation Pack"]={
    Idle=102881362305511,
    Walk=128387118174602,
    Run=78828747468431,
    Jump=93668858491558,
    Fall=131039214521623,
    Climb=127482859349460,
    Swim=133855829709999,
    Weight=9,
    Weight2=1
},
["Aura Lean Animation Pack"]={
    Idle=76463792482062,
    Walk=72606743141650,
    Run=134634120923445,
    Jump=92593563499397,
    Fall=72663643530450,
    Climb=133789124712501,
    Swim=111285353977374,
    Weight=9,
    Weight2=1
},
["Handstand Animation Pack"]={
    Idle=135912361288002,
    Walk=130594354165302,
    Run=85928026201423,
    Jump=140712685947238,
    Fall=73028141014071,
    Climb=81548277696326,
    Swim=87393278913308,
    Weight=9,
    Weight2=1
},
["Action Figure Animation Pack"]={
    Idle=123577874372546,
    Walk=120299370212012,
    Run=78557422571717,
    Jump=127654886278855,
    Fall=131264667193238,
    Climb=113815678992249,
    Swim=122004035712898,
    Weight=9,
    Weight2=1
},
["Retro Zombie Animation Pack [R6]"]={
    Idle=93853252902282,
    Walk=77864465243646,
    Run=121209272142567,
    Jump=126239971172752,
    Fall=108711747131767,
    Climb=72631711899069,
    Swim=115517779360733,
    Weight=9,
    Weight2=1
},
["Miku ☆ Live! Animation Pack"]={
    Idle=108928416280447,
    Walk=75192922676472,
    Run=115702186341667,
    Jump=74274185799648,
    Fall=116017035920895,
    Climb=97171092010967,
    Swim=76131217721465,
    Weight=9,
    Weight2=1
},
["Cheerful Animation Pack"]={
    Idle=138241110092379,
    Walk=80229093476953,
    Run=121671477770374,
    Jump=130671419404047,
    Fall=100046868607730,
    Climb=101628659210792,
    Swim=101773448754824,
    Weight=9,
    Weight2=1
},
["Bold Model Animation Pack"]={
    Idle=111929653681968,
    Walk=83396795258403,
    Run=97897064588794,
    Jump=91576450610106,
    Fall=126314823494258,
    Climb=112807781725925,
    Swim=128795818083991,
    Weight=9,
    Weight2=1
},
["Heartfelt Animation Pack"]={
    Idle=83368544562418,
    Walk=113717163388448,
    Run=115368599002947,
    Jump=126031858510212,
    Fall=122128728847345,
    Climb=88846321123903,
    Swim=82395666295332,
    Weight=9,
    Weight2=1
},
["Seizure Animation Pack"]={
    Idle=137710430385408,
    Walk=94844319116029,
    Run=111519848089795,
    Jump=103358545928997,
    Fall=120740873056634,
    Climb=113150754520706,
    Swim=76001850781429,
    Weight=9,
    Weight2=1
},
["kawaii jpop idol animation pack"]={
    Idle=111510978466887,
    Walk=75236825576153,
    Run=85985186633194,
    Jump=84221139103079,
    Fall=78061876928651,
    Climb=76505774169927,
    Swim=93396700842032,
    Weight=9,
    Weight2=1
},
["🚀Low Gravity Animation Pack"]={
    Idle=107067943798215,
    Walk=79769821278263,
    Run=125909307562681,
    Jump=78117908768638,
    Fall=136576539072157,
    Climb=117750855880534,
    Swim=85369697768840,
    Weight=9,
    Weight2=1
},
["cutie heart idle animation pack"]={
    Idle=110985355345272,
    Walk=134936779057305,
    Run=97623523061208,
    Jump=112211234292921,
    Fall=100714027972168,
    Climb=109317974744464,
    Swim=138610936366731,
    Weight=9,
    Weight2=1
},
["YBG Wallace Fairs Animation Pack"]={
    Idle=125735945647290,
    Walk=122586439250367,
    Run=114871206121597,
    Jump=133939207754445,
    Fall=111249834308597,
    Climb=117041026828115,
    Swim=125587501330262,
    Weight=9,
    Weight2=1
},
["💅 Baddie Animation Pack"]={
    Idle=140044113651389,
    Walk=75768371578847,
    Run=88517975673292,
    Jump=82718824708389,
    Fall=128715481453279,
    Climb=126365968447103,
    Swim=78317219381950,
    Weight=9,
    Weight2=1
},
["Blob Animation Pack"]={
    Idle=115590238943406,
    Walk=140119121631288,
    Run=92679583983996,
    Jump=118748479734074,
    Fall=132266976620349,
    Climb=88696097511174,
    Swim=136783093809919,
    Weight=9,
    Weight2=1
},
["crabby animation pack"]={
    Idle=92307871889456,
    Walk=78907581553577,
    Run=97445769079756,
    Jump=133426112725914,
    Fall=105378845490711,
    Climb=94863564995888,
    Swim=82777530928406,
    Weight=9,
    Weight2=1
},
["Headless Animation Pack"]={
    Idle=121326691887568,
    Walk=128005673423394,
    Run=104051354827994,
    Jump=139447598954664,
    Fall=129444204414573,
    Climb=79298459227234,
    Swim=87504885531797,
    Weight=9,
    Weight2=1
},
["Yakuza Animation Pack"]={
    Idle=72180650412503,
    Walk=106379228626182,
    Run=104216879955964,
    Jump=99996562771131,
    Fall=74792965931625,
    Climb=103114041173181,
    Swim=72492081924045,
    Weight=9,
    Weight2=1
},
["Glamorous Animation Pack"]={
    Idle=130610298520095,
    Walk=87462123481894,
    Run=70591026833677,
    Jump=125627052816815,
    Fall=76153457694003,
    Climb=86442675406345,
    Swim=133759450841966,
    Weight=9,
    Weight2=1
},
["✨ Daydreaming Aura Animation Pack"]={
    Idle=124987163648543,
    Walk=94200998369323,
    Run=102117982850618,
    Jump=117322860959393,
    Fall=85685405422085,
    Climb=126376286173318,
    Swim=74042650610851,
    Weight=9,
    Weight2=1
},
["Modern R6 Animation Pack"]={
    Idle=104406060298008,
    Walk=124988819613327,
    Run=99901926147031,
    Jump=116343198036897,
    Fall=129580654694779,
    Climb=110907985002120,
    Swim=99928806802401,
    Weight=9,
    Weight2=1
},
["Garry's Animation Pack"]={
    Idle=88144615981804,
    Walk=138884432462812,
    Run=112358977833574,
    Jump=87313977906892,
    Fall=127578931479679,
    Climb=72817701212658,
    Swim=137009629513823,
    Weight=9,
    Weight2=1
},
["Monkey Animation Pack"]={
    Idle=105276576690040,
    Walk=136060323962314,
    Run=140718527490876,
    Jump=121175674540094,
    Fall=117671681231564,
    Climb=122639532724805,
    Swim=100743458042729,
    Weight=9,
    Weight2=1
},
["Gangster Animation Pack"]={
    Idle=76457887189150,
    Walk=135367929050152,
    Run=79193713264931,
    Jump=84829577533251,
    Fall=120824508244091,
    Climb=87026455270573,
    Swim=116960734106376,
    Weight=9,
    Weight2=1
},
["Dumb Dumb animation pack"]={
    Idle=105004614594851,
    Walk=82802187852670,
    Run=94065959215233,
    Jump=95678097589635,
    Fall=139471194330271,
    Climb=74141666174470,
    Swim=128952343229653,
    Weight=9,
    Weight2=1
},
["🔫 Gun Holding Animation Pack"]={
    Idle=106777885216252,
    Walk=126634454429146,
    Run=139631982995631,
    Jump=131052864617044,
    Fall=118479821398901,
    Climb=111170622261805,
    Swim=122642792815039,
    Weight=9,
    Weight2=1
},
["Tall Animation Pack"]={
    Idle=80316629362378,
    Walk=81202202825892,
    Run=112983251470026,
    Jump=121290941194499,
    Fall=96475893909852,
    Climb=97422080907864,
    Swim=105728909041481,
    Weight=9,
    Weight2=1
},
["Kawaii Animation Pack"]={
    Idle=84721389105549,
    Walk=79177448240579,
    Run=71632541042172,
    Jump=105876388602982,
    Fall=137590039087467,
    Climb=76215614145945,
    Swim=92467188495424,
    Weight=9,
    Weight2=1
},
["Deltarune Lightner Kris Animation Pack"]={
    Idle=112314322021473,
    Walk=75167100163706,
    Run=73515954807383,
    Jump=83792898794953,
    Fall=74563033061047,
    Climb=132974827037370,
    Swim=115792973515389,
    Weight=9,
    Weight2=1
},
["Fighter Animation Pack"]={
    Idle=88016093360951,
    Walk=82800787041246,
    Run=74327884548186,
    Jump=131675266554473,
    Fall=134961140457349,
    Climb=136141293963563,
    Swim=96909954438932,
    Weight=9,
    Weight2=1
},
["Noodle Arms Animation Pack"]={
    Idle=78257012490325,
    Walk=92333999689649,
    Run=132739119494106,
    Jump=137172113225162,
    Fall=131905748438801,
    Climb=76567450707768,
    Swim=120557713298530,
    Weight=9,
    Weight2=1
},
["Meditation Animation Pack"]={
    Idle=112564785335158,
    Walk=124099546863344,
    Run=79837623908076,
    Jump=124202599816172,
    Fall=112800070418644,
    Climb=108238092814550,
    Swim=129486300275415,
    Weight=9,
    Weight2=1
},
["Go-Kart Animation pack"]={
    Idle=112711636232640,
    Walk=122646161215164,
    Run=123823067152979,
    Jump=134250065566917,
    Fall=88261158444885,
    Climb=134216348730187,
    Swim=80337827369850,
    Weight=9,
    Weight2=1
},
["Cute Animation Pack"]={
    Idle=102526860241644,
    Walk=129081631925429,
    Run=106225307541637,
    Jump=118216190885024,
    Fall=120436889637318,
    Climb=83450718624718,
    Swim=102260064079692,
    Weight=9,
    Weight2=1
},
["Kitten Animation Pack"]={
    Idle=91368074773813,
    Walk=130902706727941,
    Run=71463783759750,
    Jump=110550983978697,
    Fall=100112567743410,
    Climb=119186377296128,
    Swim=107726166499209,
    Weight=9,
    Weight2=1
},
["Bunny Animation Pack"]={
    Idle=134049040713684,
    Walk=83354815313988,
    Run=81457256061693,
    Jump=111075501642809,
    Fall=83607977709346,
    Climb=105748990569257,
    Swim=118932746831885,
    Weight=9,
    Weight2=1
},
["Sleepy Animation Pack"]={
    Idle=76391696858097,
    Walk=138972031671043,
    Run=114915062225109,
    Jump=122149724452318,
    Fall=129633598693024,
    Climb=104611191188546,
    Swim=90658324661739,
    Weight=9,
    Weight2=1
},
["Goofy Animation Pack"]={
    Idle=106124536410546,
    Walk=127440320594193,
    Run=102779725313431,
    Jump=95394891774509,
    Fall=94682389409896,
    Climb=89518194216451,
    Swim=139674360130218,
    Weight=9,
    Weight2=1
},
["KPOP Idol Aegyo Animation Pack"]={
    Idle=113229296338919,
    Walk=93589156509423,
    Run=97104827754293,
    Jump=119561921837795,
    Fall=76379618497498,
    Climb=74385452504240,
    Swim=113462143672240,
    Weight=9,
    Weight2=1
},
["Xannedo's Shy Cute Girl Animation Pack"]={
    Idle=124947494235702,
    Walk=121097002227530,
    Run=78691688818207,
    Jump=137823958042354,
    Fall=81580971895978,
    Climb=89322003411303,
    Swim=110500408713276,
    Weight=9,
    Weight2=1
},
["Powerful Animation Pack"]={
    Idle=76099739966509,
    Walk=112557609138115,
    Run=118611357161012,
    Jump=79556070243203,
    Fall=81671211782315,
    Climb=78099064261042,
    Swim=93702459398168,
    Weight=9,
    Weight2=1
},
["Nonchalant Animation Pack"]={
    Idle=102790048908078,
    Walk=72874367921780,
    Run=82838855070964,
    Jump=82959171321805,
    Fall=125286583194358,
    Climb=91771621266792,
    Swim=131824132218286,
    Weight=9,
    Weight2=1
},
["Anime Pack"]={
    Idle=118041288028130,
    Walk=104589443865922,
    Run=114349209579279,
    Jump=105560589320306,
    Fall=74983060210952,
    Climb=89681972189036,
    Swim=75214129726893,
    Weight=9,
    Weight2=1
},
["Wii Mii Animation Pack"]={
    Idle=116900641831292,
    Walk=115169133538974,
    Run=79750069528956,
    Jump=97434135279507,
    Fall=126500494584028,
    Climb=116258690753128,
    Swim=95906451272891,
    Weight=9,
    Weight2=1
},
["Rocket Animation Pack"]={
    Idle=77354196648139,
    Walk=94241087788588,
    Run=129129834370144,
    Jump=86150794217575,
    Fall=128678140364744,
    Climb=112036556935392,
    Swim=98727167575467,
    Weight=9,
    Weight2=1
},
["Chicken Animation Pack"]={
    Idle=118496702064494,
    Walk=94707864798926,
    Run=79690039022593,
    Jump=74311367470681,
    Fall=104079255409707,
    Climb=88388987528293,
    Swim=76341719721864,
    Weight=9,
    Weight2=1
},
["Mocap Animation Pack"]={
    Idle=127022995001345,
    Walk=77601109324883,
    Run=74298249451917,
    Jump=89882284821542,
    Fall=105486616755068,
    Climb=93795975867711,
    Swim=139891626000453,
    Weight=9,
    Weight2=1
},
["Hyper Animation Pack"]={
    Idle=116018108083469,
    Walk=125311986022961,
    Run=97106154511672,
    Jump=130049368677649,
    Fall=121711897282690,
    Climb=140272737132220,
    Swim=110708104733189,
    Weight=9,
    Weight2=1
},
["Shy Animation Pack"]={
    Idle=129347517585201,
    Walk=76009243841598,
    Run=76149078838674,
    Jump=97181645873929,
    Fall=74183725522491,
    Climb=101647563457055,
    Swim=135034351462030,
    Weight=9,
    Weight2=1
},
["Ghoul Animation Pack"]={
    Idle=76989014478397,
    Walk=116022874958585,
    Run=112734296077543,
    Jump=71865240269363,
    Fall=80620104261118,
    Climb=133899475603776,
    Swim=130029645154775,
    Weight=9,
    Weight2=1
},
["Floating Animation Pack"]={
    Idle=132253081802343,
    Walk=86848847379619,
    Run=82161077326096,
    Jump=135785005279309,
    Fall=74200937602556,
    Climb=131780270861622,
    Swim=123339640480297,
    Weight=9,
    Weight2=1
},
["Vampire Animation Pack"]={
    Idle=1113742618,
    Walk=1113741192,
    Run=1113740510,
    Jump=1113742359,
    Fall=1113742092,
    Climb=1113743239,
    Swim=1113742944,
    Weight=9,
    Weight2=1
},
["🌜 Dreamy Aura Animation Pack"]={
    Idle=103821987445449,
    Walk=140236552335090,
    Run=86404050564430,
    Jump=122416620253122,
    Fall=111655584291361,
    Climb=117378264371555,
    Swim=87494549118785,
    Weight=9,
    Weight2=1
},
["Silent Hill Scary Nurse Animation Pack"]={
    Idle=74283978804566,
    Walk=72086149269254,
    Run=117726505096959,
    Jump=87489514943988,
    Fall=126057025944873,
    Climb=113220020126412,
    Swim=129182184869432,
    Weight=9,
    Weight2=1
},
["Advanced R6 Animation Pack"]={
    Idle=77830269690286,
    Walk=111575206467256,
    Run=100171713967372,
    Jump=80552820935195,
    Fall=137219919980602,
    Climb=122523661081372,
    Swim=109642087798136,
    Weight=9,
    Weight2=1
},
["Puppet Animation Pack"]={
    Idle=112043426205403,
    Walk=96032337199194,
    Run=120895044312227,
    Jump=105866910188789,
    Fall=125377884073768,
    Climb=132138162794630,
    Swim=116264412396751,
    Weight=9,
    Weight2=1
},
["Upside Down Animation Pack"]={
    Idle=82027081052491,
    Walk=88035599731477,
    Run=120931980537587,
    Jump=121171309571996,
    Fall=117452286567366,
    Climb=81593155085998,
    Swim=79628858404994,
    Weight=9,
    Weight2=1
},
["Gangnam Style Animation Pack"]={
    Idle=100371144752076,
    Walk=122366220931504,
    Run=111595406837901,
    Jump=111252909962366,
    Fall=71513527507514,
    Climb=100906772081830,
    Swim=140028402383677,
    Weight=9,
    Weight2=1
},
["Jotaro Jojo Animation Pack"]={
    Idle=81556072911614,
    Walk=113476057610110,
    Run=104570035852564,
    Jump=117325143408014,
    Fall=71778694540541,
    Climb=137009731866576,
    Swim=131341710405649,
    Weight=9,
    Weight2=1
},
["flying chicken bird animation pack"]={
    Idle=125118388372151,
    Walk=125639474122941,
    Run=114464646313993,
    Jump=75621829363367,
    Fall=84615340344428,
    Climb=91810718666570,
    Swim=96185251793007,
    Weight=9,
    Weight2=1
},
["Kawaii Tsundere Animation Pack"]={
    Idle=110787343160485,
    Walk=102136272507976,
    Run=92440196072107,
    Jump=100154796590745,
    Fall=92048376586030,
    Climb=114235576408049,
    Swim=80324121805771,
    Weight=9,
    Weight2=1
},
["SCP Animation Pack"]={
    Idle=73030266464685,
    Walk=105287211960747,
    Run=131274577656424,
    Jump=102173352583011,
    Fall=103077351852694,
    Climb=93294703592043,
    Swim=113820329024206,
    Weight=9,
    Weight2=1
},
["Gyaru Animation Pack"]={
    Idle=93285939059101,
    Walk=134475730682161,
    Run=76990605488118,
    Jump=77117607881594,
    Fall=87497678199524,
    Climb=102628481691065,
    Swim=81891537510998,
    Weight=9,
    Weight2=1
},
["Flight Animation Pack"]={
    Idle=105671242944240,
    Walk=131383702287607,
    Run=83523027890890,
    Jump=128004435284622,
    Fall=79320753960497,
    Climb=70495271779816,
    Swim=106192040458450,
    Weight=9,
    Weight2=1
},
["♡ cute shy girl animation pack"]={
    Idle=129262376130469,
    Walk=75941792389306,
    Run=104910053573021,
    Jump=76112115651597,
    Fall=128034756518213,
    Climb=112015024299692,
    Swim=107402565101685,
    Weight=9,
    Weight2=1
},
["Anime Idol Animation Pack"]={
    Idle=126925605044437,
    Walk=80906454703682,
    Run=122513612184334,
    Jump=131652964524982,
    Fall=100659897444327,
    Climb=135194190132557,
    Swim=81529914821125,
    Weight=9,
    Weight2=1
},
["Aura Animation Pack"]={
    Idle=97587593965861,
    Walk=114487849400629,
    Run=134528334517704,
    Jump=87893756180698,
    Fall=88682408346096,
    Climb=118234896850812,
    Swim=130714818523606,
    Weight=9,
    Weight2=1
},
["Dr. Livesay Animation Pack"]={
    Idle=128607910263467,
    Walk=112106352564304,
    Run=130921385706080,
    Jump=102630926224901,
    Fall=102420770460839,
    Climb=108207363674419,
    Swim=104396314067569,
    Weight=9,
    Weight2=1
},
["Son Goku Animation Pack"]={
    Idle=137459284620524,
    Walk=136423511407879,
    Run=130621839900700,
    Jump=91726259965577,
    Fall=122589141661797,
    Climb=113175565949339,
    Swim=73458997866004,
    Weight=9,
    Weight2=1
},
["flying bird arm wings animation pack"]={
    Idle=123907806042465,
    Walk=90712205599553,
    Run=107808419398049,
    Jump=109272815583305,
    Fall=102046420683754,
    Climb=86567323089978,
    Swim=105848026058327,
    Weight=9,
    Weight2=1
},
["Kitty Girl Animation Pack"]={
    Idle=90351236252829,
    Walk=99318278417292,
    Run=129989338106250,
    Jump=120520640839582,
    Fall=71151626038766,
    Climb=139584701619565,
    Swim=127026976306913,
    Weight=9,
    Weight2=1
},
["💅 Diva Animation Pack"]={
    Idle=123189698667553,
    Walk=109378357549390,
    Run=109516183915724,
    Jump=81901444884268,
    Fall=94348668748494,
    Climb=113863072416354,
    Swim=80866110742556,
    Weight=9,
    Weight2=1
},
["Shy Girl Animation Pack"]={
    Idle=125549564696401,
    Walk=75238059206055,
    Run=104886822261557,
    Jump=103238290644300,
    Fall=134459032605549,
    Climb=138825724021683,
    Swim=90361999786234,
    Weight=9,
    Weight2=1
},
["Catwalk Animation Pack"]={
    Idle=129022430916292,
    Walk=109563316929211,
    Run=90678672471569,
    Jump=72524016078411,
    Fall=87608148020040,
    Climb=132152882037189,
    Swim=123145371087295,
    Weight=9,
    Weight2=1
},
["Motorcycle Riding Animation Pack"]={
    Idle=89866936331359,
    Walk=140490802786134,
    Run=89657603422195,
    Jump=103088682121999,
    Fall=114445282377923,
    Climb=106753570373552,
    Swim=127444366574477,
    Weight=9,
    Weight2=1
},
["🏴‍☠️ Pirate Captain Animation Pack"]={
    Idle=115704624794331,
    Walk=136717896399958,
    Run=120572108620181,
    Jump=129889840672216,
    Fall=101448240297616,
    Climb=115884409336663,
    Swim=113025376626211,
    Weight=9,
    Weight2=1
},
["⚡ Glitch Animation Pack"]={
    Idle=96616282361900,
    Walk=91358617758676,
    Run=99610763241007,
    Jump=110328102427493,
    Fall=137242949135834,
    Climb=93196726127064,
    Swim=132392531288132,
    Weight=9,
    Weight2=1
},
["Tall Animation Pack"]={
    Idle=140282908289444,
    Walk=123508501792913,
    Run=98056725472433,
    Jump=112077323121218,
    Fall=107913363790538,
    Climb=118708908515992,
    Swim=98393291136756,
    Weight=9,
    Weight2=1
},
["Northern Park Animation Pack"]={
    Idle=122285949459645,
    Walk=82585307333109,
    Run=85312032983727,
    Jump=117927968958455,
    Fall=116667733736281,
    Climb=84659649726854,
    Swim=139174927584316,
    Weight=9,
    Weight2=1
},
["Dog Bunny Animation Pack"]={
    Idle=117578052856086,
    Walk=86749230454596,
    Run=110363003254387,
    Jump=101207632408802,
    Fall=78381391726360,
    Climb=127535575285423,
    Swim=99773978493196,
    Weight=9,
    Weight2=1
},
["Billie Eilish Animation Pack"]={
    Idle=82009039247070,
    Walk=74056522836252,
    Run=107895705891639,
    Jump=114806832298003,
    Fall=132771121298158,
    Climb=95937554524959,
    Swim=78340083978503,
    Weight=9,
    Weight2=1
},
["R6 Aura Animation Pack"]={
    Idle=124806952672531,
    Walk=83105042264433,
    Run=130896465637299,
    Jump=102654502475002,
    Fall=74622703686105,
    Climb=94106181009660,
    Swim=119473646356383,
    Weight=9,
    Weight2=1
},
["Low Gravity Animation Pack"]={
    Idle=130225372307361,
    Walk=119617064426042,
    Run=87053518354995,
    Jump=118633113737984,
    Fall=109698889597722,
    Climb=107059222905974,
    Swim=111182530699541,
    Weight=9,
    Weight2=1
},
["Chica Animation Pack"]={
    Idle=86802764984479,
    Walk=93724839290718,
    Run=129690533274879,
    Jump=109487095300695,
    Fall=131715468870878,
    Climb=93332894243726,
    Swim=138967102160164,
    Weight=9,
    Weight2=1
},
["Monkey Crawl Animation Pack"]={
    Idle=76854538644350,
    Walk=126116026421677,
    Run=89924870675715,
    Jump=117902145064224,
    Fall=73265146721511,
    Climb=97839422835168,
    Swim=104564304811838,
    Weight=9,
    Weight2=1
},
["Spider Animation Pack 🕷️"]={
    Idle=85739786912266,
    Walk=113825059456787,
    Run=98806883577382,
    Jump=70378761242661,
    Fall=104162023136702,
    Climb=80606328863799,
    Swim=114734407280501,
    Weight=9,
    Weight2=1
},
["cute bunny rabbit animation pack"]={
    Idle=91000857932136,
    Walk=130697916629347,
    Run=103912164376296,
    Jump=86657866311208,
    Fall=105081163145793,
    Climb=140541288317705,
    Swim=110329442241509,
    Weight=9,
    Weight2=1
},
["Anime Ninja Animation Pack"]={
    Idle=107206336813176,
    Walk=72365915976703,
    Run=90192200195579,
    Jump=87813009880903,
    Fall=78637280209055,
    Climb=126557282882259,
    Swim=138639351762031,
    Weight=9,
    Weight2=1
},
["Sweet Kawaii Animation Pack"]={
    Idle=92560060952661,
    Walk=110768531278450,
    Run=140657967135462,
    Jump=93705004392870,
    Fall=104242412180677,
    Climb=88553358631324,
    Swim=103381717543647,
    Weight=9,
    Weight2=1
},
["Villian Animation Pack"]={
    Idle=110473357358997,
    Walk=97303083557520,
    Run=121187705462364,
    Jump=76591713886460,
    Fall=109202187951707,
    Climb=133031632390360,
    Swim=97316961288550,
    Weight=9,
    Weight2=1
},
["Kawaii Sad Animation Pack"]={
    Idle=101163680389666,
    Walk=90631161109698,
    Run=113965772466506,
    Jump=115667187358138,
    Fall=103367623834029,
    Climb=70940141865165,
    Swim=105441938923523,
    Weight=9,
    Weight2=1
},
["😢 Depressed Animation Pack"]={
    Idle=75286498059099,
    Walk=115480256919818,
    Run=71544124290883,
    Jump=88270261872838,
    Fall=130123175900244,
    Climb=96368436696283,
    Swim=102365254767123,
    Weight=9,
    Weight2=1
},
["cutesy kawaii heart idle animation pack"]={
    Idle=117503732397840,
    Walk=121514055632476,
    Run=130380970152469,
    Jump=76570590726581,
    Fall=93747531456266,
    Climb=138994183622945,
    Swim=127320456858203,
    Weight=9,
    Weight2=1
},
["The Worm Animation Pack"]={
    Idle=121281827951586,
    Walk=100850855096632,
    Run=128775614506405,
    Jump=86511016730357,
    Fall=121192844330467,
    Climb=110701397497547,
    Swim=129138210161557,
    Weight=9,
    Weight2=1
},
["Shy Girl Animation Pack"]={
    Idle=80372264742636,
    Walk=81390656942301,
    Run=111526476563509,
    Jump=91181802485061,
    Fall=107832134066638,
    Climb=96482551894431,
    Swim=101300090705468,
    Weight=9,
    Weight2=1
},
["Cool Skater Animation Pack"]={
    Idle=106719276226673,
    Walk=108463806882510,
    Run=118963964216879,
    Jump=138312052704226,
    Fall=70657963229126,
    Climb=121269362469254,
    Swim=81330269943678,
    Weight=9,
    Weight2=1
},
["Baddie Animation Pack"]={
    Idle=116653333559066,
    Walk=86689316159766,
    Run=110937625241049,
    Jump=101223957854536,
    Fall=124838403271703,
    Climb=75641801501738,
    Swim=98736008892307,
    Weight=9,
    Weight2=1
},
["Plastic Army Men Animation Pack"]={
    Idle=83102955101562,
    Walk=75641017050879,
    Run=87229951988929,
    Jump=112950024540870,
    Fall=84158598785934,
    Climb=98105050129197,
    Swim=125559576709485,
    Weight=9,
    Weight2=1
},
["Cute Babysitter Animation Pack"]={
    Idle=138139627523975,
    Walk=120298815866706,
    Run=134197110695051,
    Jump=116635630915746,
    Fall=89655103417848,
    Climb=74667315004933,
    Swim=118885933064575,
    Weight=9,
    Weight2=1
},
["Chill God Animation Pack"]={
    Idle=120474287901381,
    Walk=96845832136277,
    Run=110162575626175,
    Jump=76062830011259,
    Fall=102198254725389,
    Climb=140409041630978,
    Swim=91015059519223,
    Weight=9,
    Weight2=1
},
["⛩️ Anime Hero Animation Pack"]={
    Idle=103299282207604,
    Walk=92089649956514,
    Run=107528692010997,
    Jump=91836018227478,
    Fall=77265734751574,
    Climb=103091124272861,
    Swim=120925630858056,
    Weight=9,
    Weight2=1
},
["Pogo Stick Animation Pack"]={
    Idle=138797563586537,
    Walk=104698627141662,
    Run=123774410434439,
    Jump=101301562255334,
    Fall=127406482959198,
    Climb=84186940228179,
    Swim=127643988647342,
    Weight=9,
    Weight2=1
},
["[BROKEN] animation pack💔💔💔"]={
    Idle=80408991550400,
    Walk=135583543849532,
    Run=132797290891801,
    Jump=103213045651734,
    Fall=110803794287043,
    Climb=111032056468311,
    Swim=107927226258494,
    Weight=9,
    Weight2=1
},
["adorable cat girl animation pack"]={
    Idle=123149433535618,
    Walk=90212944051520,
    Run=107554652907787,
    Jump=138802125885143,
    Fall=76215199482919,
    Climb=118192264516663,
    Swim=74779174748070,
    Weight=9,
    Weight2=1
},
["Spinning Animation Pack"]={
    Idle=86860440737994,
    Walk=114850628227143,
    Run=112536795136310,
    Jump=133222061313497,
    Fall=115383908575772,
    Climb=119166109578426,
    Swim=86217613941706,
    Weight=9,
    Weight2=1
},
["Flipped Animation Pack"]={
    Idle=111715324719997,
    Walk=106061107563111,
    Run=124120689965589,
    Jump=87167197295870,
    Fall=117172419357712,
    Climb=106975088499937,
    Swim=139913254544298,
    Weight=9,
    Weight2=1
},
["Zombie Animation Pack"]={
    Idle=619535834,
    Walk=619537468,
    Run=619536621,
    Jump=619536283,
    Fall=619535616,
    Climb=619535091,
    Swim=619537096,
    Weight=9,
    Weight2=1
},
["✌ Casual Animation Pack"]={
    Idle=83510983476062,
    Walk=73549495367573,
    Run=74134888509401,
    Jump=105510822633813,
    Fall=82543219244918,
    Climb=138290105914524,
    Swim=89453170047837,
    Weight=9,
    Weight2=1
},
["Unknown Soldier Animation Pack"]={
    Idle=114025686379626,
    Walk=134886380252245,
    Run=125954149346759,
    Jump=119660079562468,
    Fall=101327424044928,
    Climb=74363443001016,
    Swim=74354024279455,
    Weight=9,
    Weight2=1
},
["🍔 Fat Animation Pack"]={
    Idle=135948543780487,
    Walk=139223587418586,
    Run=139976664477643,
    Jump=120984361520434,
    Fall=140571079316180,
    Climb=134112440574785,
    Swim=114859333114526,
    Weight=9,
    Weight2=1
},
["Standard Animation Pack"]={
    Idle=133773964630669,
    Walk=109420365864944,
    Run=99412603550531,
    Jump=99741340327782,
    Fall=128623142184884,
    Climb=75155339131835,
    Swim=112524848454512,
    Weight=9,
    Weight2=1
},
["Deltarune Ralsei Animation Pack"]={
    Idle=138147431179049,
    Walk=134512178964432,
    Run=100030622069348,
    Jump=80532310658490,
    Fall=124392668115656,
    Climb=139106200666789,
    Swim=134046117428950,
    Weight=9,
    Weight2=1
},
["Aura Floating Animation Pack"]={
    Idle=71416153951311,
    Walk=117872024171772,
    Run=120934651328369,
    Jump=81041967980579,
    Fall=130558275042782,
    Climb=100664027835484,
    Swim=117714127595601,
    Weight=9,
    Weight2=1
},
["Model Strut Animation Pack"]={
    Idle=82904232272231,
    Walk=114709058980627,
    Run=123938579295804,
    Jump=112620923795384,
    Fall=130940539321714,
    Climb=135704800548743,
    Swim=133272056686521,
    Weight=9,
    Weight2=1
},
["Wandering Ghost Animation Pack"]={
    Idle=100776755128584,
    Walk=139643694246972,
    Run=108714552253324,
    Jump=107961969467351,
    Fall=76182427728848,
    Climb=138458871147280,
    Swim=99131492985191,
    Weight=9,
    Weight2=1
},
["Masked Slasher Animation Pack"]={
    Idle=73773885116386,
    Walk=124412826823555,
    Run=71881106348683,
    Jump=102996810037511,
    Fall=131228929873479,
    Climb=92760390770977,
    Swim=92549228660507,
    Weight=9,
    Weight2=1
},
["Hold Head Animation Pack"]={
    Idle=87193256472115,
    Walk=92405791928908,
    Run=139968821766993,
    Jump=129313474634179,
    Fall=93109251815663,
    Climb=70842873158544,
    Swim=131589370490643,
    Weight=9,
    Weight2=1
},
["Animal Animation Pack"]={
    Idle=99955302753648,
    Walk=80777353730960,
    Run=98285202393652,
    Jump=104778622992335,
    Fall=101869145556635,
    Climb=125737530068698,
    Swim=137600244154602,
    Weight=9,
    Weight2=1
},
["Moonwalk Animation Pack"]={
    Idle=83302689045020,
    Walk=91487533984459,
    Run=128517249565817,
    Jump=86529191626019,
    Fall=122092645275675,
    Climb=124290962953110,
    Swim=93440332879350,
    Weight=9,
    Weight2=1
},
["Blue Speedster Animation Pack"]={
    Idle=119281837205622,
    Walk=105255799215465,
    Run=110024773802088,
    Jump=105148396706028,
    Fall=87822663134882,
    Climb=82617091466871,
    Swim=137037062282822,
    Weight=9,
    Weight2=1
},
["Roxy Animation Pack"]={
    Idle=76939815363198,
    Walk=90342407087032,
    Run=100704590536321,
    Jump=86970970527797,
    Fall=121845695111832,
    Climb=78770210912720,
    Swim=108684913068948,
    Weight=9,
    Weight2=1
},
["hovering jetpack animation pack"]={
    Idle=77608493410726,
    Walk=73571047769432,
    Run=97407018082051,
    Jump=137086007866793,
    Fall=137256156438853,
    Climb=78707892981997,
    Swim=107347125183513,
    Weight=9,
    Weight2=1
},
["Plushy Animation Pack"]={
    Idle=136472372712070,
    Walk=130244561660209,
    Run=76287925862479,
    Jump=108299105550107,
    Fall=100275827279845,
    Climb=116686782328616,
    Swim=80180306319526,
    Weight=9,
    Weight2=1
},
["Griddy Animation Pack"]={
    Idle=135552227684558,
    Walk=104826847288205,
    Run=104604186451668,
    Jump=72382414302235,
    Fall=82091812304453,
    Climb=97534384304715,
    Swim=86416832388988,
    Weight=9,
    Weight2=1
},
["🐸 Froggy Animation Pack"]={
    Idle=115911885194728,
    Walk=123276842904566,
    Run=102421049602279,
    Jump=126919247682240,
    Fall=130181388399791,
    Climb=73513783716484,
    Swim=89595617798832,
    Weight=9,
    Weight2=1
},
["Diva Animation Pack"]={
    Idle=72568889456406,
    Walk=132692856201425,
    Run=85797599924112,
    Jump=91915919626707,
    Fall=108122754155214,
    Climb=118689419913759,
    Swim=130191333764618,
    Weight=9,
    Weight2=1
},
["Cute Kawaii Animation Pack"]={
    Idle=121090681638426,
    Walk=92400420607061,
    Run=109990184916592,
    Jump=101572004083679,
    Fall=92857820032476,
    Climb=79274301646267,
    Swim=74626664006962,
    Weight=9,
    Weight2=1
},
["Cutsie Animation Pack"]={
    Idle=100435396465485,
    Walk=101781969467519,
    Run=118655344811129,
    Jump=89843799833232,
    Fall=87028119706291,
    Climb=90232469038510,
    Swim=122237384560006,
    Weight=9,
    Weight2=1
},
["Spider Animation Pack"]={
    Idle=112466965724680,
    Walk=108424853644232,
    Run=75841551285120,
    Jump=100706347195538,
    Fall=75241830583351,
    Climb=86343110170387,
    Swim=124788696828521,
    Weight=9,
    Weight2=1
},
["Super Large Animation Pack"]={
    Idle=99080693874470,
    Walk=84519556644258,
    Run=87753650721079,
    Jump=105557179627733,
    Fall=89523290696835,
    Climb=93176148548480,
    Swim=90682072651917,
    Weight=9,
    Weight2=1
},
["Zombie Animation Pack"]={
    Idle=84789326951729,
    Walk=94077353124156,
    Run=125979929424352,
    Jump=113241952534024,
    Fall=139484488154769,
    Climb=124220554506937,
    Swim=70405010012265,
    Weight=9,
    Weight2=1
},
["Gymnast Animation Pack"]={
    Idle=114351594441562,
    Walk=101379440874313,
    Run=124036555144820,
    Jump=72971926974250,
    Fall=107510699514262,
    Climb=102417905906297,
    Swim=73573239444713,
    Weight=9,
    Weight2=1
},
["🥊 Boxer Animation Pack"]={
    Idle=86862017258768,
    Walk=76576154818370,
    Run=76448325848773,
    Jump=120473986415293,
    Fall=90687673068042,
    Climb=129301715929022,
    Swim=88449239219013,
    Weight=9,
    Weight2=1
},
["Griddy Animation Pack"]={
    Idle=140498234965299,
    Walk=89530848246222,
    Run=81387054248333,
    Jump=88437783160712,
    Fall=88910789830731,
    Climb=112496569478843,
    Swim=116040472384956,
    Weight=9,
    Weight2=1
},
["Happy Animation Pack"]={
    Idle=128726557814093,
    Walk=109485855765267,
    Run=80720704847543,
    Jump=136265442090290,
    Fall=126956982534357,
    Climb=77484099918634,
    Swim=79885151719817,
    Weight=9,
    Weight2=1
},
["Jester Animation Pack V2"]={
    Idle=125486971484377,
    Walk=83905660703702,
    Run=112411097545998,
    Jump=93890558916575,
    Fall=109182594551651,
    Climb=88274257343731,
    Swim=90599101119717,
    Weight=9,
    Weight2=1
},
["R6 Animation Pack"]={
    Idle=107510976901968,
    Walk=81418689285592,
    Run=136312347048580,
    Jump=78528539300829,
    Fall=75362328318455,
    Climb=92902598283305,
    Swim=74692454929935,
    Weight=9,
    Weight2=1
},
["Marza Hedgehog Animation Pack"]={
    Idle=86352769153897,
    Walk=109833924772191,
    Run=74953609408743,
    Jump=125256665045177,
    Fall=104179213823423,
    Climb=84538837227208,
    Swim=108415927711622,
    Weight=9,
    Weight2=1
},
["Tail Wag Happy Anim Pack"]={
    Idle=127236197054344,
    Walk=122044989040112,
    Run=110611505521446,
    Jump=100895873671070,
    Fall=123757935215700,
    Climb=135961299027018,
    Swim=121567866506609,
    Weight=9,
    Weight2=1
},
["⚡ Aura Monster Animation Pack"]={
    Idle=97005849733115,
    Walk=108059497211872,
    Run=90322453935350,
    Jump=76294741518168,
    Fall=119021466179506,
    Climb=134710443503074,
    Swim=103370701275699,
    Weight=9,
    Weight2=1
},
["Piccolo DBZ Aura Farm Animation Pack"]={
    Idle=101521298022498,
    Walk=76233982405039,
    Run=86434889766832,
    Jump=97878425354727,
    Fall=93226265450238,
    Climb=119497048908131,
    Swim=79339609093643,
    Weight=9,
    Weight2=1
},
["Mad Mew Mew Animation Pack"]={
    Idle=71357763353689,
    Walk=117257128261449,
    Run=95942943077912,
    Jump=73447461442472,
    Fall=76195606825434,
    Climb=105069163737845,
    Swim=139246600546440,
    Weight=9,
    Weight2=1
},
["Woman Diva Model Doll Cutie Girl Animation Pack"]={
    Idle=73438516437449,
    Walk=94231635478017,
    Run=115293809286485,
    Jump=112452381032436,
    Fall=123530563951933,
    Climb=129755941346915,
    Swim=75193870711980,
    Weight=9,
    Weight2=1
},
["R6 Retro 2010 Animation Pack"]={
    Idle=125766793339975,
    Walk=129749410696991,
    Run=126167863102982,
    Jump=96428781605971,
    Fall=84245697389145,
    Climb=85473106449902,
    Swim=102026332503955,
    Weight=9,
    Weight2=1
},
["Happy Animation Pack 3.0"]={
    Idle=139969260588865,
    Walk=77617295956564,
    Run=140209310791454,
    Jump=94208937101914,
    Fall=88733709159369,
    Climb=78669840449533,
    Swim=100654676283603,
    Weight=9,
    Weight2=1
},
["Scooter/Bike riding animation pack"]={
    Idle=139430872415644,
    Walk=99985831361149,
    Run=135300109539439,
    Jump=118702697373032,
    Fall=130480121923310,
    Climb=92293701668396,
    Swim=121677049885627,
    Weight=9,
    Weight2=1
},
["Skateboard Riding Animation Pack"]={
    Idle=117197511240051,
    Walk=131387420395722,
    Run=110044260033395,
    Jump=91772828102812,
    Fall=96808963630679,
    Climb=130661498164819,
    Swim=84073154535104,
    Weight=9,
    Weight2=1
},
["Counter Strike Animation Pack"]={
    Idle=102236288052447,
    Walk=128326665405845,
    Run=75012566067522,
    Jump=110147118010517,
    Fall=83830802416057,
    Climb=116733319736935,
    Swim=83985968953401,
    Weight=9,
    Weight2=1
},
["Emo Sleep Deprived Animation Pack"]={
    Idle=114569156917421,
    Walk=110892082550195,
    Run=106576826308726,
    Jump=98380946957872,
    Fall=107582270115111,
    Climb=77672051201444,
    Swim=86355547457776,
    Weight=9,
    Weight2=1
},
["Playful Animation Pack"]={
    Idle=120689598353117,
    Walk=114016477467016,
    Run=100544523365436,
    Jump=120995290549560,
    Fall=71696351775083,
    Climb=130191378009701,
    Swim=112265837069377,
    Weight=9,
    Weight2=1
},
["Vampire Animation Pack"]={
    Idle=109272431056863,
    Walk=117057590015267,
    Run=89266644468053,
    Jump=134018087359069,
    Fall=81329346491758,
    Climb=114839047200583,
    Swim=93388783357088,
    Weight=9,
    Weight2=1
},
["🎈 Balloon Animation Pack"]={
    Idle=92998846391045,
    Walk=84615968528065,
    Run=101959392094535,
    Jump=126656347190479,
    Fall=82328119750416,
    Climb=87769850928023,
    Swim=97983474917601,
    Weight=9,
    Weight2=1
},
["Supermodel Animation Pack"]={
    Idle=106651085974258,
    Walk=116615129377349,
    Run=73549807435054,
    Jump=135166834278957,
    Fall=139990540732153,
    Climb=101889454537842,
    Swim=131223642555518,
    Weight=9,
    Weight2=1
},
["Gliding Impact Floating Animation Pack"]={
    Idle=110996851039338,
    Walk=96363607201663,
    Run=118749542869787,
    Jump=71582062718359,
    Fall=122127642420531,
    Climb=89341299264239,
    Swim=103289255935624,
    Weight=9,
    Weight2=1
},
["Unknown Animation Pack"]={
    Idle=121128697839457,
    Walk=76233469876459,
    Run=82251264936868,
    Jump=137478709920830,
    Fall=116271934544716,
    Climb=113149114818632,
    Swim=84382810502503,
    Weight=9,
    Weight2=1
},
["Kawaii Girl Animation Pack"]={
    Idle=132157334207835,
    Walk=134035890582064,
    Run=88716123789578,
    Jump=130513759791841,
    Fall=119729930880674,
    Climb=124855763190946,
    Swim=110414267665541,
    Weight=9,
    Weight2=1
},
["Injured Zombie Apocalypse Animation Pack"]={
    Idle=117224096048595,
    Walk=117756200313016,
    Run=83559236307261,
    Jump=79345826225184,
    Fall=74262939968531,
    Climb=123177572658624,
    Swim=101127346852555,
    Weight=9,
    Weight2=1
},
["Silly Cartoonish Animation Pack"]={
    Idle=124307194057332,
    Walk=123004159504841,
    Run=83569136751114,
    Jump=139614962653186,
    Fall=125168274625988,
    Climb=123093909829965,
    Swim=72083470781578,
    Weight=9,
    Weight2=1
},
["⛩️  Anime Ninja Animation Pack"]={
    Idle=129778269204113,
    Walk=75088330620626,
    Run=140724389861048,
    Jump=132920013446365,
    Fall=105147580534313,
    Climb=111517765013593,
    Swim=79173373847516,
    Weight=9,
    Weight2=1
},
["R6 Holdable Animation Pack"]={
    Idle=84080473900503,
    Walk=121373796216421,
    Run=79459373609440,
    Jump=102407781166435,
    Fall=96886574673301,
    Climb=129113083146679,
    Swim=126904940890409,
    Weight=9,
    Weight2=1
},
["🧙 Wizard Animation Pack"]={
    Idle=135022386561879,
    Walk=84081833249260,
    Run=78503897582808,
    Jump=96566650376156,
    Fall=100626737262630,
    Climb=124532889059060,
    Swim=92540957284078,
    Weight=9,
    Weight2=1
},
["R6 Animation Pack"]={
    Idle=111991230410929,
    Walk=103444215959002,
    Run=130759540088490,
    Jump=77524921676733,
    Fall=134206366450477,
    Climb=79125691198222,
    Swim=92507358265895,
    Weight=9,
    Weight2=1
},
["adidas Sports Animation Pack"]={
    Idle=18538150608,
    Walk=18538146480,
    Run=18538133604,
    Jump=18538153691,
    Fall=18538164337,
    Climb=18538170170,
    Swim=18538158932,
    Weight=9,
    Weight2=1
},
["Penguin Animation Pack"]={
    Idle=135111430957572,
    Walk=115341069150718,
    Run=84572365223425,
    Jump=92854477036794,
    Fall=109991994406933,
    Climb=120634484220418,
    Swim=83233336957306,
    Weight=9,
    Weight2=1
},
["Hurt Animation Pack"]={
    Idle=128842161112789,
    Walk=72564894703336,
    Run=84913614867730,
    Jump=75202669680124,
    Fall=118128207197046,
    Climb=86807590831246,
    Swim=86191265713798,
    Weight=9,
    Weight2=1
},
["Eg! Animation Pack"]={
    Idle=132589803541931,
    Walk=81663023306815,
    Run=87463198351022,
    Jump=127656803863339,
    Fall=78994450254899,
    Climb=95637028459677,
    Swim=83840056250922,
    Weight=9,
    Weight2=1
},
["Superdude Animation Pack"]={
    Idle=130195664961997,
    Walk=138431403955891,
    Run=81846381384428,
    Jump=93113905383527,
    Fall=131529107242380,
    Climb=131964679501918,
    Swim=74507039326965,
    Weight=9,
    Weight2=1
},
["🤸 Handstand Animation Pack"]={
    Idle=119718678619654,
    Walk=120779828540112,
    Run=74743923335305,
    Jump=106738358000265,
    Fall=140035581518979,
    Climb=105106152978552,
    Swim=93107206685726,
    Weight=9,
    Weight2=1
},
["Detective / Mafia Animation Pack"]={
    Idle=139109279036888,
    Walk=130318375466007,
    Run=100035784099110,
    Jump=130915975817889,
    Fall=130448881461319,
    Climb=129001808884122,
    Swim=137198611187499,
    Weight=9,
    Weight2=1
},
["Floating Aura Animation Pack"]={
    Idle=77508418361086,
    Walk=71169977946229,
    Run=97417069168118,
    Jump=100074744468537,
    Fall=70685790898331,
    Climb=88717930985048,
    Swim=120575014050992,
    Weight=9,
    Weight2=1
},
["Old R15 Animation Pack (2016)"]={
    Idle=82435394999967,
    Walk=74186359572619,
    Run=74020964944572,
    Jump=128433356734226,
    Fall=94812844919764,
    Climb=123554355952666,
    Swim=131274185512742,
    Weight=9,
    Weight2=1
},
["Swim Everywhere Animation Pack"]={
    Idle=103464832549392,
    Walk=81977029424156,
    Run=71242806154978,
    Jump=73681332138653,
    Fall=100899485404663,
    Climb=114785916083168,
    Swim=73145661352452,
    Weight=9,
    Weight2=1
},
["Female Survivor Animation Pack"]={
    Idle=138248191246392,
    Walk=124194184618732,
    Run=112387727141066,
    Jump=116356729483983,
    Fall=96606391453016,
    Climb=106216889002728,
    Swim=124372340393075,
    Weight=9,
    Weight2=1
},
["angelic dainty floating animation pack"]={
    Idle=122087124095413,
    Walk=133979848959140,
    Run=138857433670797,
    Jump=130915558062129,
    Fall=103456136433561,
    Climb=110517842631547,
    Swim=81357557460188,
    Weight=9,
    Weight2=1
},
["Basketball Animation Pack"]={
    Idle=119868463464372,
    Walk=115087863956777,
    Run=107929532403305,
    Jump=80842756584570,
    Fall=127004862928103,
    Climb=136481824489752,
    Swim=74450182271761,
    Weight=9,
    Weight2=1
},
["cutesy chibi animation pack"]={
    Idle=103179664605636,
    Walk=103849563001453,
    Run=136485344017634,
    Jump=85211239912050,
    Fall=110743159760232,
    Climb=140486275218961,
    Swim=121372042956337,
    Weight=9,
    Weight2=1
},
["Floating Sorceress Animation Pack"]={
    Idle=111256296694940,
    Walk=115354674077211,
    Run=78503530637952,
    Jump=107043538678790,
    Fall=112264236065702,
    Climb=82297610893391,
    Swim=104545192715215,
    Weight=9,
    Weight2=1
},
["Kawaii Cute Girly Animation Pack"]={
    Idle=111249376072333,
    Walk=73636981266788,
    Run=131576761090801,
    Jump=125116610868743,
    Fall=106910927390939,
    Climb=133959656651864,
    Swim=104067918460960,
    Weight=9,
    Weight2=1
},
["Cowboy Animation Pack"]={
    Idle=92230314446857,
    Walk=93332618625661,
    Run=91518205543155,
    Jump=101561510535504,
    Fall=79983001529634,
    Climb=105282331638868,
    Swim=78700855269283,
    Weight=9,
    Weight2=1
},
["Phone Texting Animation Pack"]={
    Idle=71620603848172,
    Walk=116307721458923,
    Run=139390417013762,
    Jump=70793365188189,
    Fall=107991568020375,
    Climb=86461644795896,
    Swim=132093547424687,
    Weight=9,
    Weight2=1
},
["🐰 Kawaii Cute Bunny Animation Pack"]={
    Idle=136843470687256,
    Walk=77916864238811,
    Run=85316343302379,
    Jump=82908618346687,
    Fall=97791220075273,
    Climb=114829123543835,
    Swim=131093048629595,
    Weight=9,
    Weight2=1
},
["Fighter Animation Pack"]={
    Idle=123346040357818,
    Walk=105654706420144,
    Run=79544951255000,
    Jump=105880659299299,
    Fall=104710218772614,
    Climb=119788248254453,
    Swim=88021722449442,
    Weight=9,
    Weight2=1
},
["Marionette Animation Pack"]={
    Idle=132519560653998,
    Walk=104608902563047,
    Run=127389260825032,
    Jump=136710434764714,
    Fall=114858102588438,
    Climb=131013988368375,
    Swim=75636322255776,
    Weight=9,
    Weight2=1
},
["R6 Skipping Animation Pack"]={
    Idle=88289934665255,
    Walk=92216949024179,
    Run=85475345515550,
    Jump=116707185167082,
    Fall=75704208249812,
    Climb=98916278751594,
    Swim=88539743989721,
    Weight=9,
    Weight2=1
},
["Haunted Nurse Animation Pack"]={
    Idle=126281872966479,
    Walk=135069420041263,
    Run=82991295330635,
    Jump=115458866688617,
    Fall=75547875521023,
    Climb=105139466827422,
    Swim=134557147191533,
    Weight=9,
    Weight2=1
},
["Jogging Animation Pack"]={
    Idle=76460553572896,
    Walk=135644164811331,
    Run=78606026148130,
    Jump=79196645394354,
    Fall=124269667229869,
    Climb=124133844066606,
    Swim=74618964035981,
    Weight=9,
    Weight2=1
},
["undead zombie animation pack"]={
    Idle=103972314835276,
    Walk=126660522945872,
    Run=113981647762155,
    Jump=89610966269603,
    Fall=87377099758330,
    Climb=109339313308818,
    Swim=79334873367237,
    Weight=9,
    Weight2=1
},
["Moonwalk Animation Pack"]={
    Idle=115644212180070,
    Walk=77689057586204,
    Run=131255135572286,
    Jump=131449662770117,
    Fall=103409530170311,
    Climb=101584997704464,
    Swim=137456698201526,
    Weight=9,
    Weight2=1
},
["R6 Anime Ninja Animation Pack"]={
    Idle=77013281173824,
    Walk=97266174820108,
    Run=116748223893483,
    Jump=134008909031322,
    Fall=138623109153538,
    Climb=116146299321925,
    Swim=93876184104555,
    Weight=9,
    Weight2=1
},
["Psychiatric Experiment Animation Pack"]={
    Idle=71800048659728,
    Walk=97339542131283,
    Run=125497262389481,
    Jump=127572452007672,
    Fall=132374736263828,
    Climb=100092412192440,
    Swim=85406824443955,
    Weight=9,
    Weight2=1
},
["Rockstar Animation Pack"]={
    Idle=113992785864022,
    Walk=92534125455880,
    Run=90484728038634,
    Jump=77318977519492,
    Fall=113532471709100,
    Climb=104013769504382,
    Swim=90450427709030,
    Weight=9,
    Weight2=1
},
["Catwalk Glam Animation Pack by e.l.f."]={
    Idle=101279640971758,
    Walk=103190462987721,
    Run=75036746190467,
    Jump=138641066989023,
    Fall=72706690305027,
    Climb=104741822987331,
    Swim=112231179705221,
    Weight=9,
    Weight2=1
},
["Popstar Animation Pack"]={
    Idle=94422743721931,
    Walk=98496093971070,
    Run=73741705379526,
    Jump=88598374603231,
    Fall=140066878465669,
    Climb=82281422150420,
    Swim=74488535830524,
    Weight=9,
    Weight2=1
},
["T-Pose Animation Pack"]={
    Idle=112885052432923,
    Walk=71415330898842,
    Run=123760829486377,
    Jump=104850700599620,
    Fall=102127714780780,
    Climb=73431516321046,
    Swim=133684539355843,
    Weight=9,
    Weight2=1
},
["Stealth Animation Pack"]={
    Idle=72885106395689,
    Walk=75476762486537,
    Run=97540014506397,
    Jump=102325337450666,
    Fall=134260592755409,
    Climb=127985379697339,
    Swim=83311292823335,
    Weight=9,
    Weight2=1
},
["Hoverboard Animation Pack"]={
    Idle=79037669152978,
    Walk=85683201632203,
    Run=114630914225043,
    Jump=83770254299463,
    Fall=109658464030343,
    Climb=108655251205230,
    Swim=129121436288321,
    Weight=9,
    Weight2=1
},
["Tall Animation Pack"]={
    Idle=87713303429702,
    Walk=120077848943018,
    Run=101504437712772,
    Jump=124496253908049,
    Fall=110652926970380,
    Climb=91501468857552,
    Swim=118166841328113,
    Weight=9,
    Weight2=1
},
["Vegeta DBZ Animation Pack"]={
    Idle=100092438972559,
    Walk=95236990535814,
    Run=106688973017055,
    Jump=76560195747903,
    Fall=104579263759378,
    Climb=110331412757519,
    Swim=112405171778731,
    Weight=9,
    Weight2=1
},
["Fort Builder Animation Pack"]={
    Idle=79698115947760,
    Walk=100688708360268,
    Run=106340645503053,
    Jump=71812189607163,
    Fall=98155788475578,
    Climb=86321368573653,
    Swim=137052622943493,
    Weight=9,
    Weight2=1
},
["Invincible Man Animation Pack"]={
    Idle=126199839982819,
    Walk=72302146674889,
    Run=77336325388034,
    Jump=78428512015441,
    Fall=120844609688307,
    Climb=131367802780833,
    Swim=100693224338544,
    Weight=9,
    Weight2=1
},
["Possessed Animation Pack"]={
    Idle=132677802125982,
    Walk=70378603117320,
    Run=81570969506282,
    Jump=122430127025476,
    Fall=99586632571265,
    Climb=82695877474917,
    Swim=95759016266750,
    Weight=9,
    Weight2=1
},
["Michael Jackson Animation Pack"]={
    Idle=128388099420728,
    Walk=78641754903578,
    Run=126605711243063,
    Jump=119818721420571,
    Fall=133604364124954,
    Climb=82534825434147,
    Swim=90189340554296,
    Weight=9,
    Weight2=1
},
["Corrupted / Glitched Animation Pack"]={
    Idle=132530736168527,
    Walk=95604564815120,
    Run=87571084414292,
    Jump=71865969022310,
    Fall=138978820300738,
    Climb=114479897512899,
    Swim=77438513752906,
    Weight=9,
    Weight2=1
},
["⚽ Soccer (Football) Animation Pack"]={
    Idle=74136159555416,
    Walk=102957581890878,
    Run=77111984845556,
    Jump=93857568370592,
    Fall=71413261703275,
    Climb=73514896460390,
    Swim=119960898183386,
    Weight=9,
    Weight2=1
},
["Static Miku VOCALOID Animation Pack"]={
    Idle=93121794610059,
    Walk=131511740176207,
    Run=116463118547966,
    Jump=90642063655260,
    Fall=123072416034180,
    Climb=126163675183654,
    Swim=90976875809431,
    Weight=9,
    Weight2=1
},
["handcuff criminal animation pack"]={
    Idle=106719883105142,
    Walk=115271576888863,
    Run=123957813638283,
    Jump=111154124614892,
    Fall=114928426166806,
    Climb=127703908927799,
    Swim=76476538376094,
    Weight=9,
    Weight2=1
},
["Uncanny Alien Animation Pack"]={
    Idle=91289201171947,
    Walk=76357847027699,
    Run=132615629210141,
    Jump=77444209285892,
    Fall=137957686196687,
    Climb=140273518308664,
    Swim=89566960443945,
    Weight=9,
    Weight2=1
},
["Retro Jotaro Animation Pack"]={
    Idle=127539196281100,
    Walk=113157973911088,
    Run=85642032402963,
    Jump=134297716993205,
    Fall=106612579537379,
    Climb=119864070433518,
    Swim=84052935746516,
    Weight=9,
    Weight2=1
},
["Scooter (Motorbike) Animation Pack"]={
    Idle=100546856109191,
    Walk=130418002284659,
    Run=74751892093099,
    Jump=107218325281560,
    Fall=108172607659654,
    Climb=122427580600563,
    Swim=125101360449135,
    Weight=9,
    Weight2=1
},
["FIFA Football Animation Pack"]={
    Idle=118649383584034,
    Walk=116562432475955,
    Run=85988010084587,
    Jump=109764146230261,
    Fall=114350110947576,
    Climb=93756360672538,
    Swim=96253251952462,
    Weight=9,
    Weight2=1
},
["Glamrock Animation Pack"]={
    Idle=122945940549426,
    Walk=76099419369475,
    Run=86974875934105,
    Jump=117683926143008,
    Fall=79956253205096,
    Climb=116538019131526,
    Swim=87116903374201,
    Weight=9,
    Weight2=1
},
["Cursed Fighter Animation Pack"]={
    Idle=88011717753511,
    Walk=84769673855377,
    Run=133378822305845,
    Jump=95015261286721,
    Fall=74255361802584,
    Climb=129013103274530,
    Swim=100477727327330,
    Weight=9,
    Weight2=1
},
["Goober Animation Pack"]={
    Idle=98982724956533,
    Walk=137738393470167,
    Run=76463192365039,
    Jump=105626484051261,
    Fall=74968738001285,
    Climb=129506026949642,
    Swim=81101365566917,
    Weight=9,
    Weight2=1
},
["Miku ☆ BEAM!  Animation Pack"]={
    Idle=134733722420062,
    Walk=108256614844835,
    Run=110984930425694,
    Jump=139502154541448,
    Fall=111993854457128,
    Climb=93919650768333,
    Swim=129986060812933,
    Weight=9,
    Weight2=1
},
["Catwalk Animation Pack"]={
    Idle=119003592081191,
    Walk=140550610763932,
    Run=133982999991497,
    Jump=98877178080033,
    Fall=76877700005498,
    Climb=126446396070735,
    Swim=128112060756575,
    Weight=9,
    Weight2=1
},
["Sword Animation Pack"]={
    Idle=128731738170816,
    Walk=107365456434018,
    Run=80585041821647,
    Jump=76724576999363,
    Fall=126950005025157,
    Climb=73473042698477,
    Swim=87839370090376,
    Weight=9,
    Weight2=1
},
["cutesy animation pack"]={
    Idle=119304131758806,
    Walk=107924964315039,
    Run=119642273241155,
    Jump=124027966787465,
    Fall=137014341252681,
    Climb=84604285740767,
    Swim=121772695867454,
    Weight=9,
    Weight2=1
},
["Kawaii Shy Girl Animation Pack"]={
    Idle=122592046891110,
    Walk=138237909694282,
    Run=125629445976619,
    Jump=110476808376424,
    Fall=131862878154472,
    Climb=77505565560274,
    Swim=116567744442325,
    Weight=9,
    Weight2=1
},
["Spinning Animation Pack"]={
    Idle=122047016161870,
    Walk=120550301371773,
    Run=81351635605102,
    Jump=122296362548713,
    Fall=134900980771599,
    Climb=92747568633200,
    Swim=132313760391419,
    Weight=9,
    Weight2=1
},
["Cat Animation Pack"]={
    Idle=74355822688913,
    Walk=95679318521607,
    Run=120478953606211,
    Jump=120825476819365,
    Fall=118369041659055,
    Climb=117993845087371,
    Swim=90169545336471,
    Weight=9,
    Weight2=1
},
["Tornado Animation Pack"]={
    Idle=112311122731769,
    Walk=112709977356437,
    Run=98662676459474,
    Jump=83328213927402,
    Fall=139843782873971,
    Climb=103521583974582,
    Swim=89154162885203,
    Weight=9,
    Weight2=1
},
["Cutest Animation Pack"]={
    Idle=127562171858685,
    Walk=135859499018920,
    Run=109835628812578,
    Jump=99416442683978,
    Fall=117135566684157,
    Climb=132360896660425,
    Swim=92372629737411,
    Weight=9,
    Weight2=1
},
["Tough Animation Pack"]={
    Idle=124987425184293,
    Walk=129248686053306,
    Run=97945271765764,
    Jump=140016329830323,
    Fall=106351152491477,
    Climb=134391767384582,
    Swim=83890768067983,
    Weight=9,
    Weight2=1
},
["🐾 Whimsy Animation Pack"]={
    Idle=112474185519914,
    Walk=130648630296857,
    Run=99925981032749,
    Jump=79626740162105,
    Fall=118932949060509,
    Climb=139492825912258,
    Swim=139578846198951,
    Weight=9,
    Weight2=1
},
["[R6] Sonic Speedster Anim Pack"]={
    Idle=128200188464094,
    Walk=96353899184850,
    Run=83851522234030,
    Jump=81618354444197,
    Fall=90715718113183,
    Climb=98500626075688,
    Swim=128862881664678,
    Weight=9,
    Weight2=1
},
["Cool ShowOff Animation Pack"]={
    Idle=92970008311663,
    Walk=71996221768678,
    Run=97520342259036,
    Jump=115515801837637,
    Fall=120381173022061,
    Climb=108550977223814,
    Swim=113331307223261,
    Weight=9,
    Weight2=1
},
["Floating Animation Pack"]={
    Idle=110077138896444,
    Walk=84042488812579,
    Run=133213375576190,
    Jump=94758768797424,
    Fall=100060942968114,
    Climb=134365203050862,
    Swim=70742815646610,
    Weight=9,
    Weight2=1
},
["Clown Animation Pack"]={
    Idle=133461435323867,
    Walk=113913885561230,
    Run=95043672350077,
    Jump=84657375060588,
    Fall=118155940144177,
    Climb=74634356897077,
    Swim=114318339862673,
    Weight=9,
    Weight2=1
},
["Spirit Animation Pack"]={
    Idle=81568074867976,
    Walk=74942022430113,
    Run=91281692680914,
    Jump=129775268918468,
    Fall=82087570968798,
    Climb=73761503751068,
    Swim=126167178989799,
    Weight=9,
    Weight2=1
},
["3.0 Kawaii Animation Pack"]={
    Idle=87424778892364,
    Walk=138844946942468,
    Run=93812889355168,
    Jump=98852827323316,
    Fall=108489592367522,
    Climb=86607872915491,
    Swim=105433789727240,
    Weight=9,
    Weight2=1
},
["Evil Witch Animation Pack"]={
    Idle=87592184372390,
    Walk=109517763188492,
    Run=139603451703438,
    Jump=82641503078297,
    Fall=112541280672938,
    Climb=124936642981709,
    Swim=92174321473345,
    Weight=9,
    Weight2=1
},
["Jujutsu Shenanigans Animation Pack"]={
    Idle=120416193475676,
    Walk=105734590727566,
    Run=139346741258681,
    Jump=102505273479555,
    Fall=126743089564851,
    Climb=90934964040019,
    Swim=89771707787929,
    Weight=9,
    Weight2=1
},
["R6 Zombie Animation Pack"]={
    Idle=95253702183394,
    Walk=139588998219529,
    Run=90936444396653,
    Jump=110008024097677,
    Fall=103115951904108,
    Climb=114707190063421,
    Swim=102826001294148,
    Weight=9,
    Weight2=1
},
["Wheel Animation Pack"]={
    Idle=125539698856329,
    Walk=116315189589553,
    Run=97256899120439,
    Jump=113429731737499,
    Fall=112857301234933,
    Climb=135379122155144,
    Swim=129720222505714,
    Weight=9,
    Weight2=1
},
["🕷️ Spider Animation Pack"]={
    Idle=79040996548199,
    Walk=70426179555994,
    Run=127698798443837,
    Jump=85588072231738,
    Fall=138732985008846,
    Climb=119466250896306,
    Swim=105564435561971,
    Weight=9,
    Weight2=1
},
["puppy-girl animation pack"]={
    Idle=111749180513057,
    Walk=90443424631782,
    Run=78024865892029,
    Jump=97624693542486,
    Fall=119524820750332,
    Climb=73719994122245,
    Swim=84374727885308,
    Weight=9,
    Weight2=1
},
["Ballerina Animation Pack"]={
    Idle=96570467526369,
    Walk=109600649702418,
    Run=135506277935530,
    Jump=135043606381289,
    Fall=112527046946434,
    Climb=119856823568568,
    Swim=95511493438317,
    Weight=9,
    Weight2=1
},
["adidas animal animation pack"]={
    Idle=88588592137033,
    Walk=81281696577427,
    Run=131412866275486,
    Jump=103774864966499,
    Fall=95106363390518,
    Climb=78060506615772,
    Swim=122672658502030,
    Weight=9,
    Weight2=1
},
["bbno$ - Microphone Artist Animation Pack"]={
    Idle=77597158051552,
    Walk=138648344756262,
    Run=137154350792989,
    Jump=104524083350042,
    Fall=80914879706995,
    Climb=96560438360210,
    Swim=112506729787422,
    Weight=9,
    Weight2=1
},
["Hero Animation Pack"]={
    Idle=91290213778990,
    Walk=71218398502574,
    Run=113348193165636,
    Jump=92964847175336,
    Fall=99190165500094,
    Climb=80632678744795,
    Swim=135074863147837,
    Weight=9,
    Weight2=1
},
["Realistic Zombie Animation Pack"]={
    Idle=133661812397169,
    Walk=85285566343776,
    Run=118532148430496,
    Jump=98411928276937,
    Fall=73191360290838,
    Climb=91935566876394,
    Swim=129696352463753,
    Weight=9,
    Weight2=1
},
["Ragdoll Animation Pack"]={
    Idle=97695583858558,
    Walk=138382713792219,
    Run=80193233010532,
    Jump=130535791855093,
    Fall=81747721984887,
    Climb=78827767690998,
    Swim=74263510607555,
    Weight=9,
    Weight2=1
},
["🤪 Gone Crazy Animation Pack"]={
    Idle=93684252148907,
    Walk=94009258319913,
    Run=77198115523932,
    Jump=136457095474456,
    Fall=115678558832051,
    Climb=87669292593333,
    Swim=123433725505325,
    Weight=9,
    Weight2=1
},
["Cute Kawaii Animation Pack"]={
    Idle=125213714490856,
    Walk=89593750238791,
    Run=105447077026379,
    Jump=71814167711158,
    Fall=130126512901249,
    Climb=109981538265875,
    Swim=117559554412239,
    Weight=9,
    Weight2=1
},
["Space Trooper Animation Pack"]={
    Idle=120676908537591,
    Walk=109915572174703,
    Run=92935871266905,
    Jump=128850916640589,
    Fall=135758844109638,
    Climb=92429827476200,
    Swim=71298915491371,
    Weight=9,
    Weight2=1
},
["Princess Animation Pack"]={
    Idle=76466137646733,
    Walk=98481676919653,
    Run=78854678942271,
    Jump=85704459269303,
    Fall=112014167276027,
    Climb=102352039372993,
    Swim=106451480262937,
    Weight=9,
    Weight2=1
},
["Joy Animation Pack"]={
    Idle=122531702980385,
    Walk=134165520606014,
    Run=75386988216114,
    Jump=112223496914710,
    Fall=98841860085841,
    Climb=85961423328349,
    Swim=92687096386847,
    Weight=9,
    Weight2=1
},
["Visitor Animation Pack"]={
    Idle=96254432434090,
    Walk=126706150185765,
    Run=89273404079570,
    Jump=88269779762792,
    Fall=74588230531637,
    Climb=103833923598899,
    Swim=132161200322899,
    Weight=9,
    Weight2=1
},
["Confident Animation Pack"]={
    Idle=132550610743143,
    Walk=136816061107495,
    Run=133434491948052,
    Jump=140695963793644,
    Fall=72868653223594,
    Climb=117096435985411,
    Swim=125257513306163,
    Weight=9,
    Weight2=1
},
["67 Animation Pack"]={
    Idle=131615763118869,
    Walk=73305802913801,
    Run=71492775028835,
    Jump=80252381525544,
    Fall=102746074461880,
    Climb=86051297640177,
    Swim=103791932450882,
    Weight=9,
    Weight2=1
},
["Cyborg Animation Pack"]={
    Idle=118076268052179,
    Walk=125596961227383,
    Run=115489778051134,
    Jump=94144621597191,
    Fall=80081760939191,
    Climb=92357290088609,
    Swim=90510909604928,
    Weight=9,
    Weight2=1
},
["Biker Animation Pack"]={
    Idle=78675945575258,
    Walk=89511073119928,
    Run=101966982571949,
    Jump=117172772979104,
    Fall=79603899842412,
    Climb=108860518897762,
    Swim=106469888319008,
    Weight=9,
    Weight2=1
},
["Car Driving Animation Pack"]={
    Idle=127521146654624,
    Walk=102473310575382,
    Run=123865353464553,
    Jump=90169415652857,
    Fall=102951633481022,
    Climb=120202994187560,
    Swim=77727264196412,
    Weight=9,
    Weight2=1
},
["Broly DBZ DBS Animation Pack"]={
    Idle=108542902224030,
    Walk=102388303062748,
    Run=121624109781782,
    Jump=124932590435913,
    Fall=89342393321351,
    Climb=72735013486408,
    Swim=127916105042951,
    Weight=9,
    Weight2=1
},
["🐛 Worm Animation Pack"]={
    Idle=78488419976707,
    Walk=139084919449716,
    Run=132205783157536,
    Jump=128893027194691,
    Fall=137044045921324,
    Climb=137393538705567,
    Swim=112601797172514,
    Weight=9,
    Weight2=1
},
["Deltarune Jevil Animation Pack"]={
    Idle=97633441888062,
    Walk=85636617468274,
    Run=108284688862444,
    Jump=98885266005124,
    Fall=129865636429223,
    Climb=72252219989862,
    Swim=87765019756141,
    Weight=9,
    Weight2=1
},
["Monty Animation Pack"]={
    Idle=107645103249114,
    Walk=105571668002106,
    Run=131373808385359,
    Jump=136719966686181,
    Fall=86175562584836,
    Climb=91288897560224,
    Swim=84926886213912,
    Weight=9,
    Weight2=1
},
["Moonwalker Animation Pack"]={
    Idle=137397932845765,
    Walk=119126379951828,
    Run=110456016820646,
    Jump=110465134311710,
    Fall=90647006541766,
    Climb=106178391125905,
    Swim=133187384986785,
    Weight=9,
    Weight2=1
},
["R6 Survivor Animation Pack"]={
    Idle=79575948465396,
    Walk=127283838990258,
    Run=132471521372294,
    Jump=137934973717401,
    Fall=107615688046955,
    Climb=111862482779638,
    Swim=138445851536606,
    Weight=9,
    Weight2=1
},
["Frieza DBZ Animation Pack"]={
    Idle=72619464970985,
    Walk=131112969880404,
    Run=126660137792352,
    Jump=113635342332435,
    Fall=104485673251671,
    Climb=127137531161903,
    Swim=121536815416652,
    Weight=9,
    Weight2=1
},
["Aura Float Animation Pack"]={
    Idle=110825940430887,
    Walk=128714619031468,
    Run=126887058162504,
    Jump=83320082624150,
    Fall=115896999712343,
    Climb=76552567719546,
    Swim=130756104695134,
    Weight=9,
    Weight2=1
},
["Sword Animation Pack"]={
    Idle=133328858871618,
    Walk=82783586021262,
    Run=78278015603785,
    Jump=77364711664438,
    Fall=133019742186905,
    Climb=84308503872265,
    Swim=96220355456181,
    Weight=9,
    Weight2=1
},
["🔄  Backwards Animation Pack"]={
    Idle=71648378232075,
    Walk=135571675443798,
    Run=100997499084922,
    Jump=111001251683459,
    Fall=89172514355491,
    Climb=92111468010845,
    Swim=139221689875049,
    Weight=9,
    Weight2=1
},
["Levitation Animation Pack"]={
    Idle=619542203,
    Walk=619544080,
    Run=619543231,
    Jump=619542888,
    Fall=619541867,
    Climb=619541458,
    Swim=619543721,
    Weight=9,
    Weight2=1
},
["kitten kawaii animation pack"]={
    Idle=112771203182247,
    Walk=81378816009302,
    Run=121019657684852,
    Jump=76799966930119,
    Fall=107501958463460,
    Climb=129575640503196,
    Swim=120776957990716,
    Weight=9,
    Weight2=1
},
["Anime Ninja Animation Pack"]={
    Idle=130049459124971,
    Walk=87110893328207,
    Run=72644228825521,
    Jump=94314174951003,
    Fall=120827871260062,
    Climb=134904287416434,
    Swim=80310055805362,
    Weight=9,
    Weight2=1
},
["Endless Aura Animation Pack"]={
    Idle=75516613642193,
    Walk=110842184926366,
    Run=138335410408717,
    Jump=78180801043773,
    Fall=111206479563827,
    Climb=90022463193819,
    Swim=99445061681495,
    Weight=9,
    Weight2=1
},
["Kawaii Bouncy Girl Animation Pack"]={
    Idle=91127538406769,
    Walk=89049306056311,
    Run=139220255487101,
    Jump=137439440621482,
    Fall=110627678629031,
    Climb=75653450387417,
    Swim=115469224070897,
    Weight=9,
    Weight2=1
},
["L Dance Animation Pack"]={
    Idle=114298779859106,
    Walk=135765080961105,
    Run=89314288016421,
    Jump=136158777602051,
    Fall=118173109150352,
    Climb=83574262321161,
    Swim=120420532953318,
    Weight=9,
    Weight2=1
},
["Icon Animation Pack"]={
    Idle=133754801194239,
    Walk=79743374479906,
    Run=89503838837172,
    Jump=81181946155315,
    Fall=113906514321701,
    Climb=103052985690356,
    Swim=125252680057083,
    Weight=9,
    Weight2=1
},
["Retro Gaming Animation Pack"]={
    Idle=137661561203243,
    Walk=119770370972375,
    Run=122571711537015,
    Jump=98148352663227,
    Fall=136812582843353,
    Climb=102966692376352,
    Swim=137707662581298,
    Weight=9,
    Weight2=1
},
["67 Meme Animation Pack"]={
    Idle=116524562963042,
    Walk=105459205462636,
    Run=130174654421828,
    Jump=72425431193934,
    Fall=86188636174937,
    Climb=105709312366470,
    Swim=130365203545716,
    Weight=9,
    Weight2=1
},
["Mikl Animation Pack"]={
    Idle=98025376099414,
    Walk=82807476735801,
    Run=82865548486704,
    Jump=122204839782403,
    Fall=105919287776112,
    Climb=96762554348492,
    Swim=107641845554885,
    Weight=9,
    Weight2=1
},
["SIX SEVEN 67 Animation Pack"]={
    Idle=103357739992894,
    Walk=95358246025908,
    Run=132606950344328,
    Jump=111517106268123,
    Fall=108188857631452,
    Climb=98122148795713,
    Swim=86510115409940,
    Weight=9,
    Weight2=1
},
["R6 Animation Pack"]={
    Idle=88486350806167,
    Walk=74503222225198,
    Run=126737621447843,
    Jump=92176904542723,
    Fall=86008934651109,
    Climb=116965744790854,
    Swim=127780153242529,
    Weight=9,
    Weight2=1
},
["Cat Animation Pack"]={
    Idle=115397974566925,
    Walk=135495778999818,
    Run=128300828787316,
    Jump=138652892634147,
    Fall=102104304180524,
    Climb=79004099318162,
    Swim=131381286282746,
    Weight=9,
    Weight2=1
},
["Scaredy Animation Pack"]={
    Idle=138472930729657,
    Walk=73414431728321,
    Run=95883048535044,
    Jump=112172992211139,
    Fall=90834874742095,
    Climb=94738680267466,
    Swim=101112472091735,
    Weight=9,
    Weight2=1
},
["Speedrunner Animation Pack"]={
    Idle=114912890146378,
    Walk=84489673579661,
    Run=118304665554862,
    Jump=86978171409137,
    Fall=126871183733150,
    Climb=79584635234199,
    Swim=103368208944259,
    Weight=9,
    Weight2=1
},
["Crying Animation Pack"]={
    Idle=84325751352240,
    Walk=109994359440806,
    Run=83342841435906,
    Jump=107315462686165,
    Fall=78421438119872,
    Climb=122510132242829,
    Swim=135350523948511,
    Weight=9,
    Weight2=1
},
["Gym Animation Pack"]={
    Idle=106699875997929,
    Walk=104136926814653,
    Run=116451466592642,
    Jump=87347274678456,
    Fall=104959678989507,
    Climb=91409364957372,
    Swim=120237963012539,
    Weight=9,
    Weight2=1
},
["Nonchalant Animation Pack"]={
    Idle=107123120166007,
    Walk=125611743000994,
    Run=88865794201668,
    Jump=107221788639672,
    Fall=118450647827858,
    Climb=119095716889455,
    Swim=96444605185114,
    Weight=9,
    Weight2=1
},
["🎖️ Military Animation Pack"]={
    Idle=114264441201765,
    Walk=122783976375321,
    Run=117276571225301,
    Jump=92738460397646,
    Fall=121807925179208,
    Climb=78517162186590,
    Swim=104015116392523,
    Weight=9,
    Weight2=1
},
["🖥️ Glitch Animation Pack"]={
    Idle=107245650589762,
    Walk=128190163643941,
    Run=121934531969232,
    Jump=115414916728373,
    Fall=108245427497486,
    Climb=95898854434873,
    Swim=90839362430731,
    Weight=9,
    Weight2=1
},
["GMod Animation Pack"]={
    Idle=119020055323251,
    Walk=77832155848866,
    Run=111708866395371,
    Jump=94887979190744,
    Fall=135673490520449,
    Climb=129377331492040,
    Swim=85893414106740,
    Weight=9,
    Weight2=1
},
["😌 Nonchalant Animation Pack"]={
    Idle=120361344309821,
    Walk=137080061938111,
    Run=138817543112482,
    Jump=101362426464232,
    Fall=137504551310868,
    Climb=112352256883383,
    Swim=121597417409288,
    Weight=9,
    Weight2=1
},
["Hurt / Injured Animation Pack"]={
    Idle=107428645079912,
    Walk=71444980407357,
    Run=130252608384470,
    Jump=129661075156043,
    Fall=88624382408789,
    Climb=79359915781708,
    Swim=132108939734783,
    Weight=9,
    Weight2=1
},
["Kris Animation Pack"]={
    Idle=77755146564634,
    Walk=117371162298388,
    Run=102587404960699,
    Jump=105368383842855,
    Fall=114099270480451,
    Climb=131005864997922,
    Swim=84834637576649,
    Weight=9,
    Weight2=1
},
["Undertale Frisk Animation Pack"]={
    Idle=101422312812088,
    Walk=109461661433940,
    Run=93122483313847,
    Jump=92569979471933,
    Fall=109110560045205,
    Climb=140060546614619,
    Swim=109326238602070,
    Weight=9,
    Weight2=1
},
["Dio Vampire Animation Pack"]={
    Idle=95829257258640,
    Walk=115531368447404,
    Run=127353663753353,
    Jump=78235517661931,
    Fall=85439110655632,
    Climb=96782628611597,
    Swim=74376919920446,
    Weight=9,
    Weight2=1
},
["Cheetah Cat Animation Pack"]={
    Idle=77330038335337,
    Walk=70429229067796,
    Run=137117476220233,
    Jump=103797714561229,
    Fall=101537233006381,
    Climb=89756927967079,
    Swim=115233862520548,
    Weight=9,
    Weight2=1
},
["Cute Sit Animation Pack"]={
    Idle=140541002396293,
    Walk=73350639790445,
    Run=87288817152826,
    Jump=82787467618041,
    Fall=111351238674227,
    Climb=71939719516722,
    Swim=133048580555969,
    Weight=9,
    Weight2=1
},
["R6 Retro Infected Zombie Animation Pack"]={
    Idle=113628987910086,
    Walk=136415487502514,
    Run=83070887271027,
    Jump=120481560182980,
    Fall=121254553477178,
    Climb=78523485888876,
    Swim=79015098879360,
    Weight=9,
    Weight2=1
},
["Floating Aura Animation Pack"]={
    Idle=84675256240161,
    Walk=92399281657294,
    Run=98840364898616,
    Jump=130736041803639,
    Fall=119173574697959,
    Climb=90782423947560,
    Swim=94583213314751,
    Weight=9,
    Weight2=1
},
["Impatient Business Man Animation Pack"]={
    Idle=87637628480982,
    Walk=87291942996215,
    Run=118412111640909,
    Jump=102592302766300,
    Fall=78755053729201,
    Climb=124356279978000,
    Swim=109024478012602,
    Weight=9,
    Weight2=1
},
["Anime Ninja Boy Pack"]={
    Idle=126641565041858,
    Walk=128706816696979,
    Run=110380146376671,
    Jump=132508940387974,
    Fall=73830703636495,
    Climb=118762187429666,
    Swim=137545919244216,
    Weight=9,
    Weight2=1
},
["Alerted Zombie Animation Pack"]={
    Idle=108676310358770,
    Walk=100894561138498,
    Run=92116232226667,
    Jump=106269414415216,
    Fall=116440855375399,
    Climb=99982870799208,
    Swim=70681262323450,
    Weight=9,
    Weight2=1
},
["Happy Animation Pack"]={
    Idle=123069801825885,
    Walk=109406306101235,
    Run=75204876637193,
    Jump=110089875212647,
    Fall=78218044167879,
    Climb=119013657839309,
    Swim=130340333056097,
    Weight=9,
    Weight2=1
},
["Sassy Animation Pack"]={
    Idle=100105052417180,
    Walk=119535566349982,
    Run=138709446679783,
    Jump=135804900792255,
    Fall=95218769275581,
    Climb=117727500662118,
    Swim=99065139550755,
    Weight=9,
    Weight2=1
},
["Sassy Animation Pack"]={
    Idle=139101922602670,
    Walk=103918432429701,
    Run=135743990156497,
    Jump=118684232107179,
    Fall=77483695098253,
    Climb=91759895892147,
    Swim=110867193358009,
    Weight=9,
    Weight2=1
},
["Wolf Animation Pack"]={
    Idle=75893206389860,
    Walk=70867099352574,
    Run=118292624889777,
    Jump=124692722928049,
    Fall=111551751028070,
    Climb=96881262869586,
    Swim=124981096709349,
    Weight=9,
    Weight2=1
},
["Monkey Animation Pack"]={
    Idle=90767882550490,
    Walk=133493129953013,
    Run=120059269649233,
    Jump=109813295403810,
    Fall=82266542477438,
    Climb=90458662856678,
    Swim=127941264187656,
    Weight=9,
    Weight2=1
},
["Lively Animation Pack"]={
    Idle=129898616073577,
    Walk=127321281479156,
    Run=127188825777320,
    Jump=116498213774173,
    Fall=82113361405692,
    Climb=124084921157553,
    Swim=139891543197964,
    Weight=9,
    Weight2=1
},
["Ballet Animation Pack"]={
    Idle=128095298567668,
    Walk=122126536868331,
    Run=121608917085314,
    Jump=91226212102484,
    Fall=112966384177424,
    Climb=106455939982846,
    Swim=95567196034395,
    Weight=9,
    Weight2=1
},
["Bird Animation Pack"]={
    Idle=136621059295364,
    Walk=112178991848293,
    Run=84144085658577,
    Jump=71429113724951,
    Fall=76221377753539,
    Climb=84691892894993,
    Swim=121394508892134,
    Weight=9,
    Weight2=1
},
["💂 Soldier Animation Pack"]={
    Idle=103838082815064,
    Walk=89683929842910,
    Run=121250021089987,
    Jump=107878692095493,
    Fall=108972185760629,
    Climb=84110248131459,
    Swim=88972628191737,
    Weight=9,
    Weight2=1
},
["Diavolo Jojo Animation Pack"]={
    Idle=124399590468875,
    Walk=132784524055242,
    Run=135205722778519,
    Jump=133648962334311,
    Fall=104279206308246,
    Climb=127869811384748,
    Swim=133434719317311,
    Weight=9,
    Weight2=1
},
["Springtrap Animation Pack"]={
    Idle=75493710454748,
    Walk=80390932575337,
    Run=80630568017608,
    Jump=82685309683973,
    Fall=98946856146675,
    Climb=129968497350205,
    Swim=84314929417812,
    Weight=9,
    Weight2=1
},
["Rolling Animation Pack"]={
    Idle=99897982543463,
    Walk=85385284315119,
    Run=89786388662768,
    Jump=90849704156294,
    Fall=106329448421505,
    Climb=94003857075700,
    Swim=73620624516214,
    Weight=9,
    Weight2=1
},
["🌌 Eternal Aura Animation Pack"]={
    Idle=126168591018037,
    Walk=93493344776986,
    Run=123902629187783,
    Jump=125077402180068,
    Fall=85052535422098,
    Climb=93176020911718,
    Swim=138597481943113,
    Weight=9,
    Weight2=1
},
["Leon Resident Animation Pack"]={
    Idle=132367716218689,
    Walk=83610395374895,
    Run=100406870953903,
    Jump=86159095181994,
    Fall=121017142179322,
    Climb=138946664285309,
    Swim=130041190886116,
    Weight=9,
    Weight2=1
},
["driving a car animation pack"]={
    Idle=98775152264943,
    Walk=105916205476643,
    Run=87725632619556,
    Jump=110621336153965,
    Fall=100836797729035,
    Climb=92349686763104,
    Swim=114020870739134,
    Weight=9,
    Weight2=1
},
["Acrobat Animation Pack"]={
    Idle=140643907328619,
    Walk=121795409060955,
    Run=76069463121878,
    Jump=73357666451414,
    Fall=81528159328223,
    Climb=88287084402134,
    Swim=128785260578913,
    Weight=9,
    Weight2=1
},
["Kawaii Cute E-Girl Animation Pack"]={
    Idle=72343410382448,
    Walk=95915329011823,
    Run=117319207655673,
    Jump=102409286042316,
    Fall=120363252300197,
    Climb=136356280163200,
    Swim=75286183577550,
    Weight=9,
    Weight2=1
},
["Steve Animation Pack"]={
    Idle=125199214468024,
    Walk=115172566879357,
    Run=119292248543715,
    Jump=100931346966487,
    Fall=130888373723408,
    Climb=99514777856720,
    Swim=113478923317554,
    Weight=9,
    Weight2=1
},
["hoverboard animation pack"]={
    Idle=125836179302430,
    Walk=112145545156339,
    Run=111379617321448,
    Jump=100605444719943,
    Fall=120280951565733,
    Climb=89989705314839,
    Swim=105828671577157,
    Weight=9,
    Weight2=1
},
["Merged Zamasu DBZ Animation Pack"]={
    Idle=132184857127053,
    Walk=90214520143644,
    Run=73012149896384,
    Jump=109023870501390,
    Fall=133801067743726,
    Climb=122953293523194,
    Swim=120612484679972,
    Weight=9,
    Weight2=1
},
["Floating Girl Animation Pack"]={
    Idle=70950947201114,
    Walk=88400524118430,
    Run=123088900892988,
    Jump=87580840605088,
    Fall=136227821189705,
    Climb=123964253110959,
    Swim=134797091187774,
    Weight=9,
    Weight2=1
},
["Vibin Animation Pack"]={
    Idle=83521563636974,
    Walk=87659697602845,
    Run=109565543136092,
    Jump=123087352141678,
    Fall=98748085108074,
    Climb=125954069726775,
    Swim=101879555050365,
    Weight=9,
    Weight2=1
},
["Ultra Instinct Goku DBZ Animation Pack"]={
    Idle=85162669399439,
    Walk=85966621306654,
    Run=128353418373395,
    Jump=83903352717712,
    Fall=93618599121014,
    Climb=101340003975632,
    Swim=100693727763842,
    Weight=9,
    Weight2=1
},
["Sneaky Animation Pack [Fixed]"]={
    Idle=110661428296483,
    Walk=102424819965014,
    Run=114320667197968,
    Jump=74394558588026,
    Fall=124151777726994,
    Climb=95293906268328,
    Swim=113889740076439,
    Weight=9,
    Weight2=1
},
["Animal Wii Mii Crossing Chibi Animation Pack"]={
    Idle=122772255014663,
    Walk=71783037910607,
    Run=127460015395990,
    Jump=108771228605763,
    Fall=101033866589261,
    Climb=95093387366704,
    Swim=75875472045016,
    Weight=9,
    Weight2=1
},
["Scooter / Moped Animation Pack"]={
    Idle=77557907530675,
    Walk=122746608761134,
    Run=136965935460096,
    Jump=97217145210389,
    Fall=113991402968165,
    Climb=125448461662757,
    Swim=138715027405196,
    Weight=9,
    Weight2=1
},
["Viltrumite Animation Pack"]={
    Idle=107554722150346,
    Walk=118833947710130,
    Run=119281301404777,
    Jump=77884421481340,
    Fall=109461082466625,
    Climb=87763584254122,
    Swim=100240111722062,
    Weight=9,
    Weight2=1
},
["Retry Now Miku Animation Pack"]={
    Idle=109391180939842,
    Walk=128368303843283,
    Run=139658579192336,
    Jump=121622012418500,
    Fall=111576855242180,
    Climb=96513857339821,
    Swim=111629641092792,
    Weight=9,
    Weight2=1
},
["Mm2 Fake Dead Animation Pack"]={
    Idle=80002865859326,
    Walk=137893784945745,
    Run=133017929265577,
    Jump=117753997226266,
    Fall=76037893285580,
    Climb=77615247561276,
    Swim=74712001636635,
    Weight=9,
    Weight2=1
},
["Tiptoe Animation Pack"]={
    Idle=132216641812305,
    Walk=111296592874569,
    Run=116187566918057,
    Jump=130854859236213,
    Fall=72774865982287,
    Climb=125388346450660,
    Swim=92297791231524,
    Weight=9,
    Weight2=1
},
["Xannedo's Fearful Terrified Scared Animation Pack"]={
    Idle=72469643372857,
    Walk=85621340029435,
    Run=102485533187229,
    Jump=95617012507591,
    Fall=131005704661579,
    Climb=101573859155157,
    Swim=111372435885253,
    Weight=9,
    Weight2=1
},
["Bandit Gangster Mob Animation Pack"]={
    Idle=92216088857806,
    Walk=91489560566726,
    Run=139940153286379,
    Jump=136476618378550,
    Fall=91704947920667,
    Climb=139900673891318,
    Swim=101736977447872,
    Weight=9,
    Weight2=1
},
["Scuba Animation Pack"]={
    Idle=115332015083696,
    Walk=90021611295298,
    Run=97015737122485,
    Jump=102340122513794,
    Fall=128272531842567,
    Climb=123092460130819,
    Swim=131418468923285,
    Weight=9,
    Weight2=1
},
["Dancer Animation Pack"]={
    Idle=136523150079336,
    Walk=76139765570467,
    Run=109926714862436,
    Jump=117879018442007,
    Fall=93504345797825,
    Climb=95763609238667,
    Swim=135200222626004,
    Weight=9,
    Weight2=1
},
["Backwards Animation Pack"]={
    Idle=112707730449669,
    Walk=136733295152927,
    Run=83728738196205,
    Jump=102435772823611,
    Fall=87867585491350,
    Climb=118814107287524,
    Swim=104725587873390,
    Weight=9,
    Weight2=1
},
["Ultron Animation Pack"]={
    Idle=106332790451761,
    Walk=106244345643132,
    Run=102654826655551,
    Jump=110139593973756,
    Fall=79629799257731,
    Climb=92583115661296,
    Swim=123563937372535,
    Weight=9,
    Weight2=1
},
["Steven Animation Pack"]={
    Idle=133253708125525,
    Walk=84157863686470,
    Run=73636886914394,
    Jump=76594222545001,
    Fall=96851516499601,
    Climb=72765107060955,
    Swim=124364040445553,
    Weight=9,
    Weight2=1
},
["columbina animation pack"]={
    Idle=125365093773912,
    Walk=88561979227944,
    Run=105238148203235,
    Jump=128401396846661,
    Fall=119692422005293,
    Climb=119945324384231,
    Swim=98697963653600,
    Weight=9,
    Weight2=1
},
["Nonchalant Animation Pack"]={
    Idle=105625461201212,
    Walk=109929028346739,
    Run=109756398099756,
    Jump=91381601643227,
    Fall=70402738416777,
    Climb=134106808942795,
    Swim=99075695500098,
    Weight=9,
    Weight2=1
},
["Susie Animation Pack"]={
    Idle=108385581018153,
    Walk=111356015858763,
    Run=96355750771999,
    Jump=109387750765159,
    Fall=133610605472231,
    Climb=111830361007352,
    Swim=92635592054103,
    Weight=9,
    Weight2=1
},
["Runner Animation Pack"]={
    Idle=137770156485373,
    Walk=86540211302281,
    Run=92011700221480,
    Jump=102567046082506,
    Fall=118538719646278,
    Climb=117012431722709,
    Swim=85427524885848,
    Weight=9,
    Weight2=1
},
["Fish Flopping Animation Pack"]={
    Idle=111713488483569,
    Walk=120411702651029,
    Run=85062949894309,
    Jump=104628156085332,
    Fall=85188916068414,
    Climb=109243917849841,
    Swim=116045559575970,
    Weight=9,
    Weight2=1
},
["💪 Bodybuilder Animation Pack"]={
    Idle=140636313299093,
    Walk=137769537591977,
    Run=87710383546392,
    Jump=91402288561924,
    Fall=112339133038127,
    Climb=94880187024475,
    Swim=96757890245481,
    Weight=9,
    Weight2=1
},
["Shy Kawaii Animation Pack"]={
    Idle=72310737508241,
    Walk=136992953454769,
    Run=82739676869367,
    Jump=138077202867063,
    Fall=107599263610595,
    Climb=88934695261858,
    Swim=96447816100829,
    Weight=9,
    Weight2=1
},
["Worm Animation Pack"]={
    Idle=87209563775109,
    Walk=106272264033298,
    Run=71742139897715,
    Jump=76766398713282,
    Fall=124332612491009,
    Climb=104192497893224,
    Swim=128859328794697,
    Weight=9,
    Weight2=1
},
["Beast Gohan DBZ Animation Pack"]={
    Idle=130510967856534,
    Walk=125226059003867,
    Run=95611817982044,
    Jump=136459606877255,
    Fall=130767935927077,
    Climb=117572406047897,
    Swim=93223335396986,
    Weight=9,
    Weight2=1
},
["Happy Animation Pack V2"]={
    Idle=95989249556281,
    Walk=134985215661850,
    Run=130612341457590,
    Jump=113911706274834,
    Fall=125576249444670,
    Climb=123950670647417,
    Swim=138979653630248,
    Weight=9,
    Weight2=1
},
["Floating Aura Animation Pack"]={
    Idle=116833210734984,
    Walk=75147748976514,
    Run=109913461287730,
    Jump=126794347622371,
    Fall=87760036153887,
    Climb=85469820924350,
    Swim=127524565670214,
    Weight=9,
    Weight2=1
},
["🔄 Upside Down Sit Animation Pack"]={
    Idle=140050393625708,
    Walk=140389400198374,
    Run=130510977379579,
    Jump=122126428138313,
    Fall=135724580548728,
    Climb=91561578709422,
    Swim=70637946344115,
    Weight=9,
    Weight2=1
},
["Horror Animation Pack"]={
    Idle=95218544857046,
    Walk=131072056442556,
    Run=79858014297595,
    Jump=91894522413850,
    Fall=115763862425442,
    Climb=130422415200083,
    Swim=87889969784249,
    Weight=9,
    Weight2=1
},
["Weeping Angel Animation Pack"]={
    Idle=84441752366174,
    Walk=73465820139906,
    Run=88138769405447,
    Jump=100051406457410,
    Fall=84618567285508,
    Climb=90851287481603,
    Swim=116673650545599,
    Weight=9,
    Weight2=1
},
["So Very Sleepy Animation Pack"]={
    Idle=107305663110118,
    Walk=104349959318475,
    Run=126219530895261,
    Jump=101511430648704,
    Fall=131429291394368,
    Climb=133019527277529,
    Swim=135669469896873,
    Weight=9,
    Weight2=1
},
["Skater Animation Pack"]={
    Idle=113260489538159,
    Walk=109347720355132,
    Run=80994788720568,
    Jump=73602597451548,
    Fall=102518241380226,
    Climb=78799042189589,
    Swim=74137299500673,
    Weight=9,
    Weight2=1
},
["Flying Iron Hero Animation Pack"]={
    Idle=85054002122459,
    Walk=138064370948100,
    Run=112450933015401,
    Jump=107741451950011,
    Fall=126497326592366,
    Climb=105689784034813,
    Swim=81340111785104,
    Weight=9,
    Weight2=1
},
["Digital Jester Animation Pack"]={
    Idle=107691055959090,
    Walk=103907017004032,
    Run=118514011369413,
    Jump=133986091065316,
    Fall=127239345105044,
    Climb=97291886824881,
    Swim=115506217791814,
    Weight=9,
    Weight2=1
},
["Jump Man Animation Pack"]={
    Idle=100811743292398,
    Walk=118719889201440,
    Run=80434661652480,
    Jump=98700771432502,
    Fall=124022625647276,
    Climb=94441119386085,
    Swim=99534734171378,
    Weight=9,
    Weight2=1
},
["Ninja Shinobi Animation Pack"]={
    Idle=116021605661982,
    Walk=97100677358414,
    Run=133312425341230,
    Jump=115644806254345,
    Fall=111381719888939,
    Climb=108349332712931,
    Swim=81187130302499,
    Weight=9,
    Weight2=1
},
["R6 Animation Pack"]={
    Idle=73335335792925,
    Walk=100730198949541,
    Run=136380174914014,
    Jump=103741846581443,
    Fall=103017876714499,
    Climb=95108520432645,
    Swim=76796339821369,
    Weight=9,
    Weight2=1
},
["R6 2010 Alien Animation Pack"]={
    Idle=116178072317274,
    Walk=131323569464340,
    Run=136413372727825,
    Jump=75335806996754,
    Fall=133217524924457,
    Climb=100919838203263,
    Swim=101901045826041,
    Weight=9,
    Weight2=1
},
["T-Pose Animation Pack"]={
    Idle=131835296596129,
    Walk=102117701048284,
    Run=113990217845026,
    Jump=114885704017975,
    Fall=124405305550353,
    Climb=73616067202469,
    Swim=81144260418600,
    Weight=9,
    Weight2=1
},
["Daring Girl Animation Pack"]={
    Idle=124889343064586,
    Walk=122797446650026,
    Run=127001312726231,
    Jump=107423742982736,
    Fall=133642256866645,
    Climb=110965640289196,
    Swim=132544167433157,
    Weight=9,
    Weight2=1
},
["Sk8r Animation Pack"]={
    Idle=80526718474637,
    Walk=114085380929591,
    Run=124944763928987,
    Jump=83236792388761,
    Fall=122738338504919,
    Climb=75691118785291,
    Swim=95065905053702,
    Weight=9,
    Weight2=1
},
["67 Animation Pack"]={
    Idle=124219813095680,
    Walk=97912396313814,
    Run=97888144816199,
    Jump=118737470391794,
    Fall=91125299314685,
    Climb=101893877467964,
    Swim=85755462089904,
    Weight=9,
    Weight2=1
},
["Prisoner Animation Pack"]={
    Idle=84785467355263,
    Walk=80162648170688,
    Run=92866562812050,
    Jump=112540507422834,
    Fall=102124863168555,
    Climb=127476982290684,
    Swim=139300338493935,
    Weight=9,
    Weight2=1
},
["Patrol Animation Pack"]={
    Idle=104297102026326,
    Walk=96772272617971,
    Run=87575561933468,
    Jump=84534760388451,
    Fall=106397819095164,
    Climb=92790837052169,
    Swim=137632456484929,
    Weight=9,
    Weight2=1
},
["T-Pose Animation Pack"]={
    Idle=86539743293388,
    Walk=126442599378231,
    Run=72964219033448,
    Jump=99394236792569,
    Fall=106646786512991,
    Climb=129335879627016,
    Swim=116117766101846,
    Weight=9,
    Weight2=1
},
["Dead Animation Pack"]={
    Idle=100610715285469,
    Walk=120046530258468,
    Run=97509383282379,
    Jump=137304477831766,
    Fall=112446603815828,
    Climb=85765696426138,
    Swim=74986426338534,
    Weight=9,
    Weight2=1
},
["🐒🦍 Monkey Animation Pack"]={
    Idle=95085094144958,
    Walk=82150360945583,
    Run=136179980275879,
    Jump=105646498127715,
    Fall=78839229509697,
    Climb=110981817267132,
    Swim=113097854876276,
    Weight=9,
    Weight2=1
},
["monkey gorilla animation pack"]={
    Idle=100433950777463,
    Walk=93395506834116,
    Run=96703330680575,
    Jump=71514364655188,
    Fall=117649078168889,
    Climb=115953860393124,
    Swim=118246646001742,
    Weight=9,
    Weight2=1
},
["Classic Speedrunner Animation Pack"]={
    Idle=115903958664536,
    Walk=122143400912685,
    Run=78634009415565,
    Jump=102511178316657,
    Fall=122771599826808,
    Climb=107407279701598,
    Swim=113307591694353,
    Weight=9,
    Weight2=1
},
["Laggy Glitch Animation Pack"]={
    Idle=96503239442004,
    Walk=83337185613142,
    Run=113753486875795,
    Jump=112473875190477,
    Fall=123532727510821,
    Climb=74223481730879,
    Swim=93010921934153,
    Weight=9,
    Weight2=1
},
["Furry Animation Pack"]={
    Idle=71262755745725,
    Walk=86181794449933,
    Run=101389893949611,
    Jump=124301512332922,
    Fall=137345258200630,
    Climb=125740975942993,
    Swim=121555214596988,
    Weight=9,
    Weight2=1
},
["Fairy Animation Pack 🧚"]={
    Idle=125814521476987,
    Walk=139557111639551,
    Run=112534354911335,
    Jump=111632728681215,
    Fall=103152567456197,
    Climb=87089075211029,
    Swim=89365942274514,
    Weight=9,
    Weight2=1
},
["Zombie Animation Pack"]={
    Idle=72020579345676,
    Walk=112308035206770,
    Run=131605772282759,
    Jump=123878221388719,
    Fall=138858643345164,
    Climb=130045357922950,
    Swim=93287488161066,
    Weight=9,
    Weight2=1
},
["Floating Animation Pack"]={
    Idle=95162353845606,
    Walk=131103399374405,
    Run=111575500029341,
    Jump=127286182040834,
    Fall=112062184623681,
    Climb=86214071241743,
    Swim=106263572598789,
    Weight=9,
    Weight2=1
},
["Bike Animation Pack"]={
    Idle=81380398454930,
    Walk=101026854609456,
    Run=127067940056349,
    Jump=97116856761102,
    Fall=111907604945191,
    Climb=89066366778264,
    Swim=73172637499731,
    Weight=9,
    Weight2=1
},
["cute girly animation pack"]={
    Idle=79940982981175,
    Walk=126933974038523,
    Run=107863317994069,
    Jump=135301739737133,
    Fall=105471077839481,
    Climb=109950622835876,
    Swim=83882755082212,
    Weight=9,
    Weight2=1
},
["Scared Animation Pack"]={
    Idle=87235259283339,
    Walk=132148095055811,
    Run=80061591138815,
    Jump=136076150906909,
    Fall=122469464077535,
    Climb=119829192806707,
    Swim=91205899203879,
    Weight=9,
    Weight2=1
},
["Joyful Animation Pack"]={
    Idle=115993266440776,
    Walk=139313407695532,
    Run=79320869574382,
    Jump=131930671650999,
    Fall=131117498790057,
    Climb=96747830207189,
    Swim=126095360657826,
    Weight=9,
    Weight2=1
},
["🩺 Crutches Animation Pack"]={
    Idle=85410402353372,
    Walk=123671718357430,
    Run=94979324750170,
    Jump=72213681851601,
    Fall=135941814916655,
    Climb=92021065096713,
    Swim=100985316828291,
    Weight=9,
    Weight2=1
},
["🛌 Laying Down Animation Pack"]={
    Idle=98654743568723,
    Walk=120847756526468,
    Run=109878108258835,
    Jump=111870114935354,
    Fall=78196735628716,
    Climb=82683381954712,
    Swim=70754508251319,
    Weight=9,
    Weight2=1
},
["Catwalk Animation Pack"]={
    Idle=101669074550523,
    Walk=106749564365588,
    Run=79781877243429,
    Jump=74292242880451,
    Fall=118512028179107,
    Climb=122036347791433,
    Swim=100649561882330,
    Weight=9,
    Weight2=1
},
["bouncing animation pack"]={
    Idle=104588862508342,
    Walk=80139155908224,
    Run=76682684156728,
    Jump=137784565053973,
    Fall=118373564265600,
    Climb=138360712532484,
    Swim=77296029509788,
    Weight=9,
    Weight2=1
},
["Xannedo's Villain Evil Animation Pack"]={
    Idle=85815833036279,
    Walk=128525256423214,
    Run=95861576159383,
    Jump=118295581477020,
    Fall=105678274572973,
    Climb=121680969359720,
    Swim=98798001211046,
    Weight=9,
    Weight2=1
},
["Fast R6 Animation Pack"]={
    Idle=90127433330969,
    Walk=119787088296219,
    Run=102293585283404,
    Jump=82033604974127,
    Fall=91114056151897,
    Climb=88498889627034,
    Swim=131552034140165,
    Weight=9,
    Weight2=1
},
["Preppy Animation Pack"]={
    Idle=71458730890691,
    Walk=89162232904839,
    Run=128361408191364,
    Jump=113898142984795,
    Fall=83483079645745,
    Climb=133028688963941,
    Swim=80095722092137,
    Weight=9,
    Weight2=1
},
["Bunny Hop Animation Pack"]={
    Idle=103099266612099,
    Walk=73863091201068,
    Run=83597390080075,
    Jump=93813152699504,
    Fall=85140727146521,
    Climb=103132713842930,
    Swim=133112395950709,
    Weight=9,
    Weight2=1
},
["Tsundere Animation Pack"]={
    Idle=114875140433256,
    Walk=108526601061721,
    Run=76151663022671,
    Jump=83923174202568,
    Fall=94236133353214,
    Climb=73379865259884,
    Swim=81953883148936,
    Weight=9,
    Weight2=1
},
["R6 Animation Pack"]={
    Idle=118913179787930,
    Walk=106869752330504,
    Run=119331445794768,
    Jump=89720452983266,
    Fall=96229649336915,
    Climb=136243639664328,
    Swim=107942326942204,
    Weight=9,
    Weight2=1
},
["Dog Animation Pack"]={
    Idle=118094022160552,
    Walk=138112806064622,
    Run=93407833777810,
    Jump=124598204643980,
    Fall=85779085489983,
    Climb=104480695514431,
    Swim=86883112454512,
    Weight=9,
    Weight2=1
},
["💫 Sideways Animation Pack"]={
    Idle=99749560819767,
    Walk=82135856945883,
    Run=131851835451632,
    Jump=135612490735509,
    Fall=97450851289172,
    Climb=120027821222658,
    Swim=132806502090942,
    Weight=9,
    Weight2=1
},
["FPS animation pack"]={
    Idle=122179013401022,
    Walk=112017477441291,
    Run=103041554793053,
    Jump=82626706976667,
    Fall=105079447654451,
    Climb=132303931872456,
    Swim=71296401113007,
    Weight=9,
    Weight2=1
},
["Dizzy Animation Pack"]={
    Idle=137255148783720,
    Walk=81054479341998,
    Run=105873418863090,
    Jump=121811306911133,
    Fall=78281355074909,
    Climb=117513930450845,
    Swim=97259493650901,
    Weight=9,
    Weight2=1
},
["Athlete Animation Pack"]={
    Idle=70691016120578,
    Walk=80008645275308,
    Run=93212396605611,
    Jump=113363472553303,
    Fall=127600811557545,
    Climb=136335661141870,
    Swim=105089091258573,
    Weight=9,
    Weight2=1
},
["🌀 Rolling Animation Pack"]={
    Idle=85049804983250,
    Walk=102892126379915,
    Run=90567858054506,
    Jump=131512910174707,
    Fall=121165334288374,
    Climb=81583769290238,
    Swim=79042464860861,
    Weight=9,
    Weight2=1
},
["Original R15 Animation Pack (2016)"]={
    Idle=104569393799827,
    Walk=129751901801757,
    Run=117813640679681,
    Jump=103141453457952,
    Fall=127943787839575,
    Climb=129078082496213,
    Swim=86295965325303,
    Weight=9,
    Weight2=1
},
["Source Animation Pack"]={
    Idle=106887960249139,
    Walk=111298226658303,
    Run=70492756512419,
    Jump=128336755746804,
    Fall=134148469532283,
    Climb=130431764005261,
    Swim=80966804467436,
    Weight=9,
    Weight2=1
},
["R6 Business Animation Pack"]={
    Idle=81382665012202,
    Walk=116920329570203,
    Run=105964888251041,
    Jump=106453512771879,
    Fall=103576418405645,
    Climb=127681841734652,
    Swim=105047083821687,
    Weight=9,
    Weight2=1
},
["Perfect Cell DBZ Animation Pack"]={
    Idle=123078880372263,
    Walk=83652156421673,
    Run=100131860829130,
    Jump=87680392021969,
    Fall=93572774419270,
    Climb=126948857869654,
    Swim=85645144592981,
    Weight=9,
    Weight2=1
},
["Gregory Animation Pack"]={
    Idle=73739915930995,
    Walk=124347157659207,
    Run=76225618741161,
    Jump=112835030546361,
    Fall=72218362772132,
    Climb=101545166089197,
    Swim=106377359599754,
    Weight=9,
    Weight2=1
},
["Hands In Pocket Animation Pack"]={
    Idle=108828542105034,
    Walk=87879380757998,
    Run=117247361412658,
    Jump=92983911763671,
    Fall=126047077380493,
    Climb=73104700110945,
    Swim=122155900757798,
    Weight=9,
    Weight2=1
},
["Wheelchair Animation Pack"]={
    Idle=97543848434701,
    Walk=135052870785003,
    Run=123296693426760,
    Jump=120823119341363,
    Fall=130537767707325,
    Climb=131570042308625,
    Swim=123918243473161,
    Weight=9,
    Weight2=1
},
["Sword Animation Pack"]={
    Idle=81538065722442,
    Walk=114265223449292,
    Run=118840473555425,
    Jump=84684937995418,
    Fall=108390215565683,
    Climb=78714711236374,
    Swim=92510712661914,
    Weight=9,
    Weight2=1
},
["cat-girl animation pack"]={
    Idle=81209949658558,
    Walk=107866926471512,
    Run=106803440404860,
    Jump=109977769778820,
    Fall=89736643621614,
    Climb=88202442870120,
    Swim=72664017548680,
    Weight=9,
    Weight2=1
},
["Cute Animation Pack"]={
    Idle=138939410330874,
    Walk=99840464746127,
    Run=73656936285475,
    Jump=121638805023018,
    Fall=103433308815918,
    Climb=71446019452035,
    Swim=106328912863928,
    Weight=9,
    Weight2=1
},
["Tall Monster R6 Animation Pack"]={
    Idle=71612766821659,
    Walk=77622719257173,
    Run=94009603671439,
    Jump=97037008587723,
    Fall=104711093066384,
    Climb=128768803888545,
    Swim=80372521278348,
    Weight=9,
    Weight2=1
},
["Mickey Mouse Animation Pack"]={
    Idle=75766022099692,
    Walk=102955620606802,
    Run=115732339070538,
    Jump=105934284713897,
    Fall=104637473833190,
    Climb=127704939432618,
    Swim=117185983759102,
    Weight=9,
    Weight2=1
},
["Federal Task Force Animation Pack"]={
    Idle=74999693143049,
    Walk=129253330256380,
    Run=74091631030026,
    Jump=77623506307755,
    Fall=136332556456096,
    Climb=105367771427737,
    Swim=73659935773364,
    Weight=9,
    Weight2=1
},
["Gotta Go Fast Animation Pack"]={
    Idle=127672466743602,
    Walk=120787908799530,
    Run=100890277971888,
    Jump=107368746234442,
    Fall=85450728644596,
    Climb=111641114333170,
    Swim=76812838253289,
    Weight=9,
    Weight2=1
},
["Kawaii Cute Animation Pack"]={
    Idle=77366149166865,
    Walk=111237645655965,
    Run=82599883242751,
    Jump=81595621004855,
    Fall=109007038999660,
    Climb=75336407514201,
    Swim=111359729079132,
    Weight=9,
    Weight2=1
},
["Salior Moon Animation Pack"]={
    Idle=128972110211940,
    Walk=121040609760482,
    Run=129201061101131,
    Jump=81623074676742,
    Fall=77276966787966,
    Climb=127305194977291,
    Swim=78731136667898,
    Weight=9,
    Weight2=1
},
["Diva Animation Pack"]={
    Idle=110939102515835,
    Walk=134074844460853,
    Run=72599534880308,
    Jump=77243319322701,
    Fall=88659517729795,
    Climb=107562494548189,
    Swim=94607250506635,
    Weight=9,
    Weight2=1
},
["Goku Black DBZ Animation Pack"]={
    Idle=104194643545172,
    Walk=138903011838068,
    Run=132676154586749,
    Jump=105470967344542,
    Fall=136587199782676,
    Climb=74808869824979,
    Swim=137598261325931,
    Weight=9,
    Weight2=1
},
["Cute Retro Doll Animation Pack"]={
    Idle=90972816651109,
    Walk=122928308167721,
    Run=70659521944498,
    Jump=138897946347085,
    Fall=110229294313640,
    Climb=97646271895174,
    Swim=125684167401128,
    Weight=9,
    Weight2=1
},
["Divine Flying Animation Pack"]={
    Idle=91319082368049,
    Walk=121637095783548,
    Run=128437883234771,
    Jump=127521038977372,
    Fall=101997725794957,
    Climb=81505267290812,
    Swim=88705499187082,
    Weight=9,
    Weight2=1
},
["Retro Animation Pack R6/Lively"]={
    Idle=92509233321337,
    Walk=125613421305793,
    Run=107298094686520,
    Jump=124782675300685,
    Fall=85308528848133,
    Climb=120177401333629,
    Swim=79699570324366,
    Weight=9,
    Weight2=1
},
["Xannedo's Car Animation Pack"]={
    Idle=94540633920583,
    Walk=139918059527235,
    Run=132936918916845,
    Jump=105252553492166,
    Fall=87840349722122,
    Climb=103791829010001,
    Swim=96465729488881,
    Weight=9,
    Weight2=1
},
["🌌 Cursed Aura Animation Pack"]={
    Idle=97143305065955,
    Walk=127923826631873,
    Run=127941986640713,
    Jump=97995248867633,
    Fall=123513572359442,
    Climb=111680298736926,
    Swim=136471239006830,
    Weight=9,
    Weight2=1
},
["Mini Animation Pack"]={
    Idle=92994023113266,
    Walk=85784782101251,
    Run=109463937360267,
    Jump=139675952541087,
    Fall=133585670976062,
    Climb=126991961306811,
    Swim=133840982589891,
    Weight=9,
    Weight2=1
},
["Kris Dark World Animation Pack"]={
    Idle=104018107350199,
    Walk=78436686157814,
    Run=76668923126696,
    Jump=100188263389974,
    Fall=91425840050075,
    Climb=114949195634852,
    Swim=74088401169028,
    Weight=9,
    Weight2=1
},
["Scout Animation Pack"]={
    Idle=137127588287195,
    Walk=87118068694904,
    Run=94293450922898,
    Jump=99756316374541,
    Fall=137497482248930,
    Climb=123437960383557,
    Swim=125172920887602,
    Weight=9,
    Weight2=1
},
["Floaty Balloon Animation Pack"]={
    Idle=138136342971842,
    Walk=80202578130631,
    Run=116960021390413,
    Jump=113851298900821,
    Fall=130027747159494,
    Climb=129094214701938,
    Swim=93496976601246,
    Weight=9,
    Weight2=1
},
["Mecha Hover Animation Pack"]={
    Idle=105465397456832,
    Walk=108107213944016,
    Run=131811937799139,
    Jump=103327511860814,
    Fall=90757382319852,
    Climb=110625437745600,
    Swim=94622209398382,
    Weight=9,
    Weight2=1
},
["Homelander Animation Pack"]={
    Idle=118827366652292,
    Walk=116504910554439,
    Run=127391374824193,
    Jump=138128858838802,
    Fall=130644996627500,
    Climb=91220117774353,
    Swim=89945440336631,
    Weight=9,
    Weight2=1
},
["😨 Scared Animation Pack"]={
    Idle=90237026580990,
    Walk=77822102966862,
    Run=85480331395984,
    Jump=81440723469898,
    Fall=133937014439452,
    Climb=110779228631501,
    Swim=71776129685020,
    Weight=9,
    Weight2=1
},
["Ultra Ego Vegeta DBZ Animation Pack"]={
    Idle=75643546324679,
    Walk=83721220762516,
    Run=74737595876798,
    Jump=83907043569056,
    Fall=124211100902688,
    Climb=96167022431514,
    Swim=86807625639951,
    Weight=9,
    Weight2=1
},
["Nonchalant Animation Pack"]={
    Idle=89787414975748,
    Walk=83664167603586,
    Run=138481968107210,
    Jump=113804999169577,
    Fall=100716347284292,
    Climb=118693134451664,
    Swim=85007279942300,
    Weight=9,
    Weight2=1
},
[":fly Animation Pack"]={
    Idle=133064990823263,
    Walk=77694220459887,
    Run=103186412918230,
    Jump=121814280491943,
    Fall=99710704863791,
    Climb=84579378470982,
    Swim=113752777159564,
    Weight=9,
    Weight2=1
},
["Deltarune Spamton Animation Pack"]={
    Idle=102792917576140,
    Walk=74932374372415,
    Run=111429721936114,
    Jump=106065968725386,
    Fall=105741015613708,
    Climb=74507897485965,
    Swim=97811615475253,
    Weight=9,
    Weight2=1
},
["Floating Aura Animation Pack"]={
    Idle=72943241324535,
    Walk=106068663130196,
    Run=71028409996471,
    Jump=118234173683058,
    Fall=88297913712194,
    Climb=75271252156441,
    Swim=100459435965166,
    Weight=9,
    Weight2=1
},
["Spiderman Superhero Animation Pack"]={
    Idle=71731575290845,
    Walk=102178317171429,
    Run=101299187952996,
    Jump=112403225814757,
    Fall=135107838974309,
    Climb=117533620744630,
    Swim=76503321994696,
    Weight=9,
    Weight2=1
},
["Prank Animation Pack"]={
    Idle=92599696593804,
    Walk=75679244076246,
    Run=82261874695810,
    Jump=78915205490622,
    Fall=128340362214855,
    Climb=86185791097602,
    Swim=81904713642007,
    Weight=9,
    Weight2=1
},
["Retro 2014 Animation Pack"]={
    Idle=134228129417789,
    Walk=95716530523541,
    Run=95732905437872,
    Jump=133707960471465,
    Fall=77386478841794,
    Climb=126378549473837,
    Swim=104758184476068,
    Weight=9,
    Weight2=1
},
["Deltarune Queen Animation Pack"]={
    Idle=93014431428411,
    Walk=72590040200060,
    Run=96627982277796,
    Jump=76154049480127,
    Fall=81587863563435,
    Climb=94456333567469,
    Swim=115708409799867,
    Weight=9,
    Weight2=1
},
["Fort Builder OG Animation Pack"]={
    Idle=97230173731082,
    Walk=134970383093058,
    Run=97799166157260,
    Jump=75649470224104,
    Fall=98934949798992,
    Climb=137147668660557,
    Swim=139598145409927,
    Weight=9,
    Weight2=1
},
["Fashion Queen Animation Pack"]={
    Idle=111065779319998,
    Walk=71277192546705,
    Run=82911122303579,
    Jump=79308901257784,
    Fall=76767471143702,
    Climb=110328621284815,
    Swim=119830608407236,
    Weight=9,
    Weight2=1
},
["1.0 Aura Lean Animation Pack"]={
    Idle=98771512862635,
    Walk=85598278006606,
    Run=128494436000991,
    Jump=92111826664606,
    Fall=104444799004635,
    Climb=73956813057691,
    Swim=75936773504814,
    Weight=9,
    Weight2=1
},
["Electric Animation Pack"]={
    Idle=91555323662648,
    Walk=138822304105370,
    Run=83989806170135,
    Jump=112190482112877,
    Fall=113389481465667,
    Climb=77487602833649,
    Swim=104764901614871,
    Weight=9,
    Weight2=1
},
["Slippery Animation Pack"]={
    Idle=104949848806618,
    Walk=103195487043544,
    Run=118419626200766,
    Jump=93026869036259,
    Fall=114868512480463,
    Climb=109340193761017,
    Swim=137412845554673,
    Weight=9,
    Weight2=1
},
["bouncy ball animation pack"]={
    Idle=129670308155214,
    Walk=121475365648537,
    Run=107208991798497,
    Jump=139482577013732,
    Fall=113935800315984,
    Climb=118288422021354,
    Swim=85919112607479,
    Weight=9,
    Weight2=1
},
["Fashion Style Animation Pack"]={
    Idle=78053204338059,
    Walk=73690504322233,
    Run=125517986759778,
    Jump=94857618663980,
    Fall=95101109247196,
    Climb=77329968604041,
    Swim=130737271346088,
    Weight=9,
    Weight2=1
},
["Action Figure Animation Pack"]={
    Idle=115854857573366,
    Walk=90486050338241,
    Run=74298662639114,
    Jump=88725079143077,
    Fall=81118606997193,
    Climb=136189052201578,
    Swim=87238705855506,
    Weight=9,
    Weight2=1
},
["Cute Aesthetic Animation Pack"]={
    Idle=111820801843978,
    Walk=95757228483548,
    Run=82529210319938,
    Jump=109837574157929,
    Fall=73182977018604,
    Climb=72947979643484,
    Swim=136701955266172,
    Weight=9,
    Weight2=1
},
["Cartwheel Animation Pack"]={
    Idle=80193205142467,
    Walk=129901213309743,
    Run=104732648506939,
    Jump=127494243664410,
    Fall=138798435763887,
    Climb=78120923681017,
    Swim=103812203474405,
    Weight=9,
    Weight2=1
},
["KPop Animation Pack"]={
    Idle=122363156859319,
    Walk=74326146728053,
    Run=135961837507665,
    Jump=127400499757492,
    Fall=122033380730491,
    Climb=115744234554508,
    Swim=92080207021696,
    Weight=9,
    Weight2=1
},
["Shy Animation Pack"]={
    Idle=74027966905255,
    Walk=93700100434615,
    Run=93257133071335,
    Jump=80934885560324,
    Fall=105077921085819,
    Climb=102939994601102,
    Swim=129305934632615,
    Weight=9,
    Weight2=1
},
["Aura Monster Animation Pack"]={
    Idle=79217605500977,
    Walk=114622148888245,
    Run=114392672746467,
    Jump=75377988573819,
    Fall=78382710925140,
    Climb=96861755034176,
    Swim=126258172507161,
    Weight=9,
    Weight2=1
},
["Extraterrestrial Racing Pilot Animation Pack"]={
    Idle=134158935182862,
    Walk=106676565838317,
    Run=97628017280861,
    Jump=115634554652850,
    Fall=99514833488858,
    Climb=138887636063583,
    Swim=121397765977312,
    Weight=9,
    Weight2=1
},
["Gojo Animation Pack"]={
    Idle=124040127645402,
    Walk=72424590488316,
    Run=90604043688392,
    Jump=129084841320936,
    Fall=99430723991674,
    Climb=125143072297572,
    Swim=102071588052329,
    Weight=9,
    Weight2=1
},
["Springy Animation Pack"]={
    Idle=127048747632593,
    Walk=107845744161745,
    Run=100519451083931,
    Jump=103645244715378,
    Fall=96687668124366,
    Climb=106067835730852,
    Swim=125762294796576,
    Weight=9,
    Weight2=1
},
["Toy Animation Pack"]={
    Idle=973771666,
    Walk=973767371,
    Run=973766674,
    Jump=973770652,
    Fall=973768058,
    Climb=973773170,
    Swim=973772659,
    Weight=9,
    Weight2=1
},
["Normal Animation Pack"]={
    Idle=78225344508915,
    Walk=113454440575540,
    Run=108917750956325,
    Jump=95104132069565,
    Fall=132088401100486,
    Climb=140266970336590,
    Swim=138397281164366,
    Weight=9,
    Weight2=1
},
["Mafia Boss Animation Pack"]={
    Idle=137129257555113,
    Walk=137639507915743,
    Run=127112941824252,
    Jump=109115809372480,
    Fall=139885481339333,
    Climb=94157946527913,
    Swim=98231997651207,
    Weight=9,
    Weight2=1
},
["Male Survivor Animation Pack"]={
    Idle=102228266334727,
    Walk=135744877882202,
    Run=135886122810040,
    Jump=79775742118976,
    Fall=125104658376134,
    Climb=80773251277106,
    Swim=136634795907059,
    Weight=9,
    Weight2=1
},
["Aura Animation Pack"]={
    Idle=103073671112449,
    Walk=107974792006222,
    Run=126690709549004,
    Jump=131932286655764,
    Fall=74746323396145,
    Climb=103443334658077,
    Swim=128846499821276,
    Weight=9,
    Weight2=1
},
["Samurai Animation Pack"]={
    Idle=121241183076649,
    Walk=111049170024813,
    Run=108178534241898,
    Jump=87502770759894,
    Fall=138444994981244,
    Climb=110588257756222,
    Swim=123712910778913,
    Weight=9,
    Weight2=1
},
["UFO Animation Pack"]={
    Idle=86002159310340,
    Walk=81974271469844,
    Run=71265049412405,
    Jump=111967342383904,
    Fall=137267981364088,
    Climb=119918231536490,
    Swim=89311294678527,
    Weight=9,
    Weight2=1
},
["Scared Animation Pack"]={
    Idle=114775668757009,
    Walk=82760006654664,
    Run=105875635682320,
    Jump=102681123390008,
    Fall=78074259839981,
    Climb=95179848851691,
    Swim=80695088180591,
    Weight=9,
    Weight2=1
},
["Floating Animation Pack"]={
    Idle=107969744822134,
    Walk=126878962164794,
    Run=125825030020535,
    Jump=114173400001445,
    Fall=123091416353291,
    Climb=111509537839107,
    Swim=96516668244672,
    Weight=9,
    Weight2=1
},
["Aura Farm Animation Pack"]={
    Idle=124764022610936,
    Walk=120148334329668,
    Run=95686696151186,
    Jump=93157953375621,
    Fall=84063677359518,
    Climb=99387856326270,
    Swim=134353666716167,
    Weight=9,
    Weight2=1
},
["Swordsman Animation Pack"]={
    Idle=102544573402763,
    Walk=79777552332572,
    Run=85681056409264,
    Jump=89172997787336,
    Fall=126534314406122,
    Climb=78276347169653,
    Swim=92852866554486,
    Weight=9,
    Weight2=1
},
["Chill Sans Animation Pack"]={
    Idle=112944862004993,
    Walk=72674347277707,
    Run=71478173638235,
    Jump=91421196767692,
    Fall=110692746605068,
    Climb=110657410245187,
    Swim=82787252731052,
    Weight=9,
    Weight2=1
},
["Tired Animation Pack"]={
    Idle=73489489681307,
    Walk=100931696134805,
    Run=101206982621631,
    Jump=71454820364163,
    Fall=85593014317701,
    Climb=76423787644807,
    Swim=116873862222013,
    Weight=9,
    Weight2=1
},
["Cute Animation Pack"]={
    Idle=117735426342277,
    Walk=123775886616413,
    Run=117487593570857,
    Jump=73236558642306,
    Fall=83764365105957,
    Climb=98470955363206,
    Swim=119949535042034,
    Weight=9,
    Weight2=1
},
["Wicked Popular Animation Pack"]={
    Idle=101839542383818,
    Walk=133304526526319,
    Run=136276875045281,
    Jump=130373407996664,
    Fall=83937116921114,
    Climb=135810009801094,
    Swim=128475661806875,
    Weight=9,
    Weight2=1
},
["Happy Animation Pack"]={
    Idle=77561521369868,
    Walk=85161663022009,
    Run=93329852409612,
    Jump=116520958726270,
    Fall=124602176885000,
    Climb=105359269785961,
    Swim=123008597737878,
    Weight=9,
    Weight2=1
},
["Blue Lock Egoist Animation Pack"]={
    Idle=75542955567804,
    Walk=111269078107515,
    Run=111598704377621,
    Jump=117009493894962,
    Fall=127315461455760,
    Climb=70450051394124,
    Swim=90977780010690,
    Weight=9,
    Weight2=1
},
["Kawaii Bouncy Animation Pack"]={
    Idle=70555112060391,
    Walk=120312452429453,
    Run=107040972522394,
    Jump=85980076701165,
    Fall=110732584497974,
    Climb=119148235349086,
    Swim=136546912982911,
    Weight=9,
    Weight2=1
},
["Depressed Emo Sad Boy Animation Pack"]={
    Idle=124256164019863,
    Walk=98513750834476,
    Run=89272613969612,
    Jump=85079464128690,
    Fall=137322039607554,
    Climb=109747404554050,
    Swim=72145136704860,
    Weight=9,
    Weight2=1
},
["Game Action Animation Pack"]={
    Idle=129348708502266,
    Walk=137169809885705,
    Run=78724667837778,
    Jump=98799780243687,
    Fall=128794109070275,
    Climb=89114068117207,
    Swim=101631704835250,
    Weight=9,
    Weight2=1
},
["Tall Scary Monster Animation Pack"]={
    Idle=73397786863604,
    Walk=96649427876114,
    Run=133979581306937,
    Jump=136531259109034,
    Fall=104082651391026,
    Climb=110758265895374,
    Swim=140064706297430,
    Weight=9,
    Weight2=1
},
["Flying Carpet Animation Pack"]={
    Idle=104618376935402,
    Walk=81360319712195,
    Run=138619576540159,
    Jump=80854068046729,
    Fall=121441293612856,
    Climb=75963901385706,
    Swim=115178063256413,
    Weight=9,
    Weight2=1
},
["Original R6 Animation Pack"]={
    Idle=122837975215393,
    Walk=132557156577473,
    Run=130838956714309,
    Jump=116856313824308,
    Fall=73088092212760,
    Climb=87697566409991,
    Swim=138836872269781,
    Weight=9,
    Weight2=1
},
["Runway Animation Pack"]={
    Idle=75361441749543,
    Walk=91135166347931,
    Run=119595460467007,
    Jump=132525041512601,
    Fall=87631875099099,
    Climb=123500969296563,
    Swim=94153750287125,
    Weight=9,
    Weight2=1
},
["Gentle Animation Pack"]={
    Idle=131568652086974,
    Walk=139905256703920,
    Run=120908509837969,
    Jump=74779140332889,
    Fall=103630400781175,
    Climb=109690802682419,
    Swim=87847411475746,
    Weight=9,
    Weight2=1
},
["🐰 Cute Bunny Animation Pack"]={
    Idle=118370745616654,
    Walk=79446499904743,
    Run=90885773748548,
    Jump=110012204344593,
    Fall=76484518940107,
    Climb=124741997394776,
    Swim=82515287431637,
    Weight=9,
    Weight2=1
},
["airplane arms out animation pack"]={
    Idle=116891838116244,
    Walk=128962686456155,
    Run=124909938819576,
    Jump=72811795782695,
    Fall=73269924003655,
    Climb=105851071634044,
    Swim=111585656521605,
    Weight=9,
    Weight2=1
},
["Goofy Animation Pack"]={
    Idle=84571477575895,
    Walk=80681301193337,
    Run=120640311651725,
    Jump=132412289624096,
    Fall=117623392142997,
    Climb=88664980914825,
    Swim=133064692444834,
    Weight=9,
    Weight2=1
},
["Aura Animation Pack"]={
    Idle=106829617915307,
    Walk=112883579107748,
    Run=101843753364599,
    Jump=121185194651924,
    Fall=132263539885390,
    Climb=110776158155975,
    Swim=87638700569387,
    Weight=9,
    Weight2=1
},
["GTA CJ Animation Pack"]={
    Idle=129967003835088,
    Walk=98106599274596,
    Run=121376515612452,
    Jump=103848345009758,
    Fall=97025254217957,
    Climb=125584778256606,
    Swim=74656778237250,
    Weight=9,
    Weight2=1
},
["🃏 Jester Clown Animation Pack"]={
    Idle=91576888047241,
    Walk=70894989148183,
    Run=118512899981412,
    Jump=138532413619262,
    Fall=92447755325919,
    Climb=114785749673065,
    Swim=117103561764568,
    Weight=9,
    Weight2=1
},
["Floating Ghost Animation Pack"]={
    Idle=73922889839499,
    Walk=73439268040958,
    Run=117180457314481,
    Jump=128909044288103,
    Fall=102279854866683,
    Climb=119151752115147,
    Swim=78596128116729,
    Weight=9,
    Weight2=1
},
["Dark Souls Animation Pack"]={
    Idle=83615457626534,
    Walk=96620836424943,
    Run=127928233242645,
    Jump=82562747464633,
    Fall=104959949303168,
    Climb=123590835737622,
    Swim=123685052537196,
    Weight=9,
    Weight2=1
},
["Godly Endless Aura Animation Pack"]={
    Idle=112682806659479,
    Walk=75394898627258,
    Run=99961532364115,
    Jump=101614282604304,
    Fall=75326918143034,
    Climb=135376188693230,
    Swim=90862503321139,
    Weight=9,
    Weight2=1
},
["SSJ3 Goku DBZ Animation Pack"]={
    Idle=102994438121065,
    Walk=98217934389093,
    Run=107411587365865,
    Jump=92844137321144,
    Fall=138553022046795,
    Climb=82749924026067,
    Swim=88295483220725,
    Weight=9,
    Weight2=1
},
["Goth Animation Pack"]={
    Idle=121365926712528,
    Walk=99527709874253,
    Run=140040054955661,
    Jump=101865902940161,
    Fall=138184028627174,
    Climb=116569346780310,
    Swim=78788122672677,
    Weight=9,
    Weight2=1
},
["Wally Speedster Animation Pack"]={
    Idle=108555960146641,
    Walk=75903750696200,
    Run=104095533822833,
    Jump=99748624469232,
    Fall=132551179683942,
    Climb=137030518305787,
    Swim=129549072000159,
    Weight=9,
    Weight2=1
},
["R6 Animation Pack"]={
    Idle=80213479081676,
    Walk=129199912195783,
    Run=140400050836536,
    Jump=87666666569025,
    Fall=119938743070440,
    Climb=74638475205792,
    Swim=118625655089703,
    Weight=9,
    Weight2=1
},
["💎 Thief Animation Pack"]={
    Idle=117056542841555,
    Walk=81753747880748,
    Run=135474881909701,
    Jump=85077406806537,
    Fall=91529779622849,
    Climb=120800333027049,
    Swim=79829814412337,
    Weight=9,
    Weight2=1
},
["Secret Agent Animation Pack"]={
    Idle=119003949092467,
    Walk=82175877109154,
    Run=89020428143529,
    Jump=93176681252220,
    Fall=121591357748591,
    Climb=75470907514985,
    Swim=112551804662796,
    Weight=9,
    Weight2=1
},
["Infected Animation Pack"]={
    Idle=109545591191019,
    Walk=124297869209556,
    Run=115460085699080,
    Jump=97275481548306,
    Fall=117280812567364,
    Climb=107627680157678,
    Swim=95438452976201,
    Weight=9,
    Weight2=1
},
["Anime Emo Animation Pack"]={
    Idle=134382029907457,
    Walk=127695127906987,
    Run=71283597742449,
    Jump=140632400496179,
    Fall=99273625709769,
    Climb=113393058842620,
    Swim=140592052152309,
    Weight=9,
    Weight2=1
},
["Block Game Animation Pack"]={
    Idle=112233648197387,
    Walk=105370336301524,
    Run=95830914663722,
    Jump=136979548763619,
    Fall=78497466211065,
    Climb=118485682966905,
    Swim=83652807640055,
    Weight=9,
    Weight2=1
},
["Dog Animation Pack"]={
    Idle=84324707404321,
    Walk=106440966913248,
    Run=75222080312923,
    Jump=81156300482107,
    Fall=139229868393677,
    Climb=78869251945889,
    Swim=104059797316176,
    Weight=9,
    Weight2=1
},
["Scene Animation Pack"]={
    Idle=78330241491267,
    Walk=117114990154903,
    Run=89538003333379,
    Jump=87917060499954,
    Fall=98344100700384,
    Climb=94094625251718,
    Swim=130414106541702,
    Weight=9,
    Weight2=1
},
["Baddie Animation Pack"]={
    Idle=97780371093134,
    Walk=138421976075298,
    Run=135476557053455,
    Jump=90720055810864,
    Fall=137853627159856,
    Climb=88822771263405,
    Swim=125772288690585,
    Weight=9,
    Weight2=1
},
["R15 Legacy Animation Pack 2015"]={
    Idle=120472842054186,
    Walk=130255328834500,
    Run=100126079931609,
    Jump=91356130464283,
    Fall=75592527244796,
    Climb=122911138720253,
    Swim=133746756603282,
    Weight=9,
    Weight2=1
},
["Cutesy Animation Pack"]={
    Idle=132599551121207,
    Walk=78867782762086,
    Run=82726162785476,
    Jump=89295799464325,
    Fall=123938386040625,
    Climb=120855403607062,
    Swim=97633587566533,
    Weight=9,
    Weight2=1
},
["God Animation Pack"]={
    Idle=115973567825543,
    Walk=103323691165756,
    Run=118581474294164,
    Jump=98969036149560,
    Fall=105409300510346,
    Climb=140084477633651,
    Swim=89856268694388,
    Weight=9,
    Weight2=1
},
["[broken] Sneaky Animation Pack"]={
    Idle=102935680727216,
    Walk=74395846179985,
    Run=72648865224049,
    Jump=93332696551413,
    Fall=132286859404276,
    Climb=74868603921509,
    Swim=121161423587459,
    Weight=9,
    Weight2=1
},
["Sweet Animation Pack"]={
    Idle=111065937647099,
    Walk=137802863789523,
    Run=86632239324746,
    Jump=118406823930557,
    Fall=92998242853301,
    Climb=105204933008964,
    Swim=130161724591774,
    Weight=9,
    Weight2=1
},
["Classic Retro Zombie Animation Pack"]={
    Idle=126021434246460,
    Walk=117048226188508,
    Run=75045582652249,
    Jump=125565849274807,
    Fall=98505172546641,
    Climb=80432163494186,
    Swim=113575976044406,
    Weight=9,
    Weight2=1
},
["Flying Animation Pack"]={
    Idle=131625947823783,
    Walk=127254948573086,
    Run=72972054160879,
    Jump=117682296825018,
    Fall=132378285273682,
    Climb=95676804222647,
    Swim=95842322801290,
    Weight=9,
    Weight2=1
},
["Aura Protagonist Animation Pack"]={
    Idle=137025907358739,
    Walk=90379270903311,
    Run=120072392641690,
    Jump=121689690771249,
    Fall=97934227828280,
    Climb=105270430999028,
    Swim=119635319982183,
    Weight=9,
    Weight2=1
},
["Fairy Animation Pack"]={
    Idle=94003895743760,
    Walk=129197233114264,
    Run=123120818793561,
    Jump=135272497634274,
    Fall=74400102724824,
    Climb=129938932672785,
    Swim=108725745962861,
    Weight=9,
    Weight2=1
},
["R6 Baddie Animation Pack"]={
    Idle=107968212772981,
    Walk=98032074645254,
    Run=114829639722864,
    Jump=87299078193756,
    Fall=129033810350407,
    Climb=140606132622683,
    Swim=130237136792960,
    Weight=9,
    Weight2=1
},
["DJ Animation Pack"]={
    Idle=114256340986775,
    Walk=98402342672869,
    Run=129029542457857,
    Jump=81821781739496,
    Fall=100792569259196,
    Climb=130304750920857,
    Swim=71597918118600,
    Weight=9,
    Weight2=1
},
["Car Animation Pack"]={
    Idle=92021594088577,
    Walk=97515561715290,
    Run=126510405029653,
    Jump=104549289947255,
    Fall=135213447372472,
    Climb=115810892761483,
    Swim=122228703403423,
    Weight=9,
    Weight2=1
},
["Neighbour Animation Pack"]={
    Idle=117329143773421,
    Walk=79476635062229,
    Run=89287483741078,
    Jump=72482427656762,
    Fall=111889365061454,
    Climb=109686061441391,
    Swim=97335965344964,
    Weight=9,
    Weight2=1
},
["Princess Animation Pack"]={
    Idle=139566410766923,
    Walk=104129255175952,
    Run=129338264161346,
    Jump=75553656367110,
    Fall=70695506666872,
    Climb=72262009621780,
    Swim=106722422195676,
    Weight=9,
    Weight2=1
},
["Retro Animation Pack"]={
    Idle=91334610292493,
    Walk=113866237794361,
    Run=82449559205951,
    Jump=81975998427267,
    Fall=131265023902034,
    Climb=71746696709344,
    Swim=71819090103948,
    Weight=9,
    Weight2=1
},
["Jolly Animation Pack"]={
    Idle=121468276202179,
    Walk=83096586914276,
    Run=71971990553119,
    Jump=86777047181866,
    Fall=83063007119941,
    Climb=73563861115457,
    Swim=71637541197973,
    Weight=9,
    Weight2=1
},
["💅 Sassy Animation Pack ✨"]={
    Idle=129626196680285,
    Walk=96410564425021,
    Run=75896195178885,
    Jump=114840474009020,
    Fall=80824008450652,
    Climb=136213738352357,
    Swim=124254242876616,
    Weight=9,
    Weight2=1
},
["Moonwalker Animation Pack"]={
    Idle=92710716765283,
    Walk=114763801999339,
    Run=101531926378460,
    Jump=104533631513747,
    Fall=70566441403811,
    Climb=79306475091221,
    Swim=98563274763262,
    Weight=9,
    Weight2=1
},
["Effortless Aura Animation Pack"]={
    Idle=106390953994044,
    Walk=111484087971615,
    Run=112515971043909,
    Jump=89547925261998,
    Fall=135065867268215,
    Climb=116904502538281,
    Swim=133821165523889,
    Weight=9,
    Weight2=1
},
["Jester Clown Animation Pack"]={
    Idle=74343944408319,
    Walk=135451395999513,
    Run=110266189414580,
    Jump=89950611695159,
    Fall=118409452324225,
    Climb=138585255008570,
    Swim=82924458694261,
    Weight=9,
    Weight2=1
},
["Shy Animation Pack"]={
    Idle=105016595700861,
    Walk=116180797147849,
    Run=103084557715769,
    Jump=110381706131025,
    Fall=123521483009114,
    Climb=96156166051413,
    Swim=76776378927518,
    Weight=9,
    Weight2=1
},
["Reversed Animation Pack"]={
    Idle=137073123524958,
    Walk=88868557753462,
    Run=79659905635578,
    Jump=115141069464737,
    Fall=127181456039877,
    Climb=108414237631335,
    Swim=139584439758623,
    Weight=9,
    Weight2=1
},
["R6 Girl Animation Pack"]={
    Idle=111923939139311,
    Walk=112244262274499,
    Run=80324946000474,
    Jump=127063252798596,
    Fall=96735030801894,
    Climb=93507832073441,
    Swim=114939349259848,
    Weight=9,
    Weight2=1
},
["🦋 Fairy Animation Pack"]={
    Idle=89083151597904,
    Walk=70694340291974,
    Run=121135476621722,
    Jump=124909042161301,
    Fall=87787512377012,
    Climb=140475232307421,
    Swim=117829242170557,
    Weight=9,
    Weight2=1
},
["Yandere Animation Pack"]={
    Idle=140336774147023,
    Walk=112140980336039,
    Run=87528642825805,
    Jump=110945849357671,
    Fall=118633153681261,
    Climb=108957728699999,
    Swim=91020496489042,
    Weight=9,
    Weight2=1
},
["Aura Animation Pack"]={
    Idle=134273908839148,
    Walk=92311618626678,
    Run=70535026462043,
    Jump=99327657314192,
    Fall=127424988803310,
    Climb=98088126918874,
    Swim=72269250092786,
    Weight=9,
    Weight2=1
},
["Flying Aura Animation Pack"]={
    Idle=74691485490268,
    Walk=80925477324207,
    Run=73303618259519,
    Jump=110958866240086,
    Fall=92303296493315,
    Climb=86956653116976,
    Swim=132157047704982,
    Weight=9,
    Weight2=1
},
["🤪 Goofball Animation Pack"]={
    Idle=127952167642002,
    Walk=99475662049729,
    Run=113646281767103,
    Jump=100039666240392,
    Fall=92339309933546,
    Climb=117527274426804,
    Swim=101695413408541,
    Weight=9,
    Weight2=1
},
["Cyber Ninja Animation Pack"]={
    Idle=101314116336862,
    Walk=126492341948930,
    Run=88824839372473,
    Jump=107357904936127,
    Fall=115744108030880,
    Climb=73515649873492,
    Swim=138051308545915,
    Weight=9,
    Weight2=1
},
["🔄 Upside Down Animation Pack"]={
    Idle=122297596254318,
    Walk=122745245676622,
    Run=129084919466488,
    Jump=106692008661896,
    Fall=117689643964415,
    Climb=139249246342919,
    Swim=122771615785264,
    Weight=9,
    Weight2=1
},
["Gymrat Animation Pack"]={
    Idle=94077673261306,
    Walk=122715075692793,
    Run=83564775315787,
    Jump=101982737187420,
    Fall=93104762635303,
    Climb=98082408483548,
    Swim=102327580874767,
    Weight=9,
    Weight2=1
},
["Bunny Animation Pack"]={
    Idle=139964563627901,
    Walk=89159427129238,
    Run=139822126855656,
    Jump=87458017242305,
    Fall=126817686809078,
    Climb=107064211701479,
    Swim=113228142307046,
    Weight=9,
    Weight2=1
},
["Heartbreak.exe Emo Animation Pack"]={
    Idle=100466680352645,
    Walk=128339140201385,
    Run=132427869515587,
    Jump=102876541284913,
    Fall=109708299934528,
    Climb=132417358767785,
    Swim=138132604168403,
    Weight=9,
    Weight2=1
},
["Groove Dance Animation Pack"]={
    Idle=95020994137382,
    Walk=113455083511898,
    Run=73526470685752,
    Jump=94203012897842,
    Fall=76550338576013,
    Climb=128960856495314,
    Swim=95723676820577,
    Weight=9,
    Weight2=1
},
["Retro Fairy Animation Pack"]={
    Idle=75905371612717,
    Walk=120090459989745,
    Run=77882802689026,
    Jump=109556114105022,
    Fall=87102008374311,
    Climb=111910555094497,
    Swim=91235217538274,
    Weight=9,
    Weight2=1
},
["Model Animation Pack"]={
    Idle=99423496928172,
    Walk=121379039184992,
    Run=111690474676113,
    Jump=140076228243519,
    Fall=121644281698290,
    Climb=123867543377233,
    Swim=124780401363660,
    Weight=9,
    Weight2=1
},
["Bruiser Animation Pack"]={
    Idle=91486182566842,
    Walk=110119880881706,
    Run=136670254583990,
    Jump=110949855044563,
    Fall=114388482037548,
    Climb=113866830860789,
    Swim=113544566765768,
    Weight=9,
    Weight2=1
},
["Joyous Animation Pack"]={
    Idle=122144918720398,
    Walk=100429024233379,
    Run=108306429625952,
    Jump=86031683612282,
    Fall=116662955282576,
    Climb=84926740358785,
    Swim=102734106087283,
    Weight=9,
    Weight2=1
},
["Silly Animation Pack"]={
    Idle=103515293810292,
    Walk=118717944111797,
    Run=97101290201918,
    Jump=122202419566887,
    Fall=97920845952566,
    Climb=132435236046445,
    Swim=131087238603071,
    Weight=9,
    Weight2=1
},
["Aura Float Animation Pack"]={
    Idle=77944556069734,
    Walk=118783698771757,
    Run=92373181998670,
    Jump=128455215897480,
    Fall=129911095680365,
    Climb=115980070775346,
    Swim=83505514580679,
    Weight=9,
    Weight2=1
},
["Silly Seal Animation Pack"]={
    Idle=110848837021078,
    Walk=76278922106068,
    Run=112124641484207,
    Jump=136889700343436,
    Fall=129767237010484,
    Climb=119516910650077,
    Swim=137154786107025,
    Weight=9,
    Weight2=1
},
["Hoverboard Animation Pack"]={
    Idle=139054058038226,
    Walk=136596748371662,
    Run=101244150992145,
    Jump=110070014442514,
    Fall=102145519849166,
    Climb=96108870072440,
    Swim=124427589699118,
    Weight=9,
    Weight2=1
},
["Creepy Animation Pack"]={
    Idle=117708987405272,
    Walk=127754778693805,
    Run=107910163251050,
    Jump=130554795405542,
    Fall=113689716802826,
    Climb=91613070906598,
    Swim=87971530817887,
    Weight=9,
    Weight2=1
},
["2006 Static Animation Pack"]={
    Idle=102864174159116,
    Walk=132494970654863,
    Run=136128226401691,
    Jump=77087045911032,
    Fall=87738844903905,
    Climb=86098243863453,
    Swim=140622068394574,
    Weight=9,
    Weight2=1
},
["Handstand Animation Pack"]={
    Idle=97864682966274,
    Walk=73418841798805,
    Run=126941949970847,
    Jump=84368545692027,
    Fall=99476325907685,
    Climb=123147618976653,
    Swim=70523334631786,
    Weight=9,
    Weight2=1
},
["Cartoon Motion Animation Pack"]={
    Idle=76725354897742,
    Walk=84909365662561,
    Run=93140675248050,
    Jump=140435602762728,
    Fall=79999419399400,
    Climb=123351725617322,
    Swim=121664272578587,
    Weight=9,
    Weight2=1
},
["🕷🕸 Spider Animation Pack"]={
    Idle=97752276477336,
    Walk=86974846189558,
    Run=106751214578458,
    Jump=96400444754200,
    Fall=80118118211844,
    Climb=133065264033131,
    Swim=80730944481759,
    Weight=9,
    Weight2=1
},
["Reimagined 2016 R15 Animation Pack"]={
    Idle=107572420225086,
    Walk=125235943650557,
    Run=107750092433572,
    Jump=96068875863364,
    Fall=85800511908627,
    Climb=107252923787245,
    Swim=93405710244928,
    Weight=9,
    Weight2=1
},
["3.0 Princess Animation Pack"]={
    Idle=120075135672186,
    Walk=76647144799600,
    Run=79529091692355,
    Jump=88217682976881,
    Fall=71709496377151,
    Climb=78888586606570,
    Swim=75840793282778,
    Weight=9,
    Weight2=1
},
["Floating Animation Pack V2"]={
    Idle=94641155403691,
    Walk=71225129486231,
    Run=101200816297061,
    Jump=135691766788043,
    Fall=130754813307087,
    Climb=76400842192172,
    Swim=103657023754149,
    Weight=9,
    Weight2=1
},
["Formal Animation Pack"]={
    Idle=86581706084882,
    Walk=72515517400250,
    Run=75516877565104,
    Jump=123439051565746,
    Fall=115971739372789,
    Climb=82874913229227,
    Swim=136380936715763,
    Weight=9,
    Weight2=1
},
["Aura Float Animation Pack"]={
    Idle=124158023804554,
    Walk=126690271824216,
    Run=101317217717030,
    Jump=74271054227960,
    Fall=116497123001426,
    Climb=121617225878766,
    Swim=84995563386769,
    Weight=9,
    Weight2=1
},
["Flying Animation Pack"]={
    Idle=92336802177146,
    Walk=74279532761147,
    Run=129540348471975,
    Jump=99030062785653,
    Fall=132933090339937,
    Climb=105931443421147,
    Swim=94909919397469,
    Weight=9,
    Weight2=1
},
["Michael Jackson Animation Pack"]={
    Idle=76037155964970,
    Walk=113944144375220,
    Run=102634251464489,
    Jump=124705071716676,
    Fall=76568676698113,
    Climb=118561903177452,
    Swim=82465999222161,
    Weight=9,
    Weight2=1
},
["Xannedo's Generic Animation Pack"]={
    Idle=99777856614604,
    Walk=110378518344812,
    Run=85010090740014,
    Jump=78943541517934,
    Fall=87470161319119,
    Climb=71506166040222,
    Swim=137760782158375,
    Weight=9,
    Weight2=1
},
["Retro Stop Motion Animation Pack"]={
    Idle=79950243825088,
    Walk=113488091565892,
    Run=91162884449466,
    Jump=90697933766807,
    Fall=97428657354421,
    Climb=87079501576389,
    Swim=111325571415568,
    Weight=9,
    Weight2=1
},
["monocycle/unicycle riding animation pack"]={
    Idle=91454280632467,
    Walk=86449803320796,
    Run=75571301955995,
    Jump=120108206854244,
    Fall=121121787665885,
    Climb=131739373907072,
    Swim=89021907451984,
    Weight=9,
    Weight2=1
},
["boxing fighter animation pack"]={
    Idle=91668887093080,
    Walk=124415193008640,
    Run=102559022696213,
    Jump=133561801961836,
    Fall=123517386847787,
    Climb=88047707031212,
    Swim=89187022301278,
    Weight=9,
    Weight2=1
},
["Ghost Operator Animation Pack"]={
    Idle=119760607290468,
    Walk=124917655024987,
    Run=78096750298792,
    Jump=126239190707253,
    Fall=78097912183014,
    Climb=132672761360187,
    Swim=74874152076582,
    Weight=9,
    Weight2=1
},
["👮 Police Animation Pack"]={
    Idle=74609595407492,
    Walk=121846507583972,
    Run=138501931250671,
    Jump=81601789729658,
    Fall=83033316557999,
    Climb=117940720828106,
    Swim=117816232713957,
    Weight=9,
    Weight2=1
},
["R6 2010 Area 51 Killer Animation Pack"]={
    Idle=91671473696980,
    Walk=78908746914590,
    Run=100609689634332,
    Jump=116767186327088,
    Fall=94303246984474,
    Climb=134746769113724,
    Swim=83082103557735,
    Weight=9,
    Weight2=1
},
["Heavy Animation Pack"]={
    Idle=106732330001103,
    Walk=115268674537182,
    Run=124222171764247,
    Jump=131734443206987,
    Fall=123288093414903,
    Climb=91854949745229,
    Swim=70832105522442,
    Weight=9,
    Weight2=1
},
["Retro NPC Animation Pack"]={
    Idle=124829617681757,
    Walk=139084522783907,
    Run=113026144887166,
    Jump=87185602906223,
    Fall=113437395070392,
    Climb=74818021820423,
    Swim=111938494950555,
    Weight=9,
    Weight2=1
},
["Steven Zombie Animation Pack"]={
    Idle=100128951364392,
    Walk=109841040589237,
    Run=100789055045725,
    Jump=140443524913235,
    Fall=132472674393183,
    Climb=139428539581768,
    Swim=76411737815448,
    Weight=9,
    Weight2=1
},
["cutesy ballerina dance animation pack"]={
    Idle=99812869382937,
    Walk=134722766646668,
    Run=78644199730018,
    Jump=83573315654087,
    Fall=118604189715055,
    Climb=107751755123284,
    Swim=101750170804504,
    Weight=9,
    Weight2=1
},
["Monk Animation Pack"]={
    Idle=92840338870497,
    Walk=95281915824711,
    Run=133072146372178,
    Jump=135210393964488,
    Fall=84855788381401,
    Climb=113518150026183,
    Swim=90526977714025,
    Weight=9,
    Weight2=1
},
["Fashionable Animation Pack"]={
    Idle=97636476503589,
    Walk=105262684140271,
    Run=74728686728152,
    Jump=96245545206482,
    Fall=100065747984368,
    Climb=76669099927235,
    Swim=110900200720688,
    Weight=9,
    Weight2=1
},
["Handcuff Animation Pack"]={
    Idle=120151039351338,
    Walk=131171303285426,
    Run=130632855761214,
    Jump=111611156372556,
    Fall=75417753542103,
    Climb=78238202802922,
    Swim=104693901887454,
    Weight=9,
    Weight2=1
},
["Sword Animation Pack"]={
    Idle=114369154163347,
    Walk=132189012366468,
    Run=87770000067910,
    Jump=113357698901401,
    Fall=108519921701378,
    Climb=112902067866259,
    Swim=117331900750388,
    Weight=9,
    Weight2=1
},
["Ragdoll Animation Pack"]={
    Idle=118801072763379,
    Walk=110047526049559,
    Run=134449493770546,
    Jump=120828898958538,
    Fall=84228811395338,
    Climb=124367468395188,
    Swim=121031855831851,
    Weight=9,
    Weight2=1
},
["Hifi-Beat Animation Pack"]={
    Idle=124021520508462,
    Walk=96738792878457,
    Run=98941809729913,
    Jump=78343871764194,
    Fall=72874241842922,
    Climb=84594109042166,
    Swim=89114507358456,
    Weight=9,
    Weight2=1
},
["🦸‍♂️ Superhero Animation Pack (Floating)"]={
    Idle=120488365012955,
    Walk=129882529617192,
    Run=75276306753537,
    Jump=139628235198994,
    Fall=104339185965828,
    Climb=87820706711345,
    Swim=129003695793530,
    Weight=9,
    Weight2=1
},
["Cute Sleepy Animation Pack"]={
    Idle=82753729197213,
    Walk=84342856874870,
    Run=95828332443989,
    Jump=101191464147123,
    Fall=134891173403801,
    Climb=131105025952814,
    Swim=71011513835759,
    Weight=9,
    Weight2=1
},
["Cartoony Scared Animation Pack"]={
    Idle=139788467990816,
    Walk=89076386352694,
    Run=130193079348374,
    Jump=131461248240163,
    Fall=97342532395004,
    Climb=117724104569866,
    Swim=125243399529226,
    Weight=9,
    Weight2=1
},
["Sad Animation Pack"]={
    Idle=129134357056057,
    Walk=139115198478318,
    Run=124276348647641,
    Jump=103159011889361,
    Fall=130651854569435,
    Climb=86990667693308,
    Swim=70914278918301,
    Weight=9,
    Weight2=1
},
["slow motion animation pack"]={
    Idle=112223701120105,
    Walk=82957310977308,
    Run=103240900201060,
    Jump=128461926069973,
    Fall=124666806897198,
    Climb=91700305141547,
    Swim=125937457994700,
    Weight=9,
    Weight2=1
},
["Lancer Deltarune Animation Pack"]={
    Idle=90514578750559,
    Walk=122542317078389,
    Run=125501558472381,
    Jump=99477623766321,
    Fall=104819712717464,
    Climb=78801940225385,
    Swim=133562417814036,
    Weight=9,
    Weight2=1
},
["Handstand Animation Pack"]={
    Idle=105580383737859,
    Walk=82043232029400,
    Run=123465221499611,
    Jump=80444352909720,
    Fall=79498728184348,
    Climb=119932111212326,
    Swim=136764403306225,
    Weight=9,
    Weight2=1
},
["Sassy Icon Animation Pack"]={
    Idle=118674255507276,
    Walk=70374363666970,
    Run=92054140399231,
    Jump=77088476160154,
    Fall=116251296894082,
    Climb=133046692116989,
    Swim=137535182530243,
    Weight=9,
    Weight2=1
},
["Lazy Teenager Animation Pack"]={
    Idle=74595198822175,
    Walk=124292296214114,
    Run=83900849713800,
    Jump=133548803697772,
    Fall=133731413734994,
    Climb=79275077587793,
    Swim=122059261017247,
    Weight=9,
    Weight2=1
},
["Moonwalker Animation pack"]={
    Idle=87092730974339,
    Walk=104305662446339,
    Run=127713350966761,
    Jump=123819019464972,
    Fall=130543739062744,
    Climb=127390756115448,
    Swim=92439133290637,
    Weight=9,
    Weight2=1
},
["Penguin Animation Pack"]={
    Idle=72717235479279,
    Walk=113261795134108,
    Run=99628455700679,
    Jump=91199208983106,
    Fall=98118841232349,
    Climb=92154304078324,
    Swim=136939851869513,
    Weight=9,
    Weight2=1
},
["Terminally Online Animation Pack"]={
    Idle=97206393421456,
    Walk=88017800638751,
    Run=102792835234538,
    Jump=108816716047602,
    Fall=117702500694183,
    Climb=128025939585952,
    Swim=81593686052329,
    Weight=9,
    Weight2=1
},
["Werewolf Animation Pack"]={
    Idle=83998633851341,
    Walk=118201238462111,
    Run=99873481429129,
    Jump=106939210686305,
    Fall=81075944684031,
    Climb=116603768156237,
    Swim=72411191108512,
    Weight=9,
    Weight2=1
},
["Xannedo's Cute Yandere Animation Pack"]={
    Idle=111937093999069,
    Walk=134425522316276,
    Run=107775256596218,
    Jump=130773604090379,
    Fall=115678807200701,
    Climb=76662417519649,
    Swim=87842341328314,
    Weight=9,
    Weight2=1
},
["Retro Helper Bot R6 Animation Pack"]={
    Idle=75330432855950,
    Walk=98067103818049,
    Run=131692372720032,
    Jump=82360940352684,
    Fall=94764965493396,
    Climb=129360331806204,
    Swim=84260842382064,
    Weight=9,
    Weight2=1
},
["Flying Frog Animation Pack"]={
    Idle=84705173729984,
    Walk=78244956563352,
    Run=86016133727258,
    Jump=121407958307681,
    Fall=73184060170944,
    Climb=132166855736138,
    Swim=95293585284418,
    Weight=9,
    Weight2=1
},
["Cute Floating Animation Pack"]={
    Idle=138581699766756,
    Walk=84509777479713,
    Run=134255000933895,
    Jump=76372245426280,
    Fall=131206560200928,
    Climb=95705394693403,
    Swim=118332693810374,
    Weight=9,
    Weight2=1
},
["Spiders Animation Pack"]={
    Idle=90577576234693,
    Walk=90818489703518,
    Run=111712361290572,
    Jump=128864570532602,
    Fall=88222214848061,
    Climb=70849275940282,
    Swim=100501565397594,
    Weight=9,
    Weight2=1
},
["♡ kitty cat animation pack"]={
    Idle=109403228994402,
    Walk=84525161536363,
    Run=123906332759095,
    Jump=105170217302291,
    Fall=78885751875031,
    Climb=71464111274383,
    Swim=106467941652594,
    Weight=9,
    Weight2=1
},
["Dainty Floating Animation Pack"]={
    Idle=100213682809705,
    Walk=98527636832188,
    Run=75302908618477,
    Jump=113987833999934,
    Fall=82998901027233,
    Climb=113128849187939,
    Swim=125131186410934,
    Weight=9,
    Weight2=1
},
["R6 Animation Pack"]={
    Idle=125541672507085,
    Walk=80753238691927,
    Run=125090045358237,
    Jump=92350883308134,
    Fall=133216496060701,
    Climb=71153058329709,
    Swim=109309374043830,
    Weight=9,
    Weight2=1
},
["Runway Royale Animation Pack"]={
    Idle=74715900853692,
    Walk=123405983688201,
    Run=122698275723868,
    Jump=109047250869477,
    Fall=124304829089431,
    Climb=98360452283407,
    Swim=74676852379213,
    Weight=9,
    Weight2=1
},
["Bicycle Animation Pack"]={
    Idle=82491375427507,
    Walk=98661931480961,
    Run=130170113102737,
    Jump=90075254332019,
    Fall=122767622107222,
    Climb=70997621222494,
    Swim=93618183619877,
    Weight=9,
    Weight2=1
},
["Casual Animation Pack"]={
    Idle=136607681838394,
    Walk=88766053158819,
    Run=78209309053197,
    Jump=70380397793550,
    Fall=123732290752173,
    Climb=88787300450271,
    Swim=78871479374096,
    Weight=9,
    Weight2=1
},
["🎭 Mimic Animation Pack"]={
    Idle=82276843742413,
    Walk=88053533129140,
    Run=95860339756806,
    Jump=103981014197046,
    Fall=106109360007121,
    Climb=110444663940851,
    Swim=93901303771370,
    Weight=9,
    Weight2=1
},
["Furry Animation Pack"]={
    Idle=122017321744523,
    Walk=124732270095091,
    Run=78822241982559,
    Jump=106970102410990,
    Fall=75892211224822,
    Climb=101997929337327,
    Swim=105993144805512,
    Weight=9,
    Weight2=1
},
["Secret Agent Animation Pack"]={
    Idle=92218190346839,
    Walk=104724130283444,
    Run=86044573374946,
    Jump=90413927505422,
    Fall=102469518998022,
    Climb=78168066364210,
    Swim=120149490597139,
    Weight=9,
    Weight2=1
},
["Ralsei Animation Pack"]={
    Idle=85172099818789,
    Walk=86044201646146,
    Run=79820720377244,
    Jump=98527952203860,
    Fall=104760243261756,
    Climb=85589407900365,
    Swim=108106739173193,
    Weight=9,
    Weight2=1
},
["Jester Animation Pack"]={
    Idle=92399096526413,
    Walk=106461077352156,
    Run=136076384470282,
    Jump=92482689671717,
    Fall=127855639525683,
    Climb=80255986158687,
    Swim=75246743928409,
    Weight=9,
    Weight2=1
},
["Xannedo's Flying Animation Pack"]={
    Idle=77264403995318,
    Walk=124723213988275,
    Run=128672919754925,
    Jump=131967189574811,
    Fall=113476439334471,
    Climb=100959862493684,
    Swim=115314692508831,
    Weight=9,
    Weight2=1
},
["Crawl Animation Pack"]={
    Idle=72952710834362,
    Walk=90366376433809,
    Run=89396432007704,
    Jump=79226912725015,
    Fall=73293483928245,
    Climb=78655181398372,
    Swim=90436052334078,
    Weight=9,
    Weight2=1
},
["Cute Shy Animation Pack"]={
    Idle=110335965613791,
    Walk=88354674253567,
    Run=108892505937356,
    Jump=112598844654591,
    Fall=116336440124933,
    Climb=108646387674307,
    Swim=105086806405008,
    Weight=9,
    Weight2=1
},
["Retro Dio Animation Pack"]={
    Idle=122765497084926,
    Walk=88891151668480,
    Run=133211846352573,
    Jump=133432331482544,
    Fall=140610070614538,
    Climb=106337432661731,
    Swim=132721233680142,
    Weight=9,
    Weight2=1
},
["Skipping Animation Pack"]={
    Idle=112587242225137,
    Walk=135483024952357,
    Run=129049260306852,
    Jump=105323284633641,
    Fall=88440325537817,
    Climb=117396960798369,
    Swim=125778138112031,
    Weight=9,
    Weight2=1
},
["Xannedo's Zombie Animation Pack"]={
    Idle=104222882478245,
    Walk=90118465407143,
    Run=89803535252529,
    Jump=88582965648672,
    Fall=93163093885876,
    Climb=122918847891411,
    Swim=127568954643175,
    Weight=9,
    Weight2=1
},
["Crazy Killer Animation Pack"]={
    Idle=78508793606056,
    Walk=97981678474383,
    Run=87050762272607,
    Jump=127544115522683,
    Fall=129829209430454,
    Climb=83687047931857,
    Swim=111395025210609,
    Weight=9,
    Weight2=1
},
["Flying Animation Pack"]={
    Idle=125352493738079,
    Walk=83549282405082,
    Run=100885450736160,
    Jump=106944231122680,
    Fall=81518018980190,
    Climb=72579120348335,
    Swim=83636222371933,
    Weight=9,
    Weight2=1
},
["🤖 Robot Clanker Animation Pack"]={
    Idle=83550659554711,
    Walk=72631653413443,
    Run=130644077895319,
    Jump=138646633258155,
    Fall=121298402130719,
    Climb=120139235223049,
    Swim=124457513377632,
    Weight=9,
    Weight2=1
},
["Icon Doll Animation Pack"]={
    Idle=104573164952710,
    Walk=90777171096533,
    Run=92962426155797,
    Jump=75674867252773,
    Fall=73555940570698,
    Climb=92685898242064,
    Swim=136562156745059,
    Weight=9,
    Weight2=1
},
["Rogue Ninja Animation Pack"]={
    Idle=129196339591821,
    Walk=106987196803039,
    Run=131467138753887,
    Jump=84286498691792,
    Fall=94546905945684,
    Climb=117067341950841,
    Swim=103063533906606,
    Weight=9,
    Weight2=1
},
["💅 Diva Animation Pack"]={
    Idle=88482554139722,
    Walk=94256804666698,
    Run=79334438988956,
    Jump=97808091973123,
    Fall=124469782365525,
    Climb=109755265573758,
    Swim=87225003917447,
    Weight=9,
    Weight2=1
},
["💪 Macho Man Animation Pack"]={
    Idle=100500264744932,
    Walk=82500868604839,
    Run=89997510662237,
    Jump=117547687785351,
    Fall=128553010866343,
    Climb=79186302698869,
    Swim=131076683624489,
    Weight=9,
    Weight2=1
},
["scary zombie animation pack"]={
    Idle=135644204321757,
    Walk=73179729594048,
    Run=76163436846947,
    Jump=82511210221866,
    Fall=88578161495770,
    Climb=113791332500571,
    Swim=98194283643979,
    Weight=9,
    Weight2=1
},
["Retro Character Animation Pack"]={
    Idle=126817296696620,
    Walk=115345992262595,
    Run=127244397571146,
    Jump=96946709839111,
    Fall=98022335142334,
    Climb=73143132881371,
    Swim=93521000500880,
    Weight=9,
    Weight2=1
},
["Pop Idol Animation Pack"]={
    Idle=138662532959873,
    Walk=131787807818529,
    Run=95382888489201,
    Jump=97024372740590,
    Fall=108216153585671,
    Climb=109122441923712,
    Swim=123984253915537,
    Weight=9,
    Weight2=1
},
["Girl Animation Pack"]={
    Idle=97990316834738,
    Walk=97819045002903,
    Run=89135693539422,
    Jump=90876722853586,
    Fall=77714223707033,
    Climb=109617594734448,
    Swim=78662542560372,
    Weight=9,
    Weight2=1
},
["Tomodachi Pack"]={
    Idle=132840312872034,
    Walk=114253071119152,
    Run=123357883449891,
    Jump=101557495261504,
    Fall=106166854945713,
    Climb=77622040053588,
    Swim=117778594432620,
    Weight=9,
    Weight2=1
},
["Backflip Pack"]={
    Idle=104173764557973,
    Walk=135296396017033,
    Run=121543087773623,
    Jump=104694526700604,
    Fall=132082831603971,
    Climb=109745210807459,
    Swim=114291311423862,
    Weight=9,
    Weight2=1
},
["Anomaly Glitch Pack"]={
    Idle=82358403472298,
    Walk=117132364106317,
    Run=130553620344786,
    Jump=133065300297928,
    Fall=101795949025788,
    Climb=136519562098407,
    Swim=120323862008607,
    Weight=9,
    Weight2=1
},
["Catwalk Model Pack (Left)"]={
    Idle=77579540468149,
    Walk=74666749064296,
    Run=113266002958634,
    Jump=74137338349723,
    Fall=119688671997846,
    Climb=122465160134232,
    Swim=117302193023732,
    Weight=9,
    Weight2=1
},
["Head Basketball Headless Pack"]={
    Idle=78343283422610,
    Walk=80128559318062,
    Run=83921847684903,
    Jump=88803725455247,
    Fall=120392000736214,
    Climb=132834495630380,
    Swim=97301035615223,
    Weight=9,
    Weight2=1
},
["Rocking With The Guitar Pack"]={
    Idle=125751487937838,
    Walk=90279069770262,
    Run=124711224247095,
    Jump=84908881131704,
    Fall=96940737590247,
    Climb=114885042152250,
    Swim=134883396549631,
    Weight=9,
    Weight2=1
},
["R6 Pack"]={
    Idle=108035065847383,
    Walk=95042189794341,
    Run=82600013734221,
    Jump=108768678071588,
    Fall=120296434801927,
    Climb=138483941139340,
    Swim=112510034878684,
    Weight=9,
    Weight2=1
}
   }

local F = {"/e dance3", "/e dance2", "/e dance", "/e cheer", "/e wave", "/e laugh", "/e point"}
local function G(string)
    if table.find(F, string) then
        return true
    else
        return false
    end
end
local H = {
    ['Balloon Float'] = {
        Emote = 148840371,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Idle'] = {
        Emote = 180435571,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Arm Turbine'] = {
        Emote = 259438880,
        Speed = 1.5,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Floating Head'] = {
        Emote = 121572214,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Insane Rotation'] = {
        Emote = 121572214,
        Speed = 99,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Scream'] = {
        Emote = 180611870,
        Speed = 1.5,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Party Time'] = {
        Emote = 33796059,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Chop'] = {
        Emote = 33169596,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Weird Sway'] = {
        Emote = 248336677,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Goal!'] = {
        Emote = 28488254,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Rotation'] = {
        Emote = 136801964,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Spin'] = {
        Emote = 188632011,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Weird Float'] = {
        Emote = 248336459,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Pinch Nose'] = {
        Emote = 30235165,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Cry'] = {
        Emote = 180612465,
        Speed = 1.5,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Penguin Slide'] = {
        Emote = 282574440,
        Speed = 0,
        Time = 0,
        Weight = 1,
        Loop = true,
        R6 = true,
        Priority = 2
    },
    ['Zombie Arms'] = {
        Emote = 183294396,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Flying'] = {
        Emote = 46196309,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Stab'] = {
        Emote = 66703241,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Dance'] = {
        Emote = 35654637,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Random'] = {
        Emote = 48977286,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Hmmm'] = {
        Emote = 33855276,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Sword'] = {
        Emote = 35978879,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Arms Out'] = {
        Emote = 27432691,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Kick'] = {
        Emote = 45737360,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Insane Legs'] = {
        Emote = 87986341,
        Speed = 99,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Head Detach'] = {
        Emote = 35154961,
        Speed = 0,
        Time = 3,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Moon Walk'] = {
        Emote = 30196114,
        Speed = 0,
        Time = 3,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Crouch'] = {
        Emote = 287325678,
        Speed = 0,
        Time = 3,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Beat Box'] = {
        Emote = 45504977,
        Speed = 0,
        Time = 3,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Big Guns'] = {
        Emote = 161268368,
        Speed = 0,
        Time = 3,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Bigger Guns'] = {
        Emote = 225975820,
        Speed = 0,
        Time = 3,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Charleston'] = {
        Emote = 429703734,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Moon Dance'] = {
        Emote = 27789359,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Roar'] = {
        Emote = 163209885,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Weird Pose'] = {
        Emote = 248336163,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Spin Dance 2'] = {
        Emote = 186934910,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Bow Down'] = {
        Emote = 204292303,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Sword Slam'] = {
        Emote = 204295235,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Glitch Levitate'] = {
        Emote = 313762630,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Full Swing'] = {
        Emote = 218504594,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Full Punch'] = {
        Emote = 204062532,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Faint'] = {
        Emote = 181526230,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Floor Faint'] = {
        Emote = 181525546,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Crouch'] = {
        Emote = 182724289,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Jumping Jacks'] = {
        Emote = 429681631,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Spin Dance'] = {
        Emote = 429730430,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Arm Detach'] = {
        Emote = 33169583,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Mega Insane'] = {
        Emote = 184574340,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Dino Walk'] = {
        Emote = 204328711,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Tilt Head'] = {
        Emote = 283545583,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Dab'] = {
        Emote = 183412246,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Float Sit'] = {
        Emote = 179224234,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Clone Illusion'] = {
        Emote = 215384594,
        Speed = 1e7,
        Time = .5,
        Weight = 1,
        Loop = true,
        Priority = 2
    },
    ['Hero Jump'] = {
        Emote = 184574340,
        Speed = 1,
        Time = 0,
        Weight = 1,
        Loop = true,
        Priority = 2
    }
}
local I = {}
for q, r in pairs(H) do
    table.insert(I, q)
end
local J = {}
for q, r in pairs(E) do
    if q ~= "Weight" and q ~= "Weight2" and q ~= "Custom" and q ~= "Emotes" then
        table.insert(J, q)
        j = j + 1
    end
end
local K = {}
for q, r in pairs(D) do
    table.insert(K, q)
    i = i + 1
end
table.sort(J, function(L, M)
    return L:lower() < M:lower()
end)
table.sort(K, function(L, M)
    return L:lower() < M:lower()
end)
table.sort(I, function(L, M)
    return L:lower() < M:lower()
end)
local function N()
    do
        if not getgenv().AlreadyLoaded then
            return
        end
        repeat
            wait()
        until game:GetService("Players").LocalPlayer.Character and
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Animate") and
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and
            game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("Animator")
        local O = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            :FindFirstChildOfClass("Animator")
        for q, r in ipairs(O:GetPlayingAnimationTracks()) do
            r:Stop()
        end
    end
end
local function P()
    do
        if not getgenv().AlreadyLoaded then
            return
        end
        repeat
            wait()
        until game:GetService("Players").LocalPlayer.Character and
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Animate") and
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and
            game:GetService("Players").LocalPlayer.Character.Humanoid:FindFirstChild("Animator")
        local O = game:GetService("Players").LocalPlayer.Character:WaitForChild("Animate")
        O.Disabled = true;
        for q, r in ipairs(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            :GetPlayingAnimationTracks()) do
            r:AdjustSpeed(Settings.AnimationSpeed)
            r:Stop()
        end
        O.Disabled = false
    end
end
local function Q(R, S, T, U, V, W, X, Y, Z, _, a0, a1)
    do
        repeat
            wait()
        until game:GetService("Players").LocalPlayer.Character and
            game:GetService("Players").LocalPlayer.Character:FindFirstChild("Animate")
        local b = game:GetService("Players").LocalPlayer.Character.Animate;
        if b:FindFirstChild("idle") then
            b.idle.Animation1.AnimationId = c .. R;
            b.idle.Animation1.Weight.Value = tostring(a0)
            b.idle.Animation2.Weight.Value = tostring(a1)
            b.idle.Animation2.AnimationId = c .. S
        end
        if T and b:FindFirstChild("pose") then
            b.pose:FindFirstChildOfClass("Animation").AnimationId = c .. T
        end
        b.walk:FindFirstChildOfClass("Animation").AnimationId = c .. U;
        b.run:FindFirstChildOfClass("Animation").AnimationId = c .. V;
        b.jump:FindFirstChildOfClass("Animation").AnimationId = c .. W;
        b.climb:FindFirstChildOfClass("Animation").AnimationId = c .. X;
        b.fall:FindFirstChildOfClass("Animation").AnimationId = c .. Y;
        if b:FindFirstChild("swim") then
            b.swim:FindFirstChildOfClass("Animation").AnimationId = c .. Z;
            b.swimidle:FindFirstChildOfClass("Animation").AnimationId = c .. _
        end
    end
end
local function a2(a3, a4)
    repeat
        wait()
    until game:GetService("Players").LocalPlayer.Character and
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Animate")
    local b = game:GetService("Players").LocalPlayer.Character.Animate;
    if a3:match("idle") then
        if b:FindFirstChild("pose") then
            b.pose:FindFirstChildOfClass("Animation").AnimationId = c .. a4
        end
    end
    if a3 == "idle1" then
        b.idle.Animation1.AnimationId = c .. a4
    elseif a3 == "idle2" then
        b.idle.Animation2.AnimationId = c .. a4
    elseif a3:match("dance") then
        for v, r in pairs(b[a3]:GetChildren()) do
            if r:IsA("Animation") then
                r.AnimationId = c .. a4
            end
        end
    else
        local a5;
        for v, r in pairs(b:GetChildren()) do
            if r.Name == a3 then
                a5 = r;
                break
            end
        end
        if a5 then
            a5:FindFirstChildOfClass("Animation").AnimationId = c .. a4
        end
    end
    P()
end
local function a6(a4)
    local a7 = Instance.new("Animation")
    a7.AnimationId = "rbxassetid://" .. a4;
    _G.LoadAnim = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(a7)
    _G.LoadAnim.Priority = Enum.AnimationPriority.Idle;
    if not Settings.PlayAlways then
        _G.LoadAnim:Stop()
    end
    if Settings.Reversed then
        _G.LoadAnim:Play(0)
        _G.LoadAnim:AdjustSpeed(Settings.ReverseSpeed)
    else
        _G.LoadAnim:Play(0)
        _G.LoadAnim:AdjustSpeed(Settings.EmoteSpeed)
    end
    if Settings.Looped then
        _G.LoadAnim.Looped = Settings.Looped
    end
    if Settings.Time then
        _G.LoadAnim.TimePosition = _G.LoadAnim.TimePosition - Settings.TimePosition
    end
    if not game:GetService("Players").LocalPlayer.Character.Animate.Disabled then
        game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
    end
end
local function a8()
    local a9 = game:GetService("Players").LocalPlayer.Character and
                   game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if a9 and a9.RigType == Enum.HumanoidRigType.R15 then
        return "R15"
    else
        return "R6"
    end
end
local function aa(ab)
    a6(D[ab])
end
local function ac(ad)
    for q, r in pairs(E) do
        lower_string = string.lower(q)
        lower_emote = string.lower(ad)
        if string.find(q, ad) or string.find(lower_string, lower_emote) then
            return q
        end
    end
end
local function ae(ad)
    local af = {}
    for q, r in pairs(D) do
        upper_string = string.upper(q)
        upper_emote = string.upper(ad)
        if upper_string == upper_emote then
            if not table.find(af, q) then
                table.insert(af, q)
            end
        end
    end
    for q, r in pairs(D) do
        lower_string = string.lower(q)
        lower_emote = string.lower(ad)
        if string.find(q, ad) or string.find(lower_string, lower_emote) then
            if not table.find(af, q) then
                table.insert(af, q)
            end
        end
    end
    return af
end
local function ag(ad)
    for q, r in pairs(D) do
        upper_string = string.upper(q)
        upper_emote = string.upper(ad)
        if upper_string == upper_emote then
            return q
        end
    end
    for q, r in pairs(D) do
        lower_string = string.lower(q)
        lower_emote = string.lower(ad)
        if string.find(q, ad) or string.find(lower_string, lower_emote) then
            return q
        end
    end
end
if Settings.SelectedAnimation and Settings.SelectedAnimation ~= "" then
    repeat
        wait()
    until game:GetService("Players").LocalPlayer.Character and
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Animate")
    if Settings.SelectedAnimation == "Custom" and a8() == "R15" then
        N()
        Q(Settings.Custom.Idle or f(1), Settings.Custom.Idle2 or f(2), Settings.Custom.Idle3 or f(3),
            Settings.Custom.Walk or f(4), Settings.Custom.Run or f(5), Settings.Custom.Jump or f(6),
            Settings.Custom.Climb or f(7), Settings.Custom.Fall or f(8), Settings.Custom.Swim or f(9),
            Settings.Custom.SwimIdle or f(10), Settings.Custom.Weight, Settings.Custom.Weight2)
        if Settings.Custom.Wave then
            a2("wave", Settings.Custom.Wave)
        end
        if Settings.Custom.Laugh then
            a2("laugh", Settings.Custom.Laugh)
        end
        if Settings.Custom.Cheer then
            a2("cheer", Settings.Custom.Cheer)
        end
        if Settings.Custom.Point then
            a2("point", Settings.Custom.Point)
        end
        if Settings.Custom.Sit then
            a2("sit", Settings.Custom.Sit)
        end
        if Settings.Custom.Dance then
            a2("dance", Settings.Custom.Dance)
        end
        if Settings.Custom.Dance2 then
            a2("dance2", Settings.Custom.Dance2)
        end
        if Settings.Custom.Dance3 then
            a2("dance3", Settings.Custom.Dance3)
        end
    elseif a8() == "R15" then
        
        if Settings.Custom.Wave then
            a2("wave", Settings.Custom.Wave)
        end
        if Settings.Custom.Laugh then
            a2("laugh", Settings.Custom.Laugh)
        end
        if Settings.Custom.Cheer then
            a2("cheer", Settings.Custom.Cheer)
        end
        if Settings.Custom.Point then
            a2("point", Settings.Custom.Point)
        end
        if Settings.Custom.Sit then
            a2("sit", Settings.Custom.Sit)
        end
        if Settings.Custom.Dance then
            a2("dance", Settings.Custom.Dance)
        end
        if Settings.Custom.Dance2 then
            a2("dance2", Settings.Custom.Dance2)
        end
        if Settings.Custom.Dance3 then
            a2("dance3", Settings.Custom.Dance3)
        end
        P()
        local a9 = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or
                       game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
        local ah = a9:GetPlayingAnimationTracks()
        for v, r in pairs(ah) do
            r:AdjustSpeed(Settings.AnimationSpeed)
        end
    end
end
game.TextChatService.OnIncomingMessage = function(y)
    local ai = tostring(y.TextSource)
    local aj = tostring(y.Text)
    if ai == game.Players.LocalPlayer.Name and Settings.Chat and aj:match(Settings.EmotePrefix) or ai ==
        game.Players.LocalPlayer.Name and Settings.Animate and aj:match(Settings.AnimationPrefix) then
        y.Status = Enum.TextChatMessageStatus.InvalidTextChannelPermissions
    end
end;
local function ak()
    if _G.LoadAnim and _G.LoadAnim.TimePosition then
        return tostring(math.floor(_G.LoadAnim.TimePosition))
    end
    return "0"
end
local function al()
    if _G.LoadAnim and _G.LoadAnim.Looped then
        return tostring(_G.LoadAnim.Looped)
    end
    return "false"
end
if game.TextChatService:FindFirstChild("TextChannels") and not getgenv().AlreadyLoaded then
    game.TextChatService.TextChannels.RBXGeneral.MessageReceived:Connect(function(y)
        local ai = tostring(y.TextSource)
        local aj = tostring(y.Text)
        if Settings.Player and ai == Settings.Player.Name and Settings.CopyMovement then
            game.TextChatService.TextChannels.RBXGeneral:SendAsync(aj)
        end
    end)
end
if game.ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") and not getgenv().AlreadyLoaded then
    local am = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents;
    am.OnMessageDoneFiltering.OnClientEvent:Connect(function(an)
        local ai = an.FromSpeaker;
        local aj = an.Message or ""
        if Settings.Player and ai == Settings.Player.Name and Settings.CopyMovement then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(aj, "All")
        end
    end)
end



--Library
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()




--Themes

WindUI:AddTheme({
    Name = "Halloween",
    
    Accent = "#331400",
    Outline = "#400000",
    
    Text = "#EAEAEA",
    PlaceholderText = "#AAAAAA"
})

WindUI:SetTheme("Halloween")

WindUI:AddTheme({
    Name = "Valentine",
    
    Accent = "#660000",
    Outline = "#660000",
    
    Text = "#000000",
    PlaceholderText = "#000000"
})

WindUI:SetTheme("Valentine")

WindUI:AddTheme({
    Name = "Red Theme",
    
    Accent = "#0F0F0F",
    Outline = "#1A1A1A",

    Text = "#FFFFFF",
    PlaceholderText = "#8A8A8A"
})

WindUI:AddTheme({
    Name = "Midnight Blue",

    -- Ana Gradient
    Accent = WindUI:Gradient({
        ["0"] = {
            Color = Color3.fromHex("#18181b"),
            Transparency = 0
        },
        ["100"] = {
            Color = Color3.fromHex("#252533"),
            Transparency = 0
        },
    }, {
        Rotation = 90,
    }),

    Background = Color3.fromHex("#0d0d0d"),
    BackgroundTransparency = 0,

    Outline = Color3.fromHex("#202020"),

    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#8A8A8A"),

    Button = Color3.fromHex("#1a1a1a"),
    Hover = Color3.fromHex("#262626"),

    Icon = Color3.fromHex("#b6faff"),

    WindowBackground = Color3.fromHex("#0d0d0d"),
    WindowShadow = Color3.fromHex("#000000"),

    WindowTopbarTitle = Color3.fromHex("#FFFFFF"),
    WindowTopbarAuthor = Color3.fromHex("#b6faff"),
    WindowTopbarIcon = Color3.fromHex("#b6faff"),
    WindowTopbarButtonIcon = Color3.fromHex("#b6faff"),

    -- Gradient Tab Yazıları
    TabTitle = WindUI:Gradient({
        ["0"] = {
            Color = Color3.fromHex("#FFFFFF"),
            Transparency = 0
        },
        ["100"] = {
            Color = Color3.fromHex("#b6faff"),
            Transparency = 0
        },
    }, {
        Rotation = 0,
    }),

    TabBackground = Color3.fromHex("#181818"),
    TabIcon = Color3.fromHex("#b6faff"),

    ElementBackground = Color3.fromHex("#181818"),
    ElementTitle = Color3.fromHex("#FFFFFF"),
    ElementDesc = Color3.fromHex("#BDBDBD"),
    ElementIcon = Color3.fromHex("#b6faff"),

    PopupBackground = Color3.fromHex("#101010"),
    PopupBackgroundTransparency = 0,
    PopupTitle = Color3.fromHex("#FFFFFF"),
    PopupContent = Color3.fromHex("#DDDDDD"),
    PopupIcon = Color3.fromHex("#b6faff"),

    DialogBackground = Color3.fromHex("#101010"),
    DialogBackgroundTransparency = 0,
    DialogTitle = Color3.fromHex("#FFFFFF"),
    DialogContent = Color3.fromHex("#DDDDDD"),
    DialogIcon = Color3.fromHex("#b6faff"),

    Toggle = Color3.fromHex("#1e1e1e"),
    ToggleBar = Color3.fromHex("#b6faff"),

    Checkbox = Color3.fromHex("#1e1e1e"),
    CheckboxIcon = Color3.fromHex("#b6faff"),

    Slider = Color3.fromHex("#1e1e1e"),
    SliderThumb = Color3.fromHex("#b6faff"),
})

WindUI:SetTheme("Midnight Blue")





local Window = WindUI:CreateWindow({
    Title = "Echelon Hub ☆",
    Icon = "rbxassetid://89361131196562",
    Author = "2.0",
    Size = UDim2.fromOffset(550, 350),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 150,
    HasOutline = false,
})

WindUI:Notify({
    Title = "Hey!",
    Content = "Please wait, The script will load in a maximum of 20 seconds.",
    Icon = "badge-info",
    Duration = 5,
})



--tabs
local MainTab = Window:Tab({ Title = "Main", Icon = "house" })
local PlayerTab = Window:Tab({ Title = "Player", Icon = "dna" })
local VisualsTab = Window:Tab({ Title = "Visuals", Icon = "eye" })
Window:Divider()
local AnimationTab = Window:Tab({ Title = "Animations", Icon = "rbxassetid://91176866374860" })
local EmoteTab = Window:Tab({ Title = "Emote", Icon = "rbxassetid://11713358131" })
local SusTab = Window:Tab({ Title = "Sus", Icon = "lollipop" })
local TrollsTab = Window:Tab({ Title = "Trolls", Icon = "rbxassetid://104928133693808" })
Window:Divider()
local AdminsTab = Window:Tab({ Title = "Admins", Icon = "rbxassetid://6935096958" })
local HubTab = Window:Tab({ Title = "Hub", Icon = "notepad-text"})
local ScriptTab = Window:Tab({ Title = "Scripts", Icon = "rbxassetid://6026568213" })
local FeTab = Window:Tab({ Title = "Fe Scirpts", Icon = "file-archive" })
Window:Divider()
local MusicTab = Window:Tab({ Title = "Music", Icon = "music" })
local ToolsTab = Window:Tab({ Title = "Tools", Icon = "hammer" })
local DbgTab = Window:Tab({ Title = "Debuggers", Icon = "backpack" })
Window:Divider()
local SettingsTab = Window:Tab({ Title = "Settings", Icon = "settings" })
local LogTab = Window:Tab({ Title = "Logs", Icon = "logs" })

--main tab
PlayerTab:Section({ Title = "Local" })


local GameId = game.PlaceId
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local plrs = game:GetService("Players")
local plr = plrs.LocalPlayer
local plrname = plr.Name
local plrid = plr.UserId
local plrchr = plr.Character
local plrage = plr.AccountAge
local plrcount = #plrs:GetPlayers()

MainTab:Paragraph({
    Title = "Player Information",
    Desc = "Player Name:" .. plrname ..
           "\nPlayerID: " .. plrid ..
           "\nChracter: " .. tostring(plrchr) ..
           "\nAccount Age: " .. plrage .. " day" ..
           "\nPlayers Count: " .. plrcount ..
           "\nGame Name: " .. GameName ..
           "\nGame ID: " .. GameId,
    Image = "computer", -- lucide or URL or rbxassetid://
    ImageSize = 50
})

MainTab:Paragraph({
    Title = "You can get more scripts by joining Discord!",
    Desc = "",
    Image = "rbxassetid://135550354937113", 
    ImageSize = 100
})



MainTab:Button({
    Title = "Discord Link",
    Desc = "5xZXaSr3Nq",
    Callback = function() 
WindUI:Notify({
            Title = "Copied link:",
            Content = "https://discord.gg/5xZXaSr3Nq",
            Icon = "link",
            Duration = 4,
        })
setclipboard("https://discord.gg/5xZXaSr3Nq") end
})


MainTab:Paragraph({
    Title = "Support me on YouTube.",
    Desc = "",
    Image = "rbxassetid://14311938964", 
    ImageSize = 100
})


MainTab:Button({
    Title = "YouTube Link:",
    Desc = "Echelon",
    Callback = function() 
WindUI:Notify({
            Title = "Copied link",
            Content = "https://m.youtube.com/channel/UCMPNe8f-2EvJefwZgch3G9A",
            Icon = "link",
            Duration = 4,
        })
setclipboard("https://m.youtube.com/channel/UCMPNe8f-2EvJefwZgch3G9A") end
})

MainTab:Paragraph({
    Title = "Made By Echelon",
    Desc = "Hi this script is just developing, please let me know if there is a bug, thanks",
    Image = "rbxassetid://89361131196562", -- lucide or URL or rbxassetid://
    ImageSize = 100
})




PlayerTab:Slider({
    Title = "Speed",
    Value = {
        Min = 0,
        Max = 200,
        Default = 16,
    },
    Callback = function(s) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s end
})

PlayerTab:Slider({
    Title = "Jump Power",
    Value = {
        Min = 0,
        Max = 200,
        Default = 0,
    },
    Callback = function(s) game.Players.LocalPlayer.Character.Humanoid.JumpPower = s end
})


PlayerTab:Slider({
    Title = "Gravity",
    Value = {
        Min = 0,
        Max = 200,
        Default = 2,
    },
    Callback = function(s) game.Workspace.Gravity = s end
})

PlayerTab:Slider({
    Title = "Hip Height",
    Value = {
        Min = 0,
        Max = 200,
        Default = 2,
    },
    Callback = function(s) game.Players.LocalPlayer.Character.Humanoid.HipHeight = s end
})

PlayerTab:Section({ Title = "Fov" })

PlayerTab:Slider({
    Title = "Fov",
    Value = {
        Min = 0,
        Max = 200,
        Default = 18,
    },
    Callback = function(s) game.Workspace.CurrentCamera.FieldOfView = s end
})

PlayerTab:Slider({
    Title = "Time",
    Value = {
        Min = 0,
        Max = 8,
        Default = 0,
    },
    Callback = function(p) game:GetService("Lighting").ClockTime = p end
})




PlayerTab:Section({ Title = "Fly" })


PlayerTab:Button({
    Title = "Pc fly",
    Desc = "Key Q",
    Callback = function()  
loadstring(game:HttpGet("https://pastebin.com/raw/jpRKGvvi",true))()
end
})


PlayerTab:Button({
    Title = "Pc Invisible",
    Desc = "Key e",
    Callback = function()  
loadstring(game:HttpGet("https://pastebin.com/raw/hk09qgd9"))()
end
})

PlayerTab:Button({
    Title = "Mobile Fly Gui",
    Desc = "Gui",
    Callback = function()  
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end
})







PlayerTab:Section({ Title = "Character" })

local aC;
local aD;
local aE;
local aF;
local aG;
local aH;
local aI = Client;
local aJ = {
    W = false,
    S = false,
    A = false,
    D = false,
    Moving = false
}
local aK = function()
    if not game:GetService("Players").LocalPlayer.Character or not game:GetService("Players").LocalPlayer.Character.Head or
        aH then
        return
    end
    aC = game:GetService("Players").LocalPlayer.Character;
    aD = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    aD.PlatformStand = true;
    aG = workspace:WaitForChild('Camera')
    aE = Instance.new("BodyVelocity")
    aF = Instance.new("BodyAngularVelocity")
    aE.Velocity, aE.MaxForce, aE.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000;
    aF.AngularVelocity, aF.MaxTorque, aF.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000;
    aE.Parent = aC.Head;
    aF.Parent = aC.Head;
    aH = true;
    aD.Died:connect(function()
        aH = false
    end)
end;
local aL = function()
    if not game:GetService("Players").LocalPlayer.Character or not aH then
        return
    end
    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false;
    aE:Destroy()
    aF:Destroy()
    aH = false
end;
game:GetService("UserInputService").InputBegan:connect(function(aM, aN)
    if aM.UserInputType == Enum.UserInputType.MouseButton1 and
        game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) and Settings.ClickTeleport then
        game:GetService("Players").LocalPlayer.Character:MoveTo(game.Players.LocalPlayer:GetMouse().Hit.p)
    end
    if aN then
        return
    end
    for q, aO in pairs(aJ) do
        if q ~= "Moving" and aM.KeyCode == Enum.KeyCode[q] then
            aJ[q] = true;
            aJ.Moving = true
        end
    end
end)
game:GetService("UserInputService").InputEnded:connect(function(aM, aN)
    if aN then
        return
    end
    local L = false;
    for q, aO in pairs(aJ) do
        if q ~= "Moving" then
            if aM.KeyCode == Enum.KeyCode[q] then
                aJ[q] = false
            end
            if aJ[q] then
                L = true
            end
        end
    end
    aJ.Moving = L
end)
local aP = function(aQ)
    return aQ * (Settings.FlySpeed or 50) / aQ.Magnitude
end;
game:GetService("RunService").Heartbeat:connect(function(aR)
    if aH and aC and aC.PrimaryPart then
        local aI = aC.PrimaryPart.Position;
        local aS = aG.CFrame;
        local aT, aU, aV = aS:toEulerAnglesXYZ()
        aC:SetPrimaryPartCFrame(CFrame.new(aI.x, aI.y, aI.z) * CFrame.Angles(aT, aU, aV))
        if aJ.Moving then
            local au = Vector3.new()
            if aJ.W then
                au = au + aP(aS.lookVector)
            end
            if aJ.S then
                au = au - aP(aS.lookVector)
            end
            if aJ.A then
                au = au - aP(aS.rightVector)
            end
            if aJ.D then
                au = au + aP(aS.rightVector)
            end
            aC:TranslateBy(au * aR)
        end
    end
end)

PlayerTab:Toggle({
    Title = "Noclip",
    Default = false,
    Callback = function(au) 
Settings.Noclip = au;
        if Settings.Noclip then
            local L = Instance.new("Part", game:GetService("Lighting"))
            L.Name = "niggANOclip"
            local function aZ()
                if game:GetService("Players").LocalPlayer.Character and Settings.Noclip then
                    for v, a_ in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                        if a_:IsA('BasePart') and a_.CanCollide and Settings.Noclip then
                            a_.CanCollide = false
                        end
                    end
                end
            end
            if aY then
                aY:Disconnect()
            end
            aY = game:GetService("RunService").RenderStepped:Connect(aZ)
        elseif game:GetService("Lighting"):FindFirstChild("niggANOclip") then
            game:GetService("Lighting"):FindFirstChild("niggANOclip"):Destroy()
            if aY then
                aY:Disconnect()
                aY = nil
            end
            if game:GetService("Players").LocalPlayer.Character then
                for v, a_ in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                    if a_:IsA('BasePart') then
                        a_.CanCollide = true
                    end
                end
            end
        end
 end
})








local JQ = false;
PlayerTab:Toggle({
    Title = "Bunny Hop",
    Default = false,
    Callback = function(K)  
JQ = K;
spawn(function()
while wait()
and JQ do game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
end
end)
end
})

PlayerTab:Button({
    Title = "Reset Character",
    Desc = "Reset",
    Callback = function() game.Players.LocalPlayer.Character.Humanoid.Health = 0
end
})

PlayerTab:Button({
    Title = "Reset Backpack",
    Desc = "Reset",
    Callback = function() local gear = game.Players.LocalPlayer.Backpack:GetChildren()
    for i, child in ipairs(gear) do
      child:Destroy()
      end
end
})

PlayerTab:Button({
    Title = "God",
    Callback = function()
    loadstring(game:HttpGet("https://freenote.biz/raw/Fhpx5r5A8M"))()
end
})






--visuals
VisualsTab:Section({ Title = "Player" })

VisualsTab:Input({
    Title = "Player",
    PlaceholderText = "name",
    Callback = function(at)
        Settings.Player = getPlayersByName(at)
    end
})

VisualsTab:Button({
    Title = "Goto",
    Callback = function(au)
        if not Settings.Player then
                    return
                end
        WindUI:Notify({
            Title = "Teleported",
            Content = "Completed",
            Icon = "euro",
            Duration = 2,
        })
    
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = Settings.Player.Character
                                                                                               .HumanoidRootPart.CFrame;
                return
            end
            
})
 
 VisualsTab:Toggle({
    Title = "View",
    Default = false,
    Callback = function(au) 
    		if not Settings.Player and au == true or Settings.Player and not Settings.Player.Character and au ==
                    true then
                    x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                end
                if au == true and Settings.Player then
                    if workspace:FindFirstChild("ViewNIG") then
                        workspace.ViewNIG:Destroy()
                    end
                    local L = Instance.new("Part", workspace)
                    L.Name = "ViewNIG"
                    game:GetService("Workspace").CurrentCamera.CameraSubject = Settings.Player.Character;
                    WindUI:Notify({
            Title = "Player",
            Content = "view",
            Icon = "eye",
            Duration = 2,
        })
		return
                elseif workspace:FindFirstChild("ViewNIG") then
                    workspace.ViewNIG:Destroy()
                    game:GetService("Workspace").CurrentCamera.CameraSubject =
                        game:GetService("Players").LocalPlayer.Character;
			WindUI:Notify({
            Title = "Player",
            Content = "unview",
            Icon = "eye-closed",
            Duration = 2,
        })
		return
                end
            end
                    
})

VisualsTab:Section({ Title = "Appearance" })

VisualsTab:Button({
    Title = "Full Bright",
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-FullBright-Script-14383"))()
        end
})


 VisualsTab:Toggle({
    Title = "X ray",
    Default = false,
    Callback = function(enabled) xrayOn = enabled

    if xrayOn then
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("BasePart") then
                if not descendant:FindFirstChild("OriginalTransparency") then
                    local originalTransparency = Instance.new("NumberValue")
                    originalTransparency.Name = "OriginalTransparency"
                    originalTransparency.Value = descendant.Transparency
                    originalTransparency.Parent = descendant
                end
                descendant.Transparency = 0.5
            end
        end
    else
        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("BasePart") then
                if descendant:FindFirstChild("OriginalTransparency") then
                    descendant.Transparency = descendant.OriginalTransparency.Value
                    descendant.OriginalTransparency:Destroy()
                end
            end
        end
    end
end
})


 

 --SUS

SusTab:Paragraph({
    Title = "Information",
    Desc = "Just have fun, Double-click to make it work.",
    Image = "rbxassetid://132057543079280", -- lucide or URL or rbxassetid://
    ImageSize = 100
})





SusTab:Section({ 
    Title = "Player",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})


    SusTab:Input({
    Title = "Player",
    PlaceholderText = "name",
    Callback = function(at)
        Settings.Player = getPlayersByName(at)
    end
})


SusTab:Button({
    Title = "Stop",
    Desc = "Stop Animation",
    Callback = function() if _G.LoadAnim then
            _G.LoadAnim:Stop()
            P()
            Status:Set("Current Emote: " .. Settings.LastEmote .. " // Speed: " .. tostring(Settings.EmoteSpeed) ..
                           " // Time Position: " .. ak() .. " // Looped: " .. al())
            UpdateFile()
        end 
end
})


SusTab:Section({ 
    Title = "Bang Animation",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

SusTab:Toggle({
    Title = "Back Sus",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Gem")
                    P()
                    aa(av)
                    _G.LoadAnim.TimePosition = 8;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What"
                elseif game.Lighting:FindFirstChild("What") then
                    game.Lighting:FindFirstChild("What"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, 1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, 2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, 3)
                    end
                end
            end

})
 
 SusTab:Toggle({
    Title = "Bang",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Boom Boom Clap")
                    P()
                    aa(av)
                    _G.LoadAnim.TimePosition = 8;
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What1"
                elseif game.Lighting:FindFirstChild("What1") then
                    game.Lighting:FindFirstChild("What1")
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, 1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, 2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, 3)
                    end
                end
            end

})
 
 
 SusTab:Toggle({
    Title = "bang 2",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Dolphin Dance")
                    P()
                    aa(av)
                    _G.LoadAnim.TimePosition = 26 / 100 * _G.LoadAnim.Length;
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What2"
                elseif game.Lighting:FindFirstChild("What2") then
                    game.Lighting:FindFirstChild("What2"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(0, -1, 1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, -1, 2)
                        _G.LoadAnim.TimePosition = 26 / 100 * _G.LoadAnim.Length
                    end
                end
            end,

})
 
 SusTab:Section({ 
    Title = "Sus Animation",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

 
 SusTab:Toggle({
    Title = "Sus",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    local av = ag("Sleep")
                    P()
                    aa(av)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What4"
                elseif game.Lighting:FindFirstChild("What4") then
                    game.Lighting:FindFirstChild("What4"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 2",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Gem")
                    P()
                    aa(av)
                    _G.LoadAnim.TimePosition = 8;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What5"
                elseif game.Lighting:FindFirstChild("What5") then
                    game.Lighting:FindFirstChild("What5"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 3",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Scorpion")
                    P()
                    aa(av)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What6"
                elseif game.Lighting:FindFirstChild("What6") then
                    game.Lighting:FindFirstChild("What6"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        _G.LoadAnim.TimePosition = 83;
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -1)
                        task.wait(.15)
                        _G.LoadAnim.TimePosition = 84;
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -2)
                        _G.LoadAnim.TimePosition = 83;
                        task.wait(.15)
                        _G.LoadAnim.TimePosition = 84;
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 4",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("BURBERRY LOLA ATTITUDE - GEM")
                    P()
                    aa(av)
                    _G.LoadAnim.TimePosition = 60;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What7"
                elseif game.Lighting:FindFirstChild("What7") then
                    game.Lighting:FindFirstChild("What7"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 5",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("BURBERRY LOLA ATTITUDE - GEM")
                    P()
                    aa(av)
                    _G.LoadAnim.TimePosition = 38;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What8"
                elseif game.Lighting:FindFirstChild("What8") then
                    game.Lighting:FindFirstChild("What8"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 6",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Alo Yoga Pose - Warrior II")
                    P()
                    aa(av)
                    task.wait(.15)
                    _G.LoadAnim.TimePosition = 10 / 100 * _G.LoadAnim.Length;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What9"
                elseif game.Lighting:FindFirstChild("What9") then
                    game.Lighting:FindFirstChild("What9"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 7",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Break Dance")
                    P()
                    aa(av)
                    task.wait(.15)
                    _G.LoadAnim.TimePosition = 53 / 100 * _G.LoadAnim.Length;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What10"
                elseif game.Lighting:FindFirstChild("What10") then
                    game.Lighting:FindFirstChild("What10"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 0)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 2)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 8",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Team USA Breaking Emote")
                    P()
                    aa(av)
                    task.wait(.15)
                    _G.LoadAnim.TimePosition = 15 / 100 * _G.LoadAnim.Length;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "WhatNigga"
                elseif game.Lighting:FindFirstChild("WhatNigga") then
                    game.Lighting:FindFirstChild("WhatNigga"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, -math.pi / 2, 0) * CFrame.new(-2, 0, 0)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, -math.pi / 2, 0) * CFrame.new(-3, 0, 1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, -math.pi / 2, 0) * CFrame.new(-4, 0, 2)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 9",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Olympic Dismount")
                    P()
                    aa(av)
                    task.wait(.15)
                    _G.LoadAnim.TimePosition = 15 / 100 * _G.LoadAnim.Length;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "WhatNigga4"
                elseif game.Lighting:FindFirstChild("WhatNigga4") then
                    game.Lighting:FindFirstChild("WhatNigga4"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 0)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 2)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 10",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Olympic Dismount")
                    P()
                    aa(av)
                    task.wait(.15)
                    _G.LoadAnim.TimePosition = 28 / 100 * _G.LoadAnim.Length;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "WhatNigga5"
                elseif game.Lighting:FindFirstChild("WhatNigga5") then
                    game.Lighting:FindFirstChild("WhatNigga5"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 3)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 11",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Olympic Dismount")
                    P()
                    aa(av)
                    task.wait(.15)
                    _G.LoadAnim.TimePosition = 27 / 100 * _G.LoadAnim.Length;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "WhatNigga6"
                elseif game.Lighting:FindFirstChild("WhatNigga6") then
                    game.Lighting:FindFirstChild("WhatNigga6"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, -1, 1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, -1, 2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, -1, 3)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 12",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("TMNT Dance")
                    P()
                    aa(av)
                    task.wait(.15)
                    _G.LoadAnim.TimePosition = 70 / 100 * _G.LoadAnim.Length;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "WhatNigga7"
                elseif game.Lighting:FindFirstChild("WhatNigga7") then
                    game.Lighting:FindFirstChild("WhatNigga7"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(0, 0, -3)
                    end
                end
            end,

})
 
 SusTab:Toggle({
    Title = "Sus 13",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Team USA Breaking Emote")
                    P()
                    aa(av)
                    task.wait(.15)
                    _G.LoadAnim.TimePosition = 45 / 100 * _G.LoadAnim.Length;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "WhatNigga3"
                elseif game.Lighting:FindFirstChild("WhatNigga3") then
                    game.Lighting:FindFirstChild("WhatNigga3"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(1, 0, 1)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(1, 0, 2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(1, 0, 3)
                    end
                end
            end,

})

SusTab:Section({ 
    Title = "Other",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})

SusTab:Toggle({
    Title = "BlowJo*",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Gem")
                    P()
                    aa(av)
                    _G.LoadAnim.TimePosition = 8;
                    _G.LoadAnim:AdjustSpeed(0)
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What12"
                elseif game.Lighting:FindFirstChild("What12") then
                    game.Lighting:FindFirstChild("What12"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 2)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 3)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.Angles(0, math.pi, 0) * CFrame.new(0, 0, 4)
                    end
                end
            end,

})
SusTab:Toggle({
    Title = "Slapp As*",
    Default = false,
    Callback = function(au) 
Settings.RapePlayer = au;
                if Settings.RapePlayer then
                    if not Settings.Player or Settings.Player and not Settings.Player.Character then
                        x("Failed!", "Player was not found! Please enter player-name in textbox above.")
                    end
                    Settings.PlayAlways = true;
                    Settings.Time = true;
                    local av = ag("Beauty Touchdown")
                    P()
                    aa(av)
                    _G.LoadAnim.TimePosition = -1;
                    local L = Instance.new("Part", game.Lighting)
                    L.Name = "What11"
                elseif game.Lighting:FindFirstChild("What11") then
                    game.Lighting:FindFirstChild("What11"):Destroy()
                    P()
                    Settings.PlayAlways = false
                end
                while Settings.RapePlayer do
                    task.wait()
                    pcall(function()
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit =
                                false
                        end
                    end)
                    if game:GetService("Players").LocalPlayer.Character and Settings.Player.Character and
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        Settings.Player.Character:FindFirstChild("HumanoidRootPart") then
                        local aw = game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                        local ax = Settings.Player.Character:FindFirstChild("HumanoidRootPart")
                        if aw.Position.Y < ax.Position.Y then
                            if not platform then
                                platform = Instance.new("Part")
                                platform.Size = Vector3.new(5, 0.1, 5)
                                platform.Transparency = 1;
                                platform.Anchored = true;
                                platform.Position = ax.Position + Vector3.new(0, 2, 0)
                                platform.Parent = game.Workspace
                            end
                        else
                            if platform then
                                platform:Destroy()
                                platform = nil
                            end
                        end
                        aw.CFrame = ax.CFrame * CFrame.new(-2, 0, 2)
                        task.wait(.15)
                        _G.LoadAnim.TimePosition = -1;
                        aw.CFrame = ax.CFrame * CFrame.new(-2, 0, 3)
                        task.wait(.15)
                        aw.CFrame = ax.CFrame * CFrame.new(-2, 0, 4)
                    end
                end
            end,

})

 
 SusTab:Button({
    Title = "Jerk Off",
    Desc = "R15",
    Callback = function()
 loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end
})

SusTab:Button({
    Title = "Jerk Off",
    Desc = "R6",
    Callback = function()
 loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end
})



--animations

EmoteTab:Paragraph({
    Title = "Emotes",
    Desc = "R15 | R6",
    Image = "rbxassetid://124220947837116", -- lucide or URL or rbxassetid://
    ImageSize = 100
})

EmoteTab:Section({ 
    Title = "Emote",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})



local bi;
if game:GetService("Players").LocalPlayer.Character and
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso") then
EmoteTab:Dropdown({
    Title = "Emote",
    Desc = "R15",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = K,
    Callback = function(at)
        if a8() ~= "R6" then
            N()
            Settings.LastEmote = at;
            aa(at)
            Status:Set("Current Emote: " .. Settings.LastEmote .. " // Speed: " .. tostring(Settings.EmoteSpeed) ..
                           " // Time Position: " .. ak() .. " // Looped: " .. al())
            UpdateFile()
        end
    end
})
end


if game:GetService("Players").LocalPlayer.Character and
    not game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso") then
EmoteTab:Dropdown({
    Title = "Emote",
    Desc = "R6",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = I,
    Callback = function(bh)
        if a8() ~= "R15" then
            N()
            a6(H[bh].Emote, H[bh].Speed, H[bh].Time, H[bh].Weight, H[bh].Loop)
            Settings.LastEmote = bh;
            UpdateFile()
            Status:Set("Current Emote: " .. Settings.LastEmote .. " // Speed: " .. tostring(Settings.EmoteSpeed) ..
                           " // Time Position: " .. ak() .. " // Looped: " .. al())
        end
    end
})
end



EmoteTab:Toggle({
    Title = "Freeze Emote",
    Desc = "Emote",
    Value = false,
    Callback = function(au)
        Settings.FreezeEmote = au;
        if au == true and game:GetService("Players").LocalPlayer.Character and
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and _G.LoadAnim then
            _G.LoadAnim:AdjustSpeed(0)
            Status:Set("Current Emote: " .. Settings.LastEmote .. " // Speed: " .. tostring(Settings.EmoteSpeed) ..
                           " // Time Position: " .. ak() .. " // Looped: " .. al())
        elseif au == false and game:GetService("Players").LocalPlayer.Character and
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and _G.LoadAnim then
            _G.LoadAnim:AdjustSpeed(1)
            Status:Set("Current Emote: " .. Settings.LastEmote .. " // Speed: " .. tostring(Settings.EmoteSpeed) ..
                           " // Time Position: " .. ak() .. " // Looped: " .. al())
        end
    end
})



EmoteTab:Slider({
    Title = "Emote Speed",
    Step = 1,
    Value = {
        Min = 0,
        Max = 100,
        Default = 0,
    },
    Callback = function(at)
        Settings.EmoteSpeed = at;
        if _G.LoadAnim and game:GetService("Players").LocalPlayer.Character and
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            _G.LoadAnim:AdjustSpeed(at)
            Status:Set("Current Emote: " .. Settings.LastEmote .. " // Speed: " .. tostring(Settings.EmoteSpeed) ..
                           " // Time Position: " .. ak() .. " // Looped: " .. al())
        end
    end
})


EmoteTab:Section({ 
    Title = "Other Emote",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})


EmoteTab:Toggle({
    Title = "Sit",
    Default = false,
    Callback = function(au)  
	if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = au
        end
end
})


EmoteTab:Toggle({
    Title = "Sit 2",
    Desc = "Sit char ",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
        if Settings.RapePlayer then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Bicycle")
            aa(av)
            task.wait(.15)
            _G.LoadAnim.TimePosition = 72 / 100 * _G.LoadAnim.Length;
            _G.LoadAnim:AdjustSpeed(0)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What14"
        elseif game.Lighting:FindFirstChild("What14") then
            game.Lighting:FindFirstChild("What14"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        while Settings.RapePlayer do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
        end
    end
})



EmoteTab:Toggle({
    Title = "Sit 3",
    Desc = "Sit char ",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
        if Settings.RapePlayer then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Quiet Waves")
            aa(av)
            task.wait(.15)
            _G.LoadAnim.TimePosition = 12 / 100 * _G.LoadAnim.Length;
            _G.LoadAnim:AdjustSpeed(0)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What16"
        elseif game.Lighting:FindFirstChild("What16") then
            game.Lighting:FindFirstChild("What16"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        while Settings.RapePlayer do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
        end
    end
})



EmoteTab:Toggle({
    Title = "Sit 4",
    Desc = "Sit char ",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
            if Settings.RapePlayer then
                Settings.PlayAlways = true;
                Settings.Time = true;
                P()
                local av = ag("Skadoosh")
                aa(av)
                task.wait(.15)
                _G.LoadAnim.TimePosition = 77 / 100 * _G.LoadAnim.Length;
                _G.LoadAnim:AdjustSpeed(0)
                local L = Instance.new("Part", game.Lighting)
                L.Name = "What17"
            elseif game.Lighting:FindFirstChild("What17") then
                game.Lighting:FindFirstChild("What17"):Destroy()
                P()
                Settings.PlayAlways = false
            end
            while Settings.RapePlayer do
                task.wait()
                pcall(function()
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                    end
                end)
            end
        end
})



EmoteTab:Toggle({
    Title = "Float",
    Desc = "Float char ",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
        if Settings.RapePlayer then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Fall Back to Float")
            aa(av)
            game:GetService("Players").LocalPlayer.Character.Humanoid.HipHeight = 4;
            task.wait(.15)
            _G.LoadAnim.TimePosition = 72 / 100 * _G.LoadAnim.Length;
            _G.LoadAnim:AdjustSpeed(0)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What18"
        elseif game.Lighting:FindFirstChild("What18") then
            game.Lighting:FindFirstChild("What18"):Destroy()
            game:GetService("Players").LocalPlayer.Character.Humanoid.HipHeight = bS;
            P()
            Settings.PlayAlways = false
        end
        while Settings.RapePlayer do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
        end
    end
})



EmoteTab:Toggle({
    Title = "Float 2",
    Desc = "Float char ",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
        if Settings.RapePlayer then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Skadoosh")
            aa(av)
            task.wait(.15)
            _G.LoadAnim.TimePosition = 43 / 100 * _G.LoadAnim.Length;
            _G.LoadAnim:AdjustSpeed(0)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What19"
        elseif game.Lighting:FindFirstChild("What19") then
            game.Lighting:FindFirstChild("What19"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        while Settings.RapePlayer do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
        end
    end
})

EmoteTab:Toggle({
    Title = "Float 3",
    Desc = "Float char ",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
        if Settings.RapePlayer then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Cuco - Levitate")
            aa(av)
            task.wait(.15)
            _G.LoadAnim.TimePosition = 7 / 100 * _G.LoadAnim.Length;
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What20"
        elseif game.Lighting:FindFirstChild("What20") then
            game.Lighting:FindFirstChild("What20"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        task.spawn(function()
            while Settings.RapePlayer do
                _G.LoadAnim.TimePosition = 7 / 100 * _G.LoadAnim.Length;
                task.wait(6)
            end
        end)
        while Settings.RapePlayer do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
        end
    end
})

EmoteTab:Toggle({
    Title = "Upside Down",
    Desc = "Down",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
        if Settings.RapePlayer then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Hero Landing")
            aa(av)
            task.wait(.15)
            _G.LoadAnim.TimePosition = 24.15 / 100 * _G.LoadAnim.Length;
            _G.LoadAnim:AdjustSpeed(0)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What21"
        elseif game.Lighting:FindFirstChild("What21") then
            game.Lighting:FindFirstChild("What21"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        while Settings.RapePlayer do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
        end
    end
})
EmoteTab:Toggle({
    Title = "Upside Down 2",
    Desc = "Down ",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
        if Settings.RapePlayer then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Skadoosh")
            aa(av)
            task.wait(.15)
            _G.LoadAnim.TimePosition = 44 / 100 * _G.LoadAnim.Length;
            _G.LoadAnim:AdjustSpeed(0)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What22"
        elseif game.Lighting:FindFirstChild("What22") then
            game.Lighting:FindFirstChild("What22"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        while Settings.RapePlayer do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
        end
    end
})
EmoteTab:Toggle({
    Title = "Lay down",
    Desc = "Lay",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
        if Settings.RapePlayer then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Bicycle")
            aa(av)
            task.wait(.15)
            _G.LoadAnim.TimePosition = 57 / 100 * _G.LoadAnim.Length;
            _G.LoadAnim:AdjustSpeed(0)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What23"
        elseif game.Lighting:FindFirstChild("What23") then
            game.Lighting:FindFirstChild("What23"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        while Settings.RapePlayer do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
        end
    end
})

EmoteTab:Toggle({
    Title = "Twerk 1",
    Desc = "Twerk char ",
    Value = false,
    Callback = function(au)
        Settings.TwerkAss = au;
        if Settings.TwerkAss then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Scorpion")
            aa(av)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What24"
        elseif game.Lighting:FindFirstChild("What24") then
            game.Lighting:FindFirstChild("What24"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        while Settings.TwerkAss do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
            _G.LoadAnim.TimePosition = 83;
            task.wait(.15)
            _G.LoadAnim.TimePosition = 83;
            _G.LoadAnim.TimePosition = 83;
            task.wait(.15)
            _G.LoadAnim.TimePosition = 83
        end
    end
})
EmoteTab:Toggle({
    Title = "Twerk 2",
    Desc = "Twerk char ",
    Value = false,
    Callback = function(au)
        Settings.TwerkAss2 = au;
        if Settings.TwerkAss2 then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Scorpion")
            aa(av)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What25"
        elseif game.Lighting:FindFirstChild("What25") then
            game.Lighting:FindFirstChild("What25"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        while Settings.TwerkAss2 do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
            _G.LoadAnim.TimePosition = 82;
            task.wait(.15)
            _G.LoadAnim.TimePosition = 83;
            _G.LoadAnim.TimePosition = 82;
            task.wait(.15)
            _G.LoadAnim.TimePosition = 83
        end
    end
})
EmoteTab:Toggle({
    Title = "Strech 3",
    Desc = "Strech char ",
    Value = false,
    Callback = function(au)
        Settings.RapePlayer = au;
        if Settings.RapePlayer then
            Settings.PlayAlways = true;
            Settings.Time = true;
            P()
            local av = ag("Quiet Waves")
            aa(av)
            task.wait(.15)
            _G.LoadAnim.TimePosition = 52 / 100 * _G.LoadAnim.Length;
            _G.LoadAnim:AdjustSpeed(0)
            local L = Instance.new("Part", game.Lighting)
            L.Name = "What26"
        elseif game.Lighting:FindFirstChild("What26") then
            game.Lighting:FindFirstChild("What26"):Destroy()
            P()
            Settings.PlayAlways = false
        end
        while Settings.RapePlayer do
            task.wait()
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false
                end
            end)
        end
    end
})







AnimationTab:Paragraph({
    Title = "All animations",
    Desc = "2.0",
    Image = "rbxassetid://75836201910272", -- lucide or URL or rbxassetid://
    ImageSize = 100
})


AnimationTab:Section({ 
    Title = "Animations",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})






if game:GetService("Players").LocalPlayer.Character and
    game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso") then
        AnimationTab:Dropdown({
            Title = "Animatins",
            Desc = "Set animation",
            Value = "",
            Multi = false,
            AllowNone = true,
            Values = J,
            Callback = function(bh)
                Settings.SelectedAnimation = bh;
                UpdateFile()
                N()
                Q(E[bh].Idle, E[bh].Idle2, E[bh].Idle3, E[bh].Walk, E[bh].Run, E[bh].Jump, E[bh].Climb, E[bh].Fall,
                    E[bh].Swim, E[bh].SwimIdle, E[bh].Weight, E[bh].Weight2)
                P()
                local a9 = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or
                               game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
                local ah = a9:GetPlayingAnimationTracks()
                for v, r in pairs(ah) do
                    r:AdjustSpeed(Settings.AnimationSpeed)
                end
                aB:Set("Current Animation: " .. Settings.SelectedAnimation .. " // Speed: " ..
                           tostring(Settings.AnimationSpeed))
            end
        
        })




        AnimationTab:Input({
            Title = "Play Animation",
            Desc = "Set animation",
            Value = "",
            PlaceholderText = "Enter your animation...",
            ClearTextOnFocus = false,
            Callback = function(at)
                local bx = ac(at)
                if bx and string.len(at) > 2 then
                    N()
                    Settings.SelectedAnimation = bx;
                    Settings.LastEmote = "Play"
                    Q(E[bx].Idle, E[bx].Idle2, E[bx].Idle3, E[bx].Walk, E[bx].Run, E[bx].Jump, E[bx].Climb, E[bx].Fall,
                        E[bx].Swim, E[bx].SwimIdle, E[bx].Weight, E[bx].Weight2)
                    UpdateFile()
                    aB:Set("Current Animation: " .. Settings.SelectedAnimation .. " // Speed: " ..
                               tostring(Settings.AnimationSpeed))
                    P()
                end
            end
        })

        AnimationTab:Button({
            Title = "Reset Animation",
            Desc = "reset",
            Callback = function()
                N()
                local b = game:GetService("Players").LocalPlayer.Character.Animate;
                b.idle.Animation1.AnimationId = OriginalAnimations[1] or ""
                b.idle.Animation2.AnimationId = OriginalAnimations[2] or ""
                if b:FindFirstChild("pose") then
                    local e = game:GetService("Players").LocalPlayer.Character.Animate.pose:FindFirstChildOfClass(
                        "Animation")
                    if e then
                        e.AnimationId = OriginalAnimations[3] or ""
                    end
                end
                b.walk:FindFirstChildOfClass("Animation").AnimationId = OriginalAnimations[4] or ""
                b.run:FindFirstChildOfClass("Animation").AnimationId = OriginalAnimations[5] or ""
                b.jump:FindFirstChildOfClass("Animation").AnimationId = OriginalAnimations[6] or ""
                b.climb:FindFirstChildOfClass("Animation").AnimationId = OriginalAnimations[7] or ""
                b.fall:FindFirstChildOfClass("Animation").AnimationId = OriginalAnimations[8] or ""
                b.swim:FindFirstChildOfClass("Animation").AnimationId = OriginalAnimations[9] or ""
                b.swimidle:FindFirstChildOfClass("Animation").AnimationId = OriginalAnimations[10] or ""
                P()
            end
        })

    end

AnimationTab:Section({ 
    Title = "Custom Animation",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})



AnimationTab:Dropdown({
    Title = "Idle 1 Animation",
    Desc = "Set anim",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = J,
    Callback = function(bh)
        Settings.SelectedAnimation = ""
        a2("idle1", E[bh].Idle)
        Settings.Custom.Idle = E[bh].Idle;
        Settings.SelectedAnimation = "Custom"
        Settings.Custom.Name = bh;
        UpdateFile()
    end
})



AnimationTab:Dropdown({
    Title = "Idle 2 Animation",
    Desc = "Set anim",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = J,
    Callback = function(bh)
        Settings.SelectedAnimation = ""
        a2("idle2", E[bh].Idle2)
        Settings.Custom.Idle2 = E[bh].Idle2;
        Settings.SelectedAnimation = "Custom"
        Settings.Custom.Name = bh;
        UpdateFile()
    end
})




AnimationTab:Dropdown({
    Title = "Walk Animation",
    Desc = "Set anim",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = J,
    Callback = function(bh)
        Settings.SelectedAnimation = ""
        a2("walk", E[bh].Walk)
        Settings.Custom.Walk = E[bh].Walk;
        Settings.SelectedAnimation = "Custom"
        Settings.Custom.Name = bh;
        UpdateFile()
    end
})



AnimationTab:Dropdown({
    Title = "Run Animation",
    Desc = "Set anim",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = J,
    Callback = function(bh)
        Settings.SelectedAnimation = ""
        a2("run", E[bh].Run)
        Settings.Custom.Run = E[bh].Run;
        Settings.SelectedAnimation = "Custom"
        Settings.Custom.Name = bh;
        UpdateFile()
    end
})


AnimationTab:Dropdown({
    Title = "Jump Animation",
    Desc = "Set anim",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = J,
    Callback = function(bh)
        Settings.SelectedAnimation = ""
        a2("jump", E[bh].Jump)
        Settings.Custom.Jump = E[bh].Jump;
        Settings.SelectedAnimation = "Custom"
        Settings.Custom.Name = bh;
        UpdateFile()
    end
})


AnimationTab:Dropdown({
    Title = "Climb Animation",
    Desc = "Set anim",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = J,
    Callback = function(bh)
        Settings.SelectedAnimation = ""
        a2("climb", E[bh].Climb)
        Settings.Custom.Climb = E[bh].Climb;
        Settings.Custom.Name = bh;
        UpdateFile()
    end
})


AnimationTab:Dropdown({
    Title = "Fall Animation",
    Desc = "Set anim",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = J,
    Callback = function(bh)
            Settings.SelectedAnimation = ""
            a2("fall", E[bh].Fall)
            Settings.Custom.Fall = E[bh].Fall;
            Settings.SelectedAnimation = "Custom"
            Settings.Custom.Name = bh;
            UpdateFile()
        end
})


AnimationTab:Dropdown({
    Title = "Swim idle Animation",
    Desc = "Set anim",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = J,
    Callback = function(bh)
        Settings.SelectedAnimation = ""
        a2("swimidle", E[bh].SwimIdle)
        Settings.Custom.SwimIdle = E[bh].SwimIdle;
        Settings.SelectedAnimation = "Custom"
        Settings.Custom.Name = bh;
        UpdateFile()
    end
})


AnimationTab:Dropdown({
    Title = "Swim Animation",
    Desc = "Set anim",
    Value = "",
    Multi = false,
    AllowNone = true,
    Values = J,
    Callback = function(bh)
        Settings.SelectedAnimation = ""
        a2("swim", E[bh].Swim)
        Settings.Custom.Swim = E[bh].Swim;
        Settings.SelectedAniAmation = "Custom"
        Settings.Custom.Name = bh;
        UpdateFile()
    end
})




--Settings

SettingsTab:Section({ Title = "Servers" })


SettingsTab:Button({
    Title = "Server Hop",
    Callback = function()
        local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
		module:Teleport(game.PlaceId)
    end
})

SettingsTab:Button({
    Title = "Auto Rejoin",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/9fYwjt6n"))()
    end
})

SettingsTab:Button({
    Title = "Rejoin",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/1gtVMUz3"))()
    end
})

SettingsTab:Button({
    Title = "Small Server",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/QQMDVUHL"))() 
    end
})









SettingsTab:Section({ Title = "Keybind" })

local Keybind = SettingsTab:Keybind({
    Title = "Keybind",
    Desc = "Keybind Desc",
    Value = "",
    CanChange = true,
    Callback = function(k)
        if not KeybindClicked then
            Window:Close()
        else
            Window:Open()
        end
        KeybindClicked = not KeybindClicked
    end
})


local HttpService = game:GetService("HttpService")

local folderPath = "WindUI"
makefolder(folderPath)

local function SaveFile(fileName, data)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    local jsonData = HttpService:JSONEncode(data)
    writefile(filePath, jsonData)
end

local function LoadFile(fileName)
    local filePath = folderPath .. "/" .. fileName .. ".json"
    if isfile(filePath) then
        local jsonData = readfile(filePath)
        return HttpService:JSONDecode(jsonData)
    end
end

local function ListFiles()
    local files = {}
    for _, file in ipairs(listfiles(folderPath)) do
        local fileName = file:match("([^/]+)%.json$")
        if fileName then
            table.insert(files, fileName)
        end
    end
    return files
end

SettingsTab:Section({ Title = "Window" })

local themeValues = {}
for name, _ in pairs(WindUI:GetThemes()) do
    table.insert(themeValues, name)
end

local themeDropdown = SettingsTab:Dropdown({
    Title = "Select Theme",
    Multi = false,
    AllowNone = false,
    Value = nil,
    Values = themeValues,
    Callback = function(theme)
        WindUI:SetTheme(theme)
    end
})
themeDropdown:Select(WindUI:GetCurrentTheme())

local ToggleTransparency = SettingsTab:Toggle({
    Title = "Toggle Window Transparency",
    Callback = function(e)
        Window:ToggleTransparency(e)
    end,
    Value = WindUI:GetTransparency()
})

SettingsTab:Section({ Title = "Save" })

local fileNameInput = ""
SettingsTab:Input({
    Title = "Write File Name",
    PlaceholderText = "Enter file name",
    Callback = function(text)
        fileNameInput = text
    end
})

SettingsTab:Button({
    Title = "Save File",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

SettingsTab:Section({ Title = "Load" })

local filesDropdown
local files = ListFiles()

filesDropdown = SettingsTab:Dropdown({
    Title = "Select File",
    Multi = false,
    AllowNone = true,
    Values = files,
    Callback = function(selectedFile)
        fileNameInput = selectedFile
    end
})

SettingsTab:Button({
    Title = "Load File",
    Callback = function()
        if fileNameInput ~= "" then
            local data = LoadFile(fileNameInput)
            if data then
                WindUI:Notify({
                    Title = "File Loaded",
                    Content = "Loaded data: " .. HttpService:JSONEncode(data),
                    Duration = 5,
                })
                if data.Transparent then 
                    Window:ToggleTransparency(data.Transparent)
                    ToggleTransparency:SetValue(data.Transparent)
                end
                if data.Theme then WindUI:SetTheme(data.Theme) end
            end
        end
    end
})

SettingsTab:Button({
    Title = "Overwrite File",
    Callback = function()
        if fileNameInput ~= "" then
            SaveFile(fileNameInput, { Transparent = WindUI:GetTransparency(), Theme = WindUI:GetCurrentTheme() })
        end
    end
})

SettingsTab:Button({
    Title = "Refresh List",
    Callback = function()
        filesDropdown:Refresh(ListFiles())
    end
})

--logs

LogTab:Paragraph({
    Title = "V2.0Update",
    Desc = "Comeback",
    Image = "upload", -- lucide or URL or rbxassetid://
    ImageSize = 60
})



LogTab:Paragraph({
    Title = "V1.0 Update",
    Desc = "Comeback | Mini Update",
    Image = "house", -- lucide or URL or rbxassetid://
    ImageSize = 60
})




--Fe




local Section = FeTab:Section({
	Title = "FE Event Hats"
})


FeTab:Button({
	Title = "DinoBlox [R6 Only]",
	Callback = function()
	        WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/5Kt42cfe",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://pastebin.com/raw/5Kt42cfe'))
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/fedinoblox/main/nonoti'),true))()
  	end    
})


FeTab:Button({
	Title = "Ice Cream [R6 Only]",
	Callback = function()
	        WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://www.roblox.com/catalog/9560392730/Ice-Cold-Shaved-Ice",
	Image = "rbxassetid://4483345998",
	Time = 5
})
  	WindUI:Notify({
	Title = "Controls!",
	Desc = "E to lick ice cream and Q to stop licking",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://www.roblox.com/catalog/9560392730/Ice-Cold-Shaved-Ice'))
    --hats
--https://www.roblox.com/catalog/9560392730/Ice-Cold-Shaved-Ice

--controls :
--E : To lick ice cream 
--Q : To stop licking 

loadstring(game:HttpGet("https://raw.githubusercontent.com/PYXDYT/FE-ICE-CREAM/main/V1"))()
  	end    
})


FeTab:Button({
	Title = "Jet V1 [R6 Only]",
	Callback = function()
	        WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/QqbZtXMj",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/QqbZtXMj'))
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/jetv1/main/script'))()
  	end    
})


FeTab:Button({
	Title = "Blue Flame Hoverboard [R6 Only]",
	Callback = function()
	        WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/TCKUyjx7",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://pastebin.com/raw/TCKUyjx7'))
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/bluehoverboard/main/fescript'),true))()
  	end    
})


FeTab:Button({
	Title = "Sofa Pc [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/XjdFXGdw",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://pastebin.com/raw/XjdFXGdw'))
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/pcsofa/main/scriptverycool'),true))()
  	end    
})


FeTab:Button({
	Title = "Eiffel Tower [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/skJetUDu",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://pastebin.com/raw/skJetUDu'))
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PYXDYT/FE-TOWER/main/V1"))()
  	end    
})


FeTab:Button({
	Title = "BMX Ride V2 [R6 Only]",
	Callback = function()
      		WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/aX8J7W82",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://pastebin.com/raw/aX8J7W82'))
loadstring(game:HttpGet(('https://pastefy.ga/6SiK0qV3/raw'),true))()
  	end    
})


FeTab:Button({
	Title = "Cursed Bat Cube [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/npFNxgQC",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://pastebin.com/raw/npFNxgQC'))	    
    loadstring(game:HttpGet(('https://pastefy.ga/UfJvPD1G/raw'),true))()
  	end    
})


FeTab:Button({
	Title = "Hoverboard V2 [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/tCf161BV",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://pastebin.com/raw/tCf161BV'))
    WindUI:Notify({
	Title = "Controls!",
	Desc = "Modes: Q & E",
	Image = "rbxassetid://4483345998",
	Time = 5
})
loadstring(game:HttpGet(('https://pastebin.com/raw/YLv2KSZj'),true))()
  	end    
})


FeTab:Button({
	Title = "Big Boy [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://www.roblox.com/catalog/9661543986/Nike-Shoebox-Costume",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://www.roblox.com/catalog/9661543986/Nike-Shoebox-Costume'))
    loadstring(game:HttpGet('https://paste.ee/r/gQOXW', true))()
  	end    
})


FeTab:Button({
	Title = "Ghast [R6 Only]",
	Callback = function()
      		WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/VJU8brdw",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://pastebin.com/raw/VJU8brdw'))
loadstring(game:HttpGet('https://pastefy.ga/zFn0z6VV/raw'))()
      		
  	end    
})


FeTab:Button({
	Title = "Blue Flame Power [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/KF1PBAQg",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://pastebin.com/raw/KF1PBAQg'))	    
      		loadstring("\103\97\109\101\58\71\101\116\83\101\114\118\105\99\101\40\34\83\116\97\114\116\101\114\71\117\105\34\41\58\83\101\116\67\111\114\101\40\34\83\101\110\100\78\111\116\105\102\105\99\97\116\105\111\110\34\44\32\123\32\10\9\84\105\116\108\101\32\61\32\34\77\97\100\101\32\66\121\32\73\109\32\80\97\116\114\105\99\107\34\59\10\9\84\101\120\116\32\61\32\34\34\59\10\9\73\99\111\110\32\61\32\34\34\125\41\10\68\117\114\97\116\105\111\110\32\61\32\49\54\59\10\10\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\112\97\115\116\101\102\121\46\103\97\47\111\57\90\104\120\107\81\48\47\114\97\119\39\41\44\116\114\117\101\41\41\40\41\10")()
  	end    
})


FeTab:Button({
	Title = "Hog Rider [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/j2vnk0vJ",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/j2vnk0vJ'))	    
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/pigr/main/hogrider'))()
  	end    
})


FeTab:Button({
	Title = "Flying Umbrella [R6 Only]",
	Callback = function()
      	WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://www.roblox.com/catalog/9350274205/Vans-Black-White-Checkerboard-Umbrella",
	Image = "rbxassetid://4483345998",
	Time = 5
})	
     	setclipboard(tostring('https://www.roblox.com/catalog/9350274205/Vans-Black-White-Checkerboard-Umbrella'))		
      loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/FEFlyingUmbrella/main/source'))()		
  	end    
})


FeTab:Button({
	Title = "Katana [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://www.roblox.com/catalog/7548993875/Slasher",
	Image = "rbxassetid://4483345998",
	Time = 5
})
setclipboard(tostring('https://www.roblox.com/catalog/7548993875/Slasher'))    
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\39\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\73\99\121\49\82\90\47\56\117\103\106\115\108\97\115\104\101\114\99\111\110\118\101\114\116\54\55\102\121\118\104\98\106\118\104\98\113\102\115\100\120\47\114\97\119\47\109\97\105\110\47\55\103\117\98\106\110\105\118\56\121\55\116\103\121\98\117\106\105\56\54\102\103\121\98\39\41\41\40\41\10")()
  	end    
})

FeTab:Button({
	Title = "Sad Boy [R6 & R15]",
	Callback = function()
	   WindUI:Notify({
	Title = "No necessary hats or items needed",
	Desc = "No necessary hats or items needed",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    loadstring(game:HttpGet("https://pastebin.com/raw/hgPJbwF0"))()
  	end    
})


FeTab:Button({
	Title = "Pet Dog [R6 & R15]",
	Callback = function()
	   WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/Fsf3rujC",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/Fsf3rujC'))     
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/petdog/main/feop"))()		
  	end    
})


FeTab:Button({
	Title = "Rocket [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://raw.githubusercontent.com/KRNL2/ferocket/main/hats",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://raw.githubusercontent.com/KRNL2/ferocket/main/hats'))
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/ferockett/main/source"))()
  	end    
})


FeTab:Button({
	Title = "Giant Cube Man [R6 Only]",
	Callback = function()
    	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://raw.githubusercontent.com/KRNL2/giantcubeman/main/hats",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    	setclipboard(tostring('https://raw.githubusercontent.com/KRNL2/giantcubeman/main/hats'))
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/giantcubemana/main/source"))()
  	end    
})


FeTab:Button({
	Title = "Hoverskater [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/qXa2jMnL",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/qXa2jMnL'))
    --Fe blue flame hoverboard
--https://www.roblox.com/catalog/6470135113/Fan-Hand-Sign-Why-Dont-We-WDW
--https://www.roblox.com/catalog/9560383533/Blue-Flame-Robo-Samurai
--[GET THIS HAT BEFORE JULY 8TH]

loadstring(game:HttpGet(('https://pastebin.com/raw/U2VHEdFB'),true))()
  	end    
})


----------------------------------------------------------------------------------
-- New section --
-- FE Free Hats --
----------------------------------------------------------------------------------
local Section = FeTab:Section({
	Title = "FE Free Hats"
})


FeTab:Button({
	Title = "Zombie [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/rFiVzH3Q",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	    setclipboard(tostring('https://pastebin.com/raw/rFiVzH3Q')) 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/FEZOM/main/zombie"))();
  	end    
})


FeTab:Button({
	Title = "Gun [R6]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/prWGNSPB",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/prWGNSPB'))     
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/gun/main/m40gun"))();
  	end    
})


FeTab:Button({
	Title = "Soccer Ball [R15 & R6]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/bWXNFt7T",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	    	setclipboard(tostring('https://pastebin.com/raw/bWXNFt7T'))
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/fes/main/soccerball"))();
  	end    
})


FeTab:Button({
	Title = "Titan Fling [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/FLLRSBG1",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/FLLRSBG1'))    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/TitanFling/main/op"))();
  	end    
})


FeTab:Button({
	Title = "Fake VR [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Successfully loaded!",
	Desc = "No hats required, your script has loaded.",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/fefake/main/vr"))()
  	end    
})


FeTab:Button({
	Title = "Hat Orbit [R6 & R15]",
	Callback = function()
	    WindUI:Notify({
	Title = "Commands:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/jwAckWQ5",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/jwAckWQ5')) 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/hatspin/main/cool"))()
  	end    
})


----------------------------------------------------------------------------------
-- New section --
-- FE Paid Hats--
----------------------------------------------------------------------------------
local Section = FeTab:Section({
	Title = "FE Paid Hats"
})


FeTab:Button({
	Title = "Demon [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/4YzZwE6C",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/4YzZwE6C'))	    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/demonscript/main/source"))()
  	end    
})


FeTab:Button({
	Title = "WideBoy [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hat:",
	Desc = "Link copied to clipboard, https://www.roblox.com/catalog/5074143464/Blue-Energy-Wings",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://www.roblox.com/catalog/5074143464/Blue-Energy-Wings'))
    loadstring(game:HttpGet('https://paste.ee/r/FYx2k', true))()
  	end    
})


FeTab:Button({
	Title = "Tank V2 [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/EjNBRXGR",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/EjNBRXGR'))
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/fetankv2/main/source"))()
  	end    
})


FeTab:Button({
	Title = "Block Car [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/tdch8JYU",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/tdch8JYU'))    
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/FEBlockcar/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Among Us V3 [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/3EJZEwhW",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/3EJZEwhW'))     
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/amongusv3/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Hammer Arm [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/3fiV0N5s",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/3fiV0N5s'))   
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/hammerarm/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Flying Gunner [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/LjY7qZSq",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/LjY7qZSq')) 
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/flyinggunner/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Block Hammer [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://controlc.com/1becc5a1",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://controlc.com/1becc5a1')) 
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/Blockhammer/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Red Samurai [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hat:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/B8F9HtwE",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/B8F9HtwE'))
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/kakabok1233453/asdasda/main/Red%20Samurai'),true))()
  	end    
})


FeTab:Button({
	Title = "Minecart [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hat:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/k7VcbXBi",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/k7VcbXBi'))    
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/kakabok1233453/asdasda/main/Minecart'),true))()
  	end    
})


FeTab:Button({
	Title = "Snake [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/Zqx7gxvJ",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/Zqx7gxvJ'))   
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/fesnake/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Road Rogue [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/Leh4NSzr",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/Leh4NSzr')) 	    
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/roadrogue/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Propeller [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/BWhBkH54",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/BWhBkH54'))	    
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/propellerman/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Cop [R6 Only]",
	Callback = function()
	WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/JySNEdjA",
	Image = "rbxassetid://4483345998",
	Time = 5
})

	setclipboard(tostring('https://pastebin.com/raw/JySNEdjA'))    
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/fecop/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Achromatic Glitcher [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/8hNKnjq1",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/8hNKnjq1'))
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/feglitcher/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Void Boss [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/4zNuAnzL",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://pastebin.com/raw/4zNuAnzL'))
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/voidboss/main/source', true))()	
  	end    
})



FeTab:Button({
	Title = "Jeep [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hat:",
	Desc = "Link copied to clipboard, https://www.roblox.com/catalog/9666085843/DESERT-BEEP",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    setclipboard(tostring('https://www.roblox.com/catalog/9666085843/DESERT-BEEP'))	
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/jeepdarkeccentric/main/source'),true))()
  	end    
})


FeTab:Button({
	Title = "Baseball Bat [R6 Only]",
	Callback = function()
	   WindUI:Notify({
	Title = "Necessary hat:",
	Desc = "Link copied to clipboard, https://www.roblox.com/catalog/7063113820/Aluminium-Baseball-Bat",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://www.roblox.com/catalog/7063113820/Aluminium-Baseball-Bat'))
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/baseballbatfe/main/source'),true))()
  	end    
})


FeTab:Button({
	Title = "Winged Gunner [R6 Only]",
	Callback = function()
	   WindUI:Notify({
	Title = "Necessary hat:",
	Desc = "Link copied to clipboard, https://raw.githubusercontent.com/KRNL2/hatsforwingedgunner/main/hats",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://raw.githubusercontent.com/KRNL2/hatsforwingedgunner/main/hats'))
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/wingedgunner/main/source'),true))()
  	end    
})


FeTab:Button({
	Title = "Walking Cube V2 [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Walking Cube V2",
	Desc = "Link copied to clipboard, https://www.roblox.com/catalog/5461538290/Sandwich-Costume",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://www.roblox.com/catalog/5461538290/Sandwich-Costume'))    
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/FEWalkingCubeV2/main/source'),true))()
  	end    
})


FeTab:Button({
	Title = "Shotgun [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://raw.githubusercontent.com/KRNL2/feshotgunhats/main/hats",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://raw.githubusercontent.com/KRNL2/feshotgunhats/main/hats'))        
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/feshotgun/main/source'),true))()
  	end    
})


FeTab:Button({
	Title = "Sheep [R6 Only]",
	Callback = function()
	    WindUI:Notify({
	Title = "Necessary hats:",
	Desc = "Link copied to clipboard, https://pastebin.com/raw/j9B201MY",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://pastebin.com/raw/j9B201MY'))   
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/KRNL2/fesheep/main/source'),true))()
  	end    
})


----------------------------------------------------------------------------------
-- New Section --
-- FE No Hats -- 
----------------------------------------------------------------------------------
local Section = FeTab:Section({
	Title = "FE No Hats"
})


FeTab:Button({
	Title = "Small Avatar V2 [R15 Only] [Scale]",
	Callback = function()
	    WindUI:Notify({
	Title = "Scale:",
	Desc = "Link copied to clipboard, https://raw.githubusercontent.com/KRNL2/smallavatarscale/main/source",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://raw.githubusercontent.com/KRNL2/smallavatarscale/main/source')) 
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/smallavatarv2/main/source', true))()
  	end    
})


FeTab:Button({
	Title = "Titan [R15 Only] [Scale]",
	Callback = function()
	    WindUI:Notify({
	Title = "Scale:",
	Desc = "Link copied to clipboard, https://github.com/KRNL2/bodytype/blob/main/titan",
	Image = "rbxassetid://4483345998",
	Time = 5
})
	setclipboard(tostring('https://github.com/KRNL2/bodytype/blob/main/titan'))    
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/fesizechanger/main/titan', true))()
  	end    
})


FeTab:Button({
	Title = "Winged Human [R6 Only]",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/fewinged/main/human"))()	
  	end    
})


FeTab:Button({
	Title = "Dog [R6 Only]",
	Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRNL2/fedog/main/animation"))();
  	end    
})


FeTab:Button({
	Title = "Huge Leg [R15 Only]",
	Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/DigitalityScripts/roblox-scripts/main/Leg%20Resize'))()
  	end    
})


FeTab:Button({
	Title = "Ragdoll Death [R6 Only]",
	Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/ragdolldeath/main/source'))()
  	end    
})


FeTab:Button({
	Title = "Walk on Walls [R6 & R15]",
	Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
  	end    
})


FeTab:Button({
	Title = "Invisibility [R15 Only]",
	Callback = function()
    local removeNametags = false -- remove custom billboardgui nametags from hrp, could trigger anticheat

local plr = game:GetService("Players").LocalPlayer
local character = plr.Character
local hrp = character.HumanoidRootPart
local old = hrp.CFrame

if not character:FindFirstChild("LowerTorso") or character.PrimaryPart ~= hrp then
return print("unsupported")
end

if removeNametags then
local tag = hrp:FindFirstChildOfClass("BillboardGui")
if tag then tag:Destroy() end

hrp.ChildAdded:Connect(function(item)
if item:IsA("BillboardGui") then
task.wait()
item:Destroy()
end
end)
end

local newroot = character.LowerTorso.Root:Clone()
hrp.Parent = workspace
character.PrimaryPart = hrp
character:MoveTo(Vector3.new(old.X,9e9,old.Z))
hrp.Parent = character
task.wait(0.5)
newroot.Parent = hrp
hrp.CFrame = old
  	end    
})


FeTab:Button({
	Title = "Mouse Fling [R6 Only]",
	Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/mousefling/main/source'))()
  	end    
})


FeTab:Button({
	Title = "Creepy Crawler [R6 Only]",
	Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/KRNL2/-FeCreepyCrawler/main/anice'))()
  	end    
})


--admins

AdminsTab:Section({ Title = "Admin Gui" })

AdminsTab:Button({
    Title = "Infinite Yield Delta ",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/mobile-delta-inf-yield/main/deltainfyield.txt"))()
        end
})

AdminsTab:Button({
    Title = "Infinite Yield",
    Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
        end
})
AdminsTab:Button({
    Title = "Nameless Admin",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))();
        end
})

AdminsTab:Button({
    Title = "Proton Admin",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/HuT90Wbu"))()
        end
})

AdminsTab:Button({
    Title = "Reviz Admin",
    Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/ibFPdiF7'))()
        end
})




AdminsTab:Section({ Title = "Exucator Gui" })

AdminsTab:Button({
    Title = "Fluxus",
    Callback = function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fluxus-Coral-Remake-7112"))()
        end
})


AdminsTab:Button({
    Title = "Delta Old",
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/g7LPD8er/raw"))()
        end
})


AdminsTab:Button({
    Title = "Arceus X3",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
        end
})



AdminsTab:Button({
    Title = "Vega",
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/fDluWteo/raw"))()
        end
})
AdminsTab:Button({
    Title = "Krnl",
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/M3HjLPU7"))()
        end
})

AdminsTab:Button({
    Title = "Synapse X",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/Chillz-s-scripts/main/Synapse-X-Remake.lua"))()
        end
})

AdminsTab:Button({
    Title = "Kiwi X",
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/YkNSufkg/raw"))()
        end
})









--scripts

ScriptTab:Section({ Title = "Searcher Scirpt" })

local HttpService = game:GetService("HttpService")

local currentIndex = 1
local scripts = {}


local function searchScripts(query)
    local url = "https://scriptblox.com/api/script/search?q=" .. query .. "&mode=free&page=1"
    local response = game:HttpGet(url)
    local data = HttpService:JSONDecode(response)

    if data and data.result and data.result.scripts then
        scripts = data.result.scripts
        currentIndex = 1
        updateParagraph(currentIndex)
    else
        scripts = {}
        updateParagraph(1)
    end
end

-- Arama input
local searchScriptsValue
ScriptTab:Input({
    Title = "Enter Search Query",
    Default = "",
    Placeholder = false,
    Callback = function(value)
        searchScriptsValue = value
    end
})

-- Arama butonu
ScriptTab:Button({
    Title = "Search",
    Callback = function()
        if searchScriptsValue and searchScriptsValue ~= "" then
            searchScripts(searchScriptsValue)
        else
            warn("No query entered")
        end
    end
})


ScriptTab:Button({
    Title = "Execute Script",
    Callback = function()
        local scr = scripts[currentIndex]
        if scr and scr.script and scr.script ~= "" then
            local func, err = loadstring(scr.script)
            if func then
                func()
                updateParagraph(currentIndex) -- execute sonrası Paragraph güncellensin
            else
                warn("Loadstring error: ", err)
            end
        else
            warn("No script found at index ", currentIndex)
        end
    end
})

ScriptTab:Section({ Title = "Lear Scirpts " })
ScriptTab:Button({
    Title = "Lear Auto Piano ",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Emircxy/Lear/refs/heads/main/Auto%20piano"))()
    end
})



ScriptTab:Section({ Title = "Universal Scirpts" })

ScriptTab:Button({
    Title = "Fake Lag ",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/VM3b0Thg'))()
    end
})






ScriptTab:Button({
    Title = "Auto Walk and Jump",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/srtepuBM'))()
    end
})

ScriptTab:Button({
    Title = "Illusion",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_11l7Y131YqJjZ31QmV5L8pI23V02b3191sEg26E75472Wl78Vi8870jRv5txZyL1.lua.txt"))()
    end
})

ScriptTab:Button({
    Title = "Jump Button",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/qhBY6frK'))();
    end
})



ScriptTab:Button({
    Title = "Invisible Gui",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Invisible%20Gui'))()
    end
})

ScriptTab:Button({
    Title = "Walk On Walls",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end
})


ScriptTab:Button({
    Title = "Shiftlock",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/MxxbzWR2",true))()
    end
})

ScriptTab:Button({
    Title = "Searcher Gui",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/ScriptSearcher"))()
    end
})


--Trolls

TrollsTab:Paragraph({
    Title = "Trolls",
    Desc = "Only Troll",
    Image = "rbxassetid://136912377849521", -- lucide or URL or rbxassetid://
    ImageSize = 100
})




TrollsTab:Section({ Title = "FE Troll Scirpts" })

TrollsTab:Button({
    Title = "Netless",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/pXWQxpLK'))()
    end
})


TrollsTab:Button({
    Title = "Fling All",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end
})

TrollsTab:Button({
    Title = "Fling Random",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/1FaK0DnK'))()
    end
})

TrollsTab:Button({
    Title = "Touch Fling",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/pXWQxpLK'))()
    end
})

TrollsTab:Button({
    Title = "Click Fling",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt'), true))()
    end
})

TrollsTab:Section({ Title = "Anti Trolls" })

TrollsTab:Button({
    Title = "Anti Filing",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/h8sLkBP0"))()
    end
})

TrollsTab:Button({
    Title = "Anti Filing 2",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/tMHP76Ex"))()
    end
})


TrollsTab:Button({
    Title = "Anti Bang",
    Callback = function()
        loadstring(game:HttpGet('https://github.com/AnthonyIsntHere/anthonysrepository/raw/main/scripts/Anti%20Bang.lua'))()
    end
})


TrollsTab:Button({
    Title = "Anti Tool Kill",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/Anti%20Tool%20Kill.lua'))()
    end
})



TrollsTab:Button({
    Title = "Anti Afk",
    Callback = function()
        		loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))()
    end
})

TrollsTab:Button({
    Title = "Anti Kick",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/gsxvWvnj"))()
    end
})







--Hub

HubTab:Section({ Title = "Sky Hub" })
HubTab:Paragraph({
    Title = "Sky Hub",
    Desc = "Made by yofriendfromschool1",
    Image = "rbxassetid://87127373849667", -- lucide or URL or rbxassetid://
    ImageSize = 50
    
})
HubTab:Code({
    Title = "",
    Code = [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
    ]],
})

HubTab:Button({
    Title = "Execute",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
    end
})



-------------------------------------------------------------------------------------------------------------------

HubTab:Section({ Title = "Ghost Hub" })
HubTab:Paragraph({
    Title = "Ghost Hub",
    Desc = "Made by GhostPlayer352",
    Image = "rbxassetid://133735622544532", -- lucide or URL or rbxassetid://
    ImageSize = 50
    
})
HubTab:Code({
    Title = "",
    Code = [[
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()

    ]],
})

HubTab:Button({
    Title = "Execute",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()

    end
})

---------------------------------------------------------------------------------------------------------------------

HubTab:Section({ Title = "Ez Hub" })
HubTab:Paragraph({
    Title = "Ez Hub",
    Desc = "Made by ez",
    Image = "rbxassetid://15547117196", -- lucide or URL or rbxassetid://
    ImageSize = 50
    
})
HubTab:Code({
    Title = "",
    Code = [[
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug42O/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
    ]],
})

HubTab:Button({
    Title = "Execute",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug42O/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
    end
})


----------------------------------------------------------------

HubTab:Section({ Title = "Sky Hub" })
HubTab:Paragraph({
    Title = "Game Hub",
    Desc = "Made by none",
    Image = "gamepad", -- lucide or URL or rbxassetid://
    ImageSize = 50
    
})
HubTab:Code({
    Title = "",
    Code = [[
loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-Script/main/Games%20Hub%20(Always%20updated)"))()
    ]],
})

HubTab:Button({
    Title = "Execute",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-Script/main/Games%20Hub%20(Always%20updated)"))()
    end
})




local Sound = Instance.new("Sound") -- Yeni bir ses nesnesi oluştur




MusicTab:Section({ Title = "Music" })



MusicTab:Input({
    Title = "Music ID",
    Desc = "dance",
    Value = "",
    PlaceholderText = "ID",
    ClearTextOnFocus = false,
    Callback = function(input)
        -- Müzik ID'si alınır
        local MusicId = "rbxassetid://" .. input

        -- Yeni bir ses oluşturulur
        local Sound = Instance.new("Sound")
        Sound.Parent = game:GetService("Workspace")
        Sound.SoundId = MusicId
        Sound.Volume = 5
        Sound.Looped = true
        Sound:Play()
    end
})

       
      



MusicTab:Button({
    Title = "Stop",
    Callback = function()
        for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:IsA("Sound") then
        v:Stop() -- Müziği durdur

    end
end

    end
})



MusicTab:Section({ Title = "Music List" })
MusicTab:Button({
    Title = "Fur Elise",
    Callback = function()
        Sound.Parent = game:GetService("Workspace") -- Workspace'e ekle
Sound.SoundId = "rbxassetid://1837532419" -- Buraya istediğin müzik ID'sini koy
Sound.Volume = 5 -- Ses seviyesi (0 ile 10 arasında ayarla)
Sound.Looped = true -- Müziğin sürekli çalmasını istiyorsan true yap
Sound:Play() -- Müziği çal

    end
})


MusicTab:Button({
    Title = "Uh Ah",
    Callback = function()
        Sound.Parent = game:GetService("Workspace") -- Workspace'e ekle
Sound.SoundId = "rbxassetid://86271123924168" -- Buraya istediğin müzik ID'sini koy
Sound.Volume = 5 -- Ses seviyesi (0 ile 10 arasında ayarla)
Sound.Looped = true -- Müziğin sürekli çalmasını istiyorsan true yap
Sound:Play() -- Müziği çal

    end
})

MusicTab:Button({
    Title = "Turkish March",
    Callback = function()
        Sound.Parent = game:GetService("Workspace") -- Workspace'e ekle
Sound.SoundId = "rbxassetid://1842150151" -- Buraya istediğin müzik ID'sini koy
Sound.Volume = 5 -- Ses seviyesi (0 ile 10 arasında ayarla)
Sound.Looped = true -- Müziğin sürekli çalmasını istiyorsan true yap
Sound:Play() -- Müziği çal

    end
})

MusicTab:Button({
    Title = "Andante",
    Callback = function()
        Sound.Parent = game:GetService("Workspace") -- Workspace'e ekle
Sound.SoundId = "rbxassetid://105882833374061" -- Buraya istediğin müzik ID'sini koy
Sound.Volume = 5 -- Ses seviyesi (0 ile 10 arasında ayarla)
Sound.Looped = true -- Müziğin sürekli çalmasını istiyorsan true yap
Sound:Play() -- Müziği çal

    end
})



ToolsTab:Section({ Title = "Tools" })


ToolsTab:Button({
    Title = "All Tool Giver V2",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/qpbQo0lr/raw"))()
    end
})


ToolsTab:Button({
    Title = "All Tool Giver V1",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tools-Giver-Some-Tools-Will-Fe-7865"))()
    end
})


ToolsTab:Section({ Title = "Admin Tools" })
ToolsTab:Button({
    Title = "Noclip Tool",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/by83MUJ4/raw"))()
    end
})

ToolsTab:Button({
    Title = "Run tool",
    Callback = function()
        mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Run"
tool.Activated:connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)
tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

ToolsTab:Button({
    Title = "Fling Tool",
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.ga/xBdd9GId/raw'),true))()
    end
})


ToolsTab:Button({
    Title = "Tp Tool",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/Lhg31PG6/raw"))()
    end
})



ToolsTab:Button({
    Title = "F3x Tool",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/tJg8ZaGs"))()
    end
})

ToolsTab:Button({
    Title = "BTools",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
    end
})




DbgTab:Section({ Title = "Debuggers" })


UserInputService = game:GetService("UserInputService")
local IsOnMobile = table.find({
	Enum.Platform.IOS,
	Enum.Platform.Android
}, UserInputService:GetPlatform())
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()





DbgTab:Button({
    Title = "Dex",
    Callback = function()
        if IsOnMobile then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/Dex/Mobile%20Dex%20Explorer.txt"))()
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
		end
	end
})

DbgTab:Button({
    Title = "SimpleSpy V3",
    Callback = function()
        if IsOnMobile then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/SimpleSpyV3/mobilemain.lua"))()
		else
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
		end
	end
})

DbgTab:Button({
    Title = "TurtleSpy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Spy/main/source.lua", true))()
	end
})


DbgTab:Button({
    Title = "Open Console",
    Callback = function()
        game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
	end
})









DbgTab:Section({ Title = "Helper" })

DbgTab:Button({
    Title = "Fps Counter",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Sempiller/sdluniversal/main/fpsviewer.lua"))()
	end
})

DbgTab:Button({
    Title = "Lag Reducer",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/RW7ZT29m'))()
	end
})


DbgTab:Button({
    Title = "KeyBoard",
    Callback = function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-MobileKeyboard-8101"))()
	end
})

DbgTab:Button({
    Title = "Auto Clicker",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JustEzpi/ROBLOX-Scripts/main/ROBLOX_AutoClicker"))()
	end
})

DbgTab:Section({ Title = "Bypasser" })


DbgTab:Button({
    Title = "Adonis Bypasser",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/GZRt3WgA"))()
	end
})

DbgTab:Button({
    Title = "Ac Bypasser",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xen8054/AntiCheatBypassPLUS/main/Script"))();
	end
})





DbgTab:Section({ Title = "RemoteEvent" })


DbgTab:Button({
    Title = "Game Tool Giver",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolgiver.lua"))()
	end
})

DbgTab:Button({
    Title = "Game Tool Equipper",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolequipper.lua"))()
	end
})

DbgTab:Button({
    Title = "Gui & UI Viewer",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameuigiver.lua"))()
	end
})


DbgTab:Button({
    Title = "RemoteEvent",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gameremotefireserver.lua"))()
	end
})


DbgTab:Button({
    Title = "Game World Viewer",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/subplaceviewer.txt"))()
	end
})

DbgTab:Section({ Title = "Game Saver" })



DbgTab:Button({
    Title = "Save Game",
    Callback = function()
        saveinstance()
	end
})






--functions final
game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal(
    "MoveDirection"):Connect(function()
    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").MoveDirection.Magnitude > 0 then
        if a8() == "R15" then
            if _G.LoadAnim and not Settings.PlayAlways then
                game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false;
                _G.LoadAnim:Stop()
            end
        else
            if _G.LoadAnim and not Settings.PlayAlways then
                _G.LoadAnim:Stop()
                P()
            end
        end
    end
end)
game.Players.LocalPlayer.CharacterAdded:Connect(function(bY)
    repeat
        wait()
    until game:GetService("Players").LocalPlayer.Character and
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Animate")
    bY.Humanoid.Died:Connect(function()
        Settings.DeathPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end)
    if Settings.Refresh and game.Players.LocalPlayer.Character and
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Settings.DeathPosition then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Settings.DeathPosition
    end
    wait(.15)
    N()
    if Settings.SelectedAnimation ~= "" and a8() == "R15" and Settings.SelectedAnimation ~= "Custom" or
        Settings.LastEmote == "Play" and a8() == "R15" and Settings.SelectedAnimation ~= "Custom" then
        Q(E[Settings.SelectedAnimation].Idle or f(1), E[Settings.SelectedAnimation].Idle2 or f(2),
            E[Settings.SelectedAnimation].Idle3 or f(3), E[Settings.SelectedAnimation].Walk or f(4),
            E[Settings.SelectedAnimation].Run or f(5), E[Settings.SelectedAnimation].Jump or f(6),
            E[Settings.SelectedAnimation].Climb or f(7), E[Settings.SelectedAnimation].Fall or f(8),
            E[Settings.SelectedAnimation].Swim or f(9), E[Settings.SelectedAnimation].SwimIdle or f(10),
            E[Settings.SelectedAnimation].Weight, E[Settings.SelectedAnimation].Weight2)
        if Settings.Custom.Wave then
            a2("wave", Settings.Custom.Wave)
        end
        if Settings.Custom.Laugh then
            a2("laugh", Settings.Custom.Laugh)
        end
        if Settings.Custom.Cheer then
            a2("cheer", Settings.Custom.Cheer)
        end
        if Settings.Custom.Point then
            a2("point", Settings.Custom.Point)
        end
        if Settings.Custom.Sit then
            a2("sit", Settings.Custom.Sit)
        end
        if Settings.Custom.Dance then
            a2("dance", Settings.Custom.Dance)
        end
        if Settings.Custom.Dance2 then
            a2("dance2", Settings.Custom.Dance2)
        end
        if Settings.Custom.Dance3 then
            a2("dance3", Settings.Custom.Dance3)
        end
        P()
        local a9 = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or
                       game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
        local ah = a9:GetPlayingAnimationTracks()
        for v, r in pairs(ah) do
            r:AdjustSpeed(Settings.AnimationSpeed)
        end
    elseif E[Settings.Custom.Name] and
        (Settings.Custom.Idle or Settings.Custom.Idle2 or Settings.Custom.Idle3 or Settings.Custom.Walk or
            Settings.Custom.Run or Settings.Custom.Jump or Settings.Custom.Climb or Settings.Custom.Fall or
            Settings.Custom.Swim or Settings.Custom.SwimIdle) and E[Settings.Custom.Name].Weight and
        E[Settings.Custom.Name].Weight2 and a8() == "R15" then
        Q(Settings.Custom.Idle or OriginalAnimations[1], Settings.Custom.Idle2 or OriginalAnimations[2],
            Settings.Custom.Idle3 or OriginalAnimations[3] or nil, Settings.Custom.Walk or OriginalAnimations[4],
            Settings.Custom.Run or OriginalAnimations[5], Settings.Custom.Jump or OriginalAnimations[6],
            Settings.Custom.Climb or OriginalAnimations[7], Settings.Custom.Fall or OriginalAnimations[8],
            Settings.Custom.Swim or OriginalAnimations[9], Settings.Custom.SwimIdle or OriginalAnimations[10],
            E[Settings.Custom.Name].Weight, E[Settings.Custom.Name].Weight2)
        if Settings.Custom.Wave then
            a2("wave", Settings.Custom.Wave)
        end
        if Settings.Custom.Laugh then
            a2("laugh", Settings.Custom.Laugh)
        end
        if Settings.Custom.Cheer then
            a2("cheer", Settings.Custom.Cheer)
        end
        if Settings.Custom.Point then
            a2("point", Settings.Custom.Point)
        end
        if Settings.Custom.Sit then
            a2("sit", Settings.Custom.Sit)
        end
        if Settings.Custom.Dance then
            a2("dance", Settings.Custom.Dance)
        end
        if Settings.Custom.Dance2 then
            a2("dance2", Settings.Custom.Dance2)
        end
        if Settings.Custom.Dance3 then
            a2("dance3", Settings.Custom.Dance3)
        end
        P()
        local a9 = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or
                       game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
        local ah = a9:GetPlayingAnimationTracks()
        for v, r in pairs(ah) do
            r:AdjustSpeed(Settings.AnimationSpeed)
        end
    end
    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal(
        "MoveDirection"):Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").MoveDirection.Magnitude >
            0 then
            if a8() == "R15" then
                if _G.LoadAnim and not Settings.PlayAlways then
                    game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false;
                    _G.LoadAnim:Stop()
                end
            else
                if _G.LoadAnim and not Settings.PlayAlways then
                    _G.LoadAnim:Stop()
                    P()
                end
            end
        end
    end)
end)
if not getgenv().AlreadyLoaded then
    task.spawn(function()
        while task.wait() do
            if Settings.AnimationSpeedToggle and game:GetService("Players").LocalPlayer.Character and
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or
                Settings.AnimationSpeedToggle and
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("AnimationController") then
                local a9 = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or
                               game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass(
                        "AnimationController")
                local ah = a9:GetPlayingAnimationTracks()
                for v, r in pairs(ah) do
                    r:AdjustSpeed(Settings.AnimationSpeed)
                end
            end
        end
    end)
end
if not getgenv().AlreadyLoaded then
    getgenv().AlreadyLoaded = true
end
 
 
function Protection()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/Anti%20GUI%20Detection.lua"))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/Anti%20Instance%20Detector.lua"))()
end
Protection()



