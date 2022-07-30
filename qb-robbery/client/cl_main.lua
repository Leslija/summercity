local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-robbery:truck",function()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)    
    local isCloseObject = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, 1152297372, 0, 0, 0)
    local time = Config.timeTruck * 1000
    if isCloseObject ~= 0 then
        local netID = NetworkGetNetworkIdFromEntity(isCloseObject)
        robAction("Container",time,"dispatch:truckRob","missheistfbi3b_ig7","lift_fibagent_loop","truck",netID)
    end
end)

RegisterNetEvent("qb-robbery:atm", function()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)    
    local isCloseObject = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, -870868698, 0, 0, 0)
    local isCloseObject2 = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, -1126237515, 0, 0, 0)
    local isCloseObject3 = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, -1364697528, 0, 0, 0)
    local isCloseObject4 = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, `prop_fleeca_atm`, 0, 0, 0)
    local time = Config.timeTruck * 1000
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
        hasItem = result
    end, "hacking_device")

    while hasItem == nil do
        Wait(10)
    end
    if isCloseObject ~= 0 then
        if hasItem then
            local netID = NetworkGetNetworkIdFromEntity(isCloseObject)
            robActionAtm("ATM",time,"dispatch:atmRob","anim@amb@business@weed@weed_sorting_seated@","sorter_right_sort_v3_sorter02","atm",netID)
        else
            QBCore.Functions.Notify("You need a Hacking Device to rob the ATM", "error")
        end
    elseif isCloseObject2 ~= 0 then
        if hasItem then
            local netID = NetworkGetNetworkIdFromEntity(isCloseObject)
            robActionAtm("ATM",time,"dispatch:atmRob","anim@amb@business@weed@weed_sorting_seated@","sorter_right_sort_v3_sorter02","atm",netID)
        else
            QBCore.Functions.Notify("You need a Hacking Device to rob the ATM", "error")
        end
    elseif isCloseObject3 ~= 0 then
        if hasItem then
            local netID = NetworkGetNetworkIdFromEntity(isCloseObject)
            robActionAtm("ATM",time,"dispatch:atmRob","anim@amb@business@weed@weed_sorting_seated@","sorter_right_sort_v3_sorter02","atm",netID)
        else
            QBCore.Functions.Notify("You need a Hacking Device to rob the ATM", "error")
        end
    elseif isCloseObject4 ~= 0 then
        if hasItem then
            local netID = NetworkGetNetworkIdFromEntity(isCloseObject)
            robActionAtm("ATM",time,"dispatch:atmRob","anim@amb@business@weed@weed_sorting_seated@","sorter_right_sort_v3_sorter02","atm",netID)
        else
            QBCore.Functions.Notify("You need a Hacking Device to rob the ATM", "error")
        end
    end
end)


function GetZoneData()
    local coords = GetEntityCoords(PlayerPedId());
    local var1, var2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger());
    local hash1, hash2 = GetStreetNameFromHashKey(var1), GetStreetNameFromHashKey(var2);
    local zoneLabel = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z));

    if (hash2 == '') then
        return hash1, zoneLabel;
    else
        return hash1, ('%s, %s'):format(hash2, zoneLabel);
    end
end

function robAction(name,time,dispatch,anim,anim2,bool,netID)
    local plyPed = PlayerPedId()
    TriggerEvent('qb-inventory:client:close:inventory')
    QBCore.Functions.TriggerCallback("qb-robbery:canRob",function(canRob,reason)
        if canRob then
            if (exports["idz-simon"]:createGame(math.random(4, 6), 750, 10000)) then
                if bool ~= "atm" then
                    if math.random(1,3) == 1 then 
                        TriggerEvent(dispatch)
                    end
                else
                    TriggerEvent(dispatch)
                end
                TriggerServerEvent("shners:logs", bool, true, GetZoneData());
                AnimationRequestAnimDict(anim, function()
                    ClearPedTasks(plyPed)
			    	TaskPlayAnim(plyPed, anim, anim2, 8.0, -8, -1, 49, 0, 0, 0, 0)
                    FreezeEntityPosition(plyPed,true)
			    end)
             
                TriggerEvent(dispatch)

local plyPos = GetEntityCoords(PlayerPedId(-1),  true)   
streetName,_ = GetStreetNameAtCoord(plyPos.x, plyPos.y, plyPos.z)
streetName = GetStreetNameFromHashKey(streetName)

TriggerServerEvent("core_dispatch:addCall","00-00", "Container Robbery", {
{icon="fas fa-road", info = streetName}
}, {plyPos.x, plyPos.y, plyPos.z}, "police", 5000, 477, 5 )

                QBCore.Functions.Progressbar("use_bank", "Robbing "..name, time, false, true, {}, {}, {}, {}, function() -- Done
                    if bool == "atm" then 
                        TriggerServerEvent("qb-robbery:recivemoney")
                    else 
                        getItems()
                    end
                    ClearPedTasks(plyPed)
                    FreezeEntityPosition(PlayerPedId(),false)
                    TriggerServerEvent("cr:setCooldown",netID)
                    TriggerEvent("weapons:client:AddWeaponQuality", 25)
                    TriggerServerEvent("qb-robbery:logs", bool)
                end, function() show = true
                    QBCore.Functions.Notify("Canceled..", "error")
                    ClearPedTasks(plyPed)
                    FreezeEntityPosition(PlayerPedId(),false)
                end)
            else
                local plyPos = GetEntityCoords(PlayerPedId(-1),  true)   
streetName,_ = GetStreetNameAtCoord(plyPos.x, plyPos.y, plyPos.z)
streetName = GetStreetNameFromHashKey(streetName)

TriggerServerEvent("core_dispatch:addCall","00-00", "Container Robbery", {
{icon="fas fa-road", info = streetName}
}, {plyPos.x, plyPos.y, plyPos.z}, "police", 5000, 477, 5 )
                QBCore.Functions.Notify("Rob failed!", "error")
                TriggerServerEvent("shners:logs", bool, false, GetZoneData());
            end 
        else
            QBCore.Functions.Notify(reason, "error")
        end
    end, netID, name)
end

function robActionAtm(name,time,dispatch,anim,anim2,bool,netID)
    local plyPed = PlayerPedId()
    TriggerEvent('qb-inventory:client:close:inventory')
    QBCore.Functions.TriggerCallback("qb-robbery:canRob",function(canRob,reason)
        if canRob then
            local plyPos = GetEntityCoords(PlayerPedId(-1),  true)   
            streetName,_ = GetStreetNameAtCoord(plyPos.x, plyPos.y, plyPos.z)
            streetName = GetStreetNameFromHashKey(streetName)
            
            TriggerServerEvent("core_dispatch:addCall","00-00", "ATM Robbery", {
            {icon="fas fa-road", info = streetName}
            }, {plyPos.x, plyPos.y, plyPos.z}, "police", 5000, 75, 5 )
            TaskPlayAnim(plyPed, anim, anim2, 8.0, -8, -1, 49, 0, 0, 0, 0)
            TriggerEvent("qb-robbery:toggleHackGame")
        else
            QBCore.Functions.Notify(reason, "error")
        end
    end, netID, name)
    function AtmHackSecondSuccess(success)
        DisableControls = false
        TriggerEvent('mhacking:hide')
        if success then
            TriggerServerEvent("shnersa:logs", bool, true, GetZoneData());
            AnimationRequestAnimDict(anim, function()
                ClearPedTasks(plyPed)
                TaskPlayAnim(plyPed, anim, anim2, 8.0, -8, -1, 49, 0, 0, 0, 0)
                FreezeEntityPosition(plyPed,true)
            end)
            QBCore.Functions.Progressbar("use_bank", "Robbing "..name, time, false, true, {}, {
                animDict = "anim@amb@business@weed@weed_sorting_seated@",
                anim = "sorter_right_sort_v3_sorter02",
                flags = 48,
            }, {}, {}, function()
                if bool == "atm" then 
                    TriggerServerEvent("qb-robbery:recivemoney")
                else 
                    getItems()
                end
                ClearPedTasks(plyPed)
                FreezeEntityPosition(PlayerPedId(),false)
                TriggerServerEvent("cr:setCooldown",netID)
                TriggerEvent("weapons:client:AddWeaponQuality", 25)
                TriggerServerEvent("qb-robbery:logs", bool)
            end, function() show = true
                QBCore.Functions.Notify("Canceled..", "error")
                ClearPedTasks(plyPed)
                FreezeEntityPosition(PlayerPedId(),false)
            end)
        else
            local plyPos = GetEntityCoords(PlayerPedId(-1),  true)   
streetName,_ = GetStreetNameAtCoord(plyPos.x, plyPos.y, plyPos.z)
streetName = GetStreetNameFromHashKey(streetName)

TriggerServerEvent("core_dispatch:addCall","00-00", "ATM Robbery", {
{icon="fas fa-road", info = streetName}
}, {plyPos.x, plyPos.y, plyPos.z}, "police", 5000, 75, 5 )
            QBCore.Functions.Notify("Rob failed!", "error")
            TriggerServerEvent("shnersa:logs", bool, false, GetZoneData());
        end 
        ClearPedTasks(GetPlayerPed(-1))
    end
end

RegisterNetEvent("qb-robbery:toggleHackGame")
AddEventHandler("qb-robbery:toggleHackGame",function()
	TriggerEvent("mhacking:show")
	TriggerEvent("mhacking:start",3,20,AtmHackSecondSuccess) 
end)

function AnimationRequestAnimDict(animdict,func)
    if not DoesAnimDictExist(animdict) then return end
    RequestAnimDict(animdict)
    while not HasAnimDictLoaded(animdict) do
        Wait(50)
    end
    func()
end

function getItems()
    local rand = randomWeapons()
    for k,v in next,rand do 
        TriggerServerEvent("qb-robbery:reciveitems",k,v)
    end
end

function randomWeapons()
    local list = {}
    for i = 0, 4 do 
        local rand = math.random(#Config.Var - i)

        while list[Config.Var[rand]] do 
            rand = rand + 1
        end

        list[Config.Var[rand]] = Config.TruckRob[Config.Var[rand]]
    end
    return list
end

exports("isNearTruck",function()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local isCloseObject = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, 1152297372, 0, 0, 0)

    if isCloseObject ~= 0 then 
        local objectOffset = GetOffsetFromEntityInWorldCoords(isCloseObject, 0.0,-6.0,1.5)
        local objectDist = #(playerPos - objectOffset)
        if objectDist < 2.0 then 
            return true
        end
    end
    return false
end)

exports("isNearAtm",function()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local isCloseObject = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, -870868698, 0, 0, 0)
    local isCloseObject2 = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, -1126237515, 0, 0, 0)
    local isCloseObject3 = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, -1364697528, 0, 0, 0)
    local isCloseObject4 = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 5.0, `prop_fleeca_atm`, 0, 0, 0)

    if isCloseObject ~= 0 then 
        local objectOffset = GetOffsetFromEntityInWorldCoords(isCloseObject, 0.0,0,0)
        local objectDist = #(playerPos - objectOffset)
        if objectDist < 2.0 then 
            return true
        end
    elseif isCloseObject2 ~= 0 then 
        local objectOffset2 = GetOffsetFromEntityInWorldCoords(isCloseObject2, 0.0,0,0)
        local objectDist2 = #(playerPos - objectOffset2)
        if objectDist2 < 2.0 then 
            return true
        end
    elseif isCloseObject3 ~= 0 then 
        local objectOffset3 = GetOffsetFromEntityInWorldCoords(isCloseObject3, 0.0,0,0)
        local objectDist3 = #(playerPos - objectOffset3)
        if objectDist3 < 2.0 then 
            return true
        end
    elseif isCloseObject4 ~= 0 then 
        local objectOffset4 = GetOffsetFromEntityInWorldCoords(isCloseObject, 0.0,0,0)
        local objectDist4 = #(playerPos - objectOffset4)
        if objectDist4 < 2.0 then 
            return true
        end
    end
    return false
end)

exports("IfHaveDevice",function()
    if QBCore.Functions.HasItem('hacking_device') == true then 
        return true
    end
    return false
end)