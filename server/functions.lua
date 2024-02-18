UgCore.Functions = { }

function UgCore.Functions.KickPlayer(source, author, reason, setKickReason, deferrals)
    CreateThread(function()
        if deferrals then
            deferrals.done(string.format(UgCore.Config.Messages.ErrorMessage, reason))
            Wait(2500)
        end
        if source then
            DropPlayer(source, string.format(UgCore.Config.Messages.KickMessage, reason, author))
        end
        for _ = 0, 4 do
            while true do
                if source then
                    if GetPlayerPing(source) >= 0 then
                        break
                    end
                    Wait(100)
                    CreateThread(function()
                        DropPlayer(source, string.format(UgCore.Config.Messages.KickMessage, reason, author))
                    end)
                end
            end
            Wait(5000)
        end
    end)
end

function UgCore.Functions.GetIdentifier(source)
    local identifier = GetPlayerIdentifierByType(source, 'license')
    return identifier and identifier:gsub('license:', '')
end

function UgCore.Functions.GetPlayers()
    return GetPlayers()
end

local function CheckTable(key, val, player, xPlayers)
	for valIndex = 1, #val do
		local value = val[valIndex]
		if not xPlayers[value] then
			xPlayers[value] = {}
		end

		if (key == 'job' and player.job.name == value) or player[key] == value then
			xPlayers[value][#xPlayers[value] + 1] = player
		end
	end
end

function UgCore.Functions.GetUgPlayers(key, value)
    local players = { }
    if type(value) == 'table' then
        for _, v in pairs(UgCore.Players) do
            CheckTable(key, value, v, players)
        end
    else
        for _, v in pairs(UgCore.Players) do
            if key then
                if (key == 'job' and v.job.name == value) or v[key] == value then
                    players[#players + 1] = v
                end
            else
                players[#players + 1] = v
            end
        end
    end
    return players
end

function UgCore.Functions.GetNumPlayers(key, value)
    if not key then
        return #GetPlayers()
    end

    if type(val) == 'table' then
        local numPlayers = {}
        if key == 'job' then
            for _, v in ipairs(val) do
                numPlayers[v] = (UgCore.JobsPlayerCount[v] or 0)
            end
            return numPlayers
        end
        local filteredPlayers = UgCore.Functions.GetUgPlayers(key, val)
        for i, v in pairs(filteredPlayers) do
            numPlayers[i] = (#v or 0)
        end
        return numPlayers
    end

    if key == 'job' then
        return (UgCore.JobsPlayerCount[val] or 0)
    end
    return #UgCore.Functions.GetUgPlayers(key, val)
end

function UgCore.Functions.GetPlayer(source)
    return UgCore.Players[tonumber(source)]
end

function UgCore.Functions.GetPlayerFromIdentifier(identifier)
    return UgCore.PlayersByIdentifier[identifier]
end

function UgCore.Functions.GetVehicleType(model, player, cb)
    model = type(model) == 'string' and joaat(model) or model

	if UgCore.VehicleTypesByModel[model] then
		return cb(UgCore.VehicleTypesByModel[model])
	end

	UgCore.Callbacks.TriggerCallback(player, 'ug-core:GetVehicleType', function (vehicleType)
		UgCore.VehicleTypesByModel[model] = vehicleType
		cb(vehicleType)
	end, model)
end

function UgCore.Functions.SendLog(type, title, message, color)
    if UgCore.Config.Core.Logs[type] then
        if UgCore.Config.Core.Logs[type].Enabled then
            local webhook = UgCore.Config.Core.Logs[type].Webhook
            local embedData = { {
                ['title'] = title,
                ['color'] = UgCore.Config.Core.Logs.Colors[color] or UgCore.Config.Core.Logs.Colors.default,
                ['footer'] = {
                    ['text'] = "🐌 - UgCore Logs - " .. os.date(),
                    ['icon_url'] = ""
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = "UgCore Framework by UgDev",
                    ['icon_url'] = ""
                }
            } }
            PerformHttpRequest(webhook, nil, 'POST', json.encode({
                username = 'UgCore Framework',
                embeds = embedData
            }), {
                ['Content-Type'] = 'application/json'
            })
        end
    else
        error(('Invalid Log Type "%s".'):format(type))
    end
end

function UgCore.Functions.SendLogFields(type, title, message, color, fields)
    if UgCore.Config.Core.Logs[type] then
        if UgCore.Config.Core.Logs[type].Enabled then
            local webhook = UgCore.Config.Core.Logs[type].Webhook
            local embedData = { {
                ['title'] = title,
                ['color'] = UgCore.Config.Core.Logs.Colors[color] or UgCore.Config.Core.Logs.Colors.default,
                ['footer'] = {
                    ['text'] = "🐌 - UgCore Logs - " .. os.date(),
                    ['icon_url'] = ""
                },
                ['fields'] = fields,
                ['description'] = message,
                ['author'] = {
                    ['name'] = "UgCore Framework by UgDev",
                    ['icon_url'] = ""
                }
            } }
            PerformHttpRequest(webhook, nil, 'POST', json.encode({
                username = 'UgCore Framework',
                embeds = embedData
            }), {
                ['Content-Type'] = 'application/json'
            })
        end
    else
        error(('Invalid Log Type "%s".'):format(type))
    end
end

function UgCore.Functions.CreateJob(name, label, grades)
    if not name then
		return error('Missing the job name (must be a string).')
	end

	if not label then
		return error('Missing the job label (must be a string).')
	end

	if not grades or not next(grades) then
		return error('Missing the job name (must be a table).')
	end

	local parameters = { }
	local job = { 
        name = name, 
        label = label, 
        grades = { } 
    }

	for _, v in pairs(grades) do
		job.grades[tostring(v.grade)] = { 
            jobName = name, 
            grade = v.grade, 
            name = v.name, 
            label = v.label, 
            salary = v.salary 
        }
        
		parameters[#parameters + 1] = { 
            name, 
            v.grade, 
            v.name, 
            v.label, 
            v.salary 
        }
	end

	MySQL.insert('INSERT IGNORE INTO `jobs` (`name`, `label`) VALUES (?, ?)', { name, label })
	MySQL.prepare('INSERT INTO `jobgrades` (`jobName`, `grade`, `name`, `label`, `salary`) VALUES (?, ?, ?, ?, ?)', parameters)

	UgCore.Jobs[name] = job
end

function UgCore.Functions.RefreshJobs()
    local Jobs = { }
	local jobs = MySQL.query.await('SELECT * FROM `jobs`')

	for _, v in ipairs(jobs) do
		Jobs[v.name] = v
		Jobs[v.name].grades = { }
	end

	local jobGrades = MySQL.query.await('SELECT * FROM `jobgrades`')

	for _, v in ipairs(jobGrades) do
		if Jobs[v.jobName] then
			Jobs[v.jobName].grades[tostring(v.grade)] = v
		else
			warn(('Ignoring job grades for "%s" due to missing job.'):format(v.jobName))
		end
	end

	for _, v in pairs(Jobs) do
		if UgCore.Shared.Table.SizeOf(v.grades) == 0 then
			Jobs[v.name] = nil
			warn(('Ignoring job "%s" due to missing job grades.'):format(v.name))
		end
	end

	if not Jobs then
		UgCore.Jobs['unemployed'] = { 
            label = 'Unemployed', 
            grades = { 
                ['0'] = { 
                    grade = 0, 
                    label = 'Unemployed', 
                    salary = 200, 
                } 
            } 
        }
	else
		UgCore.Jobs = Jobs
	end
end

function UgCore.Functions.RefreshItems()
    local Items = { }
    local items = MySQL.query.await('SELECT * FROM `items`')

    for _, v in pairs(items) do
        Items[v.name] = v
    end

    UgCore.Items = Items
end

function UgCore.Functions.CreateVehicle(model, coords, heading, properties, cb)
    return UgCore.OneSync.Functions.CreateVehicle(model, coords, heading, properties, cb)
end 

function UgCore.Functions.CreateItem(item, cb)
    UgCore.UsableItemsCallbacks[item] = cb
end

function UgCore.Functions.UseItem(source, item, ...)
    if UgCore.Items[item] then
		local itemCallback = UgCore.UsableItemsCallbacks[item]

		if itemCallback then
			local success, result = pcall(itemCallback, source, item, ...)

			if not success then
				return result and print(result) or error(('Error using item "%s". This was not caused by UgCore.'):format(item))
			end
		end
	else
		error(('Item "%s" used, but it does not exists.'):format(item))
	end
end

function UgCore.Functions.GetItemLabel(item)
	if UgCore.Items[item] then
		return UgCore.Items[item].label
	else
		error(('Item "%s" does not exists.'):format(item))
	end
end

function UgCore.Functions.GetJobs()
    return UgCore.Jobs
end

function UgCore.Functions.GetItems()
    local usables = { }
	for k in pairs(UgCore.UsableItemsCallbacks) do
		usables[k] = true
	end
	return usables
end

function UgCore.Functions.CreatePickup(itemType, name, count, label, playerId, components, tintIndex, coords)
    local pickupId = (UgCore.PickupId == 65635 and 0 or UgCore.PickupId + 1)
    local player = UgCore.Players[playerId]
    coords = ( (type(coords) == "vector3" or type(coords) == "vector4") and coords.xyz or player.Functions.GetCoords(true))

    UgCore.Pickups[pickupId] = { 
        type = itemType, 
        name = name, 
        count = count, 
        label = label, 
        coords = coords 
    }

    if itemType == 'item_weapon' then
        UgCore.Pickups[pickupId].components = components
        UgCore.Pickups[pickupId].tintIndex = tintIndex
    end

    TriggerClientEvent('ug-core:CreatePickup', -1, pickupId, label, coords, itemType, name, components, tintIndex)
    UgCore.PickupId = pickupId
end

function UgCore.Functions.DoesJobExists(job, grade)
    grade = tostring(grade)
	if job and grade then
		if UgCore.Jobs[job] and UgCore.Jobs[job].grades[grade] then
			return true
		end
	end
	return false
end

function UgCore.Functions.IsPlayerAdmin(playerId)
    if (IsPlayerAceAllowed(playerId, 'command') or GetConvar('sv_lan', '') == true) and true or false then return true end
    local player = UgCore.Players[playerId]
    if player then
        if UgCore.Config.Groups.Admins[player.group] then return true end
    end
    return false
end