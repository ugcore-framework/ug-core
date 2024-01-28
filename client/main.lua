UgCore                  = { }
UgDev                   = { }

UgCore.Config           = UGConfig
UgCore.Shared           = UGShared

UgCore.PlayerData       = { }
UgCore.PlayerLoaded     = false

UgCore.Input            = { }

UgCore.Pickups          = { }

UgCore.Dependencies     = {
    MultiCharacter = UgCore.Config.Core.Multicharacter.Enabled,
}

UgCore.MismatchedTypes = {
    [`airtug`] = "automobile",       -- trailer
    [`avisa`] = "submarine",         -- boat
    [`blimp`] = "heli",              -- plane
    [`blimp2`] = "heli",             -- plane
    [`blimp3`] = "heli",             -- plane
    [`caddy`] = "automobile",        -- trailer
    [`caddy2`] = "automobile",       -- trailer
    [`caddy3`] = "automobile",       -- trailer
    [`chimera`] = "automobile",      -- bike
    [`docktug`] = "automobile",      -- trailer
    [`forklift`] = "automobile",     -- trailer
    [`kosatka`] = "submarine",       -- boat
    [`mower`] = "automobile",        -- trailer
    [`policeb`] = "bike",            -- automobile
    [`ripley`] = "automobile",       -- trailer
    [`rrocket`] = "automobile",      -- bike
    [`sadler`] = "automobile",       -- trailer
    [`sadler2`] = "automobile",      -- trailer
    [`scrap`] = "automobile",        -- trailer
    [`slamtruck`] = "automobile",    -- trailer
    [`Stryder`] = "automobile",      -- bike
    [`submersible`] = "submarine",   -- boat
    [`submersible2`] = "submarine",  -- boat
    [`thruster`] = "heli",           -- automobile
    [`towtruck`] = "automobile",     -- trailer
    [`towtruck2`] = "automobile",    -- trailer
    [`tractor`] = "automobile",      -- trailer
    [`tractor2`] = "automobile",     -- trailer
    [`tractor3`] = "automobile",     -- trailer
    [`trailersmall2`] = "trailer",   -- automobile
    [`utillitruck`] = "automobile",  -- trailer
    [`utillitruck2`] = "automobile", -- trailer
    [`utillitruck3`] = "automobile"  -- trailer
}

exports('GetCore', function ()
    return UgCore
end)