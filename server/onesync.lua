UgCore.OneSync              = { }
UgCore.OneSync.Functions    = { }

local function GetNearbyPlayers(source, closest, distance, ignore)
    local result = { }
	local count = 0
    local playerPed
    local playerCoords

	if not distance then distance = 100 end

	if type(source) == 'number' then
		playerPed = GetPlayerPed(source)
        
		if not source then
			error("Received invalid first argument (source); should be playerId")
            return result
		end

		playerCoords = GetEntityCoords(playerPed)

        if not playerCoords then
            error("Received nil value (playerCoords); perhaps source is nil at first place?")
            return result
        end
	end

	if type(source) == 'vector3' then
		playerCoords = source

		if not playerCoords then
            error("Received nil value (playerCoords); perhaps source is nil at first place?")
            return result
        end
	end

	for _, player in pairs(UgCore.Players) do
		if not ignore or not ignore[player.source] then
			local entity = GetPlayerPed(player.source)
			local coords = GetEntityCoords(entity)

			if not closest then
				local dist = #(playerCoords - coords)
				if dist <= distance then
					count = count + 1
					result[count] = { 
                        ID = player.source, 
                        ped = NetworkGetNetworkIdFromEntity(entity), 
                        coords = coords, 
                        dist = dist 
                    }
				end
			else
                if player.source ~= source then
				    local dist = #(playerCoords - coords)
				    if dist <= (result.dist or distance) then
					    result = { 
                            ID = player.source, 
                            ped = NetworkGetNetworkIdFromEntity(entity), 
                            coords = coords, 
                            dist = dist 
                        }
				    end
                end
			end
		end
	end
	return result
end

local function GetNearbyEntities(entities, coords, modelFilter, maxDistance, isPed)
	local nearbyEntities = { }
	coords = type(coords) == 'number' and GetEntityCoords(GetPlayerPed(coords)) or vector3(coords.x, coords.y, coords.z)
	for _, entity in pairs(entities) do
		if not isPed or (isPed and not IsPedAPlayer(entity)) then
			if not modelFilter or modelFilter[GetEntityModel(entity)] then
				local entityCoords = GetEntityCoords(entity)
				if not maxDistance or #(coords - entityCoords) <= maxDistance then
					nearbyEntities[#nearbyEntities + 1] = NetworkGetNetworkIdFromEntity(entity)
				end
			end
		end
	end
	return nearbyEntities
end

local function GetClosestEntity(entities, coords, modelFilter, isPed)
	local distance, closestEntity, closestCoords = 100, nil, nil
	coords = type(coords) == 'number' and GetEntityCoords(GetPlayerPed(coords)) or vector3(coords.x, coords.y, coords.z)

	for _, entity in pairs(entities) do
		if not isPed or (isPed and not IsPedAPlayer(entity)) then
			if not modelFilter or modelFilter[GetEntityModel(entity)] then
				local entityCoords = GetEntityCoords(entity)
				local dist = #(coords - entityCoords)
				if dist < distance then
					closestEntity, distance, closestCoords = entity, dist, entityCoords
				end
			end
		end
	end
	return NetworkGetNetworkIdFromEntity(closestEntity), distance, closestCoords
end

function UgCore.OneSync.Functions.GetPlayersInArea(source, maxDistance, ignore)
    return GetNearbyPlayers(source, false, maxDistance, ignore)
end

function UgCore.OneSync.Functions.GetClosestPlayer(source, maxDistance, ignore)
    return GetNearbyPlayers(source, true, maxDistance, ignore)
end

function UgCore.OneSync.Functions.CreateVehicle(model, coords, heading, properties, cb)
    local vehicleModel = joaat(model)
	local vehicleProperties = properties

	CreateThread(function()
		local player = UgCore.OneSync.Functions.GetClosestPlayer(coords, 300)
		UgCore.Functions.GetVehicleType(vehicleModel, player.ID, function(vehicleType)
			if vehicleType then
				local createdVehicle = CreateVehicleServerSetter(vehicleModel, vehicleType, coords, heading)
				if not DoesEntityExist(createdVehicle) then
					return warn('This vehicle does not exists!')
				end

				local networkId = NetworkGetNetworkIdFromEntity(createdVehicle)
				Entity(createdVehicle).state:set('VehicleProperties', vehicleProperties, true)
				cb(networkId)
			else
				error('Tried to spawn invalid vehicle.')
			end
		end)
	end)
end

function UgCore.OneSync.Functions.CreateObject(model, coords, heading, cb)
    if type(model) == 'string' then model = joaat(model) end
	local objectCoords = type(coords) == "vector3" and coords or vector3(coords.x, coords.y, coords.z)
	CreateThread(function()
		local entity = CreateObject(model, objectCoords.x, objectCoords.y, objectCoords.z, true, true, false)
		while not DoesEntityExist(entity) do Wait(50) end
		SetEntityHeading(entity, heading)
		cb(NetworkGetNetworkIdFromEntity(entity))
	end)
end

function UgCore.OneSync.Functions.CreatePed(model, coords, heading, cb)
    if type(model) == 'string' then model = joaat(model) end
	CreateThread(function()
		local entity = CreatePed(0, model, coords.x, coords.y, coords.z, heading, true, true)
		while not DoesEntityExist(entity) do Wait(50) end
		cb(NetworkGetNetworkIdFromEntity(entity))
	end)
end

function UgCore.OneSync.Functions.CreatePedInVehicle(model, vehicle, seat, cb)
    if type(model) == 'string' then model = joaat(model) end
	CreateThread(function()
		local entity = CreatePedInsideVehicle(vehicle, 1, model, seat, true, true)
		while not DoesEntityExist(entity) do Wait(50) end
		cb(NetworkGetNetworkIdFromEntity(entity))
	end)
end

function UgCore.OneSync.Functions.GetPedsInArea(coords, maxDistance, modelFilter)
    return GetNearbyEntities(GetAllPeds(), coords, modelFilter, maxDistance, true)
end

function UgCore.OneSync.Functions.GetObjectsInArea(coords, maxDistance, modelFilter)
    return GetNearbyEntities(GetAllObjects(), coords, modelFilter, maxDistance)
end

function UgCore.OneSync.Functions.GetVehiclesInArea(coords, maxDistance, modelFilter)
    return GetNearbyEntities(GetAllVehicles(), coords, modelFilter, maxDistance)
end

function UgCore.OneSync.Functions.GetClosestPed(coords, modelFilter)
    return GetClosestEntity(GetAllPeds(), coords, modelFilter, true)
end

function UgCore.OneSync.Functions.GetClosestObject(coords, modelFilter)
    return GetClosestEntity(GetAllObjects(), coords, modelFilter)
end

function UgCore.OneSync.Functions.GetClosestVehicle(coords, modelFilter)
    return GetClosestEntity(GetAllVehicles(), coords, modelFilter)
end

UgCore.Callbacks.CreateCallback('ug-core:OneSync:CreateObject', function (_, cb, model, coords, heading)
    UgCore.OneSync.Functions.CreateObject(model, coords, heading, cb)
end)