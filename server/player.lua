UgCore.Player = { }

function UgCore.Player.CreatePlayer(playerId, identifier, data)
    local multiCharacter    = UgCore.Dependencies.MultiCharacter
    local self              = { }
    self.Functions          = { }

    self.accounts = data.accounts
    self.coords = data.coords
    self.group = data.group
    self.identifier = identifier
    self.inventory = data.inventory
    self.job = data.job
    self.loadout = data.loadout
    self.name = data.name
	self.steamName = data.playerName
    self.playerId = playerId
    self.source = playerId
    self.variables = { }
    self.weight = data.weight
    self.maxWeight = UgCore.Config.Core.Inventory.MaxWeight
    self.metadata = data.metadata
    self.admin = UgCore.Functions.IsPlayerAdmin(playerId)
    if multiCharacter then
        self.license = 'license' .. identifier:sub(identifier:find(':'), identifier:len()) 
	else 
		self.license = 'license:' .. identifier 
	end

    ExecuteCommand(('add_principal identifier.%s group.%s'):format(self.license, self.group))

	local stateBag = Player(self.source).state
	stateBag:set("identifier", self.identifier, true)
	stateBag:set("license", self.license, true)
	stateBag:set("job", self.job, true)
	stateBag:set("group", self.group, true)
	stateBag:set("name", self.name, true)
	stateBag:set("metadata", self.metadata, true)

    function self.Functions.TriggerEvent(eventName, ...)
        TriggerClientEvent(eventName, self.source, ...)
    end

    function self.Functions.SetCoords(coords)
        local ped = GetPlayerPed(self.source)
        local vector = type(coords) == "vector4" and coords or type(coords) == "vector3" and vector4(coords, 0.0) or vec(coords.x, coords.y, coords.z, coords.h or 0.0)
        SetEntityCoords(ped, vector.x, vector.y, vector.z, false, false, false, false)
        SetEntityHeading(ped, vector.w)
    end

    function self.Functions.GetCoords(vector)
        local ped = GetPlayerPed(self.source)
		local coords = GetEntityCoords(ped)

		if vector then
			return coords
		else
			return {
				x = coords.x,
				y = coords.y,
				z = coords.z,
			}
		end
    end

    function self.Functions.Kick(author, reason)
        return UgCore.Functions.KickPlayer(self.source, author, reason, false, false)
    end

    function self.Functions.GetIdentifier()
        return self.identifier
    end

    function self.Functions.SetGroup(group)
        ExecuteCommand(('remove_principal identifier.%s group.%s'):format(self.license, self.group))
		self.group = group
		Player(self.source).state:set("group", self.group, true)
		ExecuteCommand(('add_principal identifier.%s group.%s'):format(self.license, self.group))
    end

    function self.Functions.GetGroup()
        return self.group
    end

    function self.Functions.SetData(key, value)
        self.variables[key] = value
        Player(self.source).state:set(key, value, true)
    end

    function self.Functions.GetData(key)
        return self.variables[key]
    end

    function self.Functions.GetAccounts(minimal)
        if not minimal then return self.accounts end
        local minimalAccounts = { }
        for i = 1, #self.accounts do
            minimalAccounts[self.accounts[i].name] = self.accounts[i].name
        end
        return minimalAccounts
    end

	function self.Functions.GetMoneyFromAccounts(minimal)
		if not minimal then return self.accounts end
        local minimalAccounts = { }
        for i = 1, #self.accounts do
            minimalAccounts[self.accounts[i].name] = self.accounts[i].money
        end
        return minimalAccounts
	end

    function self.Functions.GetCash()
        return self.Functions.GetAccount('cash').money
    end

    function self.Functions.GetAccount(account)
        for i = 1, #self.accounts do
            if self.accounts[i].name == account then
                return self.accounts[i]
            end
        end
        return nil
    end

    function self.Functions.GetInventory(minimal)
        if not minimal then return self.inventory end
		local minimalInventory = {}
		for _, v in ipairs(self.inventory) do
			if v.count > 0 then
				minimalInventory[v.name] = v.count
			end
		end
		return minimalInventory
    end

    function self.Functions.GetJob()
        return self.job
    end

    function self.Functions.GetLoadout(minimal)
        if not minimal then return self.loadout end
		local minimalLoadout = { }
		for _, v in ipairs(self.loadout) do
			minimalLoadout[v.name] = { ammo = v.ammo }
			if v.tintIndex > 0 then minimalLoadout[v.name].tintIndex = v.tintIndex end
			if #v.components > 0 then
				local components = {}
				for _, component in ipairs(v.components) do
					if component ~= 'clip_default' then
						components[#components + 1] = component
					end
				end
				if #components > 0 then
					minimalLoadout[v.name].components = components
				end
			end
		end
		return minimalLoadout
    end

    function self.Functions.GetName()
        return self.name
    end

	function self.Functions.GetSteamName()
        return self.steamName
    end

	function self.Functions.GetLicense()
		return self.license
	end

    function self.Functions.SetName(name)
        self.name = name
        Player(self.source).state:set('name', self.name, true)
    end

    function self.Functions.SetMoney(accountName, amount, reason)
        reason = reason or 'unknown'
		if not tonumber(amount) then
			error('You must introduce an int for the amount (number)!')
			return
		end
		if amount >= 0 then
			local account = self.Functions.GetAccount(accountName)

			if account then
				amount = account.round and UgCore.Shared.Math.Round(amount) or amount
				self.accounts[account.index].money = amount

				self.Functions.TriggerEvent('ug-core:SetMoney', account)
				TriggerEvent('ug-core:SetMoney', self.source, accountName, money, reason)
			else
				error(('The account "%s" does not exists!'):format(accountName, self.playerId))
			end
		else
			error('You must introduce an int for the amount (number)!')
		end
    end

	function self.Functions.GetMoney(accountName)
		return self.Functions.GetAccount(accountName).money
	end

    function self.Functions.GiveMoney(accountName, amount, reason)
        reason = reason or 'unknown'
		if not tonumber(amount) then
			error('You must introduce an int for the amount (number)!')
			return
		end
		if amount >= 0 then
			local account = self.Functions.GetAccount(accountName)

			if account then
				amount = account.round and UgCore.Shared.Math.Round(amount) or amount
				self.accounts[account.index].money = self.accounts[account.index].money + amount

				self.Functions.TriggerEvent('ug-core:SetMoney', account)
				TriggerEvent('ug-core:SetMoney', self.source, accountName, amount, reason)
			else
				error(('The account "%s" does not exists!'):format(accountName, self.playerId))
			end
		else
			error('You must introduce an int for the amount (number)!')
		end
    end

    function self.Functions.RemoveMoney(accountName, amount, reason)
        reason = reason or 'unknown'
		if not tonumber(amount) then
			error('You must introduce an int for the amount (number)!')
			return
		end
		if amount >= 0 then
			local account = self.Functions.GetAccount(accountName)

			if account then
				amount = account.round and UgCore.Shared.Math.Round(amount) or amount
				self.accounts[account.index].money = self.accounts[account.index].money - amount

				self.Functions.TriggerEvent('ug-core:SetMoney', account)
				TriggerEvent('ug-core:SetMoney', self.source, accountName, amount, reason)
			else
				error(('The account "%s" does not exists!'):format(accountName, self.playerId))
			end
		else
			error('You must introduce an int for the amount (number)!')
		end
    end

    function self.Functions.GetInventoryItem(itemName)
        for _, v in ipairs(self.inventory) do
			if v.name == itemName then
				return v
			end
		end
    end

    function self.Functions.GiveItem(itemName, count)
        local item = self.Functions.GetInventoryItem(itemName)

		if item then
			count = UgCore.Shared.Math.Round(count)
			item.count = item.count + count
			self.weight = self.weight + (item.weight * count)

			TriggerEvent('ug-core:GiveItem', self.source, item.name, item.count)
			self.Functions.TriggerEvent('ug-core:GiveItem', item.name, item.count)
			self.Functions.Notify('Inventory', 'Successfully gave the item!', 'success', 5000)
		else
			self.Functions.Notify('Inventory', 'This item doesn\'t exist!', 'error', 5000)
		end
    end

    function self.Functions.RemoveItem(itemName, count)
        local item = self.Functions.GetInventoryItem(itemName)

		if item then
			count = UgCore.Shared.Math.Round(count)
			if count > 0 then
				local newCount = item.count - count

				if newCount >= 0 then
					item.count = newCount
					self.weight = self.weight - (item.weight * count)

					TriggerEvent('ug-core:RemoveItem', self.source, item.name, item.count)
					self.Functions.TriggerEvent('ug-core:RemoveItem', item.name, item.count)
				end
			else
				print(('The Player ID ^5%s tried remove an invalid count from the inventory -> %s of %s'):format(self.playerId, count, itemName))
			end
		end
    end

    function self.Functions.SetItem(itemName, count)
        local item = self.Functions.GetInventoryItem(itemName)

		if item and count >= 0 then
			count = UgCore.Shared.Math.Round(count)

			if count > item.count then
				self.Functions.GiveItem(item.name, count - item.count)
			else
				self.Functions.RemoveItem(item.name, item.count - count)
			end
		end
    end

	function self.Functions.HasItem(itemName)
		local item = self.Functions.GetInventoryItem(itemName)

		if item and item.count > 0 then
			return true
		end
		return false		
	end

    function self.Functions.GetWeight()
		return self.weight
	end

	function self.Functions.GetMaxWeight()
		return self.maxWeight
	end

    function self.Functions.CanCarryItem(itemName, count)
        if UgCore.Items[itemName] then
			local currentWeight, itemWeight = self.weight, UgCore.Items[itemName].weight
			local newWeight = currentWeight + (itemWeight * count)

			return newWeight <= self.maxWeight
		else
			error(('Item "%s" was used but does not exist!'):format(itemName))
		end
    end

    function self.Functions.CanSwapItem(firstItem, firstItemCount, testItem, testItemCount)
		local firstItemObject = self.Functions.GetInventoryItem(firstItem)
		local testItemObject = self.Functions.GetInventoryItem(testItem)
		if firstItemObject.count >= firstItemCount then
			local weightWithoutFirstItem = UgCore.Shared.Math.Round(self.weight - (firstItemObject.weight * firstItemCount))
			local weightWithTestItem = UgCore.Shared.Math.Round(weightWithoutFirstItem + (testItemObject.weight * testItemCount))
			return weightWithTestItem <= self.maxWeight
		end
		return false
	end

    function self.Functions.SetMaxWeight(weight)
        self.maxWeight = weight
        self.Functions.TriggerEvent('ug-core:SetMaxWeight', self.maxWeight)
    end

    function self.Functions.SetJob(jobName, jobGrade)
        jobGrade = tostring(jobGrade)
		local lastJob = json.decode(json.encode(self.job))

		if UgCore.Functions.DoesJobExists(jobName, jobGrade) then
			local jobObject, gradeObject = UgCore.Jobs[jobName], UgCore.Jobs[jobName].grades[jobGrade]

			self.job.id                  = jobObject.id
			self.job.name                = jobObject.name
			self.job.label               = jobObject.label

			self.job.grade               = tonumber(jobGrade)
			self.job.gradeName           = gradeObject.name
			self.job.gradeLabel          = gradeObject.label
			self.job.gradeSalary         = gradeObject.salary

			TriggerEvent('ug-core:SetJob', self.source, self.job, lastJob)
			self.Functions.TriggerEvent('ug-core:SetJob', self.job, lastJob)
			Player(self.source).state:set("job", self.job, true)
		else
			error(('Invalid setjob usage for job "%s"'):format(jobName))
		end
    end

    function self.Functions.GiveWeapon(weapon, ammo)
        if not self.Functions.HasWeapon(weapon) then
			local weaponLabel = UgCore.Shared.GetWeaponLabel(weapon)
            self.loadout[#self.loadout + 1] = {
				name = weapon,
				ammo = ammo,
				label = weaponLabel,
				components = { },
				tintIndex = 0
			}

			GiveWeaponToPed(GetPlayerPed(self.source), joaat(weapon), ammo, false, false)
			self.Functions.TriggerEvent('ug-core:GiveItem', weaponLabel, false, true)
		end
    end

    function self.Functions.GiveComponent(weapon, component)
        local loadoutNum, weapon = self.Functions.GetWeapon(weapon)
		if weapon then
			local component = UgCore.Functions.GetComponent(weapon, component)
			if component then
				if not self.Functions.Hascomponent(weapon, component) then
					self.loadout[loadoutNum].components[#self.loadout[loadoutNum].components + 1] = component
					local componentHash = UgCore.Functions.Getcomponent(weapon, component).hash
					GivecomponentToPed(GetPlayerPed(self.source), joaat(weapon), componentHash)
					self.Functions.TriggerEvent('ug-core:GiveItem', component.label, false, true)
				end
			end
		end
    end

    function self.Functions.GiveWeaponAmmo(weaponName, count)
        local _, weapon = self.Functions.GetWeapon(weaponName)
		if weapon then
			weapon.ammo = weapon.ammo + count
			SetPedAmmo(GetPlayerPed(self.source), joaat(weaponName), weapon.ammo)
		end
    end

    function self.Functions.UpdateWeaponAmmo(weaponName, ammoCount)
		local _, weapon = self.Functions.GetWeapon(weaponName)
		if weapon then
			weapon.ammo = ammoCount
		end
	end

    function self.Functions.SetWeaponTint(weaponName, weaponTintIndex)
        local loadoutNum, weapon = self.Functions.GetWeapon(weaponName)
		if weapon then
			local _, weaponObject = UgCore.Shared.GetWeapon(weaponName)
			if weaponObject.tints and weaponObject.tints[weaponTintIndex] then
				self.loadout[loadoutNum].tintIndex = weaponTintIndex
				self.Functions.TriggerEvent('ug-core:SetWeaponTint', weaponName, weaponTintIndex)
				self.Functions.TriggerEvent('ug-core:GiveItem', weaponObject.tints[weaponTintIndex], false, true)
			end
		end
    end

    function self.Functions.GetWeaponTint(weaponName)
        local _, weapon = self.Functions.GetWeapon(weaponName)
		if weapon then
			return weapon.tintIndex
		end
		return 0
    end

    function self.Functions.RemoveWeapon(weaponName)
        local weaponLabel, playerPed = nil, GetPlayerPed(self.source)

		if not playerPed then
			return error("Invalid Ped")
		end

		for k, v in ipairs(self.loadout) do
			if v.name == weaponName then
				weaponLabel = v.label
				for _, v2 in ipairs(v.components) do
					self.Functions.RemoveWeaponComponent(weaponName, v2)
				end
				local weaponHash = joaat(v.name)
				RemoveWeaponFromPed(playerPed, weaponHash)
				SetPedAmmo(playerPed, weaponHash, 0)
				table.remove(self.loadout, k)
				break
			end
		end
		if weaponLabel then
			self.Functions.TriggerEvent('ug-core:RemoveItem', weaponLabel, false, true)
		end
    end

    function self.Functions.RemoveWeaponComponent(weaponName, weaponComponent)
		local loadoutNum, weapon = self.Functions.GetWeapon(weaponName)
		if weapon then
			local component = UgCore.Shared.GetWeaponComponent(weaponName, weaponComponent)
			if component then
				if self.Functions.HasWeaponComponent(weaponName, weaponComponent) then
					for k, v in ipairs(self.loadout[loadoutNum].components) do
						if v == weaponComponent then
							table.remove(self.loadout[loadoutNum].components, k)
							break
						end
					end
					self.Functions.TriggerEvent('ug-core:RemoveWeaponComponent', weaponName, weaponComponent)
					self.Functions.TriggerEvent('ug-core:RemoveItem', component.label, false, true)
				end
			end
		end
	end

	function self.Functions.RemoveWeaponAmmo(weaponName, ammoCount)
		local _, weapon = self.Functions.GetWeapon(weaponName)
		if weapon then
			weapon.ammo = weapon.ammo - ammoCount
			self.Functions.TriggerEvent('ug-core:SetWeaponAmmo', weaponName, weapon.ammo)
		end
	end

	function self.Functions.HasWeaponComponent(weaponName, weaponComponent)
		local _, weapon = self.getWeapon(weaponName)
		if weapon then
			for _, v in ipairs(weapon.components) do
				if v == weaponComponent then
					return true
				end
			end
			return false
		else
			return false
		end
	end

	function self.Functions.HasWeapon(weaponName)
		for _, v in ipairs(self.loadout) do
			if v.name == weaponName then
				return true
			end
		end
		return false
	end

	function self.Functions.GetItem(item)
		for _, v in ipairs(self.inventory) do
			if (v.name == item) and (v.count >= 1) then
				return v, v.count
			end
		end
		return false
	end

	function self.Functions.GetWeapon(weaponName)
		for k, v in ipairs(self.loadout) do
			if v.name == weaponName then
				return k, v
			end
		end
	end

	function self.Functions.Notify(title, text, type, length)
		self.Functions.TriggerEvent('ug-core:Notify', title, text, type, length)
	end

	function self.Functions.GetMetaData(index, subIndex)
		if not (index) then return self.metadata end
		if type(index) ~= 'string' then
			return error(('Index "%s" should be a string. Received "%s".'):format(index, type(index)))
		end
		local metaData = self.metadata[index]
		if (metaData == nil) then
			return UgCore.Config.Core.Debug.Enabled and error(('Index "%s" does not exists.'):format(index)) or nil
		end
		if (subIndex and type(metaData) == 'table') then
			local _type = type(subIndex)
			if (_type == 'string') then
				local value = metaData[subIndex]
				return value
			end
			if (_type == 'table') then
				local returnValues = { }
				for i = 1, #subIndex do
					local key = subIndex[i]
					if (type(key) == 'string') then
						returnValues[key] = self.getMeta(index, key)
					else
						error(('SubIndex "%s" should be a string or a table. Received "%s".'):format(subIndex, _type))
					end
				end
				return returnValues
			end
			return error(('SubIndex "%s" should be a string or a table. Received "%s".'):format(subIndex, _type))
		end
		return metaData
	end

	function self.Functions.SetMetaData(index, value, subValue)
		if not index then
			return error('Index is nil.')
		end
		if type(index) ~= 'string' then
			return error(('Index "%s" should be a string. Received "%s".'):format(index, type(index)))
		end
		if not value then
			return error(('Value is nil.'):format(value))
		end
		local _type = type(value)
		if not subValue then
			if _type ~= 'number' and _type ~= 'string' and _type ~= 'table' then
				return error(('Value "%s" should be a string or a table. Received "%s".'):format(value, type(value)))
			end
			self.metadata[index] = value
		else
			if _type ~= "string" then
				return error(('Value "%s" should be a string as a SubIndex.'):format(value))
			end

            if not self.metadata[index] or type(self.metadata[index]) ~= 'table' then
				self.metadata[index] = { }
			end

			self.metadata[index] = type(self.metadata[index]) == 'table' and self.metadata[index] or {}
			self.metadata[index][value] = subValue
		end
		Player(self.source).state:set('metadata', self.metadata, true)
	end

	function self.Functions.ClearMetaData(index, subValues)
		if not index then
			return error("Index is nil.")
		end
	
		if type(index) ~= "string" then
			return error(('Index "%s" should be a string. Received "%s".'):format(index, type(index)))
		end
	
		local metaData = self.metadata[index]
		if metaData == nil then
			return UgCore.Config.Core.Debug.Enabled and error(('Index "%s" does not exists.'):format(index)) or nil
		end
	
		if not subValues then
			-- If no subValues is provided, we will clear the entire value in the metaData table
			self.metadata[index] = nil
		elseif type(subValues) == "string" then
			-- If subValues is a string, we will clear the specific subValue within the table
			if type(metaData) == "table" then
				metaData[subValues] = nil
			else
				return error(('Index "%s" is not a table.'):format(index, subValues))
			end
		elseif type(subValues) == "table" then
			-- If subValues is a table, we will clear multiple subValues within the table
			for i = 1, #subValues do
				local subValue = subValues[i]
				if type(subValue) == "string" then
					if type(metaData) == "table" then
						metaData[subValue] = nil
					else
						error(('Index "%s" SubValues is not a table. Couldn\'t delete SubValues "%s"'):format(index, subValue))
					end
				else
					error(('SubValues "%s" should contain strings. Received "%s".'):format(type(subValue)))
				end
			end
		else
			return error(('SubValues "%s" should be string or table. Received "%s".'):format(type(subValue)))
		end
		Player(self.source).state:set('metadata', self.metadata, true)
	end

	function self.Functions.SavePlayer()
		return UgCore.Player.SavePlayer(self)
	end
	return self
end

function UgCore.Player.LoadPlayer(identifier, playerId, isNew)
    local multiCharacter = UgCore.Dependencies.MultiCharacter
    local result = { }
    local userData = { 
        accounts    = { },
        inventory   = { },
        job         = { },
        loadout     = { },
        playerName  = GetPlayerName(playerId),
        weight      = 0,
        metadata    = { }
    }
    
    if multiCharacter then
        result = MySQL.prepare.await('SELECT `money`, `job`, `group`, `position`, `inventory`, `skin`, `loadout`, `metadata`, `firstName`, `lastName`, `dateOfBirth`, `sex`, `weight` FROM `users` WHERE `identifier` = ?', { identifier })
    else
        result = MySQL.prepare.await('SELECT `money`, `job`, `group`, `position`, `inventory`, `skin`, `loadout`, `metadata` FROM `users` WHERE `identifier` = ?', { identifier })
    end

    local job           = json.decode(result.job)
    local jobName       = job.job
    local jobGrade      = tostring(job.grade)
    local jobObj        = { }
    local jobGradeObj   = { }
    local foundAccounts = { }
    local foundItems    = { }

    if result.money and result.money ~= '' then
        local accounts = json.decode(result.money)
        for k, v in pairs(accounts) do
            foundAccounts[k] = v
        end
    end

    for k, v in pairs(UgCore.Config.Money) do
        if v.RoundNumbers == nil then v.RoundNumbers = true end
        userData.accounts[#userData.accounts + 1] = {
            name = k,
            money = foundAccounts[k] or v.StartingAmount or 0,
            label = v.Name,
            round = v.RoundNumbers,
            index = #userData.accounts + 1
        }
    end

    if UgCore.Functions.DoesJobExists(jobName, jobGrade) then
        jobObj, jobGradeObj = UgCore.Jobs[jobName], UgCore.Jobs[jobName].grades[jobGrade]
    else
        warn(('Invalid job for ^5%s^7 [job: ^5%s^7, grade: ^5%s^7]'):format(identifier, job, grade))
        jobName, jobGrade, jobObj, jobGradeObj = 'unemployed', '0', UgCore.Jobs[jobName], UgCore.Jobs[jobName].grades[jobGrade]
    end

    userData.job.id = jobObj.id
    userData.job.name = jobObj.name
    userData.job.label = jobObj.label
    userData.job.grade = tonumber(jobGrade)
    userData.job.gradeName = jobGradeObj.name
    userData.job.gradeLabel = jobGradeObj.label
    userData.job.salary = jobGradeObj.salary

    if result.inventory and result.inventory ~= '' then
        local inventory = json.decode(result.inventory)

        for name, count in pairs(inventory) do
            local item = UgCore.Items[name]

            if item then
                foundItems[name] = count
            else
                warn(('Invalid item "%s" for "%s"'):format(name, identifier))
            end
        end
    end

    for name, item in pairs(UgCore.Items) do
        local count = foundItems[name] or 0
        if count > 0 then
            userData.weight = userData.weight + (item.weight * count)
        end

        userData.inventory[#userData.inventory + 1] = {
            name = name,
            count = count,
            label = item.label,
            weight = item.weight,
            usable = UgCore.UsableItemsCallbacks[name] ~= nil,
            rare = item.rare,
            canRemove = item.canRemove
        }
    end

    table.sort(userData.inventory, function(a, b)
        return a.label < b.label
    end)

    if result.group then
        userData.group = result.group
    else
        userData.group = 'user'
    end

    if result.loadout and result.loadout ~= '' then
        local loadout = json.decode(result.loadout)

        for name, weapon in pairs(loadout) do
            local label = UgCore.Shared.GetWeaponLabel(name)

            if label then
                if not weapon.components then
                    weapon.components = { }
                end
                if not weapon.tintIndex then
                    weapon.tintIndex = 0
                end

                userData.loadout[#userData.loadout + 1] = {
                    name = name,
                    ammo = weapon.ammo,
                    label = label,
                    components = weapon.components,
                    tintIndex = weapon.tintIndex
                }
            end
        end
    end

    userData.coords = json.decode(result.position) or UgCore.Config.DefaultSpawns[math.random(#UgCore.Config.DefaultSpawns)]

    if result.skin and result.skin ~= '' then
        userData.skin = json.decode(result.skin)
    else
        if userData.sex == 'm' then
            userData.skin = { sex = 0 }
        else
            userData.skin = { sex = 1 }
        end
    end

    if result.firstName and result.firstName ~= '' then
		userData.firstName = result.firstName
		userData.lastName = result.lastName
		userData.playerName = userData.firstName .. ' ' .. userData.lastName
		if result.dateOfBirth then
			userData.dateOfBirth = result.dateOfBirth
		end
		if result.sex then
			userData.sex = result.sex
		end
		if result.height then
			userData.height = result.height
		end
	end

	if result.metadata and result.metadata ~= '' then
		local metadata = json.decode(result.metadata)
		userData.metadata = metadata
	end

    local player = UgCore.Player.CreatePlayer(playerId, identifier, userData)
    UgCore.Players[playerId] = player
    UgCore.PlayersByIdentifier[identifier] = player

    if userData.firstName then
		player.Functions.SetData('firstName', userData.firstName)
		player.Functions.SetData('lastName', userData.lastName)
		if userData.dateOfBirth then
			player.Functions.SetData('dateOfBirth', userData.dateOfBirth)
		end
		if userData.sex then
			player.Functions.SetData('sex', userData.sex)
		end
		if userData.height then
			player.Functions.SetData('height', userData.height)
		end
	end

    local ped = GetPlayerPed(player.source)
	if ped then
		player.Functions.SetMetaData('health', player.Functions.GetMetaData('health') or GetEntityHealth(ped))
		player.Functions.SetMetaData('armor', player.Functions.GetMetaData('armor') or GetPedArmour(ped))
	end

	local playerData = {
		accounts = player.Functions.GetAccounts(),
        coords = userData.coords,
        identifier = player.Functions.GetIdentifier(),
        inventory = player.Functions.GetInventory(),
        job = player.Functions.GetJob(),
        loadout = player.Functions.GetLoadout(),
        maxWeight = player.Functions.GetMaxWeight(),
		cash = player.Functions.GetCash(),
		sex = player.Functions.GetData("sex") or "m",
		steamName = player.Functions.GetSteamName(),
		firstName = player.Functions.GetData("firstName") or "John",
		lastName = player.Functions.GetData("lastName") or "Doe",
		dateOfBirth = player.Functions.GetData("dateOfBirth") or "01/01/2000",
		height = player.Functions.GetData("height") or 120,
		dead = false,
		metadata = player.Functions.GetMetaData()
	}

    TriggerEvent('ug-core:PlayerLoaded', playerId, player, isNew)
    player.Functions.TriggerEvent('ug-core:PlayerLoaded', playerData, isNew, userData.skin)
    player.Functions.TriggerEvent('ug-core:CreateMissingPickups', UgCore.Pickups)
    player.Functions.TriggerEvent('ug-core:RegisterSuggestions', UgCore.RegisteredCommands)
	print(('^7[ug-core] ^2(SUCCESS)^7: ^2Player ^5%s ^2(ID: ^5%s^2) ^2loaded successfully!^7'):format(player.Functions.GetSteamName(), playerId))
end

function UgCore.Player.CreateNewPlayer(identifier, playerId, data)
    local accounts = { }
    local defaultGroup = 'user'
    local parameters = { }
    local multiCharacter = UgCore.Dependencies.MultiCharacter
    
	for k, v in pairs(UgCore.Config.Money) do
        accounts[k] = v.StartingAmount
    end

	if UgCore.Functions.IsPlayerAdmin(playerId) then
        print(string.format('^7[ug-core] ^3(WARN)^7: ^3Player ID ^5%s ^3was granted admin permissions via Ace Permissions!^7', playerId))
        defaultGroup = 'admin'
    end

    if multiCharacter then
        parameters = { 
            json.encode(accounts),
            identifier,
            defaultGroup,
            data.firstName,
            data.lastName,
            data.dateOfBirth,
            data.sex,
            data.height
        }
    else
        parameters = { 
            json.encode(accounts),
            identifier,
            defaultGroup
        }
    end

    if multiCharacter then
        MySQL.prepare('INSERT INTO `users` SET `money` = ?, `identifier` = ?, `group` = ?, `firstName` = ?, `lastName` = ?, `dateOfBirth` = ?, `sex` = ?, `height` = ?', parameters, function ()
            UgCore.Player.LoadPlayer(identifier, playerId, true)
        end)
    else
        MySQL.prepare('INSERT INTO `users` SET `money` = ?, `identifier` = ?, `group` = ?', parameters, function ()
            UgCore.Player.LoadPlayer(identifier, playerId, true)
        end)
    end
end

local function UpdateHealthAndArmor(player)
    local ped = GetPlayerPed(player.source)
    player.Functions.SetMetaData('health', GetEntityHealth(ped))
    player.Functions.SetMetaData('armor', GetPedArmour(ped))
end

function UgCore.Player.SavePlayer(player, cb)
	UpdateHealthAndArmor(player)
	local playerJob = {
		job = player.Functions.GetJob().name,
		grade = player.Functions.GetJob().grade	
	}
	local parameters <const> = {
		json.encode(player.Functions.GetMoneyFromAccounts(true)),
		json.encode(playerJob),
		player.group,
		json.encode(player.Functions.GetCoords()),
		json.encode(player.Functions.GetInventory(true)),
		json.encode(player.Functions.GetLoadout(true)),
		json.encode(player.Functions.GetMetaData()),
		player.identifier
	}

	MySQL.prepare('UPDATE `users` SET `money` = ?, `job` = ?, `group` = ?, `position` = ?, `inventory` = ?, `loadout` = ?, `metadata` = ? WHERE `identifier` = ?', parameters, function (rows)
		if rows == 1 then
			print(("^7[ug-core] ^2(SUCCESS)^7: ^2Player ^5%s ^2(ID: ^5%s^2) was saved successfully!^7"):format(player.Functions.GetSteamName(), player.playerId))
			TriggerEvent('ug-core:PlayerSaved', player.playerId, player)
		end
		
		if cb then cb() end
	end)
end

function UgCore.Player.SavePlayers(cb)
	local players <const> = UgCore.Players
	if not next(players) then return end
	local startTime <const> = os.time()
	local parameters = { }
	
	for _, player in pairs(players) do
		UpdateHealthAndArmor(player)
		local playerJob = {
			job = player.Functions.GetJob().name,
			grade = player.Functions.GetJob().grade	
		}
		parameters[#parameters + 1] = {
			json.encode(player.Functions.GetMoneyFromAccounts(true)),
			json.encode(playerJob),
			player.group,
			json.encode(player.Functions.GetCoords()),
			json.encode(player.Functions.GetInventory(true)),
			json.encode(player.Functions.GetLoadout(true)),
			json.encode(player.Functions.GetMetaData()),
			player.identifier
		}

		MySQL.prepare('UPDATE `users` SET `money` = ?, `job` = ?, `group` = ?, `position` = ?, `inventory` = ?, `loadout` = ?, `metadata` = ? WHERE `identifier` = ?', parameters, function (results)
			if not results then return end
			if type(cb) == 'function' then
				return cb()
			end
			print(('^7[ug-core] ^2(SUCCESS)^7: ^2Saved ^5%s ^2%s in ^5%s ^2ms!^7'):format(#parameters, #parameters > 1 and 'players' or 'player', UgCore.Shared.Math.Round((os.time() - startTime) / 1000000, 2)))
		end)
	end
end

function UgCore.Player.PlayerJoined(playerId)
    local identifier = UgCore.Functions.GetIdentifier(playerId)
    if identifier then
        if UgCore.Functions.GetPlayerFromIdentifier(identifier) then
            UgCore.Functions.KickPlayer(playerId, 'UgCore', Languages.GetTranslation('player_already_ingame'), true, true)
        else
            local result = MySQL.scalar.await('SELECT 1 FROM users WHERE identifier = ?', { identifier })
            if result then
                UgCore.Player.LoadPlayer(identifier, playerId, false)    
            else
                UgCore.Player.CreateNewPlayer(identifier, playerId)
            end
        end
    else
        UgCore.Functions.KickPlayer(playerId, 'UgCore', Languages.GetTranslation('identifier_missing'), true, true)
    end
end