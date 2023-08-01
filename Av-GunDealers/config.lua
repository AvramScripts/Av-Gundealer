Config = {}

Config.Locations = {
    ["GunDealerStore"] = {
        [1] = vector3(363.32, -1650.03, 27.25),
     },
}

-- Ped Spawn


Config.Invincible = true 
Config.Frozen = true 
Config.Stoic = true 
Config.FadeIn = true 
Config.DistanceSpawn = 20.0 
Config.MinusOne = true 
Config.GenderNumbers = { 
	['male'] = 4,
	['female'] = 5
}
Config.PedSpawn = {
	{
		model = `s_m_m_highsec_01`, -- Model name
		coords = vector4(363.32, -1650.03, 27.25, 143), -- Vector
		gender = 'male' -- Male\Female
	},
}


-- Weapons To Config Down Here !


Config.GunDealer = {
    label = "Gun Dealer Store",
    slots = 30,
    items = {
        [1] = {
            name = "weapon_knife",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_switchblade",
            price = 500,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_pistol",
            price = 2500,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_pistol50",
            price = 6000,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_combatpistol",
            price = 4000,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "weapon_microsmg",
            price = 12000,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "weapon_machinepistol",
            price = 9500,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
        [9] = {
            name = "weapon_assaultrifle",
            price = 20000,
            amount = 50,
            info = {},
            type = "item",
            slot = 8,
        },
        [10] = {
            name = "weapon_microsmg2",
            price = 20000,
            amount = 50,
            info = {},
            type = "item",
            slot = 9,
        },
        [11] = {
            name = "weapon_microsmg3",
            price = 20000,
            amount = 50,
            info = {},
            type = "item",
            slot = 10,
        },
        [12] = {
            name = "weapon_compactrifle",
            price = 16000,
            amount = 50,
            info = {},
            type = "item",
            slot = 11,
        },
        [13] = {
            name = "weapon_heavypistol",
            price = 6000,
            amount = 50,
            info = {},
            type = "item",
            slot = 12,
        },
        [14] = {
            name = "uzi_wooden_stock",
            price = 4000,
            amount = 50,
            info = {},
            type = "item",
            slot = 26,
        },
        [15] = {
            name = "pistol_ammo",
            price = 50,
            amount = 1000,
            info = {},
            type = "item",
            slot = 14,
        },
        [16] = {
            name = "rifle_ammo",
            price = 50,
            amount = 1000,
            info = {},
            type = "item",
            slot = 15,
        },
        [17] = {
            name = "smg_ammo",
            price = 50,
            amount = 1000,
            info = {},
            type = "item",
            slot = 16,
        },
        [18] = {
            name = "pistol_suppressor",
            price = 3000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 17,
        },
        [19] = {
            name = "pistol_extendedclip",
            price = 3000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 18,
        },
        [20] = {
            name = "smg_extendedclip",
            price = 3000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 19,
        },
        [21] = {
            name = "smg_flashlight",
            price = 3000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 20,
        },
        [22] = {
            name = "smg_scope",
            price = 3000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 21,
        },
        [23] = {
            name = "uzi_fold_stock",
            price = 3000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 22,
        },
        [24] = {
            name = "rifle_extendedclip",
            price = 3000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 23,
        },
        [25] = {
            name = "rifle_drummag",
            price = 3000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 24,
        },
        [26] = {
            name = "rifle_suppressor",
            price = 3000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 25,
        },
        [27] = {
            name = "weapon_advancedrifle",
            price = 50000,
            amount = 1000,
            info = {},
            type = "item",
            slot = 13,
        },
    }
}
