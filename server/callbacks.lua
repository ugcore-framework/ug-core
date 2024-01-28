local serverCallbacks   = { }

local clientRequests    = { }
local RequestId         = 0

UgCore.Callbacks 		= { }

function UgCore.Callbacks.CreateCallback(eventName, callback)
	serverCallbacks[eventName] = callback
end

RegisterNetEvent('ug-core:TriggerServerCallback', function(eventName, requestId, invoker, ...)
	if not serverCallbacks[eventName] then
		return error(('Server Callback "%s" (called by "%s") does not exists!'):format(eventName, invoker))
	end

	local source = source

	serverCallbacks[eventName](source, function(...)
		TriggerClientEvent('ug-core:ServerCallback', source, requestId, invoker, ...)
	end, ...)
end)

function UgCore.Callbacks.TriggerCallback(player, eventName, callback, ...)
	clientRequests[RequestId] = callback
	TriggerClientEvent('ug-core:TriggerClientCallback', player, eventName, RequestId, GetInvokingResource() or "Unknown", ...)
	RequestId = RequestId + 1
end

RegisterNetEvent('ug-core:ClientCallback', function(requestId, invoker, ...)
	if not clientRequests[requestId] then
		return error(('Client Callback ID "%s" (called by "%s") does not exists!'):format(requestId, invoker))
	end
	clientRequests[requestId](...)
	clientRequests[requestId] = nil
end)

UgCore.Callbacks.CreateCallback('ug-core:GetPlayerData', function(source, cb)
	local player = UgCore.Functions.GetPlayer(source)

	cb({
		identifier = player.identifier,
		accounts = player.Functions.GetAccounts(),
		inventory = player.Functions.GetInventory(),
		job = player.Functions.GetJob(),
		loadout = player.Functions.GetLoadout(),
		cash = player.Functions.GetCash(),
		position = player.Functions.GetCoords(true),
		metadata = player.Functions.GetMetaData()
	})
end)

UgCore.Callbacks.CreateCallback('ug-core:IsUserAdmin', function(source, cb)
	cb(UgCore.Functions.IsPlayerAdmin(source))
end)

UgCore.Callbacks.CreateCallback('ug-core:GetGameBuild', function(_, cb)
	cb(tonumber(GetConvar('sv_enforceGameBuild', 1604)))
end)

UgCore.Callbacks.CreateCallback('ug-core:GetOtherPlayerData', function(_, cb, target)
	local player = UgCore.Functions.GetPlayer(target)

	cb({
		identifier = player.identifier,
		accounts = player.Functions.GetAccounts(),
		inventory = player.Functions.GetInventory(),
		job = player.Functions.GetJob(),
		loadout = player.Functions.GetLoadout(),
		cash = player.Functions.GetCash(),
		position = player.Functions.GetCoords(true),
		metadata = player.Functions.GetMetaData()
	})
end)

UgCore.Callbacks.CreateCallback('ug-core:GetPlayerNames', function(source, cb, players)
	players[source] = nil

	for playerId, _ in pairs(players) do
		local player = UgCore.Functions.GetPlayer(playerId)

		if player then
			players[playerId] = player.Functions.GetName()
		else
			players[playerId] = nil
		end
	end

	cb(players)
end)

UgCore.Callbacks.CreateCallback('ug-core:CreateVehicle', function(source, cb, vehData)
	local ped = GetPlayerPed(source)
	UgCore.OneSync.Functions.CreateVehicle(vehData.model or `ADDER`, vehData.coords or GetEntityCoords(ped), vehData.coords.w or 0.0, vehData.props or {}, function(id)
		if vehData.warp then
			local vehicle = NetworkGetEntityFromNetworkId(id)
			local timeout = 0
			while GetVehiclePedIsIn(ped, false) ~= vehicle and timeout <= 15 do
				Wait(0)
				TaskWarpPedIntoVehicle(ped, vehicle, -1)
				timeout += 1
			end
		end
		cb(id)
	end)
end)