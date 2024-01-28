if UgCore.Dependencies.MultiCharacter then
    AddEventHandler('ug-core:OnPlayerJoined', function (source, char, data)
        while not next(UgCore.Jobs) do
            Wait(50)
        end

        if not UgCore.Players[source] then
            local identifier = char .. ':' .. UgCore.Functions.GetIdentifier(source)
            if data then
                UgCore.Player.CreateNewPlayer(identifier, source, data)    
            else
                UgCore.Player.LoadPlayer(identifier, source, false)
            end
        end
    end)
else
    RegisterNetEvent('ug-core:OnPlayerJoined')
	AddEventHandler('ug-core:OnPlayerJoined', function()
		local src = source
		while not next(UgCore.Jobs) do
			Wait(50)
		end

		if not UgCore.Players[src] then
			UgCore.Player.PlayerJoined(src)
		end
	end)
end

if not UgCore.Dependencies.MultiCharacter then
	AddEventHandler('playerConnecting', function(_, _, deferrals)
		deferrals.defer()
		local playerId = source
		local identifier = UgCore.Functions.GetIdentifier(playerId)
	
		if UgCore.OneSyncState == 'off' or UgCore.OneSyncState == 'legacy' then
			return UgCore.Functions.KickPlayer(playerId, 'UgCore', Languages.GetTranslation('onesync_required', UgCore.OneSyncState), nil, deferrals)
		end
	
		if not UgCore.DatabaseConnected then
			return UgCore.Functions.KickPlayer(playerId, 'UgCore', Languages.GetTranslation('database_connection_failed'), nil, deferrals)
		end
	
		if identifier then
			if UgCore.Functions.GetPlayerFromIdentifier(identifier) then
				return UgCore.Functions.KickPlayer(playerId, 'UgCore', Languages.GetTranslation('player_already_ingame'), nil, deferrals)
			else
				return deferrals.done()
			end
		else
			return UgCore.Functions.KickPlayer(playerId, 'UgCore', Languages.GetTranslation('identifier_missing'), nil, deferrals)
		end
	end)
end

AddEventHandler('chatMessage', function(playerId, _, message)
	local player = UgCore.Functions.GetPlayer(playerId)
	if message:sub(1, 1) == '/' and playerId > 0 then
		CancelEvent()
		local commandName = message:sub(1):gmatch("%w+")()
		player.Functions.Notify('Error', Languages.GetTranslation('commanderror_invalidcommand', commandName), 'error', 5000)
	end
end)

AddEventHandler('playerDropped', function(reason)
	local playerId = source
	local player = UgCore.Functions.GetPlayer(playerId)

	if player then
		TriggerEvent('ug-core:PlayerDropped', playerId, reason)
		local job = player.Functions.GetJob().name
		local currentJob = UgCore.JobsPlayerCount[job]
		UgCore.JobsPlayerCount[job] = ((currentJob and currentJob > 0) and currentJob or 1) - 1
		GlobalState[("%s:count"):format(job)] = UgCore.JobsPlayerCount[job]
		UgCore.PlayersByIdentifier[player.license] = nil
		UgCore.Player.SavePlayer(player, function()
			UgCore.Players[playerId] = nil
		end)
	end
end)

AddEventHandler('ug-core:PlayerLoaded', function(_, player)
	local job = player.Functions.GetJob().name
	local jobKey = ("%s:count"):format(job)	
	
	UgCore.JobsPlayerCount[job] = (UgCore.JobsPlayerCount[job] or 0) + 1
	GlobalState[jobKey] = UgCore.JobsPlayerCount[job]
end)

AddEventHandler('ug-core:SetJob', function(_, job, lastJob)
	local lastJobKey = ('%s:count'):format(lastJob.name)
	local jobKey = ('%s:count'):format(job.name)
	local currentLastJob = UgCore.JobsPlayerCount[lastJob.name]

	UgCore.JobsPlayerCount[lastJob.name] = ((currentLastJob and currentLastJob > 0) and currentLastJob or 1) - 1
	UgCore.JobsPlayerCount[job.name] = (UgCore.JobsPlayerCount[job.name] or 0) + 1

	GlobalState[lastJobKey] = UgCore.JobsPlayerCount[lastJob.name]
	GlobalState[jobKey] = UgCore.JobsPlayerCount[job.name]
end)

AddEventHandler('ug-core:PlayerLogout', function(playerId, cb)
	local player = UgCore.Functions.GetPlayer(playerId)
	if player then
		TriggerEvent('ug-core:PlayerDropped', playerId)

		UgCore.PlayersByIdentifier[player.identifier] = nil
		UgCore.Player.SavePlayer(player, function()
			UgCore.Players[playerId] = nil
			if cb then
				cb()
			end
		end)
	end
	TriggerClientEvent('ug-core:OnPlayerLogout', playerId)
end)

RegisterNetEvent('ug-core:UpdateWeaponAmmo')
AddEventHandler('ug-core:UpdateWeaponAmmo', function(weaponName, ammoCount)
	local player = UgCore.Functions.GetPlayer(source)
	if player then
		player.Functions.UpdateWeaponAmmo(weaponName, ammoCount)
	end
end)

RegisterNetEvent('ug-core:GiveItem')
AddEventHandler('ug-core:GiveItem', function(target, itemType, itemName, itemCount)
	local playerId = source
	local sourcePlayer = UgCore.Functions.GetPlayer(playerId)
	local targetPlayer = UgCore.Functions.GetPlayer(target)
	local distance = #(GetEntityCoords(GetPlayerPed(playerId)) - GetEntityCoords(GetPlayerPed(target)))
	if not sourcePlayer or not targetPlayer or distance > UgCore.Config.Core.Others.PlayerDistance then
		print(('[^3WARNING^7] Player Detected Cheating: ^5%s^7'):format(GetPlayerName(playerId)))
		return
	end
	if itemType == 'item_standard' then
		local sourceItem = sourcePlayer.Functions.GetInventoryItem(itemName)
		if itemCount > 0 and sourceItem.count >= itemCount then
			if targetPlayer.Functions.CanCarryItem(itemName, itemCount) then
				sourcePlayer.Functions.RemoveItem(itemName, itemCount)
				targetPlayer.Functions.GiveItem(itemName, itemCount)
				sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('gave_item', itemCount, sourceItem.label, targetPlayer.name), 'success', 5000)
				targetPlayer.Functions.Notify('Inventory', Languages.GetTranslation('received_item', itemCount, sourceItem.label, sourcePlayer.name), 'info', 5000)
			else
				sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('ex_inv_lim', targetPlayer.name), 'error', 5000)
			end
		else
			sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('imp_invalid_quantity'), 'error', 5000)
		end
	elseif itemType == 'item_account' then
		if itemCount > 0 and sourcePlayer.Functions.GetAccount(itemName).money >= itemCount then
			sourcePlayer.Functions.RemoveMoney(itemName, itemCount, "Gave to " .. targetPlayer.name)
			targetPlayer.Functions.GiveMoney(itemName, itemCount, "Received from " .. sourcePlayer.name)
			sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('gave_account_money', UgCore.Shared.Math.GroupDigits(itemCount), UgCore.Config.Money[itemName].Name, targetPlayer.name), 'success', 5000)
			targetPlayer.Functions.Notify('Inventory', Languages.GetTranslation('received_account_money', UgCore.Shared.Math.GroupDigits(itemCount), UgCore.Config.Money[itemName].Name, sourcePlayer.name), 'info', 5000)
		else
			sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('imp_invalid_amount'), 'error', 5000)
		end
	elseif itemType == 'item_weapon' then
		if sourcePlayer.Functions.HasWeapon(itemName) then
			local weaponLabel = UgCore.Shared.GetWeaponLabel(itemName)
			if not targetPlayer.Functions.HasWeapon(itemName) then
				local _, weapon = sourcePlayer.Functions.GetWeapon(itemName)
				local _, weaponObject = UgCore.Shared.GetWeapon(itemName)
				itemCount = weapon.ammo
				local weaponComponents = UgCore.Shared.Table.Clone(weapon.components)
				local weaponTint = weapon.tintIndex
				if weaponTint then
					targetPlayer.Functions.SetWeaponTint(itemName, weaponTint)
				end
				if weaponComponents then
					for _, v in pairs(weaponComponents) do
						targetPlayer.Functions.GiveWeaponComponent(itemName, v)
					end
				end
				sourcePlayer.Functions.RemoveWeapon(itemName)
				targetPlayer.Functions.GiveWeapon(itemName, itemCount)
				if weaponObject.ammo and itemCount > 0 then
					local ammoLabel = weaponObject.ammo.label
					sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('gave_weapon_withammo', weaponLabel, itemCount, ammoLabel, targetPlayer.name), 'success', 5000)
					targetPlayer.Functions.Notify('Inventory', Languages.GetTranslation('received_weapon_withammo', weaponLabel, itemCount, ammoLabel, sourcePlayer.name), 'info', 5000)
				else
					sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('gave_weapon', weaponLabel, targetPlayer.name), 'success', 5000)
					targetPlayer.Functions.Notify('Inventory', Languages.GetTranslation('received_weapon', weaponLabel, sourcePlayer.name), 'info', 5000)
				end
			else
				sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('gave_weapon_hasalready', targetPlayer.name, weaponLabel), 'success', 5000)
				targetPlayer.Functions.Notify('Inventory', Languages.GetTranslation('received_weapon_hasalready', sourcePlayer.name, weaponLabel), 'info', 5000)
			end
		end
	elseif itemType == 'item_ammo' then
		if sourcePlayer.Functions.HasWeapon(itemName) then
			local _, weapon = sourcePlayer.Functions.GetWeapon(itemName)
			if targetPlayer.Functions.HasWeapon(itemName) then
				local _, weaponObject = UgCore.Shared.GetWeapon(itemName)
				if weaponObject.ammo then
					local ammoLabel = weaponObject.ammo.label
					if weapon.ammo >= itemCount then
						sourcePlayer.Functions.RemoveWeaponAmmo(itemName, itemCount)
						targetPlayer.Functions.GiveWeaponAmmo(itemName, itemCount)
						sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('gave_weapon_ammo', itemCount, ammoLabel, weapon.label, targetPlayer.name), 'success', 5000)
						targetPlayer.Functions.Notify('Inventory', Languages.GetTranslation('received_weapon_ammo', itemCount, ammoLabel, weapon.label, sourcePlayer.name), 'info', 5000)
					end
				end
			else
				sourcePlayer.Functions.Notify('Inventory', Languages.GetTranslation('gave_weapon_noweapon', targetPlayer.name), 'success', 5000)
				targetPlayer.Functions.Notify('Inventory', Languages.GetTranslation('received_weapon_noweapon', sourcePlayer.name, weapon.label), 'info', 5000)
			end
		end
	end
end)

RegisterNetEvent('ug-core:RemoveItem')
AddEventHandler('ug-core:RemoveItem', function(itemType, itemName, itemCount)
	local playerId = source
	local player = UgCore.Functions.GetPlayer(playerId)
	if itemType == 'item_standard' then
		if itemCount == nil or itemCount < 1 then
			player.Functions.Notify('Inventory', Languages.GetTranslation('imp_invalid_quantity'))
		else
			local item = player.Functions.GetInventoryItem(itemName)
			if (itemCount > item.count or item.count < 1) then
				player.Functions.Notify('Inventory', Languages.GetTranslation('imp_invalid_quantity'))
			else
				player.Functions.RemoveItem(itemName, itemCount)
				local pickupLabel = ('%s [%s]'):format(item.label, itemCount)
				UgCore.Functions.CreatePickup('item_standard', itemName, itemCount, pickupLabel, playerId)
				player.Functions.Notify('Inventory', Languages.GetTranslation('threw_standard', itemCount, item.label), 'success', 5000)
			end
		end
	elseif itemType == 'item_account' then
		if itemCount == nil or itemCount < 1 then
			player.Functions.Notify('Inventory', Languages.GetTranslation('imp_invalid_amount'), 'error', 5000)
		else
			local account = player.Functions.GetAccount(itemName)
			if (itemCount > account.money or account.money < 1) then
				player.Functions.Notify('Inventory', Languages.GetTranslation('imp_invalid_amount'), 'error', 5000)
			else
				player.Functions.RemoveMoney(itemName, itemCount, "Threw away")
				local pickupLabel = ('%s [%s]'):format(account.label, Languages.GetTranslation('locale_currency', UgCore.Shared.Math.GroupDigits(itemCount)))
				UgCore.Functions.CreatePickup('item_account', itemName, itemCount, pickupLabel, playerId)
				player.Functions.Notify('Inventory', Languages.GetTranslation('threw_account', UgCore.Shared.Math.GroupDigits(itemCount), string.lower(account.label)), 'success', 5000)
			end
		end
	elseif itemType == 'item_weapon' then
		itemName = string.upper(itemName)
		if player.Functions.HasWeapon(itemName) then
			local _, weapon = player.Functions.GetWeapon(itemName)
			local _, weaponObject = UgCore.Shared.GetWeapon(itemName)
			local components, pickupLabel = UgCore.Shared.Table.Clone(weapon.components)
			player.removeWeapon(itemName)
			if weaponObject.ammo and weapon.ammo > 0 then
				local ammoLabel = weaponObject.ammo.label
				pickupLabel = ('%s [%s %s]'):format(weapon.label, weapon.ammo, ammoLabel)
				player.Functions.Notify('Inventory', Languages.GetTranslation('threw_weapon_ammo', weapon.label, weapon.ammo, ammoLabel), 'success', 5000)
			else
				pickupLabel = ('%s'):format(weapon.label)
				player.Functions.Notify('Inventory', Languages.GetTranslation('threw_weapon', weapon.label), 'success', 5000)
			end
			UgCore.Functions.CreatePickup('item_weapon', itemName, weapon.ammo, pickupLabel, playerId, components, weapon.tintIndex)
		end
	end
end)

RegisterNetEvent('ug-core:UseItem')
AddEventHandler('ug-core:UseItem', function (itemName)
	local source = source
	local player = UgCore.Functions.GetPlayer(source)
	local count = player.Functions.GetInventoryItem(itemName).count
	if count > 0 then
		UgCore.Functions.UseItem(source, itemName)
	else
		player.Functions.Notify('Inventory', Languages.GetTranslation('act_imp'), 'error', 5000)
	end
end)

RegisterNetEvent('ug-core:OnPickup')
AddEventHandler('ug-core:OnPickup', function(pickupId)
	local pickup, player, success = UgCore.Pickups[pickupId], UgCore.Functions.GetPlayer(source)
	if pickup then
		local playerPickupDistance = #(pickup.coords - player.Functions.GetCoords(true))
		if (playerPickupDistance > 5.0) then
			print(('[^3WARNING^7] Player Detected Cheating (Out of range pickup): ^5%s^7'):format(player.getIdentifier()))
			return
		end
		if pickup.type == 'item_standard' then
			if player.Functions.CanCarryItem(pickup.name, pickup.count) then
				player.Functions.GiveItem(pickup.name, pickup.count)
				success = true
			else
				player.Functions.Notify('Inventory', Languages.GetTranslation('threw_cannot_pickup'), 'error', 5000)
			end
		elseif pickup.type == 'item_account' then
			success = true
			player.Functions.GiveMoney(pickup.name, pickup.count, "Picked up")
		elseif pickup.type == 'item_weapon' then
			if player.Functions.HasWeapon(pickup.name) then
				player.Functions.Notify('Inventory', Languages.GetTranslation('threw_weapon_already'), 'error', 5000)
			else
				success = true
				player.Functions.GiveWeapon(pickup.name, pickup.count)
				player.Functions.SetWeaponTint(pickup.name, pickup.tintIndex)
				for _, v in ipairs(pickup.components) do
					player.Functions.GiveWeaponComponent(pickup.name, v)
				end
			end
		end
		if success then
			UgCore.Pickups[pickupId] = nil
			TriggerClientEvent('ug-core:RemovePickup', -1, pickupId)
		end
	end
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
	if eventData.secondsRemaining == 60 then
		CreateThread(function()
			Wait(50000)
			UgCore.Player.SavePlayers()
		end)
	end
end)

AddEventHandler('txAdmin:events:serverShuttingDown', function()
	UgCore.Player.SavePlayers()
end)

local DoNotUse = {
    ['es_extended'] = true,
	['essentialmode'] = true,
	['es_admin2'] = true,
	['basic-gamemode'] = true,
	['mapmanager'] = true,
	['fivem-map-skater'] = true,
	['fivem-map-hipster'] = true,
	['qb-core'] = true,
	['default_spawnpoint'] = true
}

AddEventHandler('onResourceStart', function(key)
	if DoNotUse[string.lower(key)] then
		while GetResourceState(key) ~= 'started' do
			Wait(0)
		end

		StopResource(key)
		error(('Unsupported resource started. Please remove the resource "%s".'):format(key))
	end
	UgCore.Functions.SendLogFields('Resources', 'Resource Started', 'A resource has been started!', 'green', {
		{ name = 'Resource', value = key, inline = false }
	})
end)

AddEventHandler('onResourceStop', function (key)
	UgCore.Functions.SendLogFields('Resources', 'Resource Stopped', 'A resource has been stopped!', 'red', {
		{ name = 'Resource', value = key, inline = false }
	})
end)

for key in pairs(DoNotUse) do
	if GetResourceState(key) == 'started' or GetResourceState(key) == 'starting' then
		StopResource(key)
		error(('Unsupported resource started. Please remove the resource "%s", or it will break ug-core.'):format(key))
	end
end

RegisterServerEvent('ug-core:PlayerPedChanged')
RegisterServerEvent('ug-core:PlayerJumping')
RegisterServerEvent('ug-core:EnteringVehicle')
RegisterServerEvent('ug-core:EnteringVehicleAborted')
RegisterServerEvent('ug-core:EnteredVehicle')
RegisterServerEvent('ug-core:ExitedVehicle')

if UgCore.Config.Core.Debug.Enabled then
    AddEventHandler('ug-core:PlayerPedChanged', function(netId)
        print('ug-core:PlayerPedChanged', source, netId)
    end)

    AddEventHandler('ug-core:PlayerJumping', function()
        print('ug-core:PlayerJumping', source)
    end)

    AddEventHandler('ug-core:EnteringVehicle', function(plate, seat, netId)
        print('ug-core:EnteringVehicle', 'source', source, 'plate', plate, 'seat', seat, 'netId', netId)
    end)

    AddEventHandler('ug-core:EnteringVehicleAborted', function()
        print('ug-core:EEnteringVehicleAborted', source)
    end)

    AddEventHandler('ug-core:EnteredVehicle', function(plate, seat, displayName, netId)
        print('ug-core:EnteredVehicle', 'source', source, 'plate', plate, 'seat', seat, 'displayName', displayName, 'netId', netId)
    end)

    AddEventHandler('ug-core:ExitedVehicle', function(plate, seat, displayName, netId)
        print('ug-core:ExitedVehicle', 'source', source, 'plate', plate, 'seat', seat, 'displayName', displayName, 'netId', netId)
    end)
end

RegisterNetEvent('ug-core:ReturnVehicleType', function(Type, Request)
	if UgCore.ClientCallbacks[Request] then
		UgCore.ClientCallbacks[Request](Type)
		UgCore.ClientCallbacks[Request] = nil
	end
end)

local function StartDBSync()
	CreateThread(function()
		local interval <const> = 10 * 60 * 1000
		while true do
			Wait(interval)
			UgCore.Player.SavePlayers()
		end
	end)
end

MySQL.ready(function()
	UgCore.DatabaseConnected = true
	local items = MySQL.query.await('SELECT * FROM items')
	for _, v in ipairs(items) do
		UgCore.Items[v.name] = { label = v.label, weight = v.weight, rare = v.rare, canRemove = v.canRemove }
	end
	UgCore.Functions.RefreshJobs()
	print('^7[ug-core]: ====================================')
	print('^7[ug-core]: Framework Started Successfully!')
	print('^7[ug-core]: ')
	print('^7[ug-core]: Copyright (C) 2024 UgDev, Inc.')
	print('^7[ug-core]: All Rights Reserved!')
	print('^7[ug-core]: ====================================')
	StartDBSync()
end)