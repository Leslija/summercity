local QBCore = exports['qb-core']:GetCoreObject()

local InPreview = false

local isActive = false

PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

AddEventHandler('onClientResourceStart',function()
    Citizen.CreateThread(function()
        while true do
            if QBCore ~= nil and QBCore.Functions.GetPlayerData ~= nil then
                QBCore.Functions.GetPlayerData(function(PlayerData)
                    if PlayerData.job then
                        PlayerJob = PlayerData.job
                    end
                end)
                break
            end
        end
        Citizen.Wait(1)
    end)
end)

RegisterNetEvent('qb-garage-police:Menu', function()
    local Menu = {
        {
            header = "Police Garage",
            txt = "View Vehicles",
            params = {
                event = "qb-garage-police:Catalog",
            }
        }
    }
    if not Config.UseMarkerInsteadOfMenu then
        Menu[#Menu+1] = {
            header = "⬅ Store Vehicle",
            params = {
                event = "qb-garage-police:StoreVehicle"
            }
        }
    end
    Menu[#Menu+1] = {
        header = "⬅ Close Menu",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent("qb-garage-police:Catalog", function()
    local vehicleMenu = {
        {
            header = "Police Garage",
            isMenuHeader = true,
        }
    }
    for k, v in pairs(Config.Vehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = v.vehiclename,
            txt = "Buy: " .. v.vehiclename .. " For: " .. v.price .. "$",
            params = {
                isServer = true,
                event = "qb-garage-police:TakeMoney",
                args = {
                    price = v.price,
                    vehiclename = v.vehiclename,
                    vehicle = v.vehicle
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        header = "⬅ Go Back",
        params = {
            event = "qb-garage-police:Menu"
        }
    }
    exports['qb-menu']:openMenu(vehicleMenu)
end)


CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local plyCoords = GetEntityCoords(plyPed) 
        local letSleep = true

        if PlayerJob.name == Config.Job then
            if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 0, 0, 0, true) < 10) then
                letSleep = false
                DrawMarker(36, 441.78894, -1020.011, 28.225797 + 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.5, 0.5, 0, 0, 0, 255, true, false, false, true, false, false, false)
                if Config.UseMarkerInsteadOfMenu then
                    if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 0, 0, 0, true) < 1.5) and not IsPedInAnyVehicle(PlayerPedId(), false) then
                        DrawText3D(0, 0, 0, "~g~E~w~ - Police Garage") 
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-garage-police:Menu")
                        end
                    end
                    if IsPedInAnyVehicle(PlayerPedId(), false) then   
                        DrawText3D(0, 0, 0, "~g~E~w~ - Store Vehicle (Will Get Impounded)") 
                    end
                    if IsControlJustReleased(0, 38) and IsPedInAnyVehicle(PlayerPedId(), false) then
                        TriggerEvent("qb-garage-police:StoreVehicle")
                    end
                else
                    if (GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, 0, 0, 0, true) < 1.5) then
                        DrawText3D(0, 0, 0, "~g~E~w~ - Police Garage") 
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-garage-police:Menu")
                        end
                    end
                end
            end
        end

        if letSleep then
            Wait(2000)
        end

        Wait(1)
    end
end)

RegisterNetEvent('qb-garage-police:client:SetActive', function(status)
    isActive = status
end)

RegisterNetEvent('qb-garage-police:StoreVehicle')
AddEventHandler('qb-garage-police:StoreVehicle', function()
    local ped = PlayerPedId()
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    if IsPedInAnyVehicle(ped, false) then
        TaskLeaveVehicle(ped, car, 1)
        Citizen.Wait(2000)
        QBCore.Functions.Notify('Vehicle Stored!')
        DeleteVehicle(car)
        DeleteEntity(car)
    else
        QBCore.Functions.Notify("You Are Not In Any Vehicle !", "error")
    end
end)

RegisterNetEvent("qb-garage-police:SpawnVehicle")
AddEventHandler("qb-garage-police:SpawnVehicle", function(vehicle)
    local coords = vector4(vector4(442.03103, -1014.105, 27.914871, 91.461563))
    local v = Config.Vehicles
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        local props = QBCore.Functions.GetVehicleProperties(veh)
        SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(10000, 99999)))
        exports['ps-fuel']:SetFuel(veh, 100.0)
        CloseMenu()
        if Config.UseColors == true then
            SetVehicleCustomPrimaryColour(veh, v.r, v.g, v.b)
            SetVehicleCustomSecondaryColour(veh, v.r, v.g, v.b)
        end
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
        TriggerServerEvent("qb-garage-police:AddVehicleSQL", props, vehicle, GetHashKey(veh), QBCore.Functions.GetPlate(veh))
    end, coords, true)
end)

RegisterNetEvent("qb-garage-police:PreviewVehicle")
AddEventHandler("qb-garage-police:PreviewVehicle", function(data)
    if Config.UsePreviewMenuSync then
        QBCore.Functions.TriggerCallback('qb-garage-police:CheckIfActive', function(result)
            if result then
                InPreview = true
                local coords = vector4(350.0476, -588.4229, 74.161766, 273.79202)
                QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
                    SetEntityVisible(PlayerPedId(), false, 1)
                    if Config.SetVehicleTransparency == 'low' then
                        SetEntityAlpha(veh, 400)
                    elseif Config.SetVehicleTransparency == 'medium' then
                        SetEntityAlpha(veh, 93)
                    elseif Config.SetVehicleTransparency == 'high' then
                        SetEntityAlpha(veh, 40)
                    elseif Config.SetVehicleTransparency == 'none' then
                        
                    end
                    FreezeEntityPosition(PlayerPedId(), true)
                    SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
                    exports['ps-fuel']:SetFuel(veh, 0.0)
                    CloseMenu()
                    FreezeEntityPosition(veh, true)
                    SetVehicleEngineOn(veh, false, false)
                    DoScreenFadeOut(200)
                    Citizen.Wait(500)
                    DoScreenFadeIn(200)
                    SetVehicleUndriveable(veh, true)
                
                    VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 331.85275, -578.7847, 28.796875, 50, 0.00, 282.17034, 80.00, false, 0)
                    SetCamActive(VehicleCam, true)
                    RenderScriptCams(true, true, 500, true, true)
                    
                    if Config.MS == 'high' then
                        Citizen.CreateThread(function()
                            while true do
                                if InPreview then
                                    ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                                elseif not InPreview then
                                    break
                                end
                                Citizen.Wait(1)
                            end
                        end)
                    elseif Config.MS == 'low' then
                        ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                    end
            
                    Citizen.CreateThread(function()
                        while true do
                            if IsControlJustReleased(0, 177) then
                                SetEntityVisible(PlayerPedId(), true, 1)
                                FreezeEntityPosition(PlayerPedId(), false)
                                PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                                QBCore.Functions.DeleteVehicle(veh)
                                DoScreenFadeOut(200)
                                Citizen.Wait(500)
                                DoScreenFadeIn(200)
                                RenderScriptCams(false, false, 1, true, true)
                                InPreview = false
                                TriggerServerEvent("qb-garage-police:server:SetActive", false)
                                break
                            end
                            Citizen.Wait(1)
                        end
                    end)
                end, coords, true)
            end
        end)
    else
        InPreview = true
        local coords = vector4(350.16085, -588.1994, 74.161788, 277.39337),
        QBCore.Functions.SpawnVehicle(data.vehicle, function(veh)
            SetEntityVisible(PlayerPedId(), false, 1)
            if Config.SetVehicleTransparency == 'low' then
                SetEntityAlpha(veh, 400)
            elseif Config.SetVehicleTransparency == 'medium' then
                SetEntityAlpha(veh, 93)
            elseif Config.SetVehicleTransparency == 'high' then
                SetEntityAlpha(veh, 40)
            elseif Config.SetVehicleTransparency == 'none' then
                
            end
            FreezeEntityPosition(PlayerPedId(), true)
            SetVehicleNumberPlateText(veh, "POL"..tostring(math.random(1000, 9999)))
            exports['ps-fuel']:SetFuel(veh, 0.0)
            CloseMenu()
            FreezeEntityPosition(veh, true)
            SetVehicleEngineOn(veh, false, false)
            DoScreenFadeOut(200)
            Citizen.Wait(500)
            DoScreenFadeIn(200)
            SetVehicleUndriveable(veh, true)
        
            VehicleCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 434.03289, -1022.814, 28.730619, 50, 0.00, 282.17034, 80.00, false, 0)
            SetCamActive(VehicleCam, true)
            RenderScriptCams(true, true, 500, true, true)
            
            if Config.MS == 'high' then
                Citizen.CreateThread(function()
                    while true do
                        if InPreview then
                            ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
                        elseif not InPreview then
                            break
                        end
                        Citizen.Wait(1)
                    end
                end)
            elseif Config.MS == 'low' then
                ShowHelpNotification("Press ~INPUT_FRONTEND_RRIGHT~ To Close")
            end
    
            Citizen.CreateThread(function()
                while true do
                    if IsControlJustReleased(0, 177) then
                        SetEntityVisible(PlayerPedId(), true, 1)
                        FreezeEntityPosition(PlayerPedId(), false)
                        PlaySoundFrontend(-1, "NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
                        QBCore.Functions.DeleteVehicle(veh)
                        DoScreenFadeOut(200)
                        Citizen.Wait(500)
                        DoScreenFadeIn(200)
                        RenderScriptCams(false, false, 1, true, true)
                        InPreview = false
                        break
                    end
                    Citizen.Wait(1)
                end
            end)
        end, coords, true)
    end
end)

function CloseMenu()
    exports['qb-menu']:closeMenu()
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end