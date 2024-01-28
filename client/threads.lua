local isInVehicle, isEnteringVehicle, isJumping, inPauseMenu = false, false, false, false
local playerPed = PlayerPedId()
local current = { }

CreateThread(function ()
    while not UgCore.Dependencies.MultiCharacter do
        Wait(100)
        if NetworkIsPlayerActive(PlayerId()) then
            exports['spawnmanager']:setAutoSpawn(false)
            DoScreenFadeOut(0)
            Wait(500)
            TriggerServerEvent('ug-core:OnPlayerJoined')
            break
        end
    end
end)

CreateThread(function()
    while true do
        local playerId = PlayerId()
        if not UgCore.Config.Core.Others.Flags.DisplayAmmo then
            DisplayAmmoThisFrame(false)
        end

        if not UgCore.Config.Core.Others.Flags.WeaponWheel then
            BlockWeaponWheelThisFrame()
            DisableControlAction(0, 37, true)
        end

        if not UgCore.Config.Core.Others.Flags.AimAssist then
            if IsPedArmed(UgCore.PlayerData.ped, 4) then
                SetPlayerLockonRangeOverride(playerId, 2.0)
            end
        end

        if not UgCore.Config.Core.Others.Flags.VehicleRewards then
            DisablePlayerVehicleRewards(playerId)
        end

        if not UgCore.Config.Core.Others.WantedLevel then
            ClearPlayerWantedLevel(playerId)
	        SetMaxWantedLevel(0)
        end
        Wait(0)
    end
end)

CreateThread(function ()
    while true do
        local Sleep = 1500
        local playerCoords = GetEntityCoords(UgCore.PlayerData.ped)
        local _, closestDistance = UgCore.Functions.GetClosestPlayer(playerCoords)

        for pickupId, pickup in pairs(UgCore.Pickups) do
            local distance = #(playerCoords - pickup.coords)

            if distance < 5 then
                Sleep = 0
                local label = pickup.label

                if distance < 1 then
                    if IsControlJustReleased(0, 38) then
                        if IsPedOnFoot(UgCore.PlayerData.ped) and (closestDistance == -1 or closestDistance > 3) and not pickup.inRange then
                            pickup.inRange = true

                            local dict, anim = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', 'plant_floor'
                            UgCore.Functions.RequestAnimDict(dict)
                            TaskPlayAnim(UgCore.PlayerData.ped, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)
                            RemoveAnimDict(dict)
                            Wait(1000)

                            TriggerServerEvent('ug-core:OnPickup', pickupId)
                            PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
                        end
                    end

                    label = ('%s~n~%s'):format(label, TranslateCap('threw_pickup_prompt'))
                end

                UgCore.Functions.DrawText3D({
                    x = pickup.coords.x,
                    y = pickup.coords.y,
                    z = pickup.coords.z + 0.25
                }, label, 1.2, 1)
            elseif pickup.inRange then
                pickup.inRange = false
            end
        end
        Wait(Sleep)
    end
end)

local function GetPedVehicleSeat(ped, vehicle)
    for i = -1, 16 do
        if (GetPedInVehicleSeat(vehicle, i) == ped) then return i end
    end
    return -1
end

local function GetData(vehicle)
    if not DoesEntityExist(vehicle) then
        return
    end
    local model = GetEntityModel(vehicle)
    local displayName = GetDisplayNameFromVehicleModel(model)
    local netId = vehicle
    if NetworkGetEntityIsNetworked(vehicle) then
        netId = VehToNet(vehicle)
    end
    return displayName, netId
end

CreateThread(function()
    while true do
        UgCore.Functions.SetPlayerData('coords',GetEntityCoords(playerPed))
        if playerPed ~= PlayerPedId() then
            playerPed = PlayerPedId()
            UgCore.Functions.SetPlayerData('ped', playerPed)
            TriggerEvent('ug-core:PlayerPedChanged', playerPed)
            TriggerServerEvent('ug-core:PlayerPedChanged', PedToNet(playerPed))
        end

        if IsPedJumping(playerPed) and not isJumping then
            isJumping = true
            TriggerEvent('ug-core:PlayerJumping')
            TriggerServerEvent('ug-core:PlayerJumping')
        elseif not IsPedJumping(playerPed) and isJumping then
            isJumping = false
        end

        if IsPauseMenuActive() and not inPauseMenu then
            inPauseMenu = true
            TriggerEvent('ug-core:PauseMenuActive', inPauseMenu)
        elseif not IsPauseMenuActive() and inPauseMenu then
            inPauseMenu = false
            TriggerEvent('ug-core:PauseMenuActive', inPauseMenu)
        end


        if not isInVehicle and not IsPlayerDead(PlayerId()) then
            if DoesEntityExist(GetVehiclePedIsTryingToEnter(playerPed)) and not isEnteringVehicle then

                local vehicle = GetVehiclePedIsTryingToEnter(playerPed)
                local plate = GetVehicleNumberPlateText(vehicle)
                local seat = GetSeatPedIsTryingToEnter(playerPed)
                local _, netId = GetData(vehicle)
                isEnteringVehicle = true
                TriggerEvent('ug-core:EnteringVehicle', vehicle, plate, seat, netId)
                TriggerServerEvent('ug-core:EnteringVehicle', plate, seat, netId)
            elseif not DoesEntityExist(GetVehiclePedIsTryingToEnter(playerPed)) and
                not IsPedInAnyVehicle(playerPed, true) and isEnteringVehicle then
                -- vehicle entering aborted
                TriggerEvent('ug-core:EnteringVehicleAborted')
                TriggerServerEvent('ug-core:EnteringVehicleAborted')
                isEnteringVehicle = false
            elseif IsPedInAnyVehicle(playerPed, false) then
                -- suddenly appeared in a vehicle, possible teleport
                isEnteringVehicle = false
                isInVehicle = true
                current.vehicle = GetVehiclePedIsUsing(playerPed)
                current.seat = GetPedVehicleSeat(playerPed, current.vehicle)
                current.plate = GetVehicleNumberPlateText(current.vehicle)
                current.displayName, current.netId = GetData(current.vehicle)
                TriggerEvent('ug-core:EnteredVehicle', current.vehicle, current.plate, current.seat, current.displayName, current.netId)
                TriggerServerEvent('ug-core:EnteredVehicle', current.plate, current.seat, current.displayName, current.netId)
            end
        elseif isInVehicle then
            if not IsPedInAnyVehicle(playerPed, false) or IsPlayerDead(PlayerId()) then
                -- bye, vehicle
                TriggerEvent('ug-core:ExitedVehicle', current.vehicle, current.plate, current.seat, current.displayName, current.netId)
                TriggerServerEvent('ug-core:ExitedVehicle', current.plate, current.seat, current.displayName, current.netId)
                isInVehicle = false
                current = { }
            end
        end
        Wait(200)
    end
end)