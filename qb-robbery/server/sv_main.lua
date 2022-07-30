local QBCore = exports['qb-core']:GetCoreObject()
local cooldowns = {}
local currentDurability
local cashA = 400 				--<<how much minimum you can get from a robbery
local cashB = 1250				--<< how much maximum you can get from a robbery

RegisterNetEvent("qb-robbery:recivemoney",function()
	local src = tonumber(source)
	local Player =QBCore.Functions.GetPlayer(src)
    local bags = math.random(1,3)
	local info = {
		worth = math.random(cashA, cashB)
	}
	Player.Functions.AddItem('markedbills', bags, false, info)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add")
end)

RegisterNetEvent("qb-robbery:reciveitems",function(items,amount)
	local src = tonumber(source)
	local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(items, amount)
	TriggerClientEvent('QBCore:Notify', src, 'You received ' .. items, 'success')
end)

RegisterNetEvent("cr:setCooldown",function(netID)
	cooldowns[netID] = GetGameTimer() + 3600 * 1000
end)

QBCore.Functions.CreateCallback("qb-robbery:canRob", function(src,cb,networkID,name)
    if cooldowns[networkID] ~= nil and cooldowns[networkID] > GetGameTimer() then
        return cb(false,"This "..name .." was robbed.")
    end
    local players = QBCore.Functions.GetPlayers()
    local count = 0
    for k,v in next, players do 
        local player = QBCore.Functions.GetPlayer(v).PlayerData
        if player.job.name == "police" then 
            count = count + 1
        end
    end
    cb(count >= Config.needCops,"Not enough police")
end)

RegisterNetEvent("qb-robbery:logs",function(choice)
    local src = source
    local playerName = GetPlayerName(src)
    TriggerEvent('qb-logs:server:createLog', choice == "atm" and "atm" or "container", 'The player:', "**"..playerName.."** ".."has robbed: **"..choice, src)
end)

RegisterNetEvent("shners:logs",function(choice, success, street, zone)
    local src = source
    local playerName = GetPlayerName(src)
    local label = choice == "atm" and "atm" or "container";

    TriggerEvent('shahar:levy:logs', {
        src = src, 
        webhook = "container",
        description = "Lockpick %s %s.",
        args = { 'container', success and 'successfully' or 'failed' },
        fields = {
            { name = "Zone", value = zone, inline = true },
            { name = "Street", value = street, inline = true },
        }
    });
end)

RegisterNetEvent("shnersa:logs",function(choice, success, street, zone)
    local src = source
    local playerName = GetPlayerName(src)
    local label = choice == "atm" and "atm" or "container";

    TriggerEvent('shahar:levy:logs', {
        src = src, 
        webhook = "container",
        description = "Lockpick %s %s.",
        args = { 'atm', success and 'successfully' or 'failed' },
        fields = {
            { name = "Zone", value = zone, inline = true },
            { name = "Street", value = street, inline = true },
        }
    });
end)