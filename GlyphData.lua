local _, glyphData = ...

glyphData.Glyphs = {
    --[glyph itemID] = { specID, spellLink glyphID, actionID }
    [1] = { --Warrior
        --71 Arms, 72 Fury, 73 Protection
        [80588]  = {  72,  991, 184361 }, --Glyph of Burning Anger
        [141898] = {   0, 1286,   6544 }, --Glyph of Falling Thunder
        [43398]  = {  73,  486, 115768 }, --Glyph of Gushing Wound
        [80587]  = {   0,  990, 163201 }, --Glyph of Hawk Feast
        [43400]  = {   0,  488,  34428 }, --Glyph of Mighty Victory
        [217584] = {   0, 1444, 376079 }, --Glyph of Spear of Bastion
        [137188] = {   0, 1223,   3411 }, --Glyph of the Blazing Savior
        [85221]  = {   0, 1020,    100 }, --Glyph of the Blazing Trail
        [203763] = {   0, 1432,  57755 }, --Glyph of the Heaved Armament
        [104138] = {  72, 1101,   1719 }, --Glyph of the Weaponmaster
        [49084]  = {  73,  851,   6343 }, --Glyph of Thunder Strike
    },
    [2] = { --Paladin
        --65 Holy, 66 Protection, 70 Retribution
        [217588] = {  65, 1455, 388007 }, --Glyph of Blessing of the Seasons
        [217587] = {   0, 1454, 375576 }, --Glyph of Divine Toll
        [43369]  = {   0,  457,  20271 }, --Glyph of Fire From the Heavens
        [104108] = {  65, 1083,  20473 }, --Glyph of Pillar of Light
        [41100]  = {   0,  190,  32223 }, --Glyph of the Luminous Charger
        [137293] = {  66, 1245,  86659 }, --Glyph of the Queen
        [143588] = {   0, 1287, 190784 }, --Glyph of the Trusted Steed
        [43366]  = {   0,  454,  31884 }, --Glyph of Winged Vengeance
        [153177] = {   0, 1306, 190784 }, --Golden Charger's Bridle
        [153174] = {   0, 1303, 190784 }, --Valorous Charger's Bridle
        [153175] = {   0, 1304, 190784 }, --Vengeful Charger's Bridle
        [153176] = {   0, 1305, 190784 }, --Vigilant Charger's Bridle
    },
    [3] = { --Hunter
        --253 Beast Mastery, 254 Marksmanship, 255 Survival
        [137249] = { 253, 1234, 120679 }, --Glyph of Arachnophobia
        [217593] = {   0, 1450, 375891 }, --Glyph of Death Chakram
        [170173] = { 253, 1415, 120679 }, --Glyph of Dire Bees
        [43350]  = {   0,  440,    883 }, --Glyph of Lesser Proportion
        [137250] = { 253, 1235, 120679 }, --Glyph of Nesingwary's Nemeses
        [137269] = {   0, 1239,   1543 }, --Glyph of Stellar Flare
        [139288] = { 253, 1253, 120679 }, --Glyph of the Dire Stable
        [137267] = {   0, 1238,   1543 }, --Glyph of the Goblin Anti-Grav Flare
        [137239] = { 255, 1231, 190925 }, --Glyph of the Hook
        [137238] = { 255, 1230, 190925 }, --Glyph of the Trident
    },
    [4] = { --Rogue
        --259 Assassination, 260 Outlaw, 261 Subtlety
        [139358] = {   0, 1272,   6770 }, --Glyph of Blackout
        [139442] = {   0, 1283,   2983 }, --Glyph of Burnout
        [45768]  = {   0,  733,    921 }, --Glyph of Disguise
        [217597] = {   0, 1457, 385616 }, --Glyph of Echoing Reprimand
        [217598] = { 261, 1459, 384631 }, --Glyph of Flagellation
        [129020] = {   0, 1271,   1725 }, --Glyph of Flash Bang
        [217583] = {   0, 1458, 385408 }, --Glyph of Sepsis
    },
    [5] = { --Priest
        --256 Discipline, 257 Holy, 258 Shadow
        [149755] = { 257, 1084,  77485 }, --Glyph of Angels
        [153036] = { 256, 1302,  47540 }, --Glyph of Dark Absolution
        [129017] = {   0, 1270,    586 }, --Glyph of Ghostly Fade
        [104122] = { 257, 1087,  64843 }, --Glyph of Inspired Hymns
        [217589] = {   0, 1456, 375901 }, --Glyph of Mindgames
        [43373]  = {   0,  461,   9484 }, --Glyph of Shackle Undead
        [77101]  = { 258,  961, 232698 }, --Glyph of Shadow
        [87392]  = { 258, 1052, 232698 }, --Glyph of Shadowy Friends
        [79538]  = {   0, 1007,   1706 }, --Glyph of the Heavens
        [153031] = { 256, 1299,  34433 }, --Glyph of the Lightspawn
        [104120] = {   0, 1085,  34433 }, --Glyph of the Sha
        [207088] = { 258, 1439, 228260 }, --Glyph of the Shath'Yar
        [87277]  = { 257, 1049,  20711 }, --Glyph of the Val'kyr
        [153033] = { 258, 1301,  34433 }, --Glyph of the Voidling
    },
    [6] = { --Death Knight
        --250 Blood, 251 Frost, 252 Unholy
        [217596] = {   0, 1462, 383269 }, --Glyph of Abomination Limb
        [137274] = {   0, 1240,   3714 }, --Glyph of Cracked Ice
        [43551]  = { 252,  529,  42650 }, --Glyph of Foul Menagerie
        [139271] = {   0, 1247,  48707 }, --Glyph of the Chilled Shell
        [139270] = {   0, 1246,  48707 }, --Glyph of the Crimson Shell
        [43535]  = {   0,  514,  46585 }, --Glyph of the Geist
        [104099] = {   0, 1074,  46585 }, --Glyph of the Skeleton
    },
    [7] = { --Shaman
        --262 Elemental, 263 Enhancement, 264 Restoration
        [139289] = {   0, 1254,  51514 }, --Glyph of Critterhex
        [137289] = { 262, 1244, 198067 }, --Glyph of Flickering
        [104127] = {   0, 1091,   2008 }, --Glyph of Lingering Ancestors
        [137288] = {   0, 1243, 198103 }, --Glyph of Pebbles
        [217599] = {
            { 262, 1460, 375982 }, --Glyph of Primordial Wave (Elemental)
            { 263, 1460, 375982 }, --Glyph of Primordial Wave (Enhancement)
            { 264, 1460, 428332 }, --Glyph of Primordial Wave (Restoration)
        },
        [104126] = { 263, 1090,  51533 }, --Glyph of Spirit Raptors
        [190378] = {   0, 1426,   2645 }, --Glyph of the Spectral Lupine
        [137287] = {   0, 1242,   2645 }, --Glyph of the Spectral Raptor
        [190380] = {   0, 1427,   2645 }, --Glyph of the Spectral Vulpine
        [43386]  = {   0,  471,   2645 }, --Glyph of the Spectral Wolf
    },
    [8] = { --Mage
        --62 Arcane, 63 Fire, 64 Frost
        [42751]  = {   0,  328,    118 }, --Glyph of Crittermorph
        [167539] = {   0, 1410,   1459 }, --Glyph of Dalaran Brilliance
        [104105] = {  64, 1080,  31687 }, --Glyph of Evaporation
        [172449] = {   0, 1416, 190336 }, --Glyph of Lavish Servings
        [139352] = {   0, 1269,    118 }, --Glyph of Polymorphic Proportions
        [217586] = {  62, 1452, 376103 }, --Glyph of Radiant Spark
        [217594] = {   0, 1451, 382440 }, --Glyph of Shifting Power
        [139348] = {  63, 1267, 190319 }, --Glyph of Smolder
        [129019] = {   0, 1266,    130 }, --Glyph of Sparkles
        [170165] = {  64, 1413,  31687 }, --Glyph of Steaming Fury
        [166664] = {  64, 1408,  31687 }, --Glyph of Storm's Wake
        [170168] = {  64, 1414,  31687 }, --Glyph of the Cold Waves
        [170164] = {  64, 1412,  31687 }, --Glyph of the Dark Depths
        [166583] = {  64, 1407,  31687 }, --Glyph of the Tides
        [104104] = {  64, 1079,  31687 }, --Glyph of the Unbound Elemental
    },
    [9] = { --Warlock
        --265 Affliction, 266 Demonology, 267 Destruction
        [207101] = {   0, 1440,  20707 }, --Glyph of Banehollow's Soulstone
        [45789]  = {   0,  761,    710 }, --Glyph of Crimson Banish
        [151538] = { 267, 1296, 246985 }, --Glyph of Ember Shards
        [151542] = {   0, 1298, 246985 }, --Glyph of Fel-Touched Shards
        [42459]  = { 266,  278,  30146 }, --Glyph of Felguard
        [151540] = {   0, 1297, 246985 }, --Glyph of Floating Shards
        [217600] = { 265, 1461, 386997 }, --Glyph of Soul Rot
        [43394]  = {   0,  482,  29893 }, --Glyph of Soulwell
        [137191] = {   0, 1224,    126 }, --Glyph of the Inquisitor's Eye
    },
    [10] = { --Monk
        --268 Brewmaster, 269 Windwalker, 270 Mistweaver
        [139338] = {   0, 1264, 117952 }, --Glyph of Crackling Crane Lightning
        [129022] = {   0, 1263, 117952 }, --Glyph of Crackling Ox Lightning
        [87881]  = {   0, 1045, 117952 }, --Glyph of Crackling Tiger Lightning
        [217494] = {
            { 270, 1443, 388193 }, --Glyph of Faeline Stomp (Mistweaver)
            { 269, 1443, 388193 }, --Glyph of Faeline Stomp (Windwalker)
        },
        [87888]  = {   0, 1041, 101643 }, --Glyph of Fighting Pose
        [87883]  = {   0, 1039, 322109 }, --Glyph of Honor
        [87885]  = {   0, 1028, 107428 }, --Glyph of Rising Tiger Kick
        [217595] = { 268, 1453, 387184 }, --Glyph of Weapons of Order
        [139339] = { 268, 1265, 124502 }, --Glyph of Yu'lon's Grace
    },
    [11] = { --Druid
        --102 Balance, 103 Feral, 104 Guardian, 105 Restoration
        --Note: Glyph of the Forest Path DOES NOT work with Tiger Dash
        [217592] = {
            { 103, 1449, 391888 }, --Glyph of Adaptive Swarm (Feral)
            { 105, 1449, 391888 }, --Glyph of Adaptive Swarm (Restoration)
        },
        [136826] = { 105, 1221,  33763 }, --Glyph of Autumnal Bloom
        [217585] = {   0, 1448, 391528 }, --Glyph of Convoke the Spirits
        [44922]  = {
            { 102,  613,  24858 }, --Glyph of Stars (Balance)
            { 103,  613, 197625 }, --Glyph of Stars (Balance Affinity)
            { 104,  613, 197625 }, --Glyph of Stars (Balance Affinity)
            { 105,  613, 197625 }, --Glyph of Stars (Balance Affinity)
        },
        [184100] = {   0, 1421, 276029 }, --Glyph of the Aerial Chameleon
        [184097] = {   0, 1420, 276012 }, --Glyph of the Aquatic Chameleon
        [136825] = {   0, 1220,    768 }, --Glyph of the Feral Chameleon
        [139278] = {   0, 1252,   1850 }, --Glyph of the Forest Path
        [211400] = {
            { 102, 1441,  24858 }, --Glyph of the Lunar Chameleon (Balance)
            { 103, 1441, 197625 }, --Glyph of the Lunar Chameleon (Balance Affinity)
            { 104, 1441, 197625 }, --Glyph of the Lunar Chameleon (Balance Affinity)
            { 105, 1441, 197625 }, --Glyph of the Lunar Chameleon (Balance Affinity)
        },
        [118061] = { 102, 1206, 191034 }, --Glyph of the Sun
        [184096] = {   0, 1419,    783 }, --Glyph of the Swift Chameleon
        [43334]  = {   0,  432,   5487 }, --Glyph of the Ursol Chameleon
        [188164] = { 105, 1423, 145205 }, --Glyph of the Wild Mushroom
        [143750] = { 105, 1288,  33763 }, --Glyph of Twilight Bloom
    },
    [12] = { --Demon Hunter
        --577 Havoc, 581 Vengeance
        [129029] = {   0, 1275, 258920 }, --Glyph of Crackling Flames
        [217591] = {   0, 1447, 390163 }, --Glyph of Elysian Decree
        [139417] = {   0, 1276, 131347 }, --Glyph of Fallow Wings
        [129028] = {
            { 577, 1273, 178940 }, --Glyph of Fel Touched Souls (H)
            { 581, 1273, 204254 }, --Glyph of Fel Touched Souls (V)
        },
        [139435] = {   0, 1277, 131347 }, --Glyph of Fel Wings
        [139437] = {   0, 1279, 188501 }, --Glyph of Fel-Enemies
        --[] = { 0, 1446, 391429 } --Glyph of Fodder to the Flame
        [139362] = {
            { 577, 1274, 178940 }, --Glyph of Mana Touched Souls (H)
            { 581, 1274, 204254 }, --Glyph of Mana Touched Souls (V)
        },
        [139438] = {   0, 1280, 188501 }, --Glyph of Shadow-Enemies
        [139436] = {   0, 1278, 131347 }, --Glyph of Tattered Wings
        [203762] = {
            { 577, 1431, 185123 }, --Glyph of the Chosen Glaive (H)
            { 581, 1431, 204157 }, --Glyph of the Chosen Glaive (V)
        },
        [217590] = {   0, 1445, 370965 }, --Glyph of the Hunt
    },
}

glyphData.Barbershop = {
    --[itemID] = { questID, spellID }
    [9] = { --Warlock
        [139314] = { 76370, 219460 }, --Grimoire of the Abyssal
        [213016] = { 79457, 433534 }, --Grimoire of the Abyssal Darkglare
        [212750] = { 79359, 432954 }, --Grimoire of the Ancient Observer
        [208051] = { 77180, 417546 }, --Grimoire of the Antoran Felhunter
        [212983] = { 79443, 433451 }, --Grimoire of the Blasted Observer
        [212779] = { 79374, 433077 }, --Grimoire of the Bloodrage Tyrant
        [207178] = { 76743, 416352 }, --Grimoire of the Darkfire Imp
        [212991] = { 79447, 433467 }, --Grimoire of the Dire Observer
        [207295] = { 76744, 416364 }, --Grimoire of the Dreadfire Imp
        [213015] = { 79456, 433533 }, --Grimoire of the Eredathian Darkglare
        [129018] = { 76369, 219425 }, --Grimoire of the Fel Imp
        [207297] = { 76746, 416368 }, --Grimoire of the Felblaze Imp
        [212780] = { 79375, 433081 }, --Grimoire of the Felbrute Tyrant
        [207294] = { 76747, 416360 }, --Grimoire of the Felfrost Imp
        [207114] = { 76742, 416344 }, --Grimoire of the Fiendish Imp
        [207111] = { 76737, 416330 }, --Grimoire of the Hellfire Fel Imp
        [212989] = { 79446, 433456 }, --Grimoire of the Mana-Gorged Observer
        [207296] = { 76745, 416366 }, --Grimoire of the Netherbound Imp
        [212783] = { 79376, 433083 }, --Grimoire of the Netherwalk Tyrant
        [212993] = { 79449, 433468 }, --Grimoire of the Plagued Observer
        [213017] = { 79458, 433535 }, --Grimoire of the Riftsmolder Darkglare
        [147119] = { 76372, 240271 }, --Grimoire of the Shadow Succubus
        [139310] = { 76373, 219437 }, --Grimoire of the Shivarra
        [207113] = { 76741, 416339 }, --Grimoire of the Trickster Fel Imp
        [207112] = { 76740, 416336 }, --Grimoire of the Void-Touched Fel Imp
        [139311] = { 76375, 219446 }, --Grimoire of the Voidlord
        [208052] = { 77181, 417547 }, --Grimoire of the Voracious Felmaw
        [139315] = { 76376, 219468 }, --Grimoire of the Wrathguard
        [208050] = { 77183, 417529 }, --Grimoire of the Xorothian Felhunter
        [147117] = { 76377, 240268 }, --Orb of the Fel Temptress
        [212778] = { 79373, 433076 }, --Grimoire of the Vile Tyrant
        [208048] = { 77182, 417510 }, --Ritual of the Voidmaw Felhunter
        [212995] = { 79450, 433469 }, --Grimoire of the Whispering Observer
        [213014] = { 79455, 433532 }, --Grimoire of the Xorothian Darkglare
        [212984] = { 79444, 433452 }, --Grimoire of the Zealous Observer
    },
    [11] = { --Druid
        [210645] = { 78479, 426328 }, --Feather of Friends
        [210754] = { 78527, 426478 }, --Feather of the Blazing Somnowl
        [211280] = { 78525, 428622 }, --Feather of the Smoke Red Moon
        [89868]  = { 62677, 131151 }, --Glyph of the Cheetah
        [140630] = { 62678, 224123 }, --Glyph of the Doe
        [162022] = { 62674, 276058 }, --Glyph of the Dolphin
        [162029] = { 62676, 276120 }, --Glyph of the Humble Flyer
        [40919]  = { 62673,  54872 }, --Glyph of the Orca
        [129021] = { 62675, 219064 }, --Glyph of the Sentinel
        [162027] = { 62672, 276087 }, --Glyph of the Tideskipper
        [210735] = { 78523, 426476 }, --Mark of the Auric Dreamstag
        [211081] = { 78514, 428050 }, --Mark of the Auroral Dreamtalon
        [211080] = { 78512, 428045 }, --Mark of the Boreal Dreamtalon
        [210683] = { 78513, 426455 }, --Mark of the Dreamtalon Matriarch
        [187933] = { 65058, 360883 }, --Mark of the Duskwing Raven
        [210669] = { 78507, 426426 }, --Mark of the Evergreen Dreamsaber
        [187887] = { 65048, 360543 }, --Mark of the Gloomstalker Dredbat
        [210751] = { 78528, 426483 }, --Mark of the Hibernating Runebear
        [210650] = { 78503, 426354 }, --Mark of the Keen-Eyed Dreamsaber
        [210731] = { 78522, 426475 }, --Mark of the Lush Dreamstag
        [210738] = { 78519, 426465 }, --Mark of the Loamy Umbraclaw
        [187934] = { 65061, 360895 }, --Mark of the Midnight Runestag
        [187931] = { 65059, 360881 }, --Mark of the Regal Dredbat
        [187936] = { 65062, 360900 }, --Mark of the Sable Ardenmoth
        [210674] = { 78511, 426439 }, --Mark of the Sable Dreamtalon
        [187888] = { 64987, 360547 }, --Mark of the Shimmering Ardenmoth
        [210535] = { 78448, 426075 }, --Mark of the Slumbering Somnowl
        [210736] = { 78524, 426477 }, --Mark of the Smoldering Dreamstag
        [210739] = { 78520, 426473 }, --Mark of the Snowy Umbraclaw
        [210684] = { 78515, 426457 }, --Mark of the Thriving Dreamtalon
        [187884] = { 64986, 360541 }, --Mark of the Twilight Runestag
        [210647] = { 78481, 426335 }, --Mark of the Umbramane
        [210729] = { 78517, 426460 }, --Mark of the Verdant Bristlebruin
        [210728] = { 78521, 426485 }, --Moon-Blessed Claw
        [210727] = { 78518, 426462 }, --Pollenfused Bristlebruin Fur Sample
        [210753] = { 78516, 426459 }, --Scale of the Prismatic Whiskerfish
    },
}
