INSTALTION
srl-radialmenu/config:
    
    if you want it to work with crowbar use this one
    {
    id = "AtmRob",
    displayName = "Crack Atm",
    icon = "#container-rob",
    functionName = "shaharlevy-robbery:atm",
    enableMenu = function()
        local Data = SRLCore.Functions.GetPlayerData()
        local isNearAtm = exports["shaharlevy-robbery"]:isNearAtm()
        local hasItem = GetSelectedPedWeapon(PlayerPedId()) == `weapon_crowbar`
        return hasItem and isNearAtm and (not Data.metadata["isdead"] and not Data.metadata["inlaststand"])
    end
    },

    if you want it to work if you have A certain item in your inventory use this

    {
        id = "AtmRob1",
        displayName = "Crack Atm",
        icon = "#container-rob",
        functionName = "shaharlevy-robbery:atm",
        enableMenu = function()
            local Data, hasItem = SRLCore.Functions.GetPlayerData()
            local isNearAtm = exports["shaharlevy-robbery"]:isNearAtm()
            SRLCore.Functions.TriggerCallback('ShaharLevy:HasItem', function(result)
                hasItem = result
            end, "hacking_device")

            while hasItem == nil do
                Wait(10)
            end
            return hasItem and isNearAtm and (not Data.metadata["isdead"] and not Data.metadata["inlaststand"])
        end
    },

default item that you need in your inventory is "hacking_device" if you want to use it here is the srl-core/shared/item.lua:

    ['hacking_device']			     = {['name'] = "hacking_device",			    ['label'] = "Hacking device",			['weight'] = 500,		['type'] = 'item', 		['image'] = 'hacking_device.png',			['unique'] = true,		['useable']	= true,		['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "A multi purpose hacking device"},

the image is in the images folder


work for SRLCore only created by shahar levy#7023





Citizen.CreateThread(function()
    if "mhacking" == Config.minigame then
        Citizen.Wait(10)

    elseif "idz-simon" == Config.minigame then
        Citizen.Wait(10)
    
    elseif "idz-simon" == Config.minigame then
        Citizen.Wait(10)

    else
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
        print("you didnt chose a mini game for the atm robbery")
    end
end)
































































































































































































































































































































































































































































































shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 shahar levy#7023 

