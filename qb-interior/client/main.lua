local IsNew = false

RegisterNetEvent('qb-interior:client:SetNewState', function(bool)
	IsNew = bool
end)

-- Functions

function TeleportToInterior(x, y, z, h)
    CreateThread(function()
        SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), h)

        Wait(100)

        DoScreenFadeIn(1000)
    end)
end

exports('DespawnInterior', function(objects, cb)
    CreateThread(function()
        for _, v in pairs(objects) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end

        cb()
    end)
end)

-- Starting Apartment

exports('CreateApartmentFurnished', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -1.50, "y": 10.0, "z": 1.3, "h":358.50}')
	POIOffsets.clothes = json.decode('{"x": -6.028, "y": -9.5, "z": 1.2, "h":2.263}')
	POIOffsets.stash = json.decode('{"x": -7.305, "y": -3.922, "z": 0.5, "h":2.263}')
	POIOffsets.logout = json.decode('{"x": -0.8, "y": 1.0, "z": 1.0, "h":2.263}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`furnitured_midapart`)
	while not HasModelLoaded(`furnitured_midapart`) do
	    Wait(3)
	end
	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + 1.5, spawn.y - 10.0, spawn.z, POIOffsets.exit.h)
	if IsNew then
		SetTimeout(750, function()
			TriggerEvent('qb-clothes:client:CreateFirstCharacter')
			IsNew = false
		end)
	end
    return { objects, POIOffsets }
end)

exports('CreateHouseRobbery', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`furnitured_midapart`)
	while not HasModelLoaded(`furnitured_midapart`) do
	    Wait(1000)
	end
	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

-- Shells (in order by tier starting at 1)

exports('CreateApartmentShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 4.693, "y": -6.015, "z": 1.11, "h":358.634}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`appartment`)
	while not HasModelLoaded(`appartment`) do
	    Wait(1000)
	end
	local house = CreateObject(`appartment`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateTier1House', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.561, "y": -14.305, "z": 1.147, "h":2.263}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_v16mid`)
	while not HasModelLoaded(`shell_v16mid`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_v16mid`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateTrevorsShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 0.374, "y": -3.789, "z": 2.428, "h":358.633}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_trevor`)
	while not HasModelLoaded(`shell_trevor`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_trevor`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateCaravanShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":3.3, "y":-2.1, "x":-1.4, "h":358.633972168}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_trailer`)
	while not HasModelLoaded(`shell_trailer`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_trailer`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateLesterShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.780, "y":-0.795, "z":1.1,"h":270.30}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_lester`)
	while not HasModelLoaded(`shell_lester`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_lester`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateRanchShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.257, "y":-5.469, "z":2.5, "h":270.57,}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_ranch`)
	while not HasModelLoaded(`shell_ranch`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_ranch`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateContainer', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 0.08, "y": -5.73, "z": 1.24, "h": 359.32}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`container_shell`)
	while not HasModelLoaded(`container_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`container_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateFurniMid', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`furnitured_midapart`)
	while not HasModelLoaded(`furnitured_midapart`) do
	    Wait(1000)
	end
	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateFurniMotelModern', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 4.98, "y": 4.35, "z": 1.16, "h": 179.79}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`modernhotel_shell`)
	while not HasModelLoaded(`modernhotel_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`modernhotel_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateFranklinAunt', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -0.36, "y": -5.89, "z": 1.70, "h": 358.21}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_frankaunt`)
	while not HasModelLoaded(`shell_frankaunt`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_frankaunt`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateGarageMed', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 13.90, "y": 1.63, "z": 1.0, "h": 87.05}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_garagem`)
	while not HasModelLoaded(`shell_garagem`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_garagem`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateMichael', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -9.49, "y": 5.54, "z": 9.91, "h": 270.86}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_michael`)
	while not HasModelLoaded(`shell_michael`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_michael`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateOffice1', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.88, "y": 5.06, "z": 2.05, "h": 180.07}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_office1`)
	while not HasModelLoaded(`shell_office1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_office1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateStore1', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -2.61, "y": -4.73, "z": 1.08, "h": 1.0}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_store1`)
	while not HasModelLoaded(`shell_store1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_store1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateWarehouse1', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -8.95, "y": 0.51, "z": 1.04, "h": 268.82}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`shell_warehouse1`)
	while not HasModelLoaded(`shell_warehouse1`) do
	    Wait(1000)
	end
	local house = CreateObject(`shell_warehouse1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

exports('CreateFurniMotelStandard', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -0.43, "y": -2.51, "z": 1.0, "h": 271.29}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`standardmotel_shell`)
	while not HasModelLoaded(`standardmotel_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`standardmotel_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)


function HouseRobTierTwo(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":1.4,"y":2.65636328125,"x":-10.572736328125,"h":265.633972168}')
	POIOffsets.inhouse = json.decode('{"z":0.100000,"y":-2.690000,"x":10.300000,"h":0.000000}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
	RequestModel(`micheal_shell`)
	while not HasModelLoaded(`micheal_shell`) do
	    Citizen.Wait(1000)
	end
	
	Citizen.Wait(2000)
	local house = CreateObject(`micheal_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	local gasfornuis = CreateObject(`v_res_ovenhobmod`,spawn.x+7.11616000,spawn.y+5.6062000,spawn.z+0.6203,false,false,false)
	local gasfornuis2 = CreateObject(`v_res_ovenhobmod`,spawn.x+8.00876000,spawn.y+5.6062000,spawn.z+0.6203,false,false,false)
	local bank = CreateObject(`apa_mp_h_stn_sofacorn_01`,spawn.x-2.23024,spawn.y-5.9684600,spawn.z+0.8349,false,false,false)
	local avunits = CreateObject(`apa_mp_h_str_avunits_01`,spawn.x-1.48765600,spawn.y-11.9656,spawn.z+0.8349,false,false,false)
	local eettafel = CreateObject(`v_res_m_dinetble_replace`,spawn.x+8.07676,spawn.y-2.2142,spawn.z+0.8581,false,false,false)
	local stoel1 = CreateObject(`v_res_mbchair`,spawn.x+8.79056,spawn.y-1.5427,spawn.z+0.8604,false,false,false)
	local stoel2 = CreateObject(`v_res_mbchair`,spawn.x+7.37686,spawn.y-1.5945,spawn.z+0.8604,false,false,false)
	local stoel3 = CreateObject(`v_res_mbchair`,spawn.x+7.38636,spawn.y-2.9317,spawn.z+0.8604,false,false,false)
	local stoel4 = CreateObject(`v_res_mbchair`,spawn.x+8.74406,spawn.y-2.883,spawn.z+0.8604,false,false,false)
	local consolemod = CreateObject(`v_res_mconsolemod`,spawn.x-5.55194,spawn.y-2.2877,spawn.z+4.7544,false,false,false)
	local armoire = CreateObject(`v_res_m_armoire`,spawn.x+2.45376,spawn.y-5.1888,spawn.z+4.7544,false,false,false)
	local bed1 = CreateObject(`v_res_mdbed`,spawn.x+0.78096,spawn.y-8.8889,spawn.z+4.771,false,false,false)
	local bad = CreateObject(`apa_mp_h_bathtub_01`,spawn.x-1.48214,spawn.y-11.2114,spawn.z+4.7585,false,false,false)
	local toilet = CreateObject(`prop_toilet_01`,spawn.x-2.79564,spawn.y-11.3553,spawn.z+4.7538,false,false,false)
	local wastafel = CreateObject(`prop_sink_06`,spawn.x-3.03954,spawn.y-8.6854,spawn.z+4.7531,false,false,false)
	local handdoek = CreateObject(`prop_towel_rail_01`,spawn.x-0.68474,spawn.y-9.4637,spawn.z+5.5607,false,false,false)
	local doucheding = CreateObject(`prop_shower_rack_01`,spawn.x-0.69474,spawn.y-11.0642,spawn.z+5.5607,false,false,false)
	local zeep = CreateObject(`prop_toilet_soap_02`,spawn.x-0.82164,spawn.y-11.0668,spawn.z+5.6127,false,false,false)
	local bed2 = CreateObject(`apa_mp_h_bed_with_table_02`,spawn.x-7.87674,spawn.y+5.9472,spawn.z+4.7629,false,false,false)
	local schilderij = CreateObject(`apa_p_h_acc_artwalll_02`,spawn.x-7.86444,spawn.y+5.9283,spawn.z+5.6751,false,false,false)
	local bureau = CreateObject(`v_med_p_desk`,spawn.x-6.80674,spawn.y-1.93183,spawn.z+4.7536,false,false,false)
	local bureaustoel = CreateObject(`v_club_officechair`,spawn.x-7.97964,spawn.y-2.2074,spawn.z+4.7735,false,false,false)
	local kast = CreateObject(`v_corp_offshelf`,spawn.x-10.9832,spawn.y-2.2,spawn.z+4.7586,false,false,false)
	local laptop = CreateObject(`prop_laptop_01a`,spawn.x-7.10454,spawn.y-1.7372,spawn.z+5.5023,false,false,false)
	local muis = CreateObject(`prop_mouse_01b`,spawn.x-7.21634,spawn.y-2.0773,spawn.z+5.5035,false,false,false)
	local koffietafel = CreateObject(`v_res_fh_coftbldisp`,spawn.x-0.365654,spawn.y-8.1713,spawn.z+0.8478,false,false,false)
	local armstoel = CreateObject(`apa_mp_h_stn_chairarm_12`,spawn.x+2.40106,spawn.y-10.2779,spawn.z+0.8478,false,false,false)
	local voetensteun = CreateObject(`apa_mp_h_stn_chairstool_12`,spawn.x+1.51176,spawn.y-9.764,spawn.z+0.8478,false,false,false)
	local keukenkast = CreateObject(`prop_cs_kitchen_cab_l`,spawn.x+9.92616000,spawn.y+5.7062000,spawn.z+1.645,false,false,false)
	local bloemenvaas = CreateObject(`v_res_m_vasefresh`,spawn.x-8.11436,spawn.y-2.1717,spawn.z+1.6992,false,false,false)
	local lamp = CreateObject(`v_ret_gc_lamp`,spawn.x-6.758,spawn.y-2.763,spawn.z+5.5,false,false,false)
	local bed3 = CreateObject(`v_res_msonbed`,spawn.x-6.165,spawn.y-10.639,spawn.z+4.763,false,false,false)
	local kast2 = CreateObject(`v_res_cabinet`,spawn.x-4.387,spawn.y+4.302,spawn.z+4.678,false,false,false)
	local kast3 = CreateObject(`v_res_m_sidetable`,spawn.x+4.728,spawn.y-2.275,spawn.z+4.753,false,false,false)
	local schilderij2 = CreateObject(`apa_mp_h_acc_artwallm_04`,spawn.x-5.859,spawn.y-2.277,spawn.z+6.119,false,false,false)
	local meubel = CreateObject(`v_res_d_dressingtable`,spawn.x-3.543,spawn.y+1.2602,spawn.z+4.753,false,false,false)
	local nachtkast = CreateObject(`v_res_mbbedtable`,spawn.x-4.813,spawn.y-11.703,spawn.z+4.763,false,false,false)
	local nachtkast2 = CreateObject(`v_res_mbbedtable`,spawn.x-7.518,spawn.y-11.697,spawn.z+4.753,false,false,false)
	local meubel2 = CreateObject(`v_res_d_dressingtable`,spawn.x+1.411,spawn.y-11.608,spawn.z+4.753,false,false,false)
	local kast4 = CreateObject(`apa_mp_h_str_sideboardl_11`,spawn.x-0.176,spawn.y-1.24,spawn.z+0.848,false,false,false)
	local schilderij3 = CreateObject(`ex_mp_h_acc_artwallm_02`,spawn.x-0.176,spawn.y-1.189,spawn.z+2.163,false,false,false)
	local plant = CreateObject(`v_med_p_planter`,spawn.x-2.034,spawn.y-1.639,spawn.z+0.859,false,false,false)
	local kast5 = CreateObject(`v_res_mcupboard`,spawn.x+0.93716,spawn.y+0.3832,spawn.z+0.374,false,false,false)
	local golftas = CreateObject(`prop_golf_bag_01c`,spawn.x-10.653,spawn.y+5.15,spawn.z+0.183,false,false,false)
	local kunst = CreateObject(`apa_mp_h_acc_dec_head_01`,spawn.x-8.126,spawn.y-0.075,spawn.z+1.267,false,false,false)
	local kunst2 = CreateObject(`apa_mp_h_acc_dec_sculpt_02`,spawn.x-7.547,spawn.y-0.075,spawn.z+1.267,false,false,false)
	local bank2 = CreateObject(`v_res_r_sofa`,spawn.x-7.62,spawn.y+5.255,spawn.z+0.167,false,false,false)
	local schilderij4 = CreateObject(`ex_mp_h_acc_artwallm_02`,spawn.x-7.595,spawn.y+5.884,spawn.z+1.564,false,false,false)
	local kast6 = CreateObject(`v_res_mconsolemod`,spawn.x-7.799,spawn.y+0.537,spawn.z+0.173,false,false,false)
	local tafeltje = CreateObject(`v_res_mbbedtable`,spawn.x+1.458,spawn.y+5.495,spawn.z+3.015,false,false,false)
	local plant2 = CreateObject(`v_res_rubberplant`,spawn.x+1.491,spawn.y+5.524,spawn.z+3.565,false,false,false)
	local bank3 = CreateObject(`v_club_officesofa`,spawn.x-7.932,spawn.y-7.054,spawn.z+4.768,false,false,false)
	local box = CreateObject(`v_res_tre_storagebox`,spawn.x-3.832,spawn.y-7.528,spawn.z+4.763,false,false,false)
	local lamp2 = CreateObject(`v_club_vu_lamp`,spawn.x-4.832,spawn.y-11.730,spawn.z+5.313,false,false,false)
	local speakerdock = CreateObject(`v_res_fh_speakerdock`,spawn.x-7.53,spawn.y-11.632,spawn.z+5.3,false,false,false)
	local fan = CreateObject(`v_res_tre_lightfan`,spawn.x-1.276,spawn.y-7.481,spawn.z+4.162,false,false,false)
	local kunst3 = CreateObject(`v_res_sculpt_dec`,spawn.x-4.868,spawn.y-7.307,spawn.z+3.098,false,false,false)
	local kunst4 = CreateObject(`v_res_sculpt_dece`,spawn.x-4.903,spawn.y-7.667,spawn.z+2.112,false,false,false)
	local kunst5 = CreateObject(`v_res_r_figoblisk`,spawn.x-4.842,spawn.y-5.623,spawn.z+2.1,false,false,false)
	local kunst6 = CreateObject(`v_res_r_figflamenco`,spawn.x+0.947,spawn.y-1.451,spawn.z+1.73,false,false,false)
	local plant2 = CreateObject(`v_res_m_bananaplant`,spawn.x-1.73,spawn.y+2.15,spawn.z-0.398,false,false,false)
	local kunst7 = CreateObject(`ba_prop_battle_trophy_battler`,spawn.x-4.958,spawn.y-9.021,spawn.z+2.097,false,false,false)
	local kunst8 = CreateObject(`ba_prop_battle_trophy_no1`,spawn.x-4.899,spawn.y-9.309,spawn.z+2.097,false,false,false)
	local bong = CreateObject(`prop_bong_01`,spawn.x-4.851,spawn.y-9.808,spawn.z+2.097,false,false,false)
	local plant3 = CreateObject(`v_res_tre_tree`,spawn.x+4.654,spawn.y-4.830,spawn.z+0.848,false,false,false)
	local kunst8 = CreateObject(`v_res_fh_sculptmod`,spawn.x-3.761,spawn.y-11.148,spawn.z+0.858,false,false,false)
	local kunst9 = CreateObject(`v_res_r_figfemale`,spawn.x-4.933,spawn.y-6.174,spawn.z+2.109,false,false,false)
	local kunst10 = CreateObject(`v_res_r_figcat`,spawn.x-4.942,spawn.y-5.07,spawn.z+3.1,false,false,false)
	local kunst11 = CreateObject(`v_res_sculpt_decf`,spawn.x-4.903,spawn.y-5.93,spawn.z+3.1,false,false,false)
	local kunst12 = CreateObject(`v_res_r_fighorsestnd`,spawn.x-4.978,spawn.y-5.157,spawn.z+2.109,false,false,false)
	local kunst13 = CreateObject(`v_med_p_vaseround`,spawn.x-1.381,spawn.y-1.561,spawn.z+1.725,false,false,false)
	local krijtbord = CreateObject(`v_res_mchalkbrd`,spawn.x+2.208,spawn.y+2.895,spawn.z+1.645,false,false,false)
	local tijdschrift = CreateObject(`v_res_fashmagopen`,spawn.x-0.304,spawn.y-1.464,spawn.z+1.725,false,false,false)
	local kluis = CreateObject(`prop_ld_int_safe_01`,spawn.x-7.078,spawn.y-0.925,spawn.z+4.525,false,false,false)
	local plafondlamp = CreateObject(`ba_prop_battle_lights_ceiling_l_c`,spawn.x-1.489,spawn.y+1.703,spawn.z+5.858,false,false,false)
	table.insert(objects, house)
	FreezeEntityPosition(gasfornuis,true)
	FreezeEntityPosition(gasfornuis2,true)
	FreezeEntityPosition(keukenkast,true)
	FreezeEntityPosition(bank,true)
	FreezeEntityPosition(avunits,true)
	FreezeEntityPosition(eettafel,true)
	FreezeEntityPosition(stoel1,true)
	FreezeEntityPosition(stoel2,true)
	FreezeEntityPosition(stoel3,true)
	FreezeEntityPosition(stoel4,true)
	FreezeEntityPosition(consolemod,true)
	FreezeEntityPosition(armoire,true)
	FreezeEntityPosition(bed1,true)
	FreezeEntityPosition(bad,true)
	FreezeEntityPosition(toilet,true)
	FreezeEntityPosition(wastafel,true)
	FreezeEntityPosition(handdoek,true)
	FreezeEntityPosition(toilet,true)
	FreezeEntityPosition(wastafel,true)
	FreezeEntityPosition(handdoek,true)
	FreezeEntityPosition(doucheding,true)
	FreezeEntityPosition(zeep,true)
	FreezeEntityPosition(bed2,true)
	FreezeEntityPosition(kast,true)
	FreezeEntityPosition(bureau,true)
	FreezeEntityPosition(bureaustoel,true)
	FreezeEntityPosition(laptop,true)
	FreezeEntityPosition(muis,true)
	FreezeEntityPosition(koffietafel,true)
	FreezeEntityPosition(armstoel,true)
	FreezeEntityPosition(voetensteun,true)
	FreezeEntityPosition(plant,true)
	FreezeEntityPosition(nachtkast,true)
	FreezeEntityPosition(nachtkast2,true)
	FreezeEntityPosition(schilderij2,true)
	FreezeEntityPosition(schilderij3,true)
	FreezeEntityPosition(meubel,true)
	FreezeEntityPosition(meubel2,true)
	FreezeEntityPosition(kast2,true)
	FreezeEntityPosition(kast3,true)
	FreezeEntityPosition(kast4,true)
	FreezeEntityPosition(kast5,true)
	FreezeEntityPosition(bed3,true)
	FreezeEntityPosition(kunst,true)
	FreezeEntityPosition(kunst2,true)
	FreezeEntityPosition(bank2,true)
	FreezeEntityPosition(kast6,true)
	FreezeEntityPosition(schilderij4,true)
	FreezeEntityPosition(kunst8,true)
	FreezeEntityPosition(kluis,true)
	FreezeEntityPosition(plafondlamp,true)
	FreezeEntityPosition(krijtbord,true)
	FreezeEntityPosition(plant3,true)
	FreezeEntityPosition(plant2,true)
	FreezeEntityPosition(box,true)
	FreezeEntityPosition(bank3,true)
	FreezeEntityPosition(speakerdock,true)
	FreezeEntityPosition(kast6,true)
	FreezeEntityPosition(schilderij4,true)
	FreezeEntityPosition(tafeltje,true)
	FreezeEntityPosition(plant2,true)
	FreezeEntityPosition(schilderij,true)
	SetEntityHeading(bank,GetEntityHeading(bank)+90)
	SetEntityHeading(avunits,GetEntityHeading(avunits)+180)
	SetEntityHeading(stoel1,GetEntityHeading(stoel1)+315)
	SetEntityHeading(stoel2,GetEntityHeading(stoel2)+45)
	SetEntityHeading(stoel3,GetEntityHeading(stoel3)+135)
	SetEntityHeading(stoel4,GetEntityHeading(stoel4)+225)
	SetEntityHeading(consolemod,GetEntityHeading(consolemod)+90)
	SetEntityHeading(bed1,GetEntityHeading(bed1)+90)
	SetEntityHeading(bad,GetEntityHeading(bad)+180)
	SetEntityHeading(toilet,GetEntityHeading(toilet)+180)
	SetEntityHeading(wastafel,GetEntityHeading(wastafel)+90)
	SetEntityHeading(kast,GetEntityHeading(kast)+90)
	SetEntityHeading(handdoek,GetEntityHeading(handdoek)+270)
	SetEntityHeading(doucheding,GetEntityHeading(doucheding)+270)
	SetEntityHeading(zeep,GetEntityHeading(zeep)+270)
	SetEntityHeading(bureau,GetEntityHeading(bureau)+270)
	SetEntityHeading(bureaustoel,GetEntityHeading(bureaustoel)+103)
	SetEntityHeading(laptop,GetEntityHeading(laptop)+283)
	SetEntityHeading(muis,GetEntityHeading(muis)+270)
	SetEntityHeading(koffietafel,GetEntityHeading(koffietafel)+270)
	SetEntityHeading(armstoel,GetEntityHeading(armstoel)+240)
	SetEntityHeading(voetensteun,GetEntityHeading(voetensteun)+240)
	SetEntityHeading(schilderij2,GetEntityHeading(schilderij2)+90)
	SetEntityHeading(bed3,GetEntityHeading(bed3)+180)
	SetEntityHeading(lamp,GetEntityHeading(lamp)+180)
	SetEntityHeading(kast2,GetEntityHeading(kast2)+270)
	SetEntityHeading(kast3,GetEntityHeading(kast3)+270)
	SetEntityHeading(meubel,GetEntityHeading(meubel)+270)
	SetEntityHeading(meubel2,GetEntityHeading(meubel2)+180)
	SetEntityHeading(kast5,GetEntityHeading(kast5)+180)
	SetEntityHeading(kast6,GetEntityHeading(kast6)+180)
	SetEntityHeading(kunst,GetEntityHeading(kunst)+180)
	SetEntityHeading(kunst2,GetEntityHeading(kunst2)+180)
	SetEntityHeading(krijtbord,GetEntityHeading(krijtbord)+90)
	SetEntityHeading(plant2,GetEntityHeading(plant2)+270)
	SetEntityHeading(kunst12,GetEntityHeading(kunst12)+90)
	SetEntityHeading(kunst11,GetEntityHeading(kunst11)+90)
	SetEntityHeading(kluis,GetEntityHeading(kluis)+270)
	SetEntityHeading(box,GetEntityHeading(box)+90)
	SetEntityHeading(bank3,GetEntityHeading(bank3)+90)
	SetEntityHeading(kunst4,GetEntityHeading(kunst4)+90)
    Citizen.Wait(100)
    SetEntityCoords(PlayerPedId(), spawn.x - POIOffsets.inhouse.x , spawn.y - POIOffsets.inhouse.y, spawn.z + POIOffsets.inhouse.z)
	SetEntityHeading(PlayerPedId(), 268.56)
    Citizen.Wait(45)
    DoScreenFadeIn(500)
    return {objects, POIOffsets}
end

-- Exports
--exports('HouseRobTierTwo', HouseRobTierTwo)