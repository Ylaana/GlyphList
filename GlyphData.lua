local glyphViewer, glyphData = ...

glyphData.Glyphs = {
    --IDs are glyph ItemType subclassIDs
    [1] = { --Warrior
        [80588] = 991,   --Glyph of Burning Anger
        [141898] = 1286, --Glyph of Falling Thunder
        [43398] = 486,   --Glyph of Gushing Wound
        [80587] = 990,   --Glyph of Hawk Feast
        [43400] = 488,   --Glyph of Mighty Victory
        [137188] = 1223, --Glyph of the Blazing Savior
        [85221] = 1020,  --Glyph of the Blazing Trail
        [104138] = 1101, --Glyph of the Weaponmaster
        [49084] = 851,   --Glyph of Thunder Strike
    },
    [2] = { --Paladin
        [43369] = 457,   --Glyph of Fire From the Heavens
        [104108] = 1083, --Glyph of Pillar of Light
        [41100] = 190,   --Glyph of the Luminous Charger
        [137293] = 1245, --Glyph of the Queen
        [143588] = 1287, --Glyph of the Trusted Steed
        [43366] = 454,   --Glyph of Winged Vengeance
        [153177] = 1306, --Golden Charger's Bridle
        [153174] = 1303, --Valorous Charger's Bridle
        [153175] = 1304, --Vengeful Charger's Bridle
        [153176] = 1305, --Vigilant Charger's Bridle
    },
    [3] = { --Hunter
        [137249] = 1234, --Glyph of Arachnophobia
        [170173] = 1415, --Glyph of Dire Bees
        [43350] = 440,   --Glyph of Lesser Proportion
        [137250] = 1235, --Glyph of Nesingwary's Nemeses
        [137269] = 1239, --Glyph of Stellar Flare
        [139288] = 1253, --Glyph of the Dire Stable
        [137267] = 1238, --Glyph of the Goblin Anti-Grav Flare
        [137239] = 1231, --Glyph of the Hook
        [137238] = 1230, --Glyph of the Trident
    },
    [4] = { --Rogue
        [139358] = 1272, --Glyph of Blackout
        [139442] = 1283, --Glyph of Burnout
        [45768] = 733,   --Glyph of Disguise
        [129020] = 1271, --Glyph of Flash Bang
    },
    [5] = { --Priest
        [149755] = 1084, --Glyph of Angels
        [153036] = 1302, --Glyph of Dark Absolution
        [129017] = 1270, --Glyph of Ghostly Fade
        [104122] = 1087, --Glyph of Inspired Hymns
        [43373] = 461,   --Glyph of Shackle Undead
        [77101] = 961,   --Glyph of Shadow
        [87392] = 1052,  --Glyph of Shadowy Friends
        [79538] = 1007,  --Glyph of the Heavens
        [153031] = 1299, --Glyph of the Lightspawn
        [104120] = 1085, --Glyph of the Sha
        [87277] = 1049,  --Glyph of the Val'kyr
        [153033] = 1301, --Glyph of the Voidling
    },
    [6] = { --Death Knight
        [137274] = 1240, --Glyph of Cracked Ice
        [43551] = 529,   --Glyph of Foul Menagerie
        [139271] = 1247, --Glyph of the Chilled Shell
        [139270] = 1246, --Glyph of the Crimson Shell
        [43535] = 514,   --Glyph of the Geist
        [104099] = 1074, --Glyph of the Skeleton
    },
    [7] = { --Shaman
        [139289] = 1254, --Glyph of Critterhex
        [137289] = 1244, --Glyph of Flickering
        [104127] = 1091, --Glyph of Lingering Ancestors
        [137288] = 1243, --Glyph of Pebbles
        [104126] = 1090, --Glyph of Spirit Raptors
        [137287] = 1242, --Glyph of the Spectral Raptor
        [43386] = 471,   --Glyph of the Spectral Wolf
    },
    [8] = { --Mage
        [42751] = 328,   --Glyph of Crittermorph
        [167539] = 1410, --Glyph of Dalaran Brilliance
        [104105] = 1080, --Glyph of Evaporation
        [172449] = 1416, --Glyph of Lavish Servings
        [139352] = 1269, --Glyph of Polymorphic Proportions
        [139348] = 1267, --Glyph of Smolder
        [129019] = 1266, --Glyph of Sparkles
        [170165] = 1413, --Glyph of Steaming Fury
        [166664] = 1408, --Glyph of Storm's Wake
        [170168] = 1414, --Glyph of the Cold Waves
        [170164] = 1412, --Glyph of the Dark Depths
        [166583] = 1407, --Glyph of the Tides
        [104104] = 1079, --Glyph of the Unbound Elemental
    },
    [9] = { --Warlock
        [45789] = 761,   --Glyph of Crimson Banish
        [151538] = 1296, --Glyph of Ember Shards
        [129018] = 1255, --Glyph of Fel Imp
        [151542] = 1298, --Glyph of Fel-Touched Shards
        [42459] = 278,   --Glyph of Felguard
        [151540] = 1297, --Glyph of Floating Shards
        [43394] = 482,   --Glyph of Soulwell
        [137191] = 1224, --Glyph of the Inquisitor's Eye
        [139312] = 1258, --Glyph of the Observer
        [147119] = 1292, --Glyph of the Shadow Succubus
        [139310] = 1256, --Glyph of the Shivarra
        [139311] = 1257, --Glyph of the Voidlord
        [139315] = 1261, --Glyph of Wrathguard
        [147117] = 1291, --Orb of the Fel Temptress
    },
    [10] = { --Monk
        [139338] = 1264, --Glyph of Crackling Crane Lightning
        [129022] = 1263, --Glyph of Crackling Ox Lightning
        [87881] = 1045,  --Glyph of Crackling Tiger Lightning
        [87888] = 1041,  --Glyph of Fighting Pose
        [87883] = 1039,  --Glyph of Honor
        [87885] = 1028,  --Glyph of Rising Tiger Kick
        [139339] = 1265, --Glyph of Yu'lon's Grace
    },
    [11] = { --Druid
        [136826] = 1221, --Glyph of Autumnal Bloom
        [44922] = 613,   --Glyph of Stars
        [184100] = 1421, --Glyph of the Aerial Chameleon
        [184097] = 1420, --Glyph of the Aquatic Chameleon
        [136825] = 1220, --Glyph of the Feral Chameleon
        [139278] = 1252, --Glyph of the Forest Path
        [118061] = 1206, --Glyph of the Sun
        [184096] = 1419, --Glyph of the Swift Chameleon
        [43334] = 432,   --Glyph of the Ursol Chameleon
        [143750] = 1288, --Glyph of Twilight Bloom
        --There is currently no API information regarding marks/form customisations
        --Needs thinking about implementation of the below
        [89868] = 0,  --Mark of the Cheetah
        [140630] = 0, --Mark of the Doe
        [162022] = 0, --Mark of the Dolphin
        [162029] = 0, --Mark of the Humble Flyer
        [40919] = 0,  --Mark of the Orca
        [129021] = 0, --Mark of the Sentinel
        [162027] = 0, --Mark of the Tideskipper
    },
    [12] = { --Demon Hunter
        [129029] = 1275, --Glyph of Crackling Flames
        [139417] = 1276, --Glyph of Fallow Wings
        [129028] = 1273, --Glyph of Fel Touched Souls
        [139435] = 1277, --Glyph of Fel Wings
        [139437] = 1279, --Glyph of Fel-Enemies
        [139362] = 1274, --Glyph of Mana Touched Souls
        [139438] = 1280, --Glyph of Shadow-Enemies
        [139436] = 1278, --Glyph of Tattered Wings
    },
}

glyphData.Conflicts = {
    [2] = {
        {
            143588, --Glyph of the Trusted Steed
            153177, --Golden Charger's Bridle
            153174, --Valorous Charger's Bridle
            153175, --Vengeful Charger's Bridle
            153176, --Vigilant Charger's Bridle
        },
    },
    [3] = {
        {
            137239, --Glyph of the Hook
            137238, --Glyph of the Trident
        },
        {
            137249, --Glyph of Arachnophobia
            170173, --Glyph of Dire Bees
            137250, --Glyph of Nesingwary's Nemeses
            139288, --Glyph of the Dire Stable
        },
        {
            137269, --Glyph of Stellar Flare
            137267, --Glyph of the Goblin Anti-Grav Flare
        }
    },
    [5] = {
        {
            153031, --Glyph of the Lightspawn
            104120, --Glyph of the Sha
            153033, --Glyph of the Voidling
        },
        {
            77101,  --Glyph of Shadow
            87392,  --Glyph of Shadowy Friends
        },
    },
    [6] = {
        {
            139271, --Glyph of the Chilled Shell
            139270, --Glyph of the Crimson Shell
        },
        {
            43535,  --Glyph of the Geist
            104099, --Glyph of the Skeleton
        },
    },
    [7] = {
        {
            137287, --Glyph of the Spectral Raptor
            43386,  --Glyph of the Spectral Wolf
        },
    },
    [8] = {
        {
            104105, --Glyph of Evaporation
            170165, --Glyph of Steaming Fury
            166664, --Glyph of Storm's Wake
            170168, --Glyph of the Cold Waves
            170164, --Glyph of the Dark Depths
            166583, --Glyph of the Tides
            104104, --Glyph of the Unbound Elemental
        },
    },
    [9] = {
        {
            151538, --Glyph of Ember Shards
            151542, --Glyph of Fel-Touched Shards
            151540, --Glyph of Floating Shards
        },
        {
            42459,  --Glyph of Felguard
            139315, --Glyph of Wrathguard
        },
        {
            147119, --Glyph of the Shadow Succubus
            139310, --Glyph of the Shivarra
            147117, --Orb of the Fel Temptress
        },
    },
    [10] = {
        {
            139338, --Glyph of Crackling Crane Lightning
            129022, --Glyph of Crackling Ox Lightning
            87881,  --Glyph of Crackling Tiger Lightning
        },
    },
    [11] = {
        {
            136826, --Glyph of Autumnal Bloom
            143750, --Glyph of Twilight Bloom
        }
    },
    [12] = {
        {
            129028, --Glyph of Fel Touched Souls
            139362, --Glyph of Mana Touched Souls
        },
        {
            139437, --Glyph of Fel-Enemies
            139438, --Glyph of Shadow-Enemies
        },
        {
            139417, --Glyph of Fallow Wings
            139435, --Glyph of Fel Wings
            139436, --Glyph of Tattered Wings
        }
    }
}