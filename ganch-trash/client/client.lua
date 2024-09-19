local QBCore = exports['qb-core']:GetCoreObject()
local Trash = {}

CreateThread(function()
    local trashname = math.random(0, 1000000000)
    exports['qb-target']:AddTargetModel(Config.TrashModels, {
        options = { 
            {
                type = "cient",
                event = "ganch:openTrash",
                name = tostring(trashname),
                icon = "fas fa-trash",
                label = "Open trash",
            }  
        },
        distance = 2.0
    })
end)

RegisterNetEvent('ganch:openTrash', function(name)
    TriggerEvent("inventory:client:SetCurrentStash", name)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "trash", {
        maxweight = 4000000,
        slots = 50,
    })
end)