local Chunks                    = { }

UgCore.Menus                    = { }
UgCore.Menus.Functions          = { }

UgCore.Menus.RegisteredTypes    = { }
UgCore.Menus.Openned            = { }

function UgCore.Menus.Functions.RegisterType(menuType, open, close)
    UgCore.Menus.RegisteredTypes[menuType] = {
        open = open,
        close = close
    }
end

function UgCore.Menus.Functions.OpenMenu(menuType, namespace, name, data, submit, cancel, change, close)
    local menu      = { }
    menu.Functions  = { }
    menu.type = menuType
    menu.namespace = namespace
    menu.resourceName = (GetInvokingResource() or "Unknown")
    menu.name = name
    menu.data = data
    menu.submit = submit
    menu.cancel = cancel
    menu.change = change

    function menu.Functions.Close()
        UgCore.Menus.RegisteredTypes[menuType].close(namespace, name)
        for i = 1, #UgCore.Menus.Openned, 1 do
            if UgCore.Menus.Openned[i] then
                if UgCore.Menus.Openned[i].type == menuType and UgCore.Menus.Openned[i].namespace == namespace and UgCore.Menus.Openned[i].name == name then 
                    UgCore.Menus.Openned[i] = nil
                end
            end
        end
        if close then
            close()
        end
    end

    function menu.Functions.Update(query, newData)
        for i = 1, #menu.data.elements, 1 do
            local match = true
            
            for k, v in pairs(query) do
                if menu.data.elements[i][k] ~= v then
                    match = false
                end
            end

            if match then
                for k, v in pairs(newData) do
                    menu.data.elements[i][k] = v
                end
            end
        end
    end

    function menu.Functions.Refresh()
        UgCore.Menus.RegisteredTypes[menuType].open(namespace, name, menu.data)
    end

    function menu.Functions.SetElement(i, key, value)
        menu.data.elements[i][key] = value
    end

    function menu.Functions.SetElements(newElements)
        menu.data.elements = newElements
    end

    function menu.Functions.SetTitle(value)
        menu.data.title = value
    end

    function menu.RemoveElement(query)
        for i = 1, #menu.data.elements, 1 do
            for k, v in pairs(query) do
                if menu.data.elements[i] then
                    if menu.data.elements[i][k] == v then
                        table.remove(menu.data.elements, i)
                        break
                    end
                end
            end
        end
    end

    UgCore.Menus.Openned[#UgCore.Menus.Openned + 1] = menu
    UgCore.Menus.RegisteredTypes[menuType].open(namespace, name, data)
    return menu
end

function UgCore.Menus.Functions.CloseMenu(menuType, namespace, name)
    for i = 1, #UgCore.Menus.Openned, 1 do
        if UgCore.Menus.Openned[i] then
            if UgCore.Menus.Openmed[i].type == menuType and UgCore.Menus.Opemned[i].namespace == namespace and
                UgCore.Menus.Openned[i].name == name then
                UgCore.Menus.Openned[i].close()
                UgCore.Menus.Openned[i] = nil
            end
        end
    end
end

function UgCore.Menus.Functions.CloseAllMenus()
    for i = 1, #UgCore.Menus.Openned, 1 do
        if UgCore.Menus.Openned[i] then
            UgCore.Menus.Openned[i].close()
            UgCore.Menus.Openned[i] = nil
        end
    end
end

function UgCore.Menus.Functions.GetMenuOpenned(menuType, namespace, name)
    for i = 1, #UgCore.Menus.Openned, 1 do
        if UgCore.Menus.Openned[i] then
            if UgCore.Menus.Openned[i].type == menuType and UgCore.Menus.Openned[i].namespace == namespace and
                UgCore.Menus.Openned[i].name == name then
                return UgCore.Menus.Openned[i]
            end
        end
    end
end

function UgCore.Menus.Functions.GetOpennedMenus()
    return UgCore.Menus.Openned
end

function UgCore.Menus.Functions.IsMenuOpenned(menuType, namespace, name)
    local menuOpenned = false
    for i = 1, #UgCore.Menus.Openned, 1 do
        if UgCore.Menus.Openned[i] then
            menuOpenned = true
        end
    end
    return menuOpenned
end

RegisterNUICallback('__chunk', function(data, cb)
	Chunks[data.id] = Chunks[data.id] or ''
	Chunks[data.id] = Chunks[data.id] .. data.chunk

	if data['end'] then
		local msg = json.decode(Chunks[data.id])
		TriggerEvent(GetCurrentResourceName() .. ':message:' .. data.__type, msg)
		Chunks[data.id] = nil
	end

	cb('')
end)