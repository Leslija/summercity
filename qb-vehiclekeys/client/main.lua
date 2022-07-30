-- Variables

local QBCore = exports['qb-core']:GetCoreObject()
local HasKey = false
local IsRobbing = false
local IsHotwiring = false
local AlertSend = false
local lockpicked = false
local lockpickedPlate = nil
local usingAdvanced
--normal 
local min_nLockpickTime = 5
local max_nLockpickTime = 15
local min_aLockpickTime = 40
local max_aLockpickTime = 120
local circleToLockpick = 4


-- Functions

local function HasKey(plate)
	QBCore.Functions.TriggerCallback('vehiclekeys:CheckHasKey', function(result)
		if result then
			HasKey = true
		else
			HasKey = false
		end
	end, plate)
	return HasKey
end

function LockVehicle()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local veh = QBCore.Functions.GetClosestVehicle(pos)
    local plate = QBCore.Functions.GetPlate(veh)
    local vehpos = GetEntityCoords(veh)
    if IsPedInAnyVehicle(ped) then
        veh = GetVehiclePedIsIn(ped)
    end
    if veh ~= nil and #(pos - vehpos) < 7.5 then
        QBCore.Functions.TriggerCallback('vehiclekeys:CheckHasKey', function(result)
            if result then
                local vehLockStatus = GetVehicleDoorLockStatus(veh)
                loadAnimDict("anim@mp_player_intmenu@key_fob@")
                TaskPlayAnim(ped, 'anim@mp_player_intmenu@key_fob@', 'fob_click', 3.0, 3.0, -1, 49, 0, false, false, false)

                if vehLockStatus == 1 then
                    Wait(750)
                    ClearPedTasks(ped)
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "lock", 0.3)
                    SetVehicleDoorsLocked(veh, 2)
                    if (GetVehicleDoorLockStatus(veh) == 2) then
                        SetVehicleLights(veh, 2)
                        Wait(250)
                        SetVehicleLights(veh, 1)
                        Wait(200)
                        SetVehicleLights(veh, 0)
                        QBCore.Functions.Notify("Vehicle locked!")
                    else
                        QBCore.Functions.Notify("Something went wrong with the locking system!")
                    end
                else
                    Wait(750)
                    ClearPedTasks(ped)
                    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "unlock", 0.3)
                    SetVehicleDoorsLocked(veh, 1)
                    if (GetVehicleDoorLockStatus(veh) == 1) then
                        SetVehicleLights(veh, 2)
                        Wait(250)
                        SetVehicleLights(veh, 1)
                        Wait(200)
                        SetVehicleLights(veh, 0)
                        QBCore.Functions.Notify("Vehicle unlocked!")
                    else
                        QBCore.Functions.Notify("Something went wrong with the locking system!")
                    end
                end
            else
                QBCore.Functions.Notify('You don\'t have the keys of the vehicle..', 'error')
            end
        end, plate)
    end
end



function LockpickDoor(isAdvanced)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle(pos)
    if boostingInfo ~= nil and boostingInfo.advancedSystem then
        local boostingInfo = Entity(targetVehicle).state.boostingData
        -- TriggerEvent("yourNotificationEvent", 'You need a proffessional system to lockpick this vehicle!')
        QBCore.Functions.Notify('Doesnt seem like it ...', 'error')
        return 
    else
    print("boosting vehicle")
        if vehicle ~= nil and vehicle ~= 0 then
            local vehpos = GetEntityCoords(vehicle)
            if #(pos - vehpos) < 2.5 then
                local vehLockStatus = GetVehicleDoorLockStatus(vehicle)
                if (vehLockStatus >= 2) then
                    usingAdvanced = isAdvanced
                    loadAnimDict("veh@break_in@0h@p_m_one@")
                    if usingAdvanced then
                        TaskPlayAnim(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 8.0, 3.0, -1, 17, 1, 1, 0, 0) 
                        local circles = circleToLockpick
                        local isUsingAdvanced = 1
                        local success = exports['qb-lock']:StartLockPickCircle(circles, isUsingAdvanced, success)
                        lockpickFinish(success)
                        print(isUsingAdvanced)--remove this before release
                    else
                        TaskPlayAnim(ped, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 8.0, 3.0, -1, 17, 1, 1, 0, 0)
                        local circles = circleToLockpick
                        local isUsingAdvanced = 0
                        local success = exports['qb-lock']:StartLockPickCircle(circles, isUsingAdvanced, success);
                        lockpickFinish(success)
                        print(isUsingAdvanced)--remove this before release
                    end
                end
            end
        end
    end
end

function lockpickFinish(success)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle(pos)
    local chance = math.random()
    StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
    if success then
        TriggerServerEvent('hud:server:GainStress', math.random(1, 2))
        QBCore.Functions.Notify('Opened Door!', 'success')
        SetVehicleDoorsLocked(vehicle, 1)
        lockpicked = true
        lockpickedPlate = QBCore.Functions.GetPlate(vehicle)
    else
        PoliceCall()
        TriggerServerEvent('hud:server:GainStress', math.random(1, 2))
        lockpicked = false
        lockpickedPlate = QBCore.Functions.GetPlate(vehicle)
    end
    if usingAdvanced then
        if chance <= Config.RemoveLockpickAdvanced then
            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["advancedlockpick"], "remove")
            TriggerServerEvent("QBCore:Server:RemoveItem", "advancedlockpick", 1)
        end
    else
        if chance <= Config.RemoveLockpickNormal then
            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["lockpick"], "remove")
            TriggerServerEvent("QBCore:Server:RemoveItem", "lockpick", 1)
        end
    end
end



function PoliceCall()
    if not AlertSend then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local chance = Config.PoliceAlertChance
        if GetClockHours() >= 1 and GetClockHours() <= 6 then
            chance = Config.PoliceNightAlertChance
        end
        if math.random() <= chance then
            local closestPed = GetNearbyPed()
            if closestPed ~= nil then
                local msg = ""
                local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
                local streetLabel = GetStreetNameFromHashKey(s1)
                local street2 = GetStreetNameFromHashKey(s2)
                if street2 ~= nil and street2 ~= "" then
                    streetLabel = streetLabel .. " " .. street2
                end
                local alertTitle = ""
                if IsPedInAnyVehicle(ped) then
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    local modelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
                    if QBCore.Shared.Vehicles[modelName] ~= nil then
                        Name = QBCore.Shared.Vehicles[modelName]["brand"] .. ' ' .. QBCore.Shared.Vehicles[modelName]["name"]
                    else
                        Name = "Unknown"
                    end
                    local modelPlate = QBCore.Functions.GetPlate(vehicle)
                    local msg = "Vehicle theft attempt at " .. streetLabel .. ". Vehicle: " .. Name .. ", Licenseplate: " .. modelPlate
                    local alertTitle = "Vehicle theft attempt at"
                    TriggerServerEvent("police:server:VehicleCall", pos, msg, alertTitle, streetLabel, modelPlate, Name)
                else
                    local vehicle = QBCore.Functions.GetClosestVehicle()
                    local modelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()
                    local modelPlate = QBCore.Functions.GetPlate(vehicle)
                    if QBCore.Shared.Vehicles[modelName] ~= nil then
                        Name = QBCore.Shared.Vehicles[modelName]["brand"] .. ' ' .. QBCore.Shared.Vehicles[modelName]["name"]
                    else
                        Name = "Unknown"
                    end
                    local msg = "Vehicle theft attempt at " .. streetLabel .. ". Vehicle: " .. Name .. ", Licenseplate: " .. modelPlate
                    local alertTitle = "Vehicle theft attempt at"
                    TriggerServerEvent("police:server:VehicleCall", pos, msg, alertTitle, streetLabel, modelPlate, Name)
                end
            end
        end
        AlertSend = true
        SetTimeout(Config.AlertCooldown, function()
            AlertSend = false
        end)
    end
end

function LockpickIgnition(isAdvanced)
    if not HasKey then 
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, true)
        if vehicle ~= nil and vehicle ~= 0 then
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                IsHotwiring = true
                PoliceCall()

                local dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
                
                loadAnimDict("anim@gangops@facility@servers@bodysearch@")

                usingAdvanced = isAdvanced
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    RequestAnimDict(dict)
                    Citizen.Wait(100)
                end
                if usingAdvanced then
                    TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@", "player_search", 8.0, 3.0, -1, 17, 1, 1, 0, 0) 
					local circles = circleToLockpick
					local isUsingAdvanced = 1
                    local success = exports['qb-lock']:StartLockPickCircle(circles, isUsingAdvanced, success)
					if success then
						StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@", "player_search", 1.0)
						QBCore.Functions.Notify("Success")
						HasKey = true
						TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
						IsHotwiring = false
					else
						QBCore.Functions.Notify("Action Failed!", "error")
					end
				else
					local circles = circleToLockpick
					local isUsingAdvanced = 0
                    local success = exports['qb-lock']:StartLockPickCircle(circles, isUsingAdvanced, success)
					if success then
						StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@", "player_search", 1.0)
						QBCore.Functions.Notify("Lockpicking succeeded!")
						HasKey = true
						TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
						IsHotwiring = false
					else
						QBCore.Functions.Notify("Lockpicking failed!", "error")
					end
                end
            end
        end
    end
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

function IsBlacklistedWeapon()
    local weapon = GetSelectedPedWeapon(PlayerPedId())
    if weapon ~= nil then
        for _, v in pairs(Config.NoRobWeapons) do
            if weapon == GetHashKey(v) then
                return true
            end
        end
    end
    return false
end

function GetNearbyPed()
    local retval = nil
    local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        table.insert(PlayerPeds, ped)
    end
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
    if not IsEntityDead(closestPed) and closestDistance < 30.0 then
        retval = closestPed
    end
    return retval
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Events

RegisterNetEvent('lockpicks:UseLockpick', function(isAdvanced)
    if (IsPedInAnyVehicle(PlayerPedId())) then
        if not HasKey then
            LockpickIgnition(isAdvanced)
        end
    else
        LockpickDoor(isAdvanced)
    end
end)

RegisterNetEvent('vehiclekeys:client:SetOwner', function(plate)
    local VehPlate = plate
    local CurrentVehPlate = QBCore.Functions.GetPlate(GetVehiclePedIsIn(PlayerPedId(), true))
    if VehPlate == nil then
        VehPlate = CurrentVehPlate
    end
    TriggerServerEvent('vehiclekeys:server:SetVehicleOwner', VehPlate)
    if IsPedInAnyVehicle(PlayerPedId()) and plate == CurrentVehPlate then
        SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(), true), true, false, true)
    end
    HasKey = true
end)

RegisterNetEvent('vehiclekeys:client:GiveKeys', function(target)
    local plate = QBCore.Functions.GetPlate(GetVehiclePedIsIn(PlayerPedId(), true))
    TriggerServerEvent('vehiclekeys:server:GiveVehicleKeys', plate, target)
end)

RegisterNetEvent('vehiclekeys:client:ToggleEngine', function()
	local ped = PlayerPedId()
    local EngineOn = IsVehicleEngineOn(GetVehiclePedIsIn(ped))
    local veh = GetVehiclePedIsIn(ped, true)
	local plate = QBCore.Functions.GetPlate(veh)
	if IsPedInAnyVehicle(ped) then
        veh = GetVehiclePedIsIn(ped)
    end
	if veh ~= nil and not IsThisModelABicycle(GetEntityModel(GetVehiclePedIsIn(ped,false))) then
		QBCore.Functions.TriggerCallback('vehiclekeys:CheckHasKey', function(result)
			if result then
				if HasKey or lockpicked then
					if EngineOn then
						SetVehicleEngineOn(veh, false, false, true)
					else
						SetVehicleEngineOn(veh, true, false, true)
					end
				else
					QBCore.Functions.Notify("You don't have the keys from this vehicle.", 'error')
				end
            end
        end, plate)
	end
end)

-- command

RegisterKeyMapping('togglelocks', 'Toggle Vehicle Locks', 'keyboard', 'L')
RegisterCommand('togglelocks', function()
    LockVehicle()
end)

-- thread

CreateThread(function()
    while true do
        local sleep = 100
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local entering = GetVehiclePedIsTryingToEnter(ped)
            if entering ~= 0 then
                sleep = 2000
                local plate = QBCore.Functions.GetPlate(entering)
                QBCore.Functions.TriggerCallback('vehiclekeys:CheckOwnership', function(result)
                    if not result then -- if not player owned
                        local driver = GetPedInVehicleSeat(entering, -1)
                        if driver ~= 0 and not IsPedAPlayer(driver) then
                            if Config.Rob then
                                if IsEntityDead(driver) then
                                    TriggerEvent("vehiclekeys:client:SetOwner", plate)
                                    SetVehicleDoorsLocked(entering, 1)
                                    HasKey = true
                                else
                                    SetVehicleDoorsLocked(entering, 2)
                                end
                            else
                                TriggerEvent("vehiclekeys:client:SetOwner", plate)
                                SetVehicleDoorsLocked(entering, 1)
                                HasKey = true
                            end
                        else
                            QBCore.Functions.TriggerCallback('vehiclekeys:CheckHasKey', function(result)
                                if not lockpicked or lockpickedPlate ~= plate then
                                    if result == false then
                                        SetVehicleDoorsLocked(entering, 2)
                                        HasKey = false
                                    else 
                                        HasKey = true
                                    end
                                elseif lockpicked and lockpickedPlate == plate then
                                    if result == false then
                                        HasKey = false
                                    else 
                                        HasKey = true
                                    end
                                end
                            end, plate)
                        end
                    end
                end, plate)
            end

            if IsPedInAnyVehicle(ped, false) and lockpicked and not IsHotwiring and not HasKey then
                sleep = 7
                local veh = GetVehiclePedIsIn(ped)
                local vehpos = GetOffsetFromEntityInWorldCoords(veh, 0.0, 2.0, 1.0)
                SetVehicleEngineOn(veh, false, false, true)
            end

            if Config.Rob then
                if not IsRobbing then
                    local playerid = PlayerId()
                    local aiming, target = GetEntityPlayerIsFreeAimingAt(playerid)
                    if aiming and (target ~= nil and target ~= 0) then
                        if DoesEntityExist(target) and not IsEntityDead(target) and not IsPedAPlayer(target) then
                            if IsPedInAnyVehicle(target, false) then
                                local targetveh = GetVehiclePedIsIn(target)
                                if GetPedInVehicleSeat(targetveh, -1) == target then
                                    if not IsBlacklistedWeapon() then
                                        local pos = GetEntityCoords(ped, true)
                                        local targetpos = GetEntityCoords(target, true)
                                        if #(pos - targetpos) < 5.0 then
                                            RobVehicle(target)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
