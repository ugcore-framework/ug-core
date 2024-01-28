AddEventHandler('onResourceStop', function (resourceName)
	for i = 1, #UgCore.Menus.Openned, 1 do
        if UgCore.Menus.Openned[i] then
            if UgCore.Menus.Openned[i].resourceName == resourceName or UgCore.Menus.Openned[i].namespace == resourceName then
                UgCore.Menus.Openned[i].close()
                UgCore.Menus.Openned[i] = nil
            end
        end
    end
end)

local function PlayerKilledByPlayer(killerServerId, killerClientId, deathCause)
	local victimCoords = GetEntityCoords(PlayerPedId())
	local killerCoords = GetEntityCoords(GetPlayerPed(killerClientId))
	local distance = #(victimCoords - killerCoords)

	local data = {
		victimCoords = { x = UgCore.Shared.Round(victimCoords.x, 1), y = UgCore.Shared.Round(victimCoords.y, 1), z = UgCore.Shared.Round(victimCoords.z, 1) },
		killerCoords = { x = UgCore.Shared.Round(killerCoords.x, 1), y = UgCore.Shared.Round(killerCoords.y, 1), z = UgCore.Shared.Round(killerCoords.z, 1) },

		killedByPlayer = true,
		deathCause = deathCause,
		distance = UgCore.Shared.Round(distance, 1),

		killerServerId = killerServerId,
		killerClientId = killerClientId
	}

	TriggerEvent('ug-core:OnPlayerDeath', data)
	TriggerServerEvent('ug-core:OnPlayerDeath', data)
end

local function PlayerKilled(deathCause)
	local playerPed = PlayerPedId()
	local victimCoords = GetEntityCoords(playerPed)

	local data = {
		victimCoords = { x = UgCore.Shared.Round(victimCoords.x, 1), y = UgCore.Shared.Round(victimCoords.y, 1), z = UgCore.Shared.Round(victimCoords.z, 1) },

		killedByPlayer = false,
		deathCause = deathCause
	}

	TriggerEvent('ug-core:OnPlayerDeath', data)
	TriggerServerEvent('ug-core:OnPlayerDeath', data)
end

AddEventHandler('gameEventTriggered', function(event, data)
	if event ~= 'CEventNetworkEntityDamage' then return end
	local victim, victimDied = data[1], data[4]
	if not IsPedAPlayer(victim) then return end
	local player = PlayerId()
	local playerPed = PlayerPedId()
	if victimDied and NetworkGetPlayerIndexFromPed(victim) == player and (IsPedDeadOrDying(victim, true) or IsPedFatallyInjured(victim)) then
		local killerEntity, deathCause = GetPedSourceOfDeath(playerPed), GetPedCauseOfDeath(playerPed)
		local killerClientId = NetworkGetPlayerIndexFromPed(killerEntity)
		if killerEntity ~= playerPed and killerClientId and NetworkIsPlayerActive(killerClientId) then
			PlayerKilledByPlayer(GetPlayerServerId(killerClientId), killerClientId, deathCause)
		else
			PlayerKilled(deathCause)
		end
	end
end)

RegisterNetEvent('ug-core:RequestModel', function (model)
    UgCore.Functions.RequestModel(model)
end)

RegisterNetEvent('ug-core:PlayerLoaded', function (player, isNew, skin)
    UgCore.PlayerData = player
    if UgCore.Dependencies.MultiCharacter then
        Wait(3000)
    else
        exports['spawnmanager']:spawnPlayer({
			x           = UgCore.PlayerData.coords.x,
            y           = UgCore.PlayerData.coords.y,
            z           = UgCore.PlayerData.coords.z + 0.25,
            heading     = UgCore.PlayerData.coords.h,
            model       = `mp_m_freemode_01`,
            skipFade    = false
        }, function ()
            TriggerServerEvent('ug-core:OnPlayerSpawn')
            TriggerEvent('ug-core:OnPlayerSpawn')
            TriggerEvent('ug-core:RestoreLoadout')
            if isNew then
                TriggerEvent('ug-skinChanger:LoadDefaultModel', skin.sex == 0)
			elseif skin then
                TriggerEvent('ug-skinChanger:LoadSkin', skin)
            end
            TriggerEvent('ug-core:LoadingScreenOFF')
            ShutdownLoadingScreen()
            ShutdownLoadingScreenNui()
        end)
    end
	
    UgCore.PlayerLoaded = true
	
    while UgCore.PlayerData.ped == nil do 
        Wait(20)
    end
	
    if UgCore.Config.Core.Others.PVP then
        SetCanAttackFriendly(UgCore.PlayerData.ped, true, false)
        NetworkSetFriendlyFireOption(true)
    end
	
    local playerId = PlayerId()
    local metadata = UgCore.PlayerData.metadata
    if metadata.health then
        SetEntityHealth(UgCore.PlayerData.ped, metadata.health)
    end
	
    if metadata.armor and metadata.armor > 0 then
        SetPedArmour(UgCore.PlayerData.ped, metadata.armor)
    end
	
    for i = 1, #UgCore.Config.Core.Others.HUDComponents do
        if not UgCore.Config.Core.Others.HUDComponents[i] then
            SetHudComponentPosition(i, 9999999.0, 9999999.0)
        end
    end
	
    if not UgCore.Config.Core.Others.Flags.NPCDrops then
        local weaponPickups = { `PICKUP_WEAPON_CARBINERIFLE`, `PICKUP_WEAPON_PISTOL`, `PICKUP_WEAPON_PUMPSHOTGUN` }
		for i = 1, #weaponPickups do
			ToggleUsePickupsForPlayer(playerId, weaponPickups[i], false)
		end
    end
	
    if not UgCore.Config.Core.Others.Flags.VehicleSeat then
        AddEventHandler('ug-core:EnteredVehicle', function(vehicle, _, seat)
			if seat == 0 then
				SetPedIntoVehicle(UgCore.PlayerData.ped, vehicle, 0)
				SetPedConfigFlag(UgCore.PlayerData.ped, 184, true)
			end
		end)
    end
	
    if not UgCore.Config.Core.Others.Flags.HealthRegeneration then
        SetPlayerHealthRechargeMultiplier(playerId, 0.0)
    end
	
    if not UgCore.Config.Core.Others.Flags.DispatchServices then
        for i = 1, 15 do
            EnableDispatchService(i, false)
        end
    end
	
    if not UgCore.Config.Core.Others.Flags.Scenarios then
        local scenarios = {
			'WORLD_VEHICLE_ATTRACTOR',
			'WORLD_VEHICLE_AMBULANCE',
			'WORLD_VEHICLE_BICYCLE_BMX',
			'WORLD_VEHICLE_BICYCLE_BMX_BALLAS',
			'WORLD_VEHICLE_BICYCLE_BMX_FAMILY',
			'WORLD_VEHICLE_BICYCLE_BMX_HARMONY',
			'WORLD_VEHICLE_BICYCLE_BMX_VAGOS',
			'WORLD_VEHICLE_BICYCLE_MOUNTAIN',
			'WORLD_VEHICLE_BICYCLE_ROAD',
			'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
			'WORLD_VEHICLE_BIKER',
			'WORLD_VEHICLE_BOAT_IDLE',
			'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
			'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
			'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
			'WORLD_VEHICLE_BROKEN_DOWN',
			'WORLD_VEHICLE_BUSINESSMEN',
			'WORLD_VEHICLE_HELI_LIFEGUARD',
			'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
			'WORLD_VEHICLE_CONSTRUCTION_SOLO',
			'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
			'WORLD_VEHICLE_DRIVE_PASSENGERS',
			'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
			'WORLD_VEHICLE_DRIVE_SOLO',
			'WORLD_VEHICLE_FIRE_TRUCK',
			'WORLD_VEHICLE_EMPTY',
			'WORLD_VEHICLE_MARIACHI',
			'WORLD_VEHICLE_MECHANIC',
			'WORLD_VEHICLE_MILITARY_PLANES_BIG',
			'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
			'WORLD_VEHICLE_PARK_PARALLEL',
			'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
			'WORLD_VEHICLE_PASSENGER_EXIT',
			'WORLD_VEHICLE_POLICE_BIKE',
			'WORLD_VEHICLE_POLICE_CAR',
			'WORLD_VEHICLE_POLICE',
			'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
			'WORLD_VEHICLE_QUARRY',
			'WORLD_VEHICLE_SALTON',
			'WORLD_VEHICLE_SALTON_DIRT_BIKE',
			'WORLD_VEHICLE_SECURITY_CAR',
			'WORLD_VEHICLE_STREETRACE',
			'WORLD_VEHICLE_TOURBUS',
			'WORLD_VEHICLE_TOURIST',
			'WORLD_VEHICLE_TANDL',
			'WORLD_VEHICLE_TRACTOR',
			'WORLD_VEHICLE_TRACTOR_BEACH',
			'WORLD_VEHICLE_TRUCK_LOGS',
			'WORLD_VEHICLE_TRUCKS_TRAILERS',
			'WORLD_VEHICLE_DISTANT_EMPTY_GROUND',
			'WORLD_HUMAN_PAPARAZZI'
		}
		
		for _, v in pairs(scenarios) do
			SetScenarioTypeEnabled(v, false)
		end
    end
	
    SetDefaultVehicleNumberPlateTextPattern(-1, UgCore.Config.Core.Plates.CustomPlate)
	StartServerSyncLoops()
end)

RegisterNetEvent('ug-core:OnPlayerLogout', function ()
    UgCore.PlayerLoaded = false
end)

RegisterNetEvent('ug-core:SetMaxWeight', function (newMaxWeight)
    UgCore.Functions.SetPlayerData('maxWeight', newMaxWeight) 
end)

local function OnPlayerSpawn()
	UgCore.Functions.SetPlayerData('ped', PlayerPedId())
	UgCore.Functions.SetPlayerData('dead', false)
end

AddEventHandler('playerSpawned', OnPlayerSpawn)
AddEventHandler('ug-core:OnPlayerSpawn', OnPlayerSpawn)

AddEventHandler('ug-core:OnPlayerDeath', function ()
    UgCore.Functions.SetPlayerData('ped', PlayerPedId())
    UgCore.Functions.SetPlayerData('dead', true)
end)

AddEventHandler('ug-skinChanger:ModelLoaded', function ()
    while not UgCore.PlayerLoaded do
		Wait(100)
	end
	TriggerEvent('ug-core:RestoreLoadout')
end)

AddEventHandler('ug-core:RestoreLoadout', function()
	UgCore.Functions.SetPlayerData('ped', PlayerPedId())

	local ammoTypes = {}
	RemoveAllPedWeapons(UgCore.PlayerData.ped, true)
	for _, v in ipairs(UgCore.PlayerData.loadout) do
		local weaponName = v.name
		local weaponHash = joaat(weaponName)
		GiveWeaponToPed(UgCore.PlayerData.ped, weaponHash, 0, false, false)
		SetPedWeaponTintIndex(UgCore.PlayerData.ped, weaponHash, v.tintIndex)
		local ammoType = GetPedAmmoTypeFromWeapon(UgCore.PlayerData.ped, weaponHash)
		for _, v2 in ipairs(v.components) do
			local componentHash = UgCore.Shared.GetWeaponComponent(weaponName, v2).hash
			GiveWeaponComponentToPed(UgCore.PlayerData.ped, weaponHash, componentHash)
		end
		if not ammoTypes[ammoType] then
			AddAmmoToPed(UgCore.PlayerData.ped, weaponHash, v.ammo)
			ammoTypes[ammoType] = true
		end
	end
end)

AddStateBagChangeHandler('VehicleProperties', nil, function (bagName, _, value)
    if not value then return end

    local netId = bagName:gsub('entity:', '')
    local timer = GetGameTimer()
	while not NetworkDoesEntityExistWithNetworkId(tonumber(netId)) do
		Wait(0)
		if GetGameTimer() - timer > 10000 then
			return
		end
	end

	local vehicle = NetToVeh(tonumber(netId))
	local timer2 = GetGameTimer()
	while NetworkGetEntityOwner(vehicle) ~= PlayerId() do
		Wait(0)
		if GetGameTimer() - timer2 > 10000 then
			return
		end
	end

	UgCore.Functions.SetVehicleProperties(vehicle, value)
end)

RegisterNetEvent('ug-core:SetMoney', function (account)
	for i = 1, #UgCore.PlayerData.accounts do
		if UgCore.PlayerData.accounts[i].name == account.name then
			UgCore.PlayerData.accounts[i] = account
			break
		end
	end

	UgCore.Functions.SetPlayerData('accounts', UgCore.PlayerData.accounts)
end)

RegisterNetEvent('ug-core:GiveItem', function (item)
	for k, v in ipairs(UgCore.PlayerData.inventory) do
		if v.name == item then
			UgCore.PlayerData.inventory[k].count = count
			break
		end
	end
end)

RegisterNetEvent('ug-core:RemoveItem', function (item, count, showNotification)
	for k, v in ipairs(UgCore.PlayerData.inventory) do
		if v.name == item then
			UgCore.PlayerData.inventory[k].count = count
			break
		end
	end
end)

RegisterNetEvent('ug-core:SetWeaponTint', function (weapon, weaponTintIndex)
	SetPedWeaponTintIndex(UgCore.PlayerData.ped, joaat(weapon), weaponTintIndex)
end)

RegisterNetEvent('ug-core:RemoveWeaponComponent')
AddEventHandler('ug-core:RemoveWeaponComponent', function(weapon, weaponComponent)
	local componentHash = UgCore.Shared.GetWeaponComponent(weapon, weaponComponent).hash
	RemoveWeaponComponentFromPed(UgCore.PlayerData.ped, joaat(weapon), componentHash)
end)

RegisterNetEvent('ug-core:SetJob', function (job)
    UgCore.Functions.SetPlayerData('job', job)
end)

RegisterNetEvent('ug-core:CreatePickup', function (pickupId, label, coords, itemType, name, components, tintIndex)
	local function SetObjectProperties(object)
		SetEntityAsMissionEntity(object, true, false)
		PlaceObjectOnGroundProperly(object)
		FreezeEntityPosition(object, true)
		SetEntityCollision(object, false, true)
		UgCore.Pickups[pickupId] = {
			obj = object,
			label = label,
			inRange = false,
			coords = coords
		}
	end
	if itemType == 'item_weapon' then
		local weaponHash = joaat(name)
		UgCore.Functions.RequestWeaponAsset(weaponHash)
		local pickupObject = CreateWeaponObject(weaponHash, 50, coords.x, coords.y, coords.z, true, 1.0, 0)
		SetWeaponObjectTintIndex(pickupObject, tintIndex)
		for _, v in ipairs(components) do
			local component = UgCore.Shared.GetWeaponComponent(name, v)
			GiveWeaponComponentToWeaponObject(pickupObject, component.hash)
		end
		SetObjectProperties(pickupObject)
	else
		UgCore.Functions.CreateObject('prop_money_bag_01', coords, SetObjectProperties)
	end
end)

RegisterNetEvent('ug-core:RemovePickup', function (pickupId)
	if UgCore.Pickups[pickupId] and UgCore.Pickups[pickupId].obj then
		UgCore.Functions.DeleteObject(UgCore.Pickups[pickupId].obj)
		UgCore.Pickups[pickupId] = nil
	end
end)

RegisterNetEvent('ug-core:CreateMissingPickups', function (missingPickups)
	for pickupId, pickup in pairs(missingPickups) do
		TriggerEvent('ug-core:CreatePickup', pickupId, pickup.label, vector3(pickup.coords.x, pickup.coords.y, pickup.coords.z - 1.0), pickup.type, pickup.name, pickup.components, pickup.tintIndex)
	end
end)

RegisterNetEvent('ug-core:RegisterSuggestions', function (registeredCommands)
	for name, command in pairs(registeredCommands) do
		if command.suggestion then
			TriggerEvent('chat:addSuggestion', ('/%s'):format(name), command.suggestion.help, command.suggestion.arguments)
		end
	end
end)

AddStateBagChangeHandler('metadata', 'player:' .. tostring(GetPlayerServerId(PlayerId())), function(_, key, val)
	UgCore.Functions.SetPlayerData(key, val)
end)

RegisterNetEvent('ug-core:Notify', function (title, message, type, length)
	return UgCore.Functions.Notify(title, message, type, length)
end)

if UgCore.Config.Core.Debug.Enabled then
    AddEventHandler('ug-core:PlayerPedChanged', function(netId)
        print('ug-core:PlayerPedChanged', netId)
    end)

    AddEventHandler('ug-core:PlayerJumping', function()
        print('ug-core:PlayerJumping')
    end)

    AddEventHandler('ug-core:EnteringVehicle', function(vehicle, plate, seat, netId)
        print('ug-core:EnteringVehicle', 'vehicle', vehicle, 'plate', plate, 'seat', seat, 'netId', netId)
    end)

    AddEventHandler('ug-core:EnteringVehicleAborted', function()
        print('ug-core:EnteringVehicleAborted')
    end)

    AddEventHandler('ug-core:EnteredVehicle', function(vehicle, plate, seat, displayName, netId)
        print('ug-core:EnteredVehicle', 'vehicle', vehicle, 'plate', plate, 'seat', seat, 'displayName', displayName, 'netId', netId)
    end)

    AddEventHandler('ug-core:ExitedVehicle', function(vehicle, plate, seat, displayName, netId)
        print('ug-core:ExitedVehicle', 'vehicle', vehicle, 'plate', plate, 'seat', seat, 'displayName', displayName, 'netId', netId)
    end)
end

function StartServerSyncLoops()
    CreateThread(function()
        local currentWeapon = { Ammo = 0 }
        while UgCore.PlayerLoaded do
            local sleep = 1500
            if GetSelectedPedWeapon(UgCore.PlayerData.ped) ~= -1569615261 then
                sleep = 1000
                local _, weaponHash = GetCurrentPedWeapon(UgCore.PlayerData.ped, true)
                local weapon = UgCore.Shared.GetWeaponFromHash(weaponHash)
                if weapon then
                    local ammoCount = GetAmmoInPedWeapon(UgCore.PlayerData.ped, weaponHash)
                    if weapon.name ~= currentWeapon.name then
                        currentWeapon.Ammo = ammoCount
                        currentWeapon.name = weapon.name
                    else
                        if ammoCount ~= currentWeapon.Ammo then
                            currentWeapon.Ammo = ammoCount
                            TriggerServerEvent('ug-core:UpdateWeaponAmmo', weapon.name, ammoCount)
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
end