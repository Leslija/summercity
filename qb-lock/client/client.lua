local QBCore = exports['qb-core']:GetCoreObject()
local Result = nil
local NUI_status = false

RegisterNetEvent('qb-lock:client:openLockpick', function(callback, circles, isUsingAdvanced)
    lockpickCallback = callback
    exports['qb-lock']:StartLockPickCircle(total,isUsingAdvanced,circles) 
end)

function StartLockPickCircle(circles, isUsingAdvanced, callback)
    Result = nil
	print(circles, "you petty thief")
    NUI_status = true
    SendNUIMessage({
        action = 'start',
        value = circles,
        using_Advanced = isUsingAdvanced,
        is_cuffed = get_Cuffed;
        print(isUsingAdvanced),

    })
    while NUI_status do
        Wait(5)
        SetNuiFocus(NUI_status, false)
    end
    Wait(100)
    SetNuiFocus(false, false)
    lockpickCallback = callback
    return Result
end

RegisterNUICallback('fail', function()
        ClearPedTasks(PlayerPedId())
        Result = false
        Wait(100)
        NUI_status = false
        --print('fail')
end)

RegisterNUICallback('success', function()
	Result = true
	Wait(100)
	NUI_status = false
    SetNuiFocus(false, false)
    print(Result)
    return Result
end)
