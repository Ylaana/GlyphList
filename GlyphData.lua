local glyphViewer, glyphData = ...

glyphData.Glyphs = {
    --IDs are glyph ItemType subclassIDs
    [1] = { --Warrior
        80588,  --Glyph of Burning Anger
        141898, --Glyph of Falling Thunder
        43398,  --Glyph of Gushing Wound
        80587,  --Glyph of Hawk Feast
        43400,  --Glyph of Mighty Victory
        137188, --Glyph of the Blazing Savior
        85221,  --Glyph of the Blazing Trail
        104138, --Glyph of the Weaponmaster
        49084,  --Glyph of Thunder Strike
    },
    [2] = { --Paladin
        43369,  --Glyph of Fire From the Heavens
        104108, --Glyph of Pillar of Light
        41100,  --Glyph of the Luminous Charger
        137293, --Glyph of the Queen
        143588, --Glyph of the Trusted Steed
        43366,  --Glyph of Winged Vengeance
        153177, --Golden Charger's Bridle
        153174, --Valorous Charger's Bridle
        153175, --Vengeful Charger's Bridle
        153176, --Vigilant Charger's Bridle
    },
    [3] = { --Hunter
        137249, --Glyph of Arachnophobia
        170173, --Glyph of Dire Bees
        43350,  --Glyph of Lesser Proportion
        137250, --Glyph of Nesingwary's Nemeses
        137269, --Glyph of Stellar Flare
        139288, --Glyph of the Dire Stable
        137267, --Glyph of the Goblin Anti-Grav Flare
        137239, --Glyph of the Hook
        137238, --Glyph of the Trident
    },
    [4] = { --Rogue
        139358, --Glyph of Blackout
        139442, --Glyph of Burnout
        45768,  --Glyph of Disguise
        129020, --Glyph of Flash Bang
    },
    [5] = { --Priest
        149755, --Glyph of Angels
        153036, --Glyph of Dark Absolution
        129017, --Glyph of Ghostly Fade
        104122, --Glyph of Inspired Hymns
        43373,  --Glyph of Shackle Undead
        77101,  --Glyph of Shadow
        87392,  --Glyph of Shadowy Friends
        79538,  --Glyph of the Heavens
        153031, --Glyph of the Lightspawn
        104120, --Glyph of the Sha
        87277,  --Glyph of the Val'kyr
        153033, --Glyph of the Voidling
    },
    [6] = { --Death Knight
        137274, --Glyph of Cracked Ice
        43551,  --Glyph of Foul Menagerie
        139271, --Glyph of the Chilled Shell
        139270, --Glyph of the Crimson Shell
        43535,  --Glyph of the Geist
        104099, --Glyph of the Skeleton
    },
    [7] = { --Shaman
        139289, --Glyph of Critterhex
        137289, --Glyph of Flickering
        104127, --Glyph of Lingering Ancestors
        137288, --Glyph of Pebbles
        104126, --Glyph of Spirit Raptors
        137287, --Glyph of the Spectral Raptor
        43386,  --Glyph of the Spectral Wolf
    },
    [8] = { --Mage
        42751,  --Glyph of Crittermorph
        167539, --Glyph of Dalaran Brilliance
        104105, --Glyph of Evaporation
        172449, --Glyph of Lavish Servings
        139352, --Glyph of Polymorphic Proportions
        139348, --Glyph of Smolder
        129019, --Glyph of Sparkles
        170165, --Glyph of Steaming Fury
        166664, --Glyph of Storm's Wake
        170168, --Glyph of the Cold Waves
        170164, --Glyph of the Dark Depths
        166583, --Glyph of the Tides
        104104, --Glyph of the Unbound Elemental
    },
    [9] = { --Warlock
        45789,  --Glyph of Crimson Banish
        151538, --Glyph of Ember Shards
        129018, --Glyph of Fel Imp
        151542, --Glyph of Fel-Touched Shards
        42459,  --Glyph of Felguard
        151540, --Glyph of Floating Shards
        43394,  --Glyph of Soulwell
        137191, --Glyph of the Inquisitor's Eye
        139312, --Glyph of the Observer
        147119, --Glyph of the Shadow Succubus
        139310, --Glyph of the Shivarra
        139311, --Glyph of the Voidlord
        139315, --Glyph of Wrathguard
        147117, --Orb of the Fel Temptress
    },
    [10] = { --Monk
        139338, --Glyph of Crackling Crane Lightning
        129022, --Glyph of Crackling Ox Lightning
        87881,  --Glyph of Crackling Tiger Lightning
        87888,  --Glyph of Fighting Pose
        87883,  --Glyph of Honor
        87885,  --Glyph of Rising Tiger Kick
        139339, --Glyph of Yu'lon's Grace
    },
    [11] = { --Druid
        136826, --Glyph of Autumnal Bloom
        44922,  --Glyph of Stars
        184100, --Glyph of the Aerial Chameleon
        184097, --Glyph of the Aquatic Chameleon
        136825, --Glyph of the Feral Chameleon
        139278, --Glyph of the Forest Path
        118061, --Glyph of the Sun
        184096, --Glyph of the Swift Chameleon
        43334,  --Glyph of the Ursol Chameleon
        143750, --Glyph of Twilight Bloom
        --There is currently no API information regarding marks/form customisations
        --Needs thinking about implementation of the below
        89868,  --Mark of the Cheetah
        140630, --Mark of the Doe
        162022, --Mark of the Dolphin
        162029, --Mark of the Humble Flyer
        40919,  --Mark of the Orca
        129021, --Mark of the Sentinel
        162027, --Mark of the Tideskipper
    },
    [12] = { --Demon Hunter
        129029, --Glyph of Crackling Flames
        139417, --Glyph of Fallow Wings
        129028, --Glyph of Fel Touched Souls
        139435, --Glyph of Fel Wings
        139437, --Glyph of Fel-Enemies
        139362, --Glyph of Mana Touched Souls
        139438, --Glyph of Shadow-Enemies
        139436, --Glyph of Tattered Wings
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