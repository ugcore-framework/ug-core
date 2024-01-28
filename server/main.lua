UgCore                      = { }
UgDev                       = { }

UgCore.Config               = UGConfig
UgCore.Shared               = UGShared

UgCore.ClientCallbacks      = { }

UgCore.Players              = { }
UgCore.PlayersByIdentifier  = { }

UgCore.Items                = { }
UgCore.UsableItemsCallbacks = { }

UgCore.Jobs                 = { }
UgCore.JobsPlayerCount      = { }

UgCore.Pickups              = { }
UgCore.PickupID             = { }

UgCore.RegisteredCommands   = { }

UgCore.VehicleTypesByModel  = { }

UgCore.OneSyncState         = GetConvar('onesync', 'off')
UgCore.DatabaseConnected    = false

UgCore.Dependencies         = {
    MultiCharacter = UgCore.Config.Core.Multicharacter.Enabled
}

exports('GetCore', function ()
    return UgCore
end)