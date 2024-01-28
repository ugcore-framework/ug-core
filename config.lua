UGConfig            = { }
Config              = UGConfig

UGConfig.Language   = 'en'                    -- Language of your framework (You can create more by copying a file in languages and translating as your own).

UGConfig.Messages   = {
    KickMessage         = "\n\n⛔ You Have Been Kicked From This Server! ⛔\n\n📋 Kick Reason: %s\n👮‍♂️ Kick Author: %s\n\n🔗 Discord: https://discord.gg/\n\n🌐 You have only been kicked. You can try joining again. 🌐",
    BanMessage          = "\n\n⛔ You Have Been Banned From This Server! ⛔\n\n📋 Ban Reason: %s\n👮‍♂️ Ban Author: %s\n⏰ Unban Date: %s/%s/%s - %s:%s\n\n🔗 Discord: https://discord.gg/ \n\n🌐 Ban Appeal & Ban Info in our Discord. 🌐",
    PermBanMessage      = "\n\n⛔ You Have Been Banned From This Server! ⛔\n\n📋 Ban Reason: %s\n👮‍♂️ Ban Author: %s\n⏰ Unban Date: Permanent\n\n🔗 Discord: https://discord.gg/ \n\n🌐 Ban Appeal & Ban Info in our Discord. 🌐",
    MaintenanceMessage  = "\n\n⛔ You connection to this Server was Interrupted! ⛔\n\n📋 Reason: Maintenance\n🚧 Maintenance Starting Date: 26/06/2023 - 02:00\n⏳ Maintenance Ending Date: 27/06/2023 - 02:00\n\n🔗 Discord: https://discord.gg/ \n\n🌐 More Informations in our Discord. 🌐",
    ErrorMessage        = "\n\n⛔ You connection to this Server was Interrupted! ⛔\n\n📋 Reason: %s\n\n🔗 Discord: https://discord.gg/ \n\n🌐 Please, try again. If you're still getting issues, please join our Discord. 🌐",
}

UGConfig.Core       = {
    -- Settings for the paycheck of players. --
    PayCheck = {
        Enabled = true,                     -- Check if you want to enable this or not.
        Society = false,                    -- Payments directly from the job's money (requires ug-society)
        Interval = 30,                      -- Interval during paychecks in minutes
    },

    -- Settings for the characters. --
    Multicharacter = {
        Enabled = false   -- Check if you want to use them multicharacter system (requires ug-multicharacter).
    },

    -- Settings for the inventory system. --
    Inventory = {
        MaxWeight = 25                      -- Max weight of the player inventory without backpacks.
    },

    -- Settings for debugging (in case UgDev Support Team asked). --
    Debug = {
        Enabled = false,                    -- Check if you want to enable.
    },

    -- Settings for the vehicle plates of the vehicles. --
    Plates = {
        CustomPlate = '........'            -- Custom plate for vehicles (Use the placeholders below) (Max. 8 characters)
        
        --------------------------------------
        --           Placeholders:          --
        --------------------------------------
        -- 1    - Random number from 0-9.   --
        -- A    - Random letter from A-Z.   --
        -- .    - Random letter or number.  --
        -- ^1   - Literal 1 being emitted.  --
        -- ^A   - Literal A being emitted.  --
        --------------------------------------
    },

    -- Settings for the discord logs. --
    Logs = {
        -- Chat Messages. --
        Chat = {
            Enabled = true,                 -- Enable / Disable the log.
            Webhook = 'https://discord.com/api/webhooks/1198628599016738906/suRUWheb-E6W6s7bZ_GhTkFeLlqKsB47ft_lqj2I1MMKmj7Pp__5Ct3HO3b1DAmZbwIc'                    -- Webhook URL.
        },

        -- Resources States. --
        Resources = {
            Enabled = true,                 -- Enable / Disable the log.
            Webhook = 'https://discord.com/api/webhooks/1198628599016738906/suRUWheb-E6W6s7bZ_GhTkFeLlqKsB47ft_lqj2I1MMKmj7Pp__5Ct3HO3b1DAmZbwIc'                    -- Webhook URL.
        },

        -- User Actions. --
        Users = {
            Enabled = true,                 -- Enable / Disable the log.
            Webhook = 'https://discord.com/api/webhooks/1198628599016738906/suRUWheb-E6W6s7bZ_GhTkFeLlqKsB47ft_lqj2I1MMKmj7Pp__5Ct3HO3b1DAmZbwIc'                    -- Webhook URL.
        },

        -- Employee Payments. --
        PayCheck = {
            Enabled = true,                 -- Enable / Disable the log.
            Webhook = 'https://discord.com/api/webhooks/1198628599016738906/suRUWheb-E6W6s7bZ_GhTkFeLlqKsB47ft_lqj2I1MMKmj7Pp__5Ct3HO3b1DAmZbwIc'                    -- Webhook URL.
        },

		-- Admin Logs. --
		Admins = {
			Enabled = true,					-- Enable / Disable the log.
			Webhook = 'https://discord.com/api/webhooks/1198628599016738906/suRUWheb-E6W6s7bZ_GhTkFeLlqKsB47ft_lqj2I1MMKmj7Pp__5Ct3HO3b1DAmZbwIc',					-- Webhook URL.
		},

        -- You can add more colors and use them with the log function --
        --      by using this website: https://www.spycolor.com/      --
        Colors = { 
            default = 14423100,             
            blue = 255,                     
            red = 16711680,                 
            green = 65280,                  
            white = 16777215,               
            black = 0,                      
            orange = 16744192,              
            yellow = 16776960,              
            pink = 16761035,                
            lightgreen = 65309              
        }
    },

    -- Settings for other things. --
    Others = {
        WantedLevel = false,                -- Check if you want to enable wanted levels.
        PVP = true,                         -- Check if you want to enable PVP in the server. 
        PlayerDistance = 4.0,               -- Distance to interact with other players.
        Flags = {
            HealthRegeneration = true,      -- Regenerating health system by GTA.
            VehicleRewards = false,         -- Receiving weapons from vehicles (such as police vehicles).
            NPCDrops = false,               -- NPC's dropping weapons when dead.
            AimAssist = false,				-- Controller aim assist.
			DispatchServices = false,       -- Police radio events.
            Scenarios = true,               -- NPC's scenarios
            WeaponWheel = false,             -- Wheel from the weapon list.
            VehicleSeat = false,            -- Change vehicle seat (example: passager to driver).
            DisplayAmmo = false,             -- Displaying ammo count of the weapon. 
        },
        HUDComponents = {   -- Enabling / Disabling HUD components. --
			[1] = false,    		-- WANTED_STARS,
			[2] = false,    		-- WEAPON_ICON
			[3] = false,    		-- CASH
			[4] = false,    		-- MP_CASH
			[5] = false,    		-- MP_MESSAGE
			[6] = false,    		-- VEHICLE_NAME
			[7] = false,    		-- AREA_NAME
			[8] = false,    		-- VEHICLE_CLASS
			[9] = false,    		-- STREET_NAME
			[10] = false,   		-- HELP_TEXT
			[11] = false,   		-- FLOATING_HELP_TEXT_1
			[12] = false,   		-- FLOATING_HELP_TEXT_2
			[13] = false,   		-- CASH_CHANGE
			[15] = false,   		-- SUBTITLE_TEXT
			[16] = false,   		-- RADIO_STATIONS
			[17] = false,   		-- SAVING_GAME,
			[18] = false,   		-- GAME_STREAM
			[19] = false,   		-- WEAPON_WHEEL
			[20] = false,   		-- WEAPON_WHEEL_STATS
			[21] = false,   		-- HUD_COMPONENTS
			[22] = false,   		-- HUD_WEAPONS
        }
    }
}

-- Admin Groups. --
UGConfig.Groups = {
    Admins = {
        ['owner'] = true,
        ['admin'] = true,
        ['moderator'] = true
    }
}

-- Default spawn for first time joining the server. --
UGConfig.DefaultSpawns = {
    { x = 222.2027, y = -864.0162, z = 30.2922, h = 1.0 }
}

-- Money accounts. --
UGConfig.Money = {
    cash = {
        Name = 'Cash',
        StartingAmount = 5000,
        RoundNumbers = true
    },

    bank = {
        Name = 'Bank',
        StartingAmount = 10000,
        RoundNumbers = true
    },

    blackmoney = {
        Name = 'Black Money',
        StartingAmount = 0,
        RoundNumbers = true
    }
}

-- Weapons in the server. --
UGConfig.Weapons    = {
    DefaultTints = {
        [0] = Languages.GetTranslation('tint_default'),
	    [1] = Languages.GetTranslation('tint_green'),
	    [2] = Languages.GetTranslation('tint_gold'),
	    [3] = Languages.GetTranslation('tint_pink'),
	    [4] = Languages.GetTranslation('tint_army'),
	    [5] = Languages.GetTranslation('tint_lspd'),
	    [6] = Languages.GetTranslation('tint_orange'),
	    [7] = Languages.GetTranslation('tint_platinum')
    },

    Weapons = {
		-- Melee
		{ name = 'WEAPON_DAGGER',    label = Languages.GetTranslation('weapon_dagger'),    components = {} },
		{ name = 'WEAPON_BAT',       label = Languages.GetTranslation('weapon_bat'),       components = {} },
		{ name = 'WEAPON_BATTLEAXE', label = Languages.GetTranslation('weapon_battleaxe'), components = {} },
		{
			name = 'WEAPON_KNUCKLE',
			label = Languages.GetTranslation('weapon_knuckle'),
			components = {
				{ name = 'knuckle_base',    label = Languages.GetTranslation('component_knuckle_base'),    hash = `COMPONENT_KNUCKLE_VARMOD_BASE` },
				{ name = 'knuckle_pimp',    label = Languages.GetTranslation('component_knuckle_pimp'),    hash = `COMPONENT_KNUCKLE_VARMOD_PIMP` },
				{ name = 'knuckle_ballas',  label = Languages.GetTranslation('component_knuckle_ballas'),  hash = `COMPONENT_KNUCKLE_VARMOD_BALLAS` },
				{ name = 'knuckle_dollar',  label = Languages.GetTranslation('component_knuckle_dollar'),  hash = `COMPONENT_KNUCKLE_VARMOD_DOLLAR` },
				{ name = 'knuckle_diamond', label = Languages.GetTranslation('component_knuckle_diamond'), hash = `COMPONENT_KNUCKLE_VARMOD_DIAMOND` },
				{ name = 'knuckle_hate',    label = Languages.GetTranslation('component_knuckle_hate'),    hash = `COMPONENT_KNUCKLE_VARMOD_HATE` },
				{ name = 'knuckle_love',    label = Languages.GetTranslation('component_knuckle_love'),    hash = `COMPONENT_KNUCKLE_VARMOD_LOVE` },
				{ name = 'knuckle_player',  label = Languages.GetTranslation('component_knuckle_player'),  hash = `COMPONENT_KNUCKLE_VARMOD_PLAYER` },
				{ name = 'knuckle_king',    label = Languages.GetTranslation('component_knuckle_king'),    hash = `COMPONENT_KNUCKLE_VARMOD_KING` },
				{ name = 'knuckle_vagos',   label = Languages.GetTranslation('component_knuckle_vagos'),   hash = `COMPONENT_KNUCKLE_VARMOD_VAGOS` }
			}
		},
		{ name = 'WEAPON_BOTTLE',        label = Languages.GetTranslation('weapon_bottle'),        components = {} },
		{ name = 'WEAPON_CROWBAR',       label = Languages.GetTranslation('weapon_crowbar'),       components = {} },
		{ name = 'WEAPON_FLASHLIGHT',    label = Languages.GetTranslation('weapon_flashlight'),    components = {} },
		{ name = 'WEAPON_GOLFCLUB',      label = Languages.GetTranslation('weapon_golfclub'),      components = {} },
		{ name = 'WEAPON_HAMMER',        label = Languages.GetTranslation('weapon_hammer'),        components = {} },
		{ name = 'WEAPON_HATCHET',       label = Languages.GetTranslation('weapon_hatchet'),       components = {} },
		{ name = 'WEAPON_KNIFE',         label = Languages.GetTranslation('weapon_knife'),         components = {} },
		{ name = 'WEAPON_MACHETE',       label = Languages.GetTranslation('weapon_machete'),       components = {} },
		{ name = 'WEAPON_NIGHTSTICK',    label = Languages.GetTranslation('weapon_nightstick'),    components = {} },
		{ name = 'WEAPON_WRENCH',        label = Languages.GetTranslation('weapon_wrench'),        components = {} },
		{ name = 'WEAPON_POOLCUE',       label = Languages.GetTranslation('weapon_poolcue'),       components = {} },
		{ name = 'WEAPON_STONE_HATCHET', label = Languages.GetTranslation('weapon_stone_hatchet'), components = {} },
		{
			name = 'WEAPON_SWITCHBLADE',
			label = Languages.GetTranslation('weapon_switchblade'),
			components = {
				{ name = 'handle_default',   label = Languages.GetTranslation('component_handle_default'),   hash = `COMPONENT_SWITCHBLADE_VARMOD_BASE` },
				{ name = 'handle_vip',       label = Languages.GetTranslation('component_handle_vip'),       hash = `COMPONENT_SWITCHBLADE_VARMOD_VAR1` },
				{ name = 'handle_bodyguard', label = Languages.GetTranslation('component_handle_bodyguard'), hash = `COMPONENT_SWITCHBLADE_VARMOD_VAR2` }
			}
		},
		-- Handguns
		{
			name = 'WEAPON_APPISTOL',
			label = Languages.GetTranslation('weapon_appistol'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_APPISTOL_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_APPISTOL_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_PI_FLSH` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_PI_SUPP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_APPISTOL_VARMOD_LUXE` }
			}
		},
		{ name = 'WEAPON_CERAMICPISTOL', label = Languages.GetTranslation('weapon_ceramicpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` } },
		{
			name = 'WEAPON_COMBATPISTOL',
			label = Languages.GetTranslation('weapon_combatpistol'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_COMBATPISTOL_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_COMBATPISTOL_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_PI_FLSH` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_PI_SUPP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER` }
			}
		},
		{ name = 'WEAPON_DOUBLEACTION',  label = Languages.GetTranslation('weapon_doubleaction'),  tints = Config.DefaultWeaponTints, components = {}, ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` } },
		{ name = 'WEAPON_NAVYREVOLVER',  label = Languages.GetTranslation('weapon_navyrevolver'),  tints = Config.DefaultWeaponTints, components = {}, ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` } },
		{ name = 'WEAPON_FLAREGUN',      label = Languages.GetTranslation('weapon_flaregun'),      tints = Config.DefaultWeaponTints, components = {}, ammo = { label = Languages.GetTranslation('ammo_flaregun'), hash = `AMMO_FLAREGUN` } },
		{ name = 'WEAPON_GADGETPISTOL',  label = Languages.GetTranslation('weapon_gadgetpistol'),  tints = Config.DefaultWeaponTints, components = {}, ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` } },
		{
			name = 'WEAPON_HEAVYPISTOL',
			label = Languages.GetTranslation('weapon_heavypistol'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_HEAVYPISTOL_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_HEAVYPISTOL_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_PI_FLSH` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_PI_SUPP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_HEAVYPISTOL_VARMOD_LUXE` }
			}
		},
		{
			name = 'WEAPON_REVOLVER',
			label = Languages.GetTranslation('weapon_revolver'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',     label = Languages.GetTranslation('component_clip_default'),     hash = `COMPONENT_REVOLVER_CLIP_01` },
				{ name = 'vip_finish',       label = Languages.GetTranslation('component_vip_finish'),       hash = `COMPONENT_REVOLVER_VARMOD_BOSS` },
				{ name = 'bodyguard_finish', label = Languages.GetTranslation('component_bodyguard_finish'), hash = `COMPONENT_REVOLVER_VARMOD_GOON` }
			}
		},
		{
			name = 'WEAPON_REVOLVER_MK2',
			label = Languages.GetTranslation('weapon_revolver_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',     label = Languages.GetTranslation('component_clip_default'),     hash = `COMPONENT_REVOLVER_MK2_CLIP_01` },
				{ name = 'ammo_tracer',      label = Languages.GetTranslation('component_ammo_tracer'),      hash = `COMPONENT_REVOLVER_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',  label = Languages.GetTranslation('component_ammo_incendiary'),  hash = `COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_hollowpoint', label = Languages.GetTranslation('component_ammo_hollowpoint'), hash = `COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT` },
				{ name = 'ammo_fmj',         label = Languages.GetTranslation('component_ammo_fmj'),         hash = `COMPONENT_REVOLVER_MK2_CLIP_FMJ` },
				{ name = 'scope_holo',       label = Languages.GetTranslation('component_scope_holo'),       hash = `COMPONENT_AT_SIGHTS` },
				{ name = 'scope_small',      label = Languages.GetTranslation('component_ammo_fmj'),         hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
				{ name = 'flashlight',       label = Languages.GetTranslation('component_flashlight'),       hash = `COMPONENT_AT_PI_FLSH` },
				{ name = 'compensator',      label = Languages.GetTranslation('component_compensator'),      hash = `COMPONENT_AT_PI_COMP_03` },
				{ name = 'camo_finish',      label = Languages.GetTranslation('component_camo_finish'),      hash = `COMPONENT_REVOLVER_MK2_CAMO` },
				{ name = 'camo_finish2',     label = Languages.GetTranslation('component_camo_finish2'),     hash = `COMPONENT_REVOLVER_MK2_CAMO_02` },
				{ name = 'camo_finish3',     label = Languages.GetTranslation('component_camo_finish3'),     hash = `COMPONENT_REVOLVER_MK2_CAMO_03` },
				{ name = 'camo_finish4',     label = Languages.GetTranslation('component_camo_finish4'),     hash = `COMPONENT_REVOLVER_MK2_CAMO_04` },
				{ name = 'camo_finish5',     label = Languages.GetTranslation('component_camo_finish5'),     hash = `COMPONENT_REVOLVER_MK2_CAMO_05` },
				{ name = 'camo_finish6',     label = Languages.GetTranslation('component_camo_finish6'),     hash = `COMPONENT_REVOLVER_MK2_CAMO_06` },
				{ name = 'camo_finish7',     label = Languages.GetTranslation('component_camo_finish7'),     hash = `COMPONENT_REVOLVER_MK2_CAMO_07` },
				{ name = 'camo_finish8',     label = Languages.GetTranslation('component_camo_finish8'),     hash = `COMPONENT_REVOLVER_MK2_CAMO_08` },
				{ name = 'camo_finish9',     label = Languages.GetTranslation('component_camo_finish9'),     hash = `COMPONENT_REVOLVER_MK2_CAMO_09` },
				{ name = 'camo_finish10',    label = Languages.GetTranslation('component_camo_finish10'),    hash = `COMPONENT_REVOLVER_MK2_CAMO_10` },
				{ name = 'camo_finish11',    label = Languages.GetTranslation('component_camo_finish11'),    hash = `COMPONENT_REVOLVER_MK2_CAMO_IND_01` }
			}
		},
		{ name = 'WEAPON_MARKSMANPISTOL', label = Languages.GetTranslation('weapon_marksmanpistol'), tints = Config.DefaultWeaponTints, components = {}, ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` } },
		{
			name = 'WEAPON_PISTOL',
			label = Languages.GetTranslation('weapon_pistol'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_PISTOL_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_PISTOL_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_PI_FLSH` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_PI_SUPP_02` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_PISTOL_VARMOD_LUXE` }
			}
		},
		{
			name = 'WEAPON_PISTOL_MK2',
			label = Languages.GetTranslation('weapon_pistol_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',        label = Languages.GetTranslation('component_clip_default'),        hash = `COMPONENT_PISTOL_MK2_CLIP_01` },
				{ name = 'clip_extended',       label = Languages.GetTranslation('component_clip_extended'),       hash = `COMPONENT_PISTOL_MK2_CLIP_02` },
				{ name = 'ammo_tracer',         label = Languages.GetTranslation('component_ammo_tracer'),         hash = `COMPONENT_PISTOL_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',     label = Languages.GetTranslation('component_ammo_incendiary'),     hash = `COMPONENT_PISTOL_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_hollowpoint',    label = Languages.GetTranslation('component_ammo_hollowpoint'),    hash = `COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT` },
				{ name = 'ammo_fmj',            label = Languages.GetTranslation('component_ammo_fmj'),            hash = `COMPONENT_PISTOL_MK2_CLIP_FMJ` },
				{ name = 'scope',               label = Languages.GetTranslation('component_scope'),               hash = `COMPONENT_AT_PI_RAIL` },
				{ name = 'flashlight',          label = Languages.GetTranslation('component_flashlight'),          hash = `COMPONENT_AT_PI_FLSH_02` },
				{ name = 'suppressor',          label = Languages.GetTranslation('component_suppressor'),          hash = `COMPONENT_AT_PI_SUPP_02` },
				{ name = 'compensator',         label = Languages.GetTranslation('component_suppressor'),          hash = `COMPONENT_AT_PI_COMP` },
				{ name = 'camo_finish',         label = Languages.GetTranslation('component_camo_finish'),         hash = `COMPONENT_PISTOL_MK2_CAMO` },
				{ name = 'camo_finish2',        label = Languages.GetTranslation('component_camo_finish2'),        hash = `COMPONENT_PISTOL_MK2_CAMO_02` },
				{ name = 'camo_finish3',        label = Languages.GetTranslation('component_camo_finish3'),        hash = `COMPONENT_PISTOL_MK2_CAMO_03` },
				{ name = 'camo_finish4',        label = Languages.GetTranslation('component_camo_finish4'),        hash = `COMPONENT_PISTOL_MK2_CAMO_04` },
				{ name = 'camo_finish5',        label = Languages.GetTranslation('component_camo_finish5'),        hash = `COMPONENT_PISTOL_MK2_CAMO_05` },
				{ name = 'camo_finish6',        label = Languages.GetTranslation('component_camo_finish6'),        hash = `COMPONENT_PISTOL_MK2_CAMO_06` },
				{ name = 'camo_finish7',        label = Languages.GetTranslation('component_camo_finish7'),        hash = `COMPONENT_PISTOL_MK2_CAMO_07` },
				{ name = 'camo_finish8',        label = Languages.GetTranslation('component_camo_finish8'),        hash = `COMPONENT_PISTOL_MK2_CAMO_08` },
				{ name = 'camo_finish9',        label = Languages.GetTranslation('component_camo_finish9'),        hash = `COMPONENT_PISTOL_MK2_CAMO_09` },
				{ name = 'camo_finish10',       label = Languages.GetTranslation('component_camo_finish10'),       hash = `COMPONENT_PISTOL_MK2_CAMO_10` },
				{ name = 'camo_finish11',       label = Languages.GetTranslation('component_camo_finish11'),       hash = `COMPONENT_PISTOL_MK2_CAMO_IND_01` },
				{ name = 'camo_slide_finish',   label = Languages.GetTranslation('component_camo_slide_finish'),   hash = `COMPONENT_PISTOL_MK2_CAMO_SLIDE` },
				{ name = 'camo_slide_finish2',  label = Languages.GetTranslation('component_camo_slide_finish2'),  hash = `COMPONENT_PISTOL_MK2_CAMO_02_SLIDE` },
				{ name = 'camo_slide_finish3',  label = Languages.GetTranslation('component_camo_slide_finish3'),  hash = `COMPONENT_PISTOL_MK2_CAMO_03_SLIDE` },
				{ name = 'camo_slide_finish4',  label = Languages.GetTranslation('component_camo_slide_finish4'),  hash = `COMPONENT_PISTOL_MK2_CAMO_04_SLIDE` },
				{ name = 'camo_slide_finish5',  label = Languages.GetTranslation('component_camo_slide_finish5'),  hash = `COMPONENT_PISTOL_MK2_CAMO_05_SLIDE` },
				{ name = 'camo_slide_finish6',  label = Languages.GetTranslation('component_camo_slide_finish6'),  hash = `COMPONENT_PISTOL_MK2_CAMO_06_SLIDE` },
				{ name = 'camo_slide_finish7',  label = Languages.GetTranslation('component_camo_slide_finish7'),  hash = `COMPONENT_PISTOL_MK2_CAMO_07_SLIDE` },
				{ name = 'camo_slide_finish8',  label = Languages.GetTranslation('component_camo_slide_finish8'),  hash = `COMPONENT_PISTOL_MK2_CAMO_08_SLIDE` },
				{ name = 'camo_slide_finish9',  label = Languages.GetTranslation('component_camo_slide_finish9'),  hash = `COMPONENT_PISTOL_MK2_CAMO_09_SLIDE` },
				{ name = 'camo_slide_finish10', label = Languages.GetTranslation('component_camo_slide_finish10'), hash = `COMPONENT_PISTOL_MK2_CAMO_10_SLIDE` },
				{ name = 'camo_slide_finish11', label = Languages.GetTranslation('component_camo_slide_finish11'), hash = `COMPONENT_PISTOL_MK2_CAMO_IND_01_SLIDE` }
			}
		},
		{
			name = 'WEAPON_PISTOL50',
			label = Languages.GetTranslation('weapon_pistol50'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_PISTOL50_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_PISTOL50_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_PI_FLSH` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_PISTOL50_VARMOD_LUXE` }
			}
		},
		{
			name = 'WEAPON_SNSPISTOL',
			label = Languages.GetTranslation('weapon_snspistol'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_SNSPISTOL_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_SNSPISTOL_CLIP_02` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_SNSPISTOL_VARMOD_LOWRIDER` }
			}
		},
		{
			name = 'WEAPON_SNSPISTOL_MK2',
			label = Languages.GetTranslation('weapon_snspistol_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',        label = Languages.GetTranslation('component_clip_default'),        hash = `COMPONENT_SNSPISTOL_MK2_CLIP_01` },
				{ name = 'clip_extended',       label = Languages.GetTranslation('component_clip_extended'),       hash = `COMPONENT_SNSPISTOL_MK2_CLIP_02` },
				{ name = 'ammo_tracer',         label = Languages.GetTranslation('component_ammo_tracer'),         hash = `COMPONENT_SNSPISTOL_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',     label = Languages.GetTranslation('component_ammo_incendiary'),     hash = `COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_hollowpoint',    label = Languages.GetTranslation('component_ammo_hollowpoint'),    hash = `COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT` },
				{ name = 'ammo_fmj',            label = Languages.GetTranslation('component_ammo_fmj'),            hash = `COMPONENT_SNSPISTOL_MK2_CLIP_FMJ` },
				{ name = 'scope',               label = Languages.GetTranslation('component_scope'),               hash = `COMPONENT_AT_PI_RAIL_02` },
				{ name = 'flashlight',          label = Languages.GetTranslation('component_flashlight'),          hash = `COMPONENT_AT_PI_FLSH_03` },
				{ name = 'suppressor',          label = Languages.GetTranslation('component_suppressor'),          hash = `COMPONENT_AT_PI_SUPP_02` },
				{ name = 'compensator',         label = Languages.GetTranslation('component_suppressor'),          hash = `COMPONENT_AT_PI_COMP_02` },
				{ name = 'camo_finish',         label = Languages.GetTranslation('component_camo_finish'),         hash = `COMPONENT_SNSPISTOL_MK2_CAMO` },
				{ name = 'camo_finish2',        label = Languages.GetTranslation('component_camo_finish2'),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_02` },
				{ name = 'camo_finish3',        label = Languages.GetTranslation('component_camo_finish3'),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_03` },
				{ name = 'camo_finish4',        label = Languages.GetTranslation('component_camo_finish4'),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_04` },
				{ name = 'camo_finish5',        label = Languages.GetTranslation('component_camo_finish5'),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_05` },
				{ name = 'camo_finish6',        label = Languages.GetTranslation('component_camo_finish6'),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_06` },
				{ name = 'camo_finish7',        label = Languages.GetTranslation('component_camo_finish7'),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_07` },
				{ name = 'camo_finish8',        label = Languages.GetTranslation('component_camo_finish8'),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_08` },
				{ name = 'camo_finish9',        label = Languages.GetTranslation('component_camo_finish9'),        hash = `COMPONENT_SNSPISTOL_MK2_CAMO_09` },
				{ name = 'camo_finish10',       label = Languages.GetTranslation('component_camo_finish10'),       hash = `COMPONENT_SNSPISTOL_MK2_CAMO_10` },
				{ name = 'camo_finish11',       label = Languages.GetTranslation('component_camo_finish11'),       hash = `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01` },
				{ name = 'camo_slide_finish',   label = Languages.GetTranslation('component_camo_slide_finish'),   hash = `COMPONENT_SNSPISTOL_MK2_CAMO_SLIDE` },
				{ name = 'camo_slide_finish2',  label = Languages.GetTranslation('component_camo_slide_finish2'),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_02_SLIDE` },
				{ name = 'camo_slide_finish3',  label = Languages.GetTranslation('component_camo_slide_finish3'),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_03_SLIDE` },
				{ name = 'camo_slide_finish4',  label = Languages.GetTranslation('component_camo_slide_finish4'),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_04_SLIDE` },
				{ name = 'camo_slide_finish5',  label = Languages.GetTranslation('component_camo_slide_finish5'),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_05_SLIDE` },
				{ name = 'camo_slide_finish6',  label = Languages.GetTranslation('component_camo_slide_finish6'),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_06_SLIDE` },
				{ name = 'camo_slide_finish7',  label = Languages.GetTranslation('component_camo_slide_finish7'),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_07_SLIDE` },
				{ name = 'camo_slide_finish8',  label = Languages.GetTranslation('component_camo_slide_finish8'),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_08_SLIDE` },
				{ name = 'camo_slide_finish9',  label = Languages.GetTranslation('component_camo_slide_finish9'),  hash = `COMPONENT_SNSPISTOL_MK2_CAMO_09_SLIDE` },
				{ name = 'camo_slide_finish10', label = Languages.GetTranslation('component_camo_slide_finish10'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_10_SLIDE` },
				{ name = 'camo_slide_finish11', label = Languages.GetTranslation('component_camo_slide_finish11'), hash = `COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE` }
			}
		},
		{ name = 'WEAPON_STUNGUN',        label = Languages.GetTranslation('weapon_stungun'),        tints = Config.DefaultWeaponTints, components = {} },
		{ name = 'WEAPON_RAYPISTOL',      label = Languages.GetTranslation('weapon_raypistol'),      tints = Config.DefaultWeaponTints, components = {} },
		{
			name = 'WEAPON_VINTAGEPISTOL',
			label = Languages.GetTranslation('weapon_vintagepistol'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_VINTAGEPISTOL_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_VINTAGEPISTOL_CLIP_02` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_PI_SUPP` }
			}
		},
		-- Shotguns
		{
			name = 'WEAPON_ASSAULTSHOTGUN',
			label = Languages.GetTranslation('weapon_assaultshotgun'),
			ammo = { label = Languages.GetTranslation('ammo_shells'), hash = `AMMO_SHOTGUN` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_ASSAULTSHOTGUN_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_ASSAULTSHOTGUN_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` }
			}
		},
		{ name = 'WEAPON_AUTOSHOTGUN', label = Languages.GetTranslation('weapon_autoshotgun'), tints = Config.DefaultWeaponTints, components = {}, ammo = { label = Languages.GetTranslation('ammo_shells'), hash = `AMMO_SHOTGUN` } },
		{
			name = 'WEAPON_BULLPUPSHOTGUN',
			label = Languages.GetTranslation('weapon_bullpupshotgun'),
			ammo = { label = Languages.GetTranslation('ammo_shells'), hash = `AMMO_SHOTGUN` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'flashlight', label = Languages.GetTranslation('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'suppressor', label = Languages.GetTranslation('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'grip',       label = Languages.GetTranslation('component_grip'),       hash = `COMPONENT_AT_AR_AFGRIP` }
			}
		},
		{
			name = 'WEAPON_COMBATSHOTGUN',
			label = Languages.GetTranslation('weapon_combatshotgun'),
			ammo = { label = Languages.GetTranslation('ammo_shells'), hash = `AMMO_SHOTGUN` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'flashlight', label = Languages.GetTranslation('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'suppressor', label = Languages.GetTranslation('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP` }
			}
		},
		{ name = 'WEAPON_DBSHOTGUN',   label = Languages.GetTranslation('weapon_dbshotgun'),   tints = Config.DefaultWeaponTints, components = {}, ammo = { label = Languages.GetTranslation('ammo_shells'), hash = `AMMO_SHOTGUN` } },
		{
			name = 'WEAPON_HEAVYSHOTGUN',
			label = Languages.GetTranslation('weapon_heavyshotgun'),
			ammo = { label = Languages.GetTranslation('ammo_shells'), hash = `AMMO_SHOTGUN` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_HEAVYSHOTGUN_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_HEAVYSHOTGUN_CLIP_02` },
				{ name = 'clip_drum',     label = Languages.GetTranslation('component_clip_drum'),     hash = `COMPONENT_HEAVYSHOTGUN_CLIP_03` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` }
			}
		},
		{ name = 'WEAPON_MUSKET',     label = Languages.GetTranslation('weapon_musket'),     tints = Config.DefaultWeaponTints,                                 components = {},                   ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SHOTGUN` } },
		{
			name = 'WEAPON_PUMPSHOTGUN',
			label = Languages.GetTranslation('weapon_pumpshotgun'),
			ammo = { label = Languages.GetTranslation('ammo_shells'), hash = `AMMO_SHOTGUN` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_SR_SUPP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER` }
			}
		},
		{
			name = 'WEAPON_PUMPSHOTGUN_MK2',
			label = Languages.GetTranslation('weapon_pumpshotgun_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_shells'), hash = `AMMO_SHOTGUN` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'shells_default',     label = Languages.GetTranslation('component_shells_default'),     hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_01` },
				{ name = 'shells_incendiary',  label = Languages.GetTranslation('component_shells_incendiary'),  hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY` },
				{ name = 'shells_armor',       label = Languages.GetTranslation('component_shells_armor'),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING` },
				{ name = 'shells_hollowpoint', label = Languages.GetTranslation('component_shells_hollowpoint'), hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT` },
				{ name = 'shells_explosive',   label = Languages.GetTranslation('component_shells_explosive'),   hash = `COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE` },
				{ name = 'scope_holo',         label = Languages.GetTranslation('component_scope_holo'),         hash = `COMPONENT_AT_SIGHTS` },
				{ name = 'scope_small',        label = Languages.GetTranslation('component_scope_small'),        hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
				{ name = 'scope_medium',       label = Languages.GetTranslation('component_scope_medium'),       hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },
				{ name = 'flashlight',         label = Languages.GetTranslation('component_flashlight'),         hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'suppressor',         label = Languages.GetTranslation('component_suppressor'),         hash = `COMPONENT_AT_SR_SUPP_03` },
				{ name = 'muzzle_squared',     label = Languages.GetTranslation('component_muzzle_squared'),     hash = `COMPONENT_AT_MUZZLE_08` },
				{ name = 'camo_finish',        label = Languages.GetTranslation('component_camo_finish'),        hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO` },
				{ name = 'camo_finish2',       label = Languages.GetTranslation('component_camo_finish2'),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_02` },
				{ name = 'camo_finish3',       label = Languages.GetTranslation('component_camo_finish3'),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_03` },
				{ name = 'camo_finish4',       label = Languages.GetTranslation('component_camo_finish4'),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_04` },
				{ name = 'camo_finish5',       label = Languages.GetTranslation('component_camo_finish5'),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_05` },
				{ name = 'camo_finish6',       label = Languages.GetTranslation('component_camo_finish6'),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_06` },
				{ name = 'camo_finish7',       label = Languages.GetTranslation('component_camo_finish7'),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_07` },
				{ name = 'camo_finish8',       label = Languages.GetTranslation('component_camo_finish8'),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_08` },
				{ name = 'camo_finish9',       label = Languages.GetTranslation('component_camo_finish9'),       hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_09` },
				{ name = 'camo_finish10',      label = Languages.GetTranslation('component_camo_finish10'),      hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_10` },
				{ name = 'camo_finish11',      label = Languages.GetTranslation('component_camo_finish11'),      hash = `COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01` }
			}
		},
		{
			name = 'WEAPON_SAWNOFFSHOTGUN',
			label = Languages.GetTranslation('weapon_sawnoffshotgun'),
			ammo = { label = Languages.GetTranslation('ammo_shells'), hash = `AMMO_SHOTGUN` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE` }
			}
		},
		-- SMG & LMG
		{
			name = 'WEAPON_ASSAULTSMG',
			label = Languages.GetTranslation('weapon_assaultsmg'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SMG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_ASSAULTSMG_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_ASSAULTSMG_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_MACRO` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER` }
			}
		},
		{
			name = 'WEAPON_COMBATMG',
			label = Languages.GetTranslation('weapon_combatmg'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_MG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_COMBATMG_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_COMBATMG_CLIP_02` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_MEDIUM` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_COMBATMG_VARMOD_LOWRIDER` }
			}
		},
		{
			name = 'WEAPON_COMBATMG_MK2',
			label = Languages.GetTranslation('weapon_combatmg_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_MG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',     label = Languages.GetTranslation('component_clip_default'),     hash = `COMPONENT_COMBATMG_MK2_CLIP_01` },
				{ name = 'clip_extended',    label = Languages.GetTranslation('component_clip_extended'),    hash = `COMPONENT_COMBATMG_MK2_CLIP_02` },
				{ name = 'ammo_tracer',      label = Languages.GetTranslation('component_ammo_tracer'),      hash = `COMPONENT_COMBATMG_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',  label = Languages.GetTranslation('component_ammo_incendiary'),  hash = `COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_hollowpoint', label = Languages.GetTranslation('component_ammo_hollowpoint'), hash = `COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING` },
				{ name = 'ammo_fmj',         label = Languages.GetTranslation('component_ammo_fmj'),         hash = `COMPONENT_COMBATMG_MK2_CLIP_FMJ` },
				{ name = 'grip',             label = Languages.GetTranslation('component_grip'),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
				{ name = 'scope_holo',       label = Languages.GetTranslation('component_scope_holo'),       hash = `COMPONENT_AT_SIGHTS` },
				{ name = 'scope_medium',     label = Languages.GetTranslation('component_scope_medium'),     hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },
				{ name = 'scope_large',      label = Languages.GetTranslation('component_scope_large'),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
				{ name = 'muzzle_flat',      label = Languages.GetTranslation('component_muzzle_flat'),      hash = `COMPONENT_AT_MUZZLE_01` },
				{ name = 'muzzle_tactical',  label = Languages.GetTranslation('component_muzzle_tactical'),  hash = `COMPONENT_AT_MUZZLE_02` },
				{ name = 'muzzle_fat',       label = Languages.GetTranslation('component_muzzle_fat'),       hash = `COMPONENT_AT_MUZZLE_03` },
				{ name = 'muzzle_precision', label = Languages.GetTranslation('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
				{ name = 'muzzle_heavy',     label = Languages.GetTranslation('component_muzzle_heavy'),     hash = `COMPONENT_AT_MUZZLE_05` },
				{ name = 'muzzle_slanted',   label = Languages.GetTranslation('component_muzzle_slanted'),   hash = `COMPONENT_AT_MUZZLE_06` },
				{ name = 'muzzle_split',     label = Languages.GetTranslation('component_muzzle_split'),     hash = `COMPONENT_AT_MUZZLE_07` },
				{ name = 'barrel_default',   label = Languages.GetTranslation('component_barrel_default'),   hash = `COMPONENT_AT_MG_BARREL_01` },
				{ name = 'barrel_heavy',     label = Languages.GetTranslation('component_barrel_heavy'),     hash = `COMPONENT_AT_MG_BARREL_02` },
				{ name = 'camo_finish',      label = Languages.GetTranslation('component_camo_finish'),      hash = `COMPONENT_COMBATMG_MK2_CAMO` },
				{ name = 'camo_finish2',     label = Languages.GetTranslation('component_camo_finish2'),     hash = `COMPONENT_COMBATMG_MK2_CAMO_02` },
				{ name = 'camo_finish3',     label = Languages.GetTranslation('component_camo_finish3'),     hash = `COMPONENT_COMBATMG_MK2_CAMO_03` },
				{ name = 'camo_finish4',     label = Languages.GetTranslation('component_camo_finish4'),     hash = `COMPONENT_COMBATMG_MK2_CAMO_04` },
				{ name = 'camo_finish5',     label = Languages.GetTranslation('component_camo_finish5'),     hash = `COMPONENT_COMBATMG_MK2_CAMO_05` },
				{ name = 'camo_finish6',     label = Languages.GetTranslation('component_camo_finish6'),     hash = `COMPONENT_COMBATMG_MK2_CAMO_06` },
				{ name = 'camo_finish7',     label = Languages.GetTranslation('component_camo_finish7'),     hash = `COMPONENT_COMBATMG_MK2_CAMO_07` },
				{ name = 'camo_finish8',     label = Languages.GetTranslation('component_camo_finish8'),     hash = `COMPONENT_COMBATMG_MK2_CAMO_08` },
				{ name = 'camo_finish9',     label = Languages.GetTranslation('component_camo_finish9'),     hash = `COMPONENT_COMBATMG_MK2_CAMO_09` },
				{ name = 'camo_finish10',    label = Languages.GetTranslation('component_camo_finish10'),    hash = `COMPONENT_COMBATMG_MK2_CAMO_10` },
				{ name = 'camo_finish11',    label = Languages.GetTranslation('component_camo_finish11'),    hash = `COMPONENT_COMBATMG_MK2_CAMO_IND_01` }
			}
		},
		{
			name = 'WEAPON_COMBATPDW',
			label = Languages.GetTranslation('weapon_combatpdw'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SMG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_COMBATPDW_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_COMBATPDW_CLIP_02` },
				{ name = 'clip_drum',     label = Languages.GetTranslation('component_clip_drum'),     hash = `COMPONENT_COMBATPDW_CLIP_03` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_SMALL` }
			}
		},
		{
			name = 'WEAPON_GUSENBERG',
			label = Languages.GetTranslation('weapon_gusenberg'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_MG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_GUSENBERG_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_GUSENBERG_CLIP_02` }
			}
		},
		{
			name = 'WEAPON_MACHINEPISTOL',
			label = Languages.GetTranslation('weapon_machinepistol'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_MACHINEPISTOL_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_MACHINEPISTOL_CLIP_02` },
				{ name = 'clip_drum',     label = Languages.GetTranslation('component_clip_drum'),     hash = `COMPONENT_MACHINEPISTOL_CLIP_03` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_PI_SUPP` }
			}
		},
		{
			name = 'WEAPON_MG',
			label = Languages.GetTranslation('weapon_mg'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_MG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_MG_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_MG_CLIP_02` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_SMALL_02` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_MG_VARMOD_LOWRIDER` }
			}
		},
		{
			name = 'WEAPON_MICROSMG',
			label = Languages.GetTranslation('weapon_microsmg'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SMG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_MICROSMG_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_MICROSMG_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_PI_FLSH` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_MACRO` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_MICROSMG_VARMOD_LUXE` }
			}
		},
		{
			name = 'WEAPON_MINISMG',
			label = Languages.GetTranslation('weapon_minismg'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SMG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_MINISMG_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_MINISMG_CLIP_02` }
			}
		},
		{
			name = 'WEAPON_SMG',
			label = Languages.GetTranslation('weapon_smg'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SMG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_SMG_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_SMG_CLIP_02` },
				{ name = 'clip_drum',     label = Languages.GetTranslation('component_clip_drum'),     hash = `COMPONENT_SMG_CLIP_03` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_MACRO_02` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_PI_SUPP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_SMG_VARMOD_LUXE` }
			}
		},
		{
			name = 'WEAPON_SMG_MK2',
			label = Languages.GetTranslation('weapon_smg_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SMG` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',     label = Languages.GetTranslation('component_clip_default'),     hash = `COMPONENT_SMG_MK2_CLIP_01` },
				{ name = 'clip_extended',    label = Languages.GetTranslation('component_clip_extended'),    hash = `COMPONENT_SMG_MK2_CLIP_02` },
				{ name = 'ammo_tracer',      label = Languages.GetTranslation('component_ammo_tracer'),      hash = `COMPONENT_SMG_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',  label = Languages.GetTranslation('component_ammo_incendiary'),  hash = `COMPONENT_SMG_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_hollowpoint', label = Languages.GetTranslation('component_ammo_hollowpoint'), hash = `COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT` },
				{ name = 'ammo_fmj',         label = Languages.GetTranslation('component_ammo_fmj'),         hash = `COMPONENT_SMG_MK2_CLIP_FMJ` },
				{ name = 'flashlight',       label = Languages.GetTranslation('component_flashlight'),       hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope_holo',       label = Languages.GetTranslation('component_scope_holo'),       hash = `COMPONENT_AT_SIGHTS_SMG` },
				{ name = 'scope_small',      label = Languages.GetTranslation('component_scope_small'),      hash = `COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2` },
				{ name = 'scope_medium',     label = Languages.GetTranslation('component_scope_medium'),     hash = `COMPONENT_AT_SCOPE_SMALL_SMG_MK2` },
				{ name = 'suppressor',       label = Languages.GetTranslation('component_suppressor'),       hash = `COMPONENT_AT_PI_SUPP` },
				{ name = 'muzzle_flat',      label = Languages.GetTranslation('component_muzzle_flat'),      hash = `COMPONENT_AT_MUZZLE_01` },
				{ name = 'muzzle_tactical',  label = Languages.GetTranslation('component_muzzle_tactical'),  hash = `COMPONENT_AT_MUZZLE_02` },
				{ name = 'muzzle_fat',       label = Languages.GetTranslation('component_muzzle_fat'),       hash = `COMPONENT_AT_MUZZLE_03` },
				{ name = 'muzzle_precision', label = Languages.GetTranslation('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
				{ name = 'muzzle_heavy',     label = Languages.GetTranslation('component_muzzle_heavy'),     hash = `COMPONENT_AT_MUZZLE_05` },
				{ name = 'muzzle_slanted',   label = Languages.GetTranslation('component_muzzle_slanted'),   hash = `COMPONENT_AT_MUZZLE_06` },
				{ name = 'muzzle_split',     label = Languages.GetTranslation('component_muzzle_split'),     hash = `COMPONENT_AT_MUZZLE_07` },
				{ name = 'barrel_default',   label = Languages.GetTranslation('component_barrel_default'),   hash = `COMPONENT_AT_SB_BARREL_01` },
				{ name = 'barrel_heavy',     label = Languages.GetTranslation('component_barrel_heavy'),     hash = `COMPONENT_AT_SB_BARREL_02` },
				{ name = 'camo_finish',      label = Languages.GetTranslation('component_camo_finish'),      hash = `COMPONENT_SMG_MK2_CAMO` },
				{ name = 'camo_finish2',     label = Languages.GetTranslation('component_camo_finish2'),     hash = `COMPONENT_SMG_MK2_CAMO_02` },
				{ name = 'camo_finish3',     label = Languages.GetTranslation('component_camo_finish3'),     hash = `COMPONENT_SMG_MK2_CAMO_03` },
				{ name = 'camo_finish4',     label = Languages.GetTranslation('component_camo_finish4'),     hash = `COMPONENT_SMG_MK2_CAMO_04` },
				{ name = 'camo_finish5',     label = Languages.GetTranslation('component_camo_finish5'),     hash = `COMPONENT_SMG_MK2_CAMO_05` },
				{ name = 'camo_finish6',     label = Languages.GetTranslation('component_camo_finish6'),     hash = `COMPONENT_SMG_MK2_CAMO_06` },
				{ name = 'camo_finish7',     label = Languages.GetTranslation('component_camo_finish7'),     hash = `COMPONENT_SMG_MK2_CAMO_07` },
				{ name = 'camo_finish8',     label = Languages.GetTranslation('component_camo_finish8'),     hash = `COMPONENT_SMG_MK2_CAMO_08` },
				{ name = 'camo_finish9',     label = Languages.GetTranslation('component_camo_finish9'),     hash = `COMPONENT_SMG_MK2_CAMO_09` },
				{ name = 'camo_finish10',    label = Languages.GetTranslation('component_camo_finish10'),    hash = `COMPONENT_SMG_MK2_CAMO_10` },
				{ name = 'camo_finish11',    label = Languages.GetTranslation('component_camo_finish11'),    hash = `COMPONENT_SMG_MK2_CAMO_IND_01` }
			}
		},
		{ name = 'WEAPON_RAYCARBINE', label = Languages.GetTranslation('weapon_raycarbine'), ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SMG` }, tints = Config.DefaultWeaponTints, components = {} },
		-- Rifles
		{
			name = 'WEAPON_ADVANCEDRIFLE',
			label = Languages.GetTranslation('weapon_advancedrifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_ADVANCEDRIFLE_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_ADVANCEDRIFLE_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_SMALL` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE` }
			}
		},
		{
			name = 'WEAPON_ASSAULTRIFLE',
			label = Languages.GetTranslation('weapon_assaultrifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_ASSAULTRIFLE_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_ASSAULTRIFLE_CLIP_02` },
				{ name = 'clip_drum',     label = Languages.GetTranslation('component_clip_drum'),     hash = `COMPONENT_ASSAULTRIFLE_CLIP_03` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_MACRO` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_ASSAULTRIFLE_VARMOD_LUXE` }
			}
		},
		{
			name = 'WEAPON_ASSAULTRIFLE_MK2',
			label = Languages.GetTranslation('weapon_assaultrifle_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',     label = Languages.GetTranslation('component_clip_default'),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_01` },
				{ name = 'clip_extended',    label = Languages.GetTranslation('component_clip_extended'),    hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_02` },
				{ name = 'ammo_tracer',      label = Languages.GetTranslation('component_ammo_tracer'),      hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',  label = Languages.GetTranslation('component_ammo_incendiary'),  hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_armor',       label = Languages.GetTranslation('component_ammo_armor'),       hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING` },
				{ name = 'ammo_fmj',         label = Languages.GetTranslation('component_ammo_fmj'),         hash = `COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ` },
				{ name = 'grip',             label = Languages.GetTranslation('component_grip'),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
				{ name = 'flashlight',       label = Languages.GetTranslation('component_flashlight'),       hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope_holo',       label = Languages.GetTranslation('component_scope_holo'),       hash = `COMPONENT_AT_SIGHTS` },
				{ name = 'scope_small',      label = Languages.GetTranslation('component_scope_small'),      hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
				{ name = 'scope_large',      label = Languages.GetTranslation('component_scope_large'),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
				{ name = 'suppressor',       label = Languages.GetTranslation('component_suppressor'),       hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'muzzle_flat',      label = Languages.GetTranslation('component_muzzle_flat'),      hash = `COMPONENT_AT_MUZZLE_01` },
				{ name = 'muzzle_tactical',  label = Languages.GetTranslation('component_muzzle_tactical'),  hash = `COMPONENT_AT_MUZZLE_02` },
				{ name = 'muzzle_fat',       label = Languages.GetTranslation('component_muzzle_fat'),       hash = `COMPONENT_AT_MUZZLE_03` },
				{ name = 'muzzle_precision', label = Languages.GetTranslation('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
				{ name = 'muzzle_heavy',     label = Languages.GetTranslation('component_muzzle_heavy'),     hash = `COMPONENT_AT_MUZZLE_05` },
				{ name = 'muzzle_slanted',   label = Languages.GetTranslation('component_muzzle_slanted'),   hash = `COMPONENT_AT_MUZZLE_06` },
				{ name = 'muzzle_split',     label = Languages.GetTranslation('component_muzzle_split'),     hash = `COMPONENT_AT_MUZZLE_07` },
				{ name = 'barrel_default',   label = Languages.GetTranslation('component_barrel_default'),   hash = `COMPONENT_AT_AR_BARREL_01` },
				{ name = 'barrel_heavy',     label = Languages.GetTranslation('component_barrel_heavy'),     hash = `COMPONENT_AT_AR_BARREL_02` },
				{ name = 'camo_finish',      label = Languages.GetTranslation('component_camo_finish'),      hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO` },
				{ name = 'camo_finish2',     label = Languages.GetTranslation('component_camo_finish2'),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_02` },
				{ name = 'camo_finish3',     label = Languages.GetTranslation('component_camo_finish3'),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_03` },
				{ name = 'camo_finish4',     label = Languages.GetTranslation('component_camo_finish4'),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_04` },
				{ name = 'camo_finish5',     label = Languages.GetTranslation('component_camo_finish5'),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_05` },
				{ name = 'camo_finish6',     label = Languages.GetTranslation('component_camo_finish6'),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_06` },
				{ name = 'camo_finish7',     label = Languages.GetTranslation('component_camo_finish7'),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_07` },
				{ name = 'camo_finish8',     label = Languages.GetTranslation('component_camo_finish8'),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_08` },
				{ name = 'camo_finish9',     label = Languages.GetTranslation('component_camo_finish9'),     hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_09` },
				{ name = 'camo_finish10',    label = Languages.GetTranslation('component_camo_finish10'),    hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_10` },
				{ name = 'camo_finish11',    label = Languages.GetTranslation('component_camo_finish11'),    hash = `COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01` }
			}
		},
		{
			name = 'WEAPON_BULLPUPRIFLE',
			label = Languages.GetTranslation('weapon_bullpuprifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_BULLPUPRIFLE_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_BULLPUPRIFLE_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_SMALL` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_BULLPUPRIFLE_VARMOD_LOW` }
			}
		},
		{
			name = 'WEAPON_BULLPUPRIFLE_MK2',
			label = Languages.GetTranslation('weapon_bullpuprifle_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',     label = Languages.GetTranslation('component_clip_default'),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_01` },
				{ name = 'clip_extended',    label = Languages.GetTranslation('component_clip_extended'),    hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_02` },
				{ name = 'ammo_tracer',      label = Languages.GetTranslation('component_ammo_tracer'),      hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',  label = Languages.GetTranslation('component_ammo_incendiary'),  hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_armor',       label = Languages.GetTranslation('component_ammo_armor'),       hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING` },
				{ name = 'ammo_fmj',         label = Languages.GetTranslation('component_ammo_fmj'),         hash = `COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ` },
				{ name = 'flashlight',       label = Languages.GetTranslation('component_flashlight'),       hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope_holo',       label = Languages.GetTranslation('component_scope_holo'),       hash = `COMPONENT_AT_SIGHTS` },
				{ name = 'scope_small',      label = Languages.GetTranslation('component_scope_small'),      hash = `COMPONENT_AT_SCOPE_MACRO_02_MK2` },
				{ name = 'scope_medium',     label = Languages.GetTranslation('component_scope_medium'),     hash = `COMPONENT_AT_SCOPE_SMALL_MK2` },
				{ name = 'barrel_default',   label = Languages.GetTranslation('component_barrel_default'),   hash = `COMPONENT_AT_BP_BARREL_01` },
				{ name = 'barrel_heavy',     label = Languages.GetTranslation('component_barrel_heavy'),     hash = `COMPONENT_AT_BP_BARREL_02` },
				{ name = 'suppressor',       label = Languages.GetTranslation('component_suppressor'),       hash = `COMPONENT_AT_AR_SUPP` },
				{ name = 'muzzle_flat',      label = Languages.GetTranslation('component_muzzle_flat'),      hash = `COMPONENT_AT_MUZZLE_01` },
				{ name = 'muzzle_tactical',  label = Languages.GetTranslation('component_muzzle_tactical'),  hash = `COMPONENT_AT_MUZZLE_02` },
				{ name = 'muzzle_fat',       label = Languages.GetTranslation('component_muzzle_fat'),       hash = `COMPONENT_AT_MUZZLE_03` },
				{ name = 'muzzle_precision', label = Languages.GetTranslation('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
				{ name = 'muzzle_heavy',     label = Languages.GetTranslation('component_muzzle_heavy'),     hash = `COMPONENT_AT_MUZZLE_05` },
				{ name = 'muzzle_slanted',   label = Languages.GetTranslation('component_muzzle_slanted'),   hash = `COMPONENT_AT_MUZZLE_06` },
				{ name = 'muzzle_split',     label = Languages.GetTranslation('component_muzzle_split'),     hash = `COMPONENT_AT_MUZZLE_07` },
				{ name = 'grip',             label = Languages.GetTranslation('component_grip'),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
				{ name = 'camo_finish',      label = Languages.GetTranslation('component_camo_finish'),      hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO` },
				{ name = 'camo_finish2',     label = Languages.GetTranslation('component_camo_finish2'),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_02` },
				{ name = 'camo_finish3',     label = Languages.GetTranslation('component_camo_finish3'),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_03` },
				{ name = 'camo_finish4',     label = Languages.GetTranslation('component_camo_finish4'),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_04` },
				{ name = 'camo_finish5',     label = Languages.GetTranslation('component_camo_finish5'),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_05` },
				{ name = 'camo_finish6',     label = Languages.GetTranslation('component_camo_finish6'),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_06` },
				{ name = 'camo_finish7',     label = Languages.GetTranslation('component_camo_finish7'),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_07` },
				{ name = 'camo_finish8',     label = Languages.GetTranslation('component_camo_finish8'),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_08` },
				{ name = 'camo_finish9',     label = Languages.GetTranslation('component_camo_finish9'),     hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_09` },
				{ name = 'camo_finish10',    label = Languages.GetTranslation('component_camo_finish10'),    hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_10` },
				{ name = 'camo_finish11',    label = Languages.GetTranslation('component_camo_finish11'),    hash = `COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01` }
			}
		},
		{
			name = 'WEAPON_CARBINERIFLE',
			label = Languages.GetTranslation('weapon_carbinerifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_CARBINERIFLE_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_CARBINERIFLE_CLIP_02` },
				{ name = 'clip_box',      label = Languages.GetTranslation('component_clip_box'),      hash = `COMPONENT_CARBINERIFLE_CLIP_03` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_MEDIUM` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_CARBINERIFLE_VARMOD_LUXE` }
			}
		},
		{
			name = 'WEAPON_CARBINERIFLE_MK2',
			label = Languages.GetTranslation('weapon_carbinerifle_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',     label = Languages.GetTranslation('component_clip_default'),     hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_01` },
				{ name = 'clip_extended',    label = Languages.GetTranslation('component_clip_extended'),    hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_02` },
				{ name = 'ammo_tracer',      label = Languages.GetTranslation('component_ammo_tracer'),      hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',  label = Languages.GetTranslation('component_ammo_incendiary'),  hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_armor',       label = Languages.GetTranslation('component_ammo_armor'),       hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING` },
				{ name = 'ammo_fmj',         label = Languages.GetTranslation('component_ammo_fmj'),         hash = `COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ` },
				{ name = 'grip',             label = Languages.GetTranslation('component_grip'),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
				{ name = 'flashlight',       label = Languages.GetTranslation('component_flashlight'),       hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope_holo',       label = Languages.GetTranslation('component_scope_holo'),       hash = `COMPONENT_AT_SIGHTS` },
				{ name = 'scope_medium',     label = Languages.GetTranslation('component_scope_medium'),     hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
				{ name = 'scope_large',      label = Languages.GetTranslation('component_scope_large'),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
				{ name = 'suppressor',       label = Languages.GetTranslation('component_suppressor'),       hash = `COMPONENT_AT_AR_SUPP` },
				{ name = 'muzzle_flat',      label = Languages.GetTranslation('component_muzzle_flat'),      hash = `COMPONENT_AT_MUZZLE_01` },
				{ name = 'muzzle_tactical',  label = Languages.GetTranslation('component_muzzle_tactical'),  hash = `COMPONENT_AT_MUZZLE_02` },
				{ name = 'muzzle_fat',       label = Languages.GetTranslation('component_muzzle_fat'),       hash = `COMPONENT_AT_MUZZLE_03` },
				{ name = 'muzzle_precision', label = Languages.GetTranslation('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
				{ name = 'muzzle_heavy',     label = Languages.GetTranslation('component_muzzle_heavy'),     hash = `COMPONENT_AT_MUZZLE_05` },
				{ name = 'muzzle_slanted',   label = Languages.GetTranslation('component_muzzle_slanted'),   hash = `COMPONENT_AT_MUZZLE_06` },
				{ name = 'muzzle_split',     label = Languages.GetTranslation('component_muzzle_split'),     hash = `COMPONENT_AT_MUZZLE_07` },
				{ name = 'barrel_default',   label = Languages.GetTranslation('component_barrel_default'),   hash = `COMPONENT_AT_CR_BARREL_01` },
				{ name = 'barrel_heavy',     label = Languages.GetTranslation('component_barrel_heavy'),     hash = `COMPONENT_AT_CR_BARREL_02` },
				{ name = 'camo_finish',      label = Languages.GetTranslation('component_camo_finish'),      hash = `COMPONENT_CARBINERIFLE_MK2_CAMO` },
				{ name = 'camo_finish2',     label = Languages.GetTranslation('component_camo_finish2'),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_02` },
				{ name = 'camo_finish3',     label = Languages.GetTranslation('component_camo_finish3'),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_03` },
				{ name = 'camo_finish4',     label = Languages.GetTranslation('component_camo_finish4'),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_04` },
				{ name = 'camo_finish5',     label = Languages.GetTranslation('component_camo_finish5'),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_05` },
				{ name = 'camo_finish6',     label = Languages.GetTranslation('component_camo_finish6'),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_06` },
				{ name = 'camo_finish7',     label = Languages.GetTranslation('component_camo_finish7'),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_07` },
				{ name = 'camo_finish8',     label = Languages.GetTranslation('component_camo_finish8'),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_08` },
				{ name = 'camo_finish9',     label = Languages.GetTranslation('component_camo_finish9'),     hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_09` },
				{ name = 'camo_finish10',    label = Languages.GetTranslation('component_camo_finish10'),    hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_10` },
				{ name = 'camo_finish11',    label = Languages.GetTranslation('component_camo_finish11'),    hash = `COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01` }
			}
		},
		{
			name = 'WEAPON_COMPACTRIFLE',
			label = Languages.GetTranslation('weapon_compactrifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_COMPACTRIFLE_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_COMPACTRIFLE_CLIP_02` },
				{ name = 'clip_drum',     label = Languages.GetTranslation('component_clip_drum'),     hash = `COMPONENT_COMPACTRIFLE_CLIP_03` }
			}
		},
		{
			name = 'WEAPON_MILITARYRIFLE',
			label = Languages.GetTranslation('weapon_militaryrifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_MILITARYRIFLE_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_MILITARYRIFLE_CLIP_02` },
				{ name = 'ironsights',    label = Languages.GetTranslation('component_ironsights'),    hash = `COMPONENT_MILITARYRIFLE_SIGHT_01` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_SMALL` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP` }
			}
		},
		{
			name = 'WEAPON_SPECIALCARBINE',
			label = Languages.GetTranslation('weapon_specialcarbine'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_SPECIALCARBINE_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_SPECIALCARBINE_CLIP_02` },
				{ name = 'clip_drum',     label = Languages.GetTranslation('component_clip_drum'),     hash = `COMPONENT_SPECIALCARBINE_CLIP_03` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_MEDIUM` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER` }
			}
		},
		{
			name = 'WEAPON_SPECIALCARBINE_MK2',
			label = Languages.GetTranslation('weapon_specialcarbine_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',     label = Languages.GetTranslation('component_clip_default'),     hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_01` },
				{ name = 'clip_extended',    label = Languages.GetTranslation('component_clip_extended'),    hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_02` },
				{ name = 'ammo_tracer',      label = Languages.GetTranslation('component_ammo_tracer'),      hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',  label = Languages.GetTranslation('component_ammo_incendiary'),  hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_armor',       label = Languages.GetTranslation('component_ammo_armor'),       hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING` },
				{ name = 'ammo_fmj',         label = Languages.GetTranslation('component_ammo_fmj'),         hash = `COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ` },
				{ name = 'flashlight',       label = Languages.GetTranslation('component_flashlight'),       hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope_holo',       label = Languages.GetTranslation('component_scope_holo'),       hash = `COMPONENT_AT_SIGHTS` },
				{ name = 'scope_small',      label = Languages.GetTranslation('component_scope_small'),      hash = `COMPONENT_AT_SCOPE_MACRO_MK2` },
				{ name = 'scope_large',      label = Languages.GetTranslation('component_scope_large'),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
				{ name = 'suppressor',       label = Languages.GetTranslation('component_suppressor'),       hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'muzzle_flat',      label = Languages.GetTranslation('component_muzzle_flat'),      hash = `COMPONENT_AT_MUZZLE_01` },
				{ name = 'muzzle_tactical',  label = Languages.GetTranslation('component_muzzle_tactical'),  hash = `COMPONENT_AT_MUZZLE_02` },
				{ name = 'muzzle_fat',       label = Languages.GetTranslation('component_muzzle_fat'),       hash = `COMPONENT_AT_MUZZLE_03` },
				{ name = 'muzzle_precision', label = Languages.GetTranslation('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
				{ name = 'muzzle_heavy',     label = Languages.GetTranslation('component_muzzle_heavy'),     hash = `COMPONENT_AT_MUZZLE_05` },
				{ name = 'muzzle_slanted',   label = Languages.GetTranslation('component_muzzle_slanted'),   hash = `COMPONENT_AT_MUZZLE_06` },
				{ name = 'muzzle_split',     label = Languages.GetTranslation('component_muzzle_split'),     hash = `COMPONENT_AT_MUZZLE_07` },
				{ name = 'grip',             label = Languages.GetTranslation('component_grip'),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
				{ name = 'barrel_default',   label = Languages.GetTranslation('component_barrel_default'),   hash = `COMPONENT_AT_SC_BARREL_01` },
				{ name = 'barrel_heavy',     label = Languages.GetTranslation('component_barrel_heavy'),     hash = `COMPONENT_AT_SC_BARREL_02` },
				{ name = 'camo_finish',      label = Languages.GetTranslation('component_camo_finish'),      hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO` },
				{ name = 'camo_finish2',     label = Languages.GetTranslation('component_camo_finish2'),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_02` },
				{ name = 'camo_finish3',     label = Languages.GetTranslation('component_camo_finish3'),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_03` },
				{ name = 'camo_finish4',     label = Languages.GetTranslation('component_camo_finish4'),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_04` },
				{ name = 'camo_finish5',     label = Languages.GetTranslation('component_camo_finish5'),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_05` },
				{ name = 'camo_finish6',     label = Languages.GetTranslation('component_camo_finish6'),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_06` },
				{ name = 'camo_finish7',     label = Languages.GetTranslation('component_camo_finish7'),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_07` },
				{ name = 'camo_finish8',     label = Languages.GetTranslation('component_camo_finish8'),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_08` },
				{ name = 'camo_finish9',     label = Languages.GetTranslation('component_camo_finish9'),     hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_09` },
				{ name = 'camo_finish10',    label = Languages.GetTranslation('component_camo_finish10'),    hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_10` },
				{ name = 'camo_finish11',    label = Languages.GetTranslation('component_camo_finish11'),    hash = `COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01` }
			}
		},
		{
			name = 'WEAPON_HEAVYRIFLE',
			label = Languages.GetTranslation('weapon_heavyrifle'),
			ammo = {label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE`},
			tints = Config.DefaultWeaponTints,
			components = {
				{name = 'clip_default', label = Languages.GetTranslation('component_clip_default'), hash = `COMPONENT_HEAVYRIFLE_CLIP_01`},
				{name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_HEAVYRIFLE_CLIP_02`},
				{name = 'scope_holo', label = Languages.GetTranslation('component_scope_holo'), hash = `COMPONENT_HEAVYRIFLE_SIGHT_01` },
				{name = 'scope', label = Languages.GetTranslation('component_scope'), hash = `COMPONENT_AT_SCOPE_MEDIUM` },
				{name = 'flashlight', label = Languages.GetTranslation('component_flashlight'), hash = `COMPONENT_AT_AR_FLSH`},
				{name = 'suppressor', label = Languages.GetTranslation('component_suppressor'), hash = `COMPONENT_AT_AR_SUPP`},
				{name = 'grip', label = Languages.GetTranslation('component_grip'), hash = `COMPONENT_AT_AR_AFGRIP`}
			}
		},
		-- Sniper
		{
			name = 'WEAPON_HEAVYSNIPER',
			label = Languages.GetTranslation('weapon_heavysniper'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SNIPER` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'scope',          label = Languages.GetTranslation('component_scope'),          hash = `COMPONENT_AT_SCOPE_LARGE` },
				{ name = 'scope_advanced', label = Languages.GetTranslation('component_scope_advanced'), hash = `COMPONENT_AT_SCOPE_MAX` }
			}
		},
		{
			name = 'WEAPON_HEAVYSNIPER_MK2',
			label = Languages.GetTranslation('weapon_heavysniper_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SNIPER` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',      label = Languages.GetTranslation('component_clip_default'),      hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_01` },
				{ name = 'clip_extended',     label = Languages.GetTranslation('component_clip_extended'),     hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_02` },
				{ name = 'ammo_incendiary',   label = Languages.GetTranslation('component_ammo_incendiary'),   hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_armor',        label = Languages.GetTranslation('component_ammo_armor'),        hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING` },
				{ name = 'ammo_fmj',          label = Languages.GetTranslation('component_ammo_fmj'),          hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ` },
				{ name = 'ammo_explosive',    label = Languages.GetTranslation('component_ammo_explosive'),    hash = `COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE` },
				{ name = 'scope_zoom',        label = Languages.GetTranslation('component_scope_zoom'),        hash = `COMPONENT_AT_SCOPE_LARGE_MK2` },
				{ name = 'scope_advanced',    label = Languages.GetTranslation('component_scope_advanced'),    hash = `COMPONENT_AT_SCOPE_MAX` },
				{ name = 'scope_nightvision', label = Languages.GetTranslation('component_scope_nightvision'), hash = `COMPONENT_AT_SCOPE_NV` },
				{ name = 'scope_thermal',     label = Languages.GetTranslation('component_scope_thermal'),     hash = `COMPONENT_AT_SCOPE_THERMAL` },
				{ name = 'suppressor',        label = Languages.GetTranslation('component_suppressor'),        hash = `COMPONENT_AT_SR_SUPP_03` },
				{ name = 'muzzle_squared',    label = Languages.GetTranslation('component_muzzle_squared'),    hash = `COMPONENT_AT_MUZZLE_08` },
				{ name = 'muzzle_bell',       label = Languages.GetTranslation('component_muzzle_bell'),       hash = `COMPONENT_AT_MUZZLE_09` },
				{ name = 'barrel_default',    label = Languages.GetTranslation('component_barrel_default'),    hash = `COMPONENT_AT_SR_BARREL_01` },
				{ name = 'barrel_heavy',      label = Languages.GetTranslation('component_barrel_heavy'),      hash = `COMPONENT_AT_SR_BARREL_02` },
				{ name = 'camo_finish',       label = Languages.GetTranslation('component_camo_finish'),       hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO` },
				{ name = 'camo_finish2',      label = Languages.GetTranslation('component_camo_finish2'),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_02` },
				{ name = 'camo_finish3',      label = Languages.GetTranslation('component_camo_finish3'),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_03` },
				{ name = 'camo_finish4',      label = Languages.GetTranslation('component_camo_finish4'),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_04` },
				{ name = 'camo_finish5',      label = Languages.GetTranslation('component_camo_finish5'),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_05` },
				{ name = 'camo_finish6',      label = Languages.GetTranslation('component_camo_finish6'),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_06` },
				{ name = 'camo_finish7',      label = Languages.GetTranslation('component_camo_finish7'),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_07` },
				{ name = 'camo_finish8',      label = Languages.GetTranslation('component_camo_finish8'),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_08` },
				{ name = 'camo_finish9',      label = Languages.GetTranslation('component_camo_finish9'),      hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_09` },
				{ name = 'camo_finish10',     label = Languages.GetTranslation('component_camo_finish10'),     hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_10` },
				{ name = 'camo_finish11',     label = Languages.GetTranslation('component_camo_finish11'),     hash = `COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01` }
			}
		},
		{
			name = 'WEAPON_MARKSMANRIFLE',
			label = Languages.GetTranslation('weapon_marksmanrifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SNIPER` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_MARKSMANRIFLE_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_MARKSMANRIFLE_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'scope',         label = Languages.GetTranslation('component_scope'),         hash = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` },
				{ name = 'luxary_finish', label = Languages.GetTranslation('component_luxary_finish'), hash = `COMPONENT_MARKSMANRIFLE_VARMOD_LUXE` }
			}
		},
		{
			name = 'WEAPON_MARKSMANRIFLE_MK2',
			label = Languages.GetTranslation('weapon_marksmanrifle_mk2'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SNIPER` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',     label = Languages.GetTranslation('component_clip_default'),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_01` },
				{ name = 'clip_extended',    label = Languages.GetTranslation('component_clip_extended'),    hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_02` },
				{ name = 'ammo_tracer',      label = Languages.GetTranslation('component_ammo_tracer'),      hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER` },
				{ name = 'ammo_incendiary',  label = Languages.GetTranslation('component_ammo_incendiary'),  hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY` },
				{ name = 'ammo_armor',       label = Languages.GetTranslation('component_ammo_armor'),       hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING` },
				{ name = 'ammo_fmj',         label = Languages.GetTranslation('component_ammo_fmj'),         hash = `COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ` },
				{ name = 'scope_holo',       label = Languages.GetTranslation('component_scope_holo'),       hash = `COMPONENT_AT_SIGHTS` },
				{ name = 'scope_large',      label = Languages.GetTranslation('component_scope_large'),      hash = `COMPONENT_AT_SCOPE_MEDIUM_MK2` },
				{ name = 'scope_zoom',       label = Languages.GetTranslation('component_scope_zoom'),       hash = `COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2` },
				{ name = 'flashlight',       label = Languages.GetTranslation('component_flashlight'),       hash = `COMPONENT_AT_AR_FLSH` },
				{ name = 'suppressor',       label = Languages.GetTranslation('component_suppressor'),       hash = `COMPONENT_AT_AR_SUPP` },
				{ name = 'muzzle_flat',      label = Languages.GetTranslation('component_muzzle_flat'),      hash = `COMPONENT_AT_MUZZLE_01` },
				{ name = 'muzzle_tactical',  label = Languages.GetTranslation('component_muzzle_tactical'),  hash = `COMPONENT_AT_MUZZLE_02` },
				{ name = 'muzzle_fat',       label = Languages.GetTranslation('component_muzzle_fat'),       hash = `COMPONENT_AT_MUZZLE_03` },
				{ name = 'muzzle_precision', label = Languages.GetTranslation('component_muzzle_precision'), hash = `COMPONENT_AT_MUZZLE_04` },
				{ name = 'muzzle_heavy',     label = Languages.GetTranslation('component_muzzle_heavy'),     hash = `COMPONENT_AT_MUZZLE_05` },
				{ name = 'muzzle_slanted',   label = Languages.GetTranslation('component_muzzle_slanted'),   hash = `COMPONENT_AT_MUZZLE_06` },
				{ name = 'muzzle_split',     label = Languages.GetTranslation('component_muzzle_split'),     hash = `COMPONENT_AT_MUZZLE_07` },
				{ name = 'barrel_default',   label = Languages.GetTranslation('component_barrel_default'),   hash = `COMPONENT_AT_MRFL_BARREL_01` },
				{ name = 'barrel_heavy',     label = Languages.GetTranslation('component_barrel_heavy'),     hash = `COMPONENT_AT_MRFL_BARREL_02` },
				{ name = 'grip',             label = Languages.GetTranslation('component_grip'),             hash = `COMPONENT_AT_AR_AFGRIP_02` },
				{ name = 'camo_finish',      label = Languages.GetTranslation('component_camo_finish'),      hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO` },
				{ name = 'camo_finish2',     label = Languages.GetTranslation('component_camo_finish2'),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_02` },
				{ name = 'camo_finish3',     label = Languages.GetTranslation('component_camo_finish3'),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_03` },
				{ name = 'camo_finish4',     label = Languages.GetTranslation('component_camo_finish4'),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_04` },
				{ name = 'camo_finish5',     label = Languages.GetTranslation('component_camo_finish5'),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_05` },
				{ name = 'camo_finish6',     label = Languages.GetTranslation('component_camo_finish6'),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_06` },
				{ name = 'camo_finish7',     label = Languages.GetTranslation('component_camo_finish7'),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_07` },
				{ name = 'camo_finish8',     label = Languages.GetTranslation('component_camo_finish8'),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_08` },
				{ name = 'camo_finish9',     label = Languages.GetTranslation('component_camo_finish9'),     hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_09` },
				{ name = 'camo_finish10',    label = Languages.GetTranslation('component_camo_finish10'),    hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_10` },
				{ name = 'camo_finish11',    label = Languages.GetTranslation('component_camo_finish11'),    hash = `COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01` }
			}
		},
		{
			name = 'WEAPON_SNIPERRIFLE',
			label = Languages.GetTranslation('weapon_sniperrifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SNIPER` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'scope',          label = Languages.GetTranslation('component_scope'),          hash = `COMPONENT_AT_SCOPE_LARGE` },
				{ name = 'scope_advanced', label = Languages.GetTranslation('component_scope_advanced'), hash = `COMPONENT_AT_SCOPE_MAX` },
				{ name = 'suppressor',     label = Languages.GetTranslation('component_suppressor'),     hash = `COMPONENT_AT_AR_SUPP_02` },
				{ name = 'luxary_finish',  label = Languages.GetTranslation('component_luxary_finish'),  hash = `COMPONENT_SNIPERRIFLE_VARMOD_LUXE` }
			}
		},
		-- Heavy / Launchers
		{ name = 'WEAPON_COMPACTLAUNCHER',  label = Languages.GetTranslation('weapon_compactlauncher'),  tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = Languages.GetTranslation('ammo_grenadelauncher'), hash = `AMMO_GRENADELAUNCHER` } },
		{ name = 'WEAPON_FIREWORK',         label = Languages.GetTranslation('weapon_firework'),         components = {},                   ammo = { label = Languages.GetTranslation('ammo_firework'), hash = `AMMO_FIREWORK` } },
		{ name = 'WEAPON_GRENADELAUNCHER',  label = Languages.GetTranslation('weapon_grenadelauncher'),  tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = Languages.GetTranslation('ammo_grenadelauncher'), hash = `AMMO_GRENADELAUNCHER` } },
		{ name = 'WEAPON_HOMINGLAUNCHER',   label = Languages.GetTranslation('weapon_hominglauncher'),   tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = Languages.GetTranslation('ammo_rockets'), hash = `AMMO_HOMINGLAUNCHER` } },
		{ name = 'WEAPON_MINIGUN',          label = Languages.GetTranslation('weapon_minigun'),          tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_MINIGUN` } },
		{ name = 'WEAPON_RAILGUN',          label = Languages.GetTranslation('weapon_railgun'),          tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RAILGUN` } },
		{ name = 'WEAPON_RPG',              label = Languages.GetTranslation('weapon_rpg'),              tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = Languages.GetTranslation('ammo_rockets'), hash = `AMMO_RPG` } },
		{ name = 'WEAPON_RAYMINIGUN',       label = Languages.GetTranslation('weapon_rayminigun'),       tints = Config.DefaultWeaponTints, components = {},                                                               ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_MINIGUN` } },
		-- Thrown
		{ name = 'WEAPON_BALL',             label = Languages.GetTranslation('weapon_ball'),             components = {},                   ammo = { label = Languages.GetTranslation('ammo_ball'), hash = `AMMO_BALL` } },
		{ name = 'WEAPON_BZGAS',            label = Languages.GetTranslation('weapon_bzgas'),            components = {},                   ammo = { label = Languages.GetTranslation('ammo_bzgas'), hash = `AMMO_BZGAS` } },
		{ name = 'WEAPON_FLARE',            label = Languages.GetTranslation('weapon_flare'),            components = {},                   ammo = { label = Languages.GetTranslation('ammo_flare'), hash = `AMMO_FLARE` } },
		{ name = 'WEAPON_GRENADE',          label = Languages.GetTranslation('weapon_grenade'),          components = {},                   ammo = { label = Languages.GetTranslation('ammo_grenade'), hash = `AMMO_GRENADE` } },
		{ name = 'WEAPON_PETROLCAN',        label = Languages.GetTranslation('weapon_petrolcan'),        components = {},                   ammo = { label = Languages.GetTranslation('ammo_petrol'), hash = `AMMO_PETROLCAN` } },
		{ name = 'WEAPON_HAZARDCAN',        label = Languages.GetTranslation('weapon_hazardcan'),        components = {},                   ammo = { label = Languages.GetTranslation('ammo_petrol'), hash = `AMMO_PETROLCAN` } },
		{ name = 'WEAPON_MOLOTOV',          label = Languages.GetTranslation('weapon_molotov'),          components = {},                   ammo = { label = Languages.GetTranslation('ammo_molotov'), hash = `AMMO_MOLOTOV` } },
		{ name = 'WEAPON_PROXMINE',         label = Languages.GetTranslation('weapon_proxmine'),         components = {},                   ammo = { label = Languages.GetTranslation('ammo_proxmine'), hash = `AMMO_PROXMINE` } },
		{ name = 'WEAPON_PIPEBOMB',         label = Languages.GetTranslation('weapon_pipebomb'),         components = {},                   ammo = { label = Languages.GetTranslation('ammo_pipebomb'), hash = `AMMO_PIPEBOMB` } },
		{ name = 'WEAPON_SNOWBALL',         label = Languages.GetTranslation('weapon_snowball'),         components = {},                   ammo = { label = Languages.GetTranslation('ammo_snowball'), hash = `AMMO_SNOWBALL` } },
		{ name = 'WEAPON_STICKYBOMB',       label = Languages.GetTranslation('weapon_stickybomb'),       components = {},                   ammo = { label = Languages.GetTranslation('ammo_stickybomb'), hash = `AMMO_STICKYBOMB` } },
		{ name = 'WEAPON_SMOKEGRENADE',     label = Languages.GetTranslation('weapon_smokegrenade'),     components = {},                   ammo = { label = Languages.GetTranslation('ammo_smokebomb'), hash = `AMMO_SMOKEGRENADE` } },
		-- Tools
		{ name = 'WEAPON_FIREEXTINGUISHER', label = Languages.GetTranslation('weapon_fireextinguisher'), components = {},                   ammo = { label = Languages.GetTranslation('ammo_charge'), hash = `AMMO_FIREEXTINGUISHER` } },
		{ name = 'WEAPON_DIGISCANNER',      label = Languages.GetTranslation('weapon_digiscanner'),      components = {} },
		{ name = 'GADGET_PARACHUTE',        label = Languages.GetTranslation('gadget_parachute'),        components = {} },
		{
			name = 'WEAPON_TACTICALRIFLE',
			label = Languages.GetTranslation('weapon_tactilerifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RIFLE` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default',  label = Languages.GetTranslation('component_clip_default'),  hash = `COMPONENT_TACTICALRIFLE_CLIP_01` },
				{ name = 'clip_extended', label = Languages.GetTranslation('component_clip_extended'), hash = `COMPONENT_TACTICALRIFLE_CLIP_02` },
				{ name = 'flashlight',    label = Languages.GetTranslation('component_flashlight'),    hash = `COMPONENT_AT_AR_FLSH_REH` },
				{ name = 'grip',          label = Languages.GetTranslation('component_grip'),          hash = `COMPONENT_AT_AR_AFGRIP` },
				{ name = 'suppressor',    label = Languages.GetTranslation('component_suppressor'),    hash = `COMPONENT_AT_AR_SUPP_02` }
			}
		},
		{
			name = 'WEAPON_PRECISIONRIFLE',
			label = Languages.GetTranslation('weapon_precisionrifle'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_SNIPER` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default', label = Languages.GetTranslation('component_clip_default'), hash = `COMPONENT_PRECISIONRIFLE_CLIP_01` },
			}
		},
		{ name = 'WEAPON_METALDETECTOR', label = Languages.GetTranslation('weapon_metaldetector'), components = {} },
		{
			name = 'WEAPON_PISTOLXM3',
			label = Languages.GetTranslation('weapon_pistolxm3'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_PISTOL` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default', label = Languages.GetTranslation('component_clip_default'), hash = `COMPONENT_PISTOLXM3_CLIP_01` },
				{ name = 'suppressor',   label = Languages.GetTranslation('component_suppressor'),   hash = `COMPONENT_PISTOLXM3_SUPP` }
			}
		},
		{ name = 'WEAPON_ACIDPACKAGE',   label = Languages.GetTranslation('weapon_acidpackage'),   components = {} },
		{ name = 'WEAPON_CANDYCANE',     label = Languages.GetTranslation('weapon_candycane'),     components = {} },
		{
			name = 'WEAPON_RAILGUNXM3',
			label = Languages.GetTranslation('weapon_railgunxm3'),
			ammo = { label = Languages.GetTranslation('ammo_rounds'), hash = `AMMO_RAILGUN` },
			tints = Config.DefaultWeaponTints,
			components = {
				{ name = 'clip_default', label = Languages.GetTranslation('component_clip_default'), hash = `COMPONENT_RAILGUNXM3_CLIP_01` },
			},
		},
	}
}