UgCore.Commands = { }

function UgCore.Commands.CreateCommand(name, group, cb, allowConsole, suggestion)
    if type(name) == 'table' then
        for _, v in ipairs(name) do
            UgCore.Commands.CreateCommand(v, group, cb, allowConsole, suggestion)
        end
        return
    end

    if UgCore.RegisteredCommands[name] then
        warn(('The command "%s" already exists. The command will be replaced.'):format(name))
        if UgCore.RegisteredCommands[name].suggestion then
            TriggerClientEvent('chat:removeSuggestion', -1, ('/%s'):format(name))
        end
    end

    if suggestion then
        if not suggestion.arguments then
            suggestion.arguments = { }
        end

        if not suggestion.help then
            suggestion.help = ''
        end
        TriggerClientEvent('chat:addSuggestion', -1, ('/%s'):format(name), suggestion.help, suggestion.arguments)
    end
    UgCore.RegisteredCommands[name] = {
        group           = group,
        cb              = cb,
        allowConsole    = allowConsole,
        suggestion      = suggestion
    }

    RegisterCommand(name, function (playerId, args)
        local command = UgCore.RegisteredCommands[name]
        if not command.allowConsole and playerId == 0 then 
            warn('You can\'t execute this in the console!') 
        else
            local player, error = UgCore.Players[playerId], nil
            if command.suggestion then
                if command.suggestion.validate then
                    if #args ~= #command.suggestion.arguments then
                        error = Languages.GetTranslation('commanderror_argumentmismatch', #args, #command.suggestion.arguments)
                    end
                end

                if not error and command.suggestion.arguments then
                    local newArgs = { }
                    for k, v in ipairs(command.suggestion.arguments) do
                        if v.type then
                            if v.type == 'number' then
                                local newArg = tonumber(args[k])
                                if newArg then
                                    newArgs[v.name] = newArg
                                else
                                    error = Languages.GetTranslation('commanderror_argumentmismatch_number', k)
                                end
                            elseif v.type == 'player' or v.type == 'playerId' then
                                local targetPlayerId = tonumber(args[k])

								if args[k] == 'me' then
									targetPlayerId = playerId
								end

								if targetPlayerId then
									local targetPlayer = UgCore.Functions.GetPlayer(targetPlayerId)

									if targetPlayer then
										if v.type == 'player' then
											newArgs[v.name] = targetPlayer
										else
											newArgs[v.name] = targetPlayer
										end
									else
										error = Languages.GetTranslation('commanderror_invalidplayerid')
									end
								else
									error = Languages.GetTranslation('commanderror_argumentmismatch_number', k)
								end
                            elseif v.type == 'string' then
								local newArg = tonumber(args[k])
								if not newArg then
									newArgs[v.name] = args[k]
								else
									error = Languages.GetTranslation('commanderror_argumentmismatch_string', k)
								end
							elseif v.type == 'item' then
								if UgCore.Items[args[k]] then
									newArgs[v.name] = args[k]
								else
									error = Languages.GetTranslation('commanderror_invaliditem')
								end
							elseif v.type == 'weapon' then
								if UgCore.Shared.GetWeapon(args[k]) then
									newArgs[v.name] = string.upper(args[k])
								else
									error = Languages.GetTranslation('commanderror_invalidweapon')
								end
							elseif v.type == 'any' then
								newArgs[v.name] = args[k]
							elseif v.type == 'merge' then
								local lenght = 0
								for i = 1, k - 1 do
									lenght = lenght + string.len(args[i]) + 1
								end
								local merge = table.concat(args, " ")

								newArgs[v.name] = string.sub(merge, lenght)
                            elseif v.type == 'coordinate' then
                                local coord = tonumber(args[k]:match("(-?%d+%.?%d*)"))
                                if(not coord) then
                                    error = TranslateCap('commanderror_argumentmismatch_number', k)
                                else
                                    newArgs[v.name] = coord
                                end
						    end
                        end

                        if v.validate ~= nil and not v.validate then
							error = nil
						end

						if error then
							break
						end
                    end
                    args = newArgs
                end
            end

            if error then
				if playerId == 0 then
					warn(('Command Warning: %s'):format(error))
				else
					player.Functions.Notify('Error', error, 'error', 5000)
				end
			else
				cb(player or false, args, function (msgData)
					if playerId == 0 then
						warn(('Command Warning: %s'):format(msgData.message))
					else
						player.Functions.Notify(msgData.title, msgData.message, msgData.type, msgData.length)
					end
				end)
			end
        end 
    end, true)

    if type(group) == 'table' then
		for _, v in ipairs(group) do
			ExecuteCommand(('add_ace group.%s command.%s allow'):format(v, name))
		end
	else
		ExecuteCommand(('add_ace group.%s command.%s allow'):format(group, name))
	end
end