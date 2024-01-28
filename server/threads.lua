if UgCore.Config.Core.PayCheck.Enabled then
    CreateThread(function ()
        while true do
            local sleep = (60 * 1000) * UgCore.Config.Core.PayCheck.Interval
            Wait(sleep)
            for _, player in pairs(UgCore.Players) do
                local jobName = player.job.name
                local jobLabel = player.job.label
                local jobGrade = player.job.grade
                local salary = player.job.salary
                if UgCore.Config.Core.PayCheck.Society then
                    TriggerEvent('ug-society:GetSociety', jobName, function (society)
                        if society then
                            TriggerEvent('ug-accounts:GetAccount', society.account, function (account)
                                if account.money >= salary then
                                    player.Functions.GiveMoney('bank', salary, 'Paycheck Salary')
                                    account.Functions.RemoveMoney(salary)
                                    player.Functions.Notify('Salary', Languages.GetTranslation('received_salary', salary), 'info', 5000)
                                    UgCore.Functions.SendLogFields('PayCheck', 'Entreprise PayCheck', 'A player just received his salary!', 'yellow', {
                                        { name = 'Player Name', value = player.Functions.GetSteamName(), inline = false },
                                        { name = 'Character Name', value = player.Functions.GetName(), inline = false },
                                        { name = 'Player Identifier', value = player.identifier, inline = false },
                                        { name = 'Entreprise', value = jobLabel .. '(' .. jobName .. ')', inline = false },
                                        { name = 'Grade', value = jobGrade, inline = false },
                                        { name = 'Salary', value = salary, inline = false },
                                    })
                                else
                                    player.Functions.Notify('Salary', Languages.GetTranslation('company_nomoney'), 'error', 5000)
                                end
                            end)
                        else
                            player.Functions.GiveMoney('bank', salary, 'Paycheck Salary')
                            player.Functions.Notify('Salary', Languages.GetTranslation('received_salary', salary), 'info', 5000)
                            UgCore.Functions.SendLogFields('PayCheck', 'Entreprise PayCheck', 'A player just received his salary!', 'yellow', {
                                { name = 'Player Name', value = player.Functions.GetSteamName(), inline = false },
                                { name = 'Character Name', value = player.Functions.GetName(), inline = false },
                                { name = 'Player Identifier', value = player.identifier, inline = false },
                                { name = 'Entreprise', value = jobLabel .. ' (' .. jobName .. ')', inline = false },
                                { name = 'Grade', value = jobGrade, inline = false },
                                { name = 'Salary', value = salary, inline = false },
                            })
                        end
                    end)
                else
                    player.Functions.GiveMoney('bank', salary, 'Paycheck Salary')
                    player.Functions.Notify('Salary', Languages.GetTranslation('received_salary', salary), 'info', 5000)
                    UgCore.Functions.SendLogFields('PayCheck', 'Entreprise PayCheck', 'A player just received his salary!', 'yellow', {
                        { name = 'Player Name', value = player.Functions.GetSteamName(), inline = false },
                        { name = 'Character Name', value = player.Functions.GetName(), inline = false },
                        { name = 'Player Identifier', value = player.identifier, inline = false },
                        { name = 'Entreprise', value = jobLabel .. ' (' .. jobName .. ')', inline = false },
                        { name = 'Grade', value = jobGrade, inline = false },
                        { name = 'Salary', value = salary, inline = false },
                    })
                end 
            end
        end
    end)
end