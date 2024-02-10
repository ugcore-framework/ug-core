UgCore                      = { }
UgDev                       = { }

UgCore.Config               = UGConfig
UgCore.Shared               = UGShared
UgCore.Version              = json.decode(LoadResourceFile(GetCurrentResourceName(), 'version.json'))

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
    MultiCharacter = false              -- Still in work
}

exports('GetCore', function ()
    return UgCore
end)