local _, glyphData = ...

glyphData.Glyphs = {
    --[glyph itemID] = { specID, spellLink glyphID, actionID }
    [1] = { --Warrior
        --71 Arms, 72 Fury, 73 Protection
        [80588]  = { 72,  991, 184361 }, --Glyph of Burning Anger
        [141898] = {  0, 1286,   6544 }, --Glyph of Falling Thunder
        [43398]  = { 73,  486, 115768 }, --Glyph of Gushing Wound
        [80587]  = {  0,  990, 163201 }, --Glyph of Hawk Feast
        [43400]  = {  0,  488,  34428 }, --Glyph of Mighty Victory
        [137188] = {  0, 1223,   3411 }, --Glyph of the Blazing Savior
        [85221]  = {  0, 1020,    100 }, --Glyph of the Blazing Trail
        [104138] = { 72, 1101,   1719 }, --Glyph of the Weaponmaster
        [49084]  = { 73,  851,   6343 }, --Glyph of Thunder Strike
    },
    [2] = { --Paladin
        --65 Holy, 66 Protection, 70 Retribution
        [43369]  = {  0,  457,  20271 }, --Glyph of Fire From the Heavens
        [104108] = { 65, 1083,  20473 }, --Glyph of Pillar of Light
        [41100]  = {  0,  190,  32223 }, --Glyph of the Luminous Charger
        [137293] = { 66, 1245,  86659 }, --Glyph of the Queen
        [143588] = {  0, 1287, 190784 }, --Glyph of the Trusted Steed
        [43366]  = {  0,  454,  31884 }, --Glyph of Winged Vengeance
        [153177] = {  0, 1306, 190784 }, --Golden Charger's Bridle
        [153174] = {  0, 1303, 190784 }, --Valorous Charger's Bridle
        [153175] = {  0, 1304, 190784 }, --Vengeful Charger's Bridle
        [153176] = {  0, 1305, 190784 }, --Vigilant Charger's Bridle
    },
    [3] = { --Hunter
        --253 Beast Mastery, 254 Marksmanship, 255 Survival
        [137249] = { 253, 1234, 120679 }, --Glyph of Arachnophobia
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
        [139358] = { 0, 1272, 6770 }, --Glyph of Blackout
        [139442] = { 0, 1283, 2983 }, --Glyph of Burnout
        [45768]  = { 0,  733,  921 }, --Glyph of Disguise
        [129020] = { 0, 1271, 1725 }, --Glyph of Flash Bang
    },
    [5] = { --Priest
        --256 Discipline, 257 Holy, 258 Shadow
        [149755] = { 257, 1084,  77485 }, --Glyph of Angels
        [153036] = { 256, 1302,  47540 }, --Glyph of Dark Absolution
        [129017] = {   0, 1270,    586 }, --Glyph of Ghostly Fade
        [104122] = { 257, 1087,  64843 }, --Glyph of Inspired Hymns
        [43373]  = {   0,  461,   9484 }, --Glyph of Shackle Undead
        [77101]  = { 258,  961, 232698 }, --Glyph of Shadow
        [87392]  = { 258, 1052, 232698 }, --Glyph of Shadowy Friends
        [79538]  = {   0, 1007,   1706 }, --Glyph of the Heavens
        [153031] = { 256, 1299,  34433 }, --Glyph of the Lightspawn
        [104120] = {   0, 1085,  34433 }, --Glyph of the Sha
        [87277]  = { 257, 1049,  20711 }, --Glyph of the Val'kyr
        [153033] = { 258, 1301,  34433 }, --Glyph of the Voidling
    },
    [6] = { --Death Knight
        --250 Blood, 251 Frost, 252 Unholy
        [137274] = {   0, 1240,  3714 }, --Glyph of Cracked Ice
        [43551]  = { 252,  529, 42650 }, --Glyph of Foul Menagerie
        [139271] = {   0, 1247, 48707 }, --Glyph of the Chilled Shell
        [139270] = {   0, 1246, 48707 }, --Glyph of the Crimson Shell
        [43535]  = {   0,  514, 46585 }, --Glyph of the Geist
        [104099] = {   0, 1074, 46585 }, --Glyph of the Skeleton
    },
    [7] = { --Shaman
        --262 Elemental, 263 Enhancement, 264 Restoration
        [139289] = {   0, 1254,  51514 }, --Glyph of Critterhex
        [137289] = { 262, 1244, 198067 }, --Glyph of Flickering
        [104127] = {   0, 1091,   2008 }, --Glyph of Lingering Ancestors
        [137288] = {   0, 1243, 198103 }, --Glyph of Pebbles
        [104126] = { 263, 1090,  51533 }, --Glyph of Spirit Raptors
        [190378] = {   0, 1426,   2645 }, --Glyph of the Spectral Lupine
        [137287] = {   0, 1242,   2645 }, --Glyph of the Spectral Raptor
        [190380] = {   0, 1427,   2645 }, --Glyph of the Spectral Vulpine
        [43386]  = {   0,  471,   2645 }, --Glyph of the Spectral Wolf
    },
    [8] = { --Mage
        --62 Arcane, 63 Fire, 64 Frost
        [42751]  = {  0,  328,    118 }, --Glyph of Crittermorph
        [167539] = {  0, 1410,   1459 }, --Glyph of Dalaran Brilliance
        [104105] = { 64, 1080,  31687 }, --Glyph of Evaporation
        [172449] = {  0, 1416, 190336 }, --Glyph of Lavish Servings
        [139352] = {  0, 1269,    118 }, --Glyph of Polymorphic Proportions
        [139348] = { 63, 1267, 190319 }, --Glyph of Smolder
        [129019] = {  0, 1266,    130 }, --Glyph of Sparkles
        [170165] = { 64, 1413,  31687 }, --Glyph of Steaming Fury
        [166664] = { 64, 1408,  31687 }, --Glyph of Storm's Wake
        [170168] = { 64, 1414,  31687 }, --Glyph of the Cold Waves
        [170164] = { 64, 1412,  31687 }, --Glyph of the Dark Depths
        [166583] = { 64, 1407,  31687 }, --Glyph of the Tides
        [104104] = { 64, 1079,  31687 }, --Glyph of the Unbound Elemental
    },
    [9] = { --Warlock
        --265 Affliction, 266 Demonology, 267 Destruction
        [45789]  = {   0,  761,    710 }, --Glyph of Crimson Banish
        [151538] = { 267, 1296, 246985 }, --Glyph of Ember Shards
        [129018] = {   0, 1255,    688 }, --Glyph of Fel Imp
        [151542] = {   0, 1298, 246985 }, --Glyph of Fel-Touched Shards
        [42459]  = { 266,  278,  30146 }, --Glyph of Felguard
        [151540] = {   0, 1297, 246985 }, --Glyph of Floating Shards
        [43394]  = {   0,  482,  29893 }, --Glyph of Soulwell
        [137191] = {   0, 1224,    126 }, --Glyph of the Inquisitor's Eye
        [139312] = {   0, 1258,    691 }, --Glyph of the Observer
        [147119] = {   0, 1292,    712 }, --Glyph of the Shadow Succubus
        [139310] = {   0, 1256,    712 }, --Glyph of the Shivarra
        [139311] = {   0, 1257,    697 }, --Glyph of the Voidlord
        [139315] = { 266, 1261,  30146 }, --Glyph of Wrathguard
        [147117] = {   0, 1291,    712 }, --Orb of the Fel Temptress
    },
    [10] = { --Monk
        --268 Brewmaster, 270 Mistweaver, 269 Windwalker
        [139338] = {   0, 1264, 117952 }, --Glyph of Crackling Crane Lightning
        [129022] = {   0, 1263, 117952 }, --Glyph of Crackling Ox Lightning
        [87881]  = {   0, 1045, 117952 }, --Glyph of Crackling Tiger Lightning
        [87888]  = {   0, 1041, 101643 }, --Glyph of Fighting Pose
        [87883]  = {   0, 1039, 322109 }, --Glyph of Honor
        [87885]  = {   0, 1028, 107428 }, --Glyph of Rising Tiger Kick
        [139339] = { 268, 1265, 124502 }, --Glyph of Yu'lon's Grace
    },
    [11] = { --Druid
        --102 Balance, 103 Feral, 104 Guardian, 105 Restoration
        --Note: Glyph of the Forest Path DOES NOT work with Tiger Dash
        [136826] = { 105, 1221,  33763 }, --Glyph of Autumnal Bloom
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
        [118061] = { 102, 1206, 191034 }, --Glyph of the Sun
        [184096] = {   0, 1419,    783 }, --Glyph of the Swift Chameleon
        [43334]  = {   0,  432,   5487 }, --Glyph of the Ursol Chameleon
        [188164] = { 105, 1423, 145205 }, --Glyph of the Wild Mushroom
        [143750] = { 105, 1288,  33763 }, --Glyph of Twilight Bloom
    },
    [12] = { --Demon Hunter
        --577 Havoc, 581 Vengeance
        [129029] = { 0, 1275, 258920 }, --Glyph of Crackling Flames
        [139417] = { 0, 1276, 131347 }, --Glyph of Fallow Wings
        [129028] = {
            { 577, 1273, 178940 }, --Glyph of Fel Touched Souls (H)
            { 581, 1273, 204254 }, --Glyph of Fel Touched Souls (V)
        },
        [139435] = { 0, 1277, 131347 }, --Glyph of Fel Wings
        [139437] = { 0, 1279, 188501 }, --Glyph of Fel-Enemies
        [139362] = {
            { 577, 1274, 178940 }, --Glyph of Mana Touched Souls (H)
            { 581, 1274, 204254 }, --Glyph of Mana Touched Souls (V)
        },
        [139438] = { 0, 1280, 188501 }, --Glyph of Shadow-Enemies
        [139436] = { 0, 1278, 131347 }, --Glyph of Tattered Wings
    },
}

glyphData.Marks = {
    [40919]  = 14654, --Mark of the Orca
    [89868]  = 14664, --Mark of the Cheetah
    [129021] = 14666, --Mark of the Sentinel
    [140630] = 14665, --Mark of the Doe
    [162022] = 14653, --Mark of the Dolphin
    [162027] = 14655, --Mark of the Tideskipper
    [162029] = 14667, --Mark of the Humble Flyer
    [187884] = 15227, --Mark of the Twilight Runestag
    [187887] = 15231, --Mark of the Gloomstalker Dredbat
    [187888] = 15228, --Mark of the Shimmering Ardenmoth
    [187931] = 15236, --Mark of the Regal Dredbat
    [187933] = 15235, --Mark of the Duskwing Raven
    [187934] = 15237, --Mark of the Midnight Runestag
    [187936] = 15238, --Mark of the Sable Ardenmoth
}