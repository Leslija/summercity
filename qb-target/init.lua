function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 7.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Whether to have the target as a toggle or not
Config.Toggle = false

-- Draw a Sprite on the center of a PolyZone to hint where it's located
Config.DrawSprite = false

-- The default distance to draw the Sprite
Config.DrawDistance = 10.0

-- The color of the sprite in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = {255, 255, 255, 255}

-- The color of the sprite in rgb when the PolyZone is targeted, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = {30, 144, 255, 255}

-- The color of the outline in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255, 255}

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = false

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt

-- Control for key press detection on the context menu, it's the Right Mouse Button by default, controls are found here https://docs.fivem.net/docs/game-references/controls/
Config.MenuControlKey = 238

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {


    

    ["BurgershotDuty"] = {
		name = "BurgershotDuty",
		coords = vector3(-1191.48, -900.53, 14.25),
		length = 1.1,
		width = 0.3,
		heading = 212.0,
		debugPoly = false,
		minZ = 14.25,
		maxZ = 15.33,
		options = {
			{
				type = "client",
				targeticon = 'fas fa-eye', 
				event = "qb-burgershotjob:DutyB",
				icon = "far fa-clipboard",
				label = "Clock In/Out",
				job = "burgershot",
			}
		},
		distance = 3.0
		},
		["BurgerShotJob"] = {
			name = "BurgerShotJob",
			coords = vector3(-1196.64, -904.80, 13.04),
			length = 0.8,
			width = 2.5,
			heading = 302,
			debugPoly = false,
			minZ = 13.04,
			maxZ = 14.50,
			options = {
				{
					type = "client",
					targeticon = 'fas fa-eye', 
					event = "qb-burgershotjob:startjob",
					icon = "far fa-clipboard",
					label = "Start Job",
					job = "burgershot",
				}
			},
			distance = 3.0
		},
 ["BurgersCounter"] = {
        name = "BurgersCounter",
        coords =vector3(-1198.558, -897.416, 13.830132),
        length = 0.9,
        width = 1,
        heading = 125,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotmenu:burgershotmainmanu",
                icon = "fas fa-hamburger",
                label = "Burgershot Burger Menu",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["BurgershotWashHands"] = {
        name = "BurgershotWasHands",
        coords = vector3(-1200.291, -901.0861, 13.975964),
        length = 0.8,
        width = 0.7,
        heading = 123.5,
        debugPoly = false,
        minZ = 13.53,
        maxZ = 14.29,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:washHands",
                icon = "fas fa-hand-holding-water",
                label = "Wash your Hands!",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["SodaFountain"] = {
        name = "SodaFountain",
        coords = vector3(-1200.03, -895.47, 14.74),
        length = 1.1,
        width = 2.1,
        heading = 125,
        debugPoly = false,
        minZ = 14.00,
        maxZ = 14.73,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotmenu:DrinkMenu",
                icon = "fas fa-filter",
                label = "Burgershot Drink Menu",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
	  ["TomatoCounter"] = {
        name = "TomatoCounter",
        coords = vector3(-1198.447, -898.4566, 13.664762),
        length = 1.0,
        width = 1.1,
        heading = 29.83,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:makeTomato",
                icon = "fas fa-hamburger",
                label = "Cut Tomatoes",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:makeOnions",
                icon = "fas fa-hamburger",
                label = "Cut Onions",
                job = "burgershot",
            }

        },
        distance = 3.0
    },
    ["Fries"] = {
        name = "Fries",
        coords = vector3(-1202.03, -898.62, 13.03),
        length = 1,
        width = 1.6,
        heading = 302.5,
        debugPoly = false,
        minZ = 13.03,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:PrepareFries",
                icon = "fas fa-box",
                label = "Make Fries",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:PrepareOnionRings",
                icon = "fas fa-box",
                label = "Make Onion Rings",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:PrepareChickenNuggets",
                icon = "fas fa-box",
                label = "Make Chicken Nuggets",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
	 ["MeatGrill"] = {
        name = "MeatGrill",
        coords = vector3(-1202.83, -897.28, 13.98),
        length = 0.8,
        width = 1.45,
        heading = 304.5,
        debugPoly = false,
        minZ = 13.99,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:BakeMeat",
                icon = "fas fa-box",
                label = "Grill Raw Meat",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["DriveThruWindow"] = {
        name = "DriveThruWindow",
        coords = vector3(-1193.82, -906.99, 12.79),
        length = 1,
        width = 2,
        heading = 171.50,
        debugPoly = false,
        minZ = 12.79,
        maxZ =  15.40,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:DriveThru",
                icon = "fas fa-box",
                label = "Drive Thru",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
	  ["FrontCounterTray1"] = {
        name = "FrontCounterTray1",
        coords = vector3(-1196.01, -891.45, 14.03),
        length = 0.5,
        width = 0.5,
        heading = 122,
        debugPoly = false,
        minZ = 14.03,
        maxZ = 14.30,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Tray1",
                icon = "fas fa-box",
                label = "Tray 1",
            }
        },
        distance = 3.0
    },
    ["FrontCounterTray2"] = {
        name = "FrontCounterTray2",
        coords = vector3(-1194.67, -893.23, 14.03),
        length = 0.5,
        width = 0.5,
        heading = 122,
        debugPoly = false,
        minZ = 14.03,
        maxZ = 14.30,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Tray2",
                icon = "fas fa-box",
                label = "Tray 2",
            }
        },
        distance = 3.0
    },
    ["HotTrayStorage"] = {
        name = "HotTrayStorage",
        coords = vector3(-1197.56, -894.57, 13.00),
        length = 1,
        width = 4.5,
        heading = 304.5,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 14.87,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Storage",
                icon = "fas fa-box",
                label = "BurgerShot Storage",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["BurgerFridge"] = {
        name = "BurgerFridge",
        coords = vector3(-1196.63, -902.0, 13.05),
        length = 0.8,
        width = 1.55,
        heading = 32.5,
        debugPoly = false,
        minZ = 13.05,
        maxZ = 15.47,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:FoodStorage",
                icon = "fas fa-box",
                label = "BurgerShot Fridge",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
	 ["UnloadBurgeshotIngredients"] = {
        name = "UnloadBurgeshotIngredients",
        coords = vector3(-1204.985, -891.8149, 13.984722),
        length = 4,
        width = 4,
        heading = 214,
        debugPoly = false,
        minZ = 13.00,
        maxZ = 15.49,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:Unloadbox",
                icon = "fas fa-box",
                label = "Unload Ingredients",
                job = "burgershot",
            }
        },
        distance = 3.0
    },
    ["Icecream"] = {
        name = "Ice Cream",
        coords = vector3(-1193.029, -895.7907, 14.0616),
        length = 1,
        width = 1.6,
        heading = 302.5,
        debugPoly = false,
        minZ = 13.03,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:icecream",
                icon = "fas fa-ice-cream",
                label = "Make Ice Cream",
                job = "burgershot",
            }
        },
        distance = 1.5
    },
    ["donut"] = {
        name = "Donut",
        coords = vector3(-1203.854, -895.6851, 14.44202),
        length = 1,
        width = 1.6,
        heading = 302.5,
        debugPoly = false,
        minZ = 13.03,
        maxZ = 14.91,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:donut",
                icon = "fas fa-box",
                label = "Get a Donut",
                job = "burgershot",
            },
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershotjob:creampie",
                icon = "fas fa-box",
                label = "Get a Slice of Cream Pie",
                job = "burgershot",
            }
        },
        distance = 1.5
    },
	   ["BSRegister1"] = {
        name = "BSRegister1",
        coords = vector3(-1195.27, -892.34, 13.98),
        length = 0.7,
        width = 0.7,
        heading = 90.5,
        debugPoly = false,
        minZ = 14.23,
        maxZ = 14.45,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:registermenu",
                icon = "fas fa-credit-card",
                label = "Open Register",
                job = "burgershot",
            },
        },
        distance = 3.0
    },
    ["BSRegister2"] = {
        name = "BSRegister2",
        coords = vector3(-1194.27, -893.87, 14.06),
        length = 0.7,
        width = 0.7,
        heading = 90.5,
        debugPoly = false,
        minZ = 14.23,
        maxZ = 14.45,
        options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
                event = "qb-burgershot:registermenu",
                icon = "fas fa-credit-card",
                label = "Open Register",
                job = "burgershot",
            },
        },
},
  ["vinnysWarehouse"] = {
            name = "vinnysWarehouse",
            coords = vector3(858.65527, -3202.554, 5.994996),
            length = 2.5,
            width = 1.1,
            heading = 93.5,
            debugPoly = false,
            minZ = 5.0,
            maxZ = 7.29,
            options = {
                --pizza this
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-pizzathis:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "pizzathis",
                },
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-uwujob:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "uwu",
                },
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-bahama:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "bahama",
                },
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-burgershotjob:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "burgershot",
                },
                {
                    type = "client",
                    targeticon = 'fas fa-eye', 
                    event = "qb-pearls:Warehousebuypallet",
                    icon = "far fa-clipboard",
                    label = "Pick Up Ingredients",
                    job = "pearls",
                },
            },
            distance = 3.0
        },


}

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetModels = {
    
    ["pdmbuy"] = {
        models = {
            "a_m_m_prolhost_01"
        },
        options = {
            {
                type = "client",
                event = "ic-vehicleshop:openShop",
                icon = "fas fa-car", 
                label = "Dealership",
            }
        },
        distance = 4.5,
    },
	    ["pdmsell"] = {
        models = {
            "mp_m_waremech_01"
        },
        options = {
            {
                type = "client",
                event = "ic-vehicleshop:sell_vehicle",
                icon = "fas fa-car", 
                label = "Sell Vehicle",
            }
        },
        distance = 8.5,
    },
	
	["BurgershotGarage"] = {
		models = {
		    `csb_talcc`,
		},
		options = {
            {
                type = "client",
                targeticon = 'fas fa-eye', 
            	event = "qb-burgershotmenu:menu",
                icon = "fas fa-car",
				label = "BurgerShot Garage",
                job = "burgershot",
                canInteract  = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
                    local dist = #(GetEntityCoords(PlayerPedId()) - vector3(-1177.112, -892.277, 13.909599))
                    if dist > 6 then
                        return false  -- This will return false if the entity interacted with is a player and otherwise returns true
                    elseif dist < 7 then 
                        return true 
                    end
                end,
            },
		},
		distance = 3.0
	},

    ["police-garage"] = {
        models = {
            "s_m_y_cop_01"
        },
        options = {
            {
            type = "client",
            event = "qb-garage-police:Menu",
            icon = "fas fa-shop",
            label = "Police Garage",
            job = "police",
            }
        },
        distance = 2.5,
    },
    ["ambulance-garage"] = {
        models = {
            "s_m_m_doctor_01"
        },
        options = {
            {
            type = "client",
            event = "qb-garage-ems:Menu",
            icon = "fas fa-shop",
            label = "EMS Garage",
            job = "ambulance",
            }
        },
        distance = 2.5,
    },


	
}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {



}

Config.GlobalObjectOptions = {
    

}

Config.GlobalPlayerOptions = {
    

}

Config.Peds = {
    { ------------pdm-buy------------
        model = 'a_m_m_prolhost_01',
        coords = vector4(-56.75, -1097.15, 25.42, 36.9),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
	    { ------------pdm-sell------------
        model = 'mp_m_waremech_01',
        coords = vector4(-35.6, -1086.88, 25.42, 258.01),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
	 {  -- police shop --
		model = 'ig_trafficwarden',
		coords = vector4(458.49, -1017.2, 28.22, 90.82),
		minusOne = true,
		freeze = true,
		invincible = true,
		blockevents = true,
                animDict = 'abigail_mcs_1_concat-0',
		scenario = 'WORLD_HUMAN_CLIPBOARD',
		flag = 1,
		target = {
			options = {
				{
					type = "client",
					event = "police:client:menu",
					icon = 'fas fa-car',
					label = 'police garage',
					job = 'police',
				}
			},
			distance = 2.5,
		},
		currentpednumber = 0,
	},
	
	["uwu"] = {
		models = {
			"A_C_Cat_01"
		},
		options = {
			{
				type = "client",
				event = "idrp-shops:marketshop",
				icon = "fas fa-shopping-basket",
				label = "Open Shop",
			},
		},
		distance = 4.0
	},
    

    { -------qb-garage-police:Menu------
    model = 's_m_y_cop_01',
    coords = vector4(438.82983, -1011.735, 27.573118, 182.87187),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
    scenario = "WORLD_HUMAN_CLIPBOARD",
},

{ -------qb-garage-ems:Menu------
    model = 's_m_m_doctor_01',
    coords = vector4(323.31616, -573.8027, 27.796871, 257.92111),
    gender = 'male',
    freeze = true,
    invincible = true,
    blockevents = true,
    scenario = "WORLD_HUMAN_CLIPBOARD",
},
}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCheck() return true end
local function CitizenCheck() return true end

CreateThread(function()
	local state = GetResourceState('qb-core')
	if state ~= 'missing' then
		local timeout = 0
		while state ~= 'started' and timeout <= 100 do
			timeout += 1
			state = GetResourceState('qb-core')
			Wait(0)
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCheck = function(items)
			local isTable = type(items) == 'table'
			local isArray = isTable and table.type(items) == 'array' or false
			local finalcount = 0
			local count = 0
			if isTable then for _ in pairs(items) do finalcount += 1 end end
			for _, v in pairs(PlayerData.items) do
				if isTable then
					if isArray then -- Table expected in this format {'itemName1', 'itemName2', 'etc'}
						for _, item in pairs(items) do
							if v and v.name == item then
								count += 1
							end
						end
					else -- Table expected in this format {['itemName'] = amount}
						local itemAmount = items[v.name]
						if itemAmount and v and v.amount >= itemAmount then
							count += 1
						end
					end
					if count == finalcount then -- This is to make sure it checks all items in the table instead of only one of the items
						return true
					end
				else -- When items is a string
					if v and v.name == items then
						return true
					end
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end
        

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCheck(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end