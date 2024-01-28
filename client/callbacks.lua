local requestId 		= 0
local serverRequests 	= { }
local clientCallbacks	= { }

UgCore.Callbacks 		= { }

function UgCore.Callbacks.TriggerCallback(eventName, cb, ...)
	serverRequests[requestId] = cb
	TriggerServerEvent('ug-core:TriggerServerCallback', eventName, requestId, GetInvokingResource() or "unknown", ...)
	requestId = requestId + 1
end

function UgCore.Callbacks.CreateCallback(eventName, cb)
	clientCallbacks[eventName] = cb
end

RegisterNetEvent('ug-core:ServerCallback', function(requestId, invoker, ...)
	if not serverRequests[requestId] then
		return error(('The callback "%s" called by "%s" does not exists!'):format(requestId, invoker))
	end
	serverRequests[requestId](...)
	serverRequests[requestId] = nil
end)

RegisterNetEvent('ug-core:TriggerClientCallback', function(eventName, requestId, invoker, ...)
	if not clientCallbacks[eventName] then
		return error(('The callback "%s" called by "%s" does not exists!'):format(eventName, invoker))
	end

	clientCallbacks[eventName](function(...)
		TriggerServerEvent('ug-core:ClientCallback', requestId, invoker, ...)
	end, ...)
end)



-- Callbacks --

UgCore.Callbacks.CreateCallback('ug-core:GetVehicleType', function(cb, model)
	cb(UgCore.Functions.GetVehicleType(model))
end)