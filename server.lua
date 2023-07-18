local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent("torpak-yoga:itemver", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem(Config.ItemName, 1, false)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.ItemName], "add", 1)
end)

RegisterNetEvent("torpak-yoga:itemsil", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(Config.ItemName, 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[Config.ItemName], "remove", 1)
end)

QBCore.Functions.CreateUseableItem(Config.ItemName , function(source, item)
    TriggerClientEvent("torpak-yoga:useitem", source)
end)


