--[[
    Author: JDev17#8160
    TRANSLATION:
        To create a new translation file, copy an existing one and rename it to e.g. es (spanish), then translate it and change the imported file in the fxmanifest under shared_scripts.
    GARAGE CONFIGURATION EXAMPLE:
    ['somegarage'] = {
        ['Zone'] = {
            ['Shape'] = { -- Create a polyzone by using '/pzcreate poly', '/pzadd' and '/pzfinish' or '/pzcancel' to cancel it. the newly created polyzone will be in txData/QBCoreFramework_******.base/polyzone_created_zones.txt
            vector2(-1030.4713134766, -3016.3388671875),
            vector2(-970.09686279296, -2914.7397460938),
            vector2(-948.322265625, -2927.9030761718),
            vector2(-950.47174072266, -2941.6584472656),
            vector2(-949.04180908204, -2953.9467773438),
            vector2(-940.78369140625, -2957.2941894532),
            vector2(-943.88732910156, -2964.5512695312),
            vector2(-897.61529541016, -2990.0505371094),
            vector2(-930.01025390625, -3046.0695800782),
            vector2(-942.36407470704, -3044.7858886718),
            vector2(-952.97467041016, -3056.5122070312),
            vector2(-957.11712646484, -3057.0900878906)
            },
            ['minZ'] = 12.5,  -- min height of the parking zone, cannot be the same as maxZ, and must be smaller than maxZ
            ['maxZ'] = 20.0,  -- max height of the parking zone
            -- Important: Make sure the parking zone is high enough - higher than the tallest vehicle and touches the ground (turn on debug to see)
        },
        label = 'Hangar', -- label displayed on phone
        type = 'public', -- 'public', 'job', 'depot' or 'gang'
        showBlip = true, -- optional, when not defined, defaults to false
        blipName = 'Police', -- otional
        blipNumber = 90, -- optional, numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipColor = 69, -- optional, defaults to 3 (Blue), numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipcoords = vector3(-972.66, -3005.4, 13.32), -- blip coordinates
        job = 'police', -- optional, everyone can use it when not defined
        useVehicleSpawner = true, uses the configured job vehicles, make sure to have the job attribute set! (job = 'police')                            <---  NEW
        vehicleCategories = {'helicopter', 'plane'}, -- categories defined in VehicleCategories
        drawText = 'Hangar', -- the drawtext text, shown when entering the polyzone of that garage
        ParkingDistance = 10.0 -- Optional ParkingDistance, to override the global ParkingDistance
        SpawnDistance = 5.0 -- Optional SpawnDistance, to override the global SpawnDistance
        debug = false -- will show the polyzone and the parking spots, helpful when creating new garages. If too many garages are set to debug, it will not show all parking lots
        ExitWarpLocations: { -- Optional, Used for e.g. Boat parking, to teleport the player out of the boat to the closest location defined in the list.
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        }
    },
]]

 -- NEW --
 -- NEW --
StoreDamageAccuratly = true -- Do not use, if on latest qb-core, if set to true, make sure to apply / run patch1.sql
StoreParkinglotAccuratly = true  -- store the last parking lot in the DB, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet for qb-phone from the ReadMe to the phone so you can track the vehicle to the exact parking lot
SpawnAtLastParkinglot = true -- spawn the vehicle at hte last parked location if StoreParkinglotAccuratly = true, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet from the ReadMe to the phone so you can track the vehicle to the exact parking lot
GarageNameAsBlipName = true -- if set to true, the blips name will match the garage name
UseEnc0dedPersistenVehicles = false -- enable if you use this script, not really a requirement for your server and I don't recommend it if you don't know what you're doing as it requires a lot of changes in other places
-- NEW --

FuelScript = 'ps-fuel' -- change to lj-fuel / ps-fuel if you use lj-fuel / ps-fuel or something else if you use any other LegcyFuel compatible script
UseLoafHousing = false
AllowSpawningFromAnywhere = true -- if set to true, the car can be spawned from anywhere inside the zone on the closest parking lot, if set to false you will have to walk up to a parking lot 
AutoRespawn = true --True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
WarpPlayerIntoVehicle = false -- True == Will Warp Player Into their vehicle after pulling it out of garage. False It will spawn on the parking lot / in front of them  (Global, can be overriden by each garage)
HouseParkingDrawText = 'Parking' -- text when driving on to the HOUSE parking lot
ParkingDistance = 2.0 -- Distance to the parking lot when trying to park the vehicle  (Global, can be overriden by each garage)
SpawnDistance = 4.5 -- The maximum distance you can be from a parking spot, to spawn a car (Global, can be overriden by each garage)
DepotPrice = 1000.0 -- The price to take out a despawned vehicle from impound.
DrawTextPosition = 'left' -- location of drawtext: left, top, right

-- set useVehicleSpawner = true for each garage that has type job and should use the vehicle spawner instead of personal vehicles
JobVehicles = {
    ['police'] = { -- job
        label = "Police Vehicles",
        -- Grade 0
        vehicles = {
            [0] = {
                ["npolvic"] = "CVPI",
                ["npolexp"] = "EXP",
                ["npolchar"] = "char",
                ["npolchal"] = "chal",
                ["npolvette"] = "vette",
                ["npolstang"] = "stang",
                ["sheriff"] = "Sheriff Car 1",
                ["sheriff2"] = "Sheriff Car 2",
            },
            -- Grade 1
            [1] = {
                ["police"] = "Police Car 1",
                ["police2"] = "Police Car 2",
                ["police3"] = "Police Car 3",
                ["police4"] = "Police Car 4",
                ["policeb"] = "Police Car 5",
                ["policet"] = "Police Car 6",
                ["sheriff"] = "Sheriff Car 1",
                ["sheriff2"] = "Sheriff Car 2",

            },
            -- Grade 2
            [2] = {
                ["police"] = "Police Car 1",
                ["police2"] = "Police Car 2",
                ["police3"] = "Police Car 3",
                ["police4"] = "Police Car 4",
                ["policeb"] = "Police Car 5",
                ["policet"] = "Police Car 6",
                ["sheriff"] = "Sheriff Car 1",
                ["sheriff2"] = "Sheriff Car 2",
            },
            -- Grade 3
            [3] = {
                ["police"] = "Police Car 1",
                ["police2"] = "Police Car 2",
                ["police3"] = "Police Car 3",
                ["police4"] = "Police Car 4",
                ["policeb"] = "Police Car 5",
                ["policet"] = "Police Car 6",
                ["sheriff"] = "Sheriff Car 1",
                ["sheriff2"] = "Sheriff Car 2",
            },
            -- Grade 4
            [4] = {
                ["police"] = "Police Car 1",
                ["police2"] = "Police Car 2",
                ["police3"] = "Police Car 3",
                ["police4"] = "Police Car 4",
                ["policeb"] = "Police Car 5",
                ["policet"] = "Police Car 6",
                ["sheriff"] = "Sheriff Car 1",
                ["sheriff2"] = "Sheriff Car 2",
            }
        }
    }
}

-- '/restorelostcars <destination_garage>' allows you to restore cars that have been parked in garages which no longer exist in the config (garage renamed or removed). The restored cars get sent to the destination garage or if left empty to a random garage in the list.
-- NOTE: This may also send helis and boats to said garaga so choose wisely
RestoreCommandPermissionLevel = 'god' -- sets the permission level for the above mentioned command

-- Here you can define which category contains which vehicle class. These categories can then be used in the garage config
-- All vehicle classes can be found here: https://docs.fivem.net/natives/?_0x29439776AAA00A62
VehicleCategories = {
    ['car'] = {0,1,2,3,4,5,6,7,9,10,11,12},
    ['motorcycle'] = {8},
    ['boat'] = {14},
    ['helicopter'] = {15},
    ['plane'] = {16},
    ['service'] = {17},
    ['emergency'] = {18},
    ['other'] = {13} -- cycles: 13 - you can move cycles to cars if you want and have anything else like military vehicles in this category
    -- you can also create new / delete or update categories, and use them below in the config.
}

HouseGarageCategories = {'car', 'motorcycle', 'other'} -- Which categories are allowed to be parked at a house garage


VehicleHeading = 'driverside' -- only used when NO parking spots are defined in the garage config
--[[^^^^^^^^
    'forward' = will face the sameway as the ped
    'driverside' = will put the driver door closets to the ped
    'hood' = will face the hood towards ped
    'passengerside' = will put the passenger door closets to the ped
]]

SharedJobGarages = { -- define the job garages which are shared
    'pdgarage',
}

Garages = {
    --[[
        types:
        - public
        - job
        - depot
        vehicleCategories:
        - car
        - motorcycle
        - boat
        - helicopter
        - plane
        - other
    ]]

        ['caears24'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(76.188446044922, 7.9120540618896),
                vector2(81.977760314941, 23.525623321533),
                vector2(55.219917297363, 32.982769012451),
                vector2(49.228351593018, 16.684007644653),
                vector2(68.127639770508, 9.6578321456909),
                vector2(68.597557067871, 10.655039787292)
            },
            ['minZ'] = 68.00,  -- min height of the parking zone
            ['maxZ'] = 70.45,  -- max height of the parking zone
        },
        label = "Caesar 24h Parking",
        showBlip = true,
        blipcoords = vector3(69.84, 12.6, 68.96),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(54.49, 19.49, 69.14, 339.68),
            vector4(57.48, 17.98, 68.92, 340.13),
            vector4(60.49, 16.99, 68.8, 338.05),
            vector4(64.03, 16.28, 68.75, 337.71),
        }
    },







    ['impoundlot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-128.76565551758, -1186.7231445312),
            vector2(-128.95680236816, -1158.9990234375),
            vector2(-155.75888061524, -1158.6616210938),
            vector2(-155.84657287598, -1186.7335205078)
            },
            ['minZ'] = 22.25,  -- min height of the parking zone
            ['maxZ'] = 26.31,  -- max height of the parking zone
            debug = false,
        },
        label = "Impound Lot",
        showBlip = true,
        blipcoords = vector3(-143.15, -1175.06, 23.77),
        blipName = "Impound Lot",
        blipNumber = 68,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Impound',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-152.91, -1170.13, 23.14, 270.11),
            vector4(-153.26, -1166.51, 23.14, 270.74),
            vector4(-147.67, -1161.83, 23.14, 179.67),
            vector4(-144.19, -1161.83, 23.14, 179.02),
            vector4(-139.1, -1161.6, 23.14, 178.95),
            vector4(-131.92, -1166.54, 23.14, 89.09),
            vector4(-132.01, -1170.05, 23.14, 90.24),
            vector4(-132.03, -1175.15, 23.14, 90.94),
            vector4(-131.99, -1178.68, 23.14, 90.07),
            vector4(-131.95, -1182.25, 23.14, 90.11),
        }
    },
    ['police'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(427.85052490234, -1017.9293212891),
                vector2(428.14498901367, -1030.7161865234),
                vector2(459.05325317383, -1026.896484375),
                vector2(459.12948608398, -1012.3634033203),
                vector2(449.7737121582, -1012.4426879883),
                vector2(449.38006591797, -1011.4791870117),
                vector2(434.09115600586, -1011.4317016602),
                vector2(434.05737304688, -1013.9020996094),
                vector2(427.95745849609, -1013.9678344727)
            },
            ['minZ'] = 28.10,  -- min height of the parking zone
            ['maxZ'] = 30.97,  -- max height of the parking zone
        },
        label = "Police",
        showBlip = false,
        blipName = "Police",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency'},
        drawText = 'Parking',              --car, air, sea
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
            vector4(449.57, -1024.85, 28.06, 5.95),
            vector4(446.04, -1025.62, 28.14, 5.18),
            vector4(442.53, -1025.66, 28.2, 6.39),
            vector4(438.8, -1025.99, 28.27, 7.28),
            vector4(435.41, -1026.74, 28.35, 3.84),
        }
    },
    ['policevinewood'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(635.9017944336, 22.776243209838),
                vector2(631.24255371094, 20.99640083313),
                vector2(577.78063964844, 37.087455749512),
                vector2(575.10681152344, 41.017986297608),
                vector2(593.0210571289, 39.446407318116)
            },
            ['minZ'] = 86.00,  -- min height of the parking zone
            ['maxZ'] = 98.0,  -- max height of the parking zone
        },
        label = "Vinewood Police Station",
        showBlip = false,
        blipName = "Police",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency'},
        drawText = 'Parking',              --car, air, sea
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
            vector4(581.11, 38.73, 92.21, 265.09),
            vector4(586.74, 37.68, 91.64, 260.63),
            vector4(591.54, 36.7, 91.16, 256.37),
            vector4(597.57, 34.71, 90.54, 250.52),
            vector4(604.28, 32.61, 89.86, 251.49),
            vector4(609.33, 30.9, 89.33, 251.35),
            vector4(613.83, 29.36, 88.87, 251.19),
            vector4(619.65, 27.35, 88.26, 250.98),
            vector4(627.16, 24.64, 87.48, 247.88)
        }
    },
    ['mechanic'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-321.17425537109, -166.47213745117),
                vector2(-335.71780395508, -160.89682006836),
                vector2(-330.77108764648, -147.37300109863),
                vector2(-323.12185668945, -150.04736328125),
                vector2(-322.16271972656, -148.189453125),
                vector2(-315.29968261719, -150.44552612305)
            },
            ['minZ'] = 36.15,  -- min height of the parking zone
            ['maxZ'] = 38.22,  -- max height of the parking zone
            debug = false,
        },
        label = 'LS Customs',
        type = 'job',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        job = 'mechanic',
        debug = false
    },
    ['apartments'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-363.8267211914, -862.93182373046),
                vector2(-268.29055786132, -885.1919555664),
                vector2(-282.65710449218, -925.12030029296),
                vector2(-298.25598144532, -919.4287109375),
                vector2(-302.71203613282, -930.14245605468),
                vector2(-297.5908203125, -932.38952636718),
                vector2(-310.84530639648, -969.61614990234),
                vector2(-289.9221496582, -977.25311279296),
                vector2(-296.0697631836, -994.66876220704),
                vector2(-364.01559448242, -969.91552734375)
            },
            ['minZ'] = 30.0,  -- min height of the parking zone
            ['maxZ'] = 33.0,  -- max height of the parking zone

        },
        label = 'Alta Apartments',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(-297.71, -990.11, 30.76, 338.79),
            vector4(-301.09, -988.82, 30.76, 339.11),
            vector4(-304.64, -987.72, 30.76, 339.36),
            vector4(-308.09, -986.34, 30.76, 339.47),
            vector4(-311.46, -985.08, 30.76, 339.5),
            vector4(-315.07, -983.98, 30.76, 339.18),
            vector4(-318.71, -982.49, 30.76, 338.43),
            vector4(-285.76, -888.04, 30.76, 168.44),
            vector4(-289.39, -887.34, 30.76, 168.59),
            vector4(-292.99, -886.36, 30.76, 167.4),
            vector4(-296.78, -885.82, 30.75, 167.93),
            vector4(-300.35, -885.14, 30.76, 167.76),
            vector4(-303.82, -884.06, 30.76, 167.76),
            vector4(-307.59, -883.44, 30.76, 167.24),
            vector4(-311.16, -882.7, 30.76, 166.92),
            vector4(-314.74, -881.99, 30.75, 166.91),
            vector4(-318.34, -881.19, 30.75, 167.5),
            vector4(-322.02, -880.47, 30.75, 167.75),
            vector4(-325.62, -879.65, 30.75, 168.31),
            vector4(-329.11, -878.9, 30.75, 168.35),
            vector4(-332.88, -878.22, 30.75, 167.35),
            vector4(-336.55, -877.38, 30.75, 168.02),
            vector4(-340.1, -876.67, 30.75, 167.45),
            vector4(-343.78, -875.91, 30.75, 167.01),
            vector4(-352.86, -874.08, 30.75, 0.76),
            vector4(-360.26, -889.43, 30.75, 269.23),
            vector4(-360.46, -893.17, 30.75, 268.23),
            vector4(-360.24, -896.83, 30.75, 270.26),
            vector4(-360.37, -900.58, 30.75, 268.61),
            vector4(-360.29, -904.27, 30.75, 269.75),
            vector4(-360.14, -908.01, 30.75, 270.4),
            vector4(-360.5, -911.66, 30.76, 269.55),
            vector4(-360.12, -915.4, 30.76, 269.63),
            vector4(-360.28, -919.07, 30.76, 270.11),
            vector4(-360.56, -922.77, 30.75, 268.41),
            vector4(-360.46, -926.49, 30.76, 270.43),
            vector4(-360.37, -930.12, 30.76, 269.72),
            vector4(-360.22, -933.88, 30.76, 270.34),
            vector4(-360.28, -937.58, 30.76, 269.99),
            vector4(-360.47, -941.31, 30.75, 269.54),
            vector4(-360.28, -944.99, 30.76, 270.14),
            vector4(-360.32, -948.72, 30.76, 269.82),
            vector4(-360.38, -952.44, 30.75, 269.95),
            vector4(-360.57, -956.16, 30.76, 270.31),
            vector4(-322.02, -981.29, 30.76, 339.92),
            vector4(-325.56, -980.1, 30.76, 340.1),
            vector4(-329.0, -978.69, 30.76, 338.49),
            vector4(-332.49, -977.59, 30.76, 339.58),
            vector4(-335.9, -976.3, 30.76, 339.7),
            vector4(-339.43, -975.08, 30.76, 339.47),
            vector4(-342.7, -973.45, 30.76, 338.85),
            vector4(-326.58, -956.4, 30.75, 250.37),
            vector4(-325.37, -952.84, 30.76, 250.47),
            vector4(-324.03, -949.43, 30.76, 250.37),
            vector4(-322.69, -945.96, 30.75, 249.91),
            vector4(-321.47, -942.43, 30.76, 250.29),
            vector4(-320.23, -939.06, 30.76, 250.38),
            vector4(-318.8, -935.56, 30.76, 249.46),
            vector4(-317.66, -932.03, 30.76, 250.73),
            vector4(-316.5, -928.43, 30.76, 250.15),
            vector4(-345.07, -932.2, 30.76, 69.27),
            vector4(-343.99, -928.61, 30.76, 70.11),
            vector4(-342.58, -925.18, 30.76, 70.69),
            vector4(-341.39, -921.67, 30.76, 69.83),
            vector4(-327.34, -924.44, 30.76, 69.82),
            vector4(-328.81, -927.89, 30.76, 69.43),
            vector4(-330.09, -931.33, 30.76, 70.81),
            vector4(-331.29, -934.83, 30.76, 70.29),
            vector4(-332.71, -938.34, 30.76, 69.75),
            vector4(-333.91, -941.81, 30.76, 69.46),
            vector4(-335.02, -945.3, 30.75, 71.24),
            vector4(-336.56, -948.74, 30.75, 70.65),
            vector4(-337.69, -952.22, 30.76, 70.31),
            vector4(-340.74, -902.45, 30.75, 167.89),
            vector4(-337.18, -903.24, 30.75, 167.65),
            vector4(-333.64, -903.98, 30.75, 167.05),
            vector4(-329.93, -904.61, 30.75, 167.95),
            vector4(-326.38, -905.62, 30.75, 168.51),
            vector4(-322.65, -906.2, 30.75, 167.96),
            vector4(-318.98, -906.94, 30.75, 168.06),
            vector4(-315.39, -907.89, 30.75, 166.81),
            vector4(-311.81, -908.81, 30.75, 167.5),
            vector4(-308.14, -909.33, 30.75, 167.34),
            vector4(-285.56, -921.9, 30.76, 70.14),
            vector4(-283.75, -918.52, 30.76, 70.23),
            vector4(-282.97, -914.81, 30.75, 69.93),
            vector4(-281.65, -911.4, 30.76, 69.49),
            vector4(-280.5, -908.04, 30.76, 69.51),
            vector4(-279.28, -904.45, 30.76, 70.18),
            vector4(-302.07, -933.44, 30.75, 69.9),
            vector4(-303.19, -937.09, 30.76, 70.71),
            vector4(-304.56, -940.34, 30.76, 70.04),
            vector4(-305.74, -943.95, 30.76, 70.49),
            vector4(-307.19, -947.34, 30.76, 69.04),
            vector4(-308.26, -950.95, 30.76, 70.24),
            vector4(-309.63, -954.35, 30.76, 68.9),
            vector4(-310.83, -957.88, 30.76, 69.56),
            vector4(-312.07, -961.38, 30.76, 70.21),
            vector4(-313.39, -964.8, 30.76, 68.92),
            vector4(-298.26, -899.82, 30.66, 346.23),
            vector4(-302.47, -898.86, 30.66, 348.7),
            vector4(-305.9, -898.52, 30.66, 351.35),
            vector4(-309.58, -897.38, 30.66, 347.24),
            vector4(-313.04, -896.37, 30.65, 349.98),
            vector4(-316.74, -895.46, 30.65, 347.83),
            vector4(-320.36, -894.95, 30.65, 348.97),
            vector4(-324.05, -893.86, 30.65, 348.71),
            vector4(-327.67, -893.18, 30.65, 347.61),
            vector4(-331.02, -892.69, 30.65, 346.03),
            vector4(-334.83, -891.72, 30.65, 350.2),
            vector4(-338.6, -891.08, 30.65, 348.34),
        },
        debug = false

    },

    ['pdfront'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(405.13595581054, -998.57788085938),
            vector2(410.59521484375, -1002.8664550782),
            vector2(410.91711425782, -979.44134521484),
            vector2(405.4065246582, -974.57928466796),
            },
            ['minZ'] = 28.0,  -- min height of the parking zone
            ['maxZ'] = 31.0,  -- max height of the parking zone

        },
        label = 'Front of MRPD',
        type = 'job',
        job = "police",
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(407.44, -997.7, 28.94, 52.87),
            vector4(407.55, -992.85, 28.94, 51.63),
            vector4(407.7, -988.49, 28.94, 52.48),
            vector4(407.42, -983.95, 28.94, 51.54),
            vector4(407.68, -979.62, 28.94, 51.69),
        },
        debug = false
    },
    ['pdgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(448.33670043945, -998.80895996094),
                vector2(423.15826416016, -998.98077392578),
                vector2(423.48205566406, -973.94946289063),
                vector2(428.74041748047, -974.35272216797),
                vector2(428.564453125, -984.02642822266),
                vector2(448.21347045898, -983.94213867188),
            },
            ['minZ'] = 24.0,  -- min height of the parking zone
            ['maxZ'] = 27.0,  -- max height of the parking zone
        },
        label = 'MRPD Garage',
        type = 'job',
        job = "police",
        --useVehicleSpawner = true,
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(445.67, -997.0, 24.81, 269.98),
            vector4(445.83, -994.31, 25.21, 267.42),
            vector4(445.53, -991.53, 25.21, 269.55),
            vector4(445.51, -988.84, 25.21, 269.43),
            vector4(445.55, -986.12, 25.21, 270.71),
            vector4(437.35, -986.1, 25.21, 89.31),
            vector4(437.27, -988.86, 25.21, 90.05),
            vector4(437.32, -991.57, 25.21, 90.47),
            vector4(437.3, -994.26, 25.21, 90.38),
            vector4(437.31, -996.97, 25.21, 90.1),
            vector4(425.76, -997.07, 25.21, 270.57),
            vector4(425.72, -994.41, 25.21, 269.31),
            vector4(425.72, -991.68, 25.21, 269.53),
            vector4(425.69, -989.03, 25.21, 270.22),
            vector4(425.69, -984.26, 25.21, 269.65),
            vector4(425.67, -981.55, 25.21, 269.33),
            vector4(425.68, -978.88, 25.21, 269.76),
            vector4(425.68, -976.24, 25.21, 270.49),
        },
        debug = false
    },
    ['helipad'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-757.8896484375, -1469.876953125),
                vector2(-744.54223632812, -1480.4110107422),
                vector2(-733.07989501954, -1467.4460449218),
                vector2(-746.4605102539, -1456.0607910156)
            },
            ['minZ'] = 4.0,  -- min height of the parking zone
            ['maxZ'] = 8.0,  -- max height of the parking zone
        },
        label = 'Helipad',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Helipad',
        showBlip = true,
        blipName = "Helipad",
        blipNumber = 64,
        blipColor = 50,
        blipcoords = vector3(-745.61, -1468.57, 4.37),
        ["ParkingSpots"] = {
            vector4(-745.53, -1468.68, 5.0, 321.19)
        },
        ParkingDistance = 10.0,
        debug = false
    },
    ['shoreheli'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1774.4047851562, 3246.9484863281),
                vector2(1762.30859375, 3244.3928222656),
                vector2(1765.3605957031, 3231.908203125),
                vector2(1777.5689697266, 3235.4580078125)
            },
            ['minZ'] = 40.0,  -- min height of the parking zone
            ['maxZ'] = 46.0,  -- max height of the parking zone
        },
        label = 'Sandy Shores Helipad',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Sandy Shores Helipad',
        showBlip = true,
        blipName = 'Helipad',
        blipNumber = 64,
        blipColor = 50,
        blipcoords = vector3(1769.62, 3240.14, 42.01),
        ['ParkingSpots'] = {
            vector4(1769.62, 3240.14, 42.01, 60.44),
        },
        ParkingDistance = 100.0,
        debug = false
    },
    ['airdepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1235.3253173828, -3378.4008789062),
                vector2(-1284.2642822266, -3350.1474609375),
                vector2(-1284.5589599609, -3350.7241210938),
                vector2(-1289.5042724609, -3348.0512695312),
                vector2(-1308.7587890625, -3382.4091796875),
                vector2(-1307.0877685547, -3383.8776855469),
                vector2(-1307.6185302734, -3385.4577636719),
                vector2(-1306.0087890625, -3386.4213867188),
                vector2(-1308.2755126953, -3391.1662597656),
                vector2(-1306.2180175781, -3392.1394042969),
                vector2(-1264.1188964844, -3420.0451660156),
                vector2(-1258.6077880859, -3412.1069335938),
                vector2(-1258.1317138672, -3412.4846191406),
                vector2(-1237.5152587891, -3387.8581542969),
                vector2(-1236.4268798828, -3387.1162109375),
                vector2(-1233.0942382812, -3380.8115234375),
                vector2(-1233.4357910156, -3380.13671875),
                vector2(-1235.1755371094, -3379.1962890625)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Air Depot',
        type = 'depot',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'AIR DEPOT',
        showBlip = true,
        blipName = 'Air Depot',
        blipNumber = 569,
        blipColor = 33,
        blipcoords = vector3(-1274.34, -3385.97, 13.94),
        ParkingDistance = 200.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1286.09, -3363.24, 14.54, 275.59),
            vector4(-1292.65, -3383.11, 14.54, 280.17),
            vector4(-1252.97, -3385.7, 14.54, 11.75),
            vector4(-1268.63, -3402.56, 14.54, 14.72),
            vector4(-1280.83, -3395.7, 14.54, 330.47),

        },
    },
    ['boathouse1'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(-778.9291381836, -1513.3040771484),
                vector2(-803.83276367188, -1521.1665039062),
                vector2(-816.67852783204, -1493.2373046875),
                vector2(-791.34436035156, -1481.7546386718)
            },
            ['minZ'] = 0.00,
            ['maxZ'] = 5.00
        },
        label = 'Boat House',
        type = 'public',
        vehicleCategories = {'boat'},
        drawText = 'BOAT HOUSE',
        showBlip = true,
        blipName = 'Boat House',
        blipNumber = 427,
        blipColor = 15,
        blipcoords = vector3(-784.84, -1498.33, 0.2),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-798.39, -1499.15, 0.37, 109.87),
            vector4(-797.47, -1506.73, 0.3, 114.49),
        },
        ExitWarpLocations = {
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        },
    },
    ['intairport'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-992.59680175781, -2949.84375),
                vector2(-1030.8975830078, -3016.2927246094),
                vector2(-1030.3382568359, -3016.5925292969),
                vector2(-1029.6291503906, -3017.0434570312),
                vector2(-1028.7434082031, -3018.0705566406),
                vector2(-1022.2585449219, -3021.5798339844),
                vector2(-1021.3436279297, -3020.5522460938),
                vector2(-1016.1632080078, -3023.6635742188),
                vector2(-1016.3262329102, -3024.7385253906),
                vector2(-966.09301757812, -3052.3435058594),
                vector2(-965.42352294922, -3051.1135253906),
                vector2(-961.01477050781, -3052.7600097656),
                vector2(-923.76300048828, -2978.2124023438)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Airport Hangar',
        type = 'public',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'Airport Hangar',
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 359,
        blipColor = 50,
        blipcoords = vector3(-930.23, -2995.38, 19.85),
        ParkingDistance = 100.0,
        SpawnDistance = 100.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-985.04, -2965.05, 14.55, 128.92),
            vector4(-964.84, -2974.78, 14.55, 125.92),
            vector4(-945.49, -2985.63, 14.55, 117.77),
            vector4(-967.17, -3034.71, 14.55, 14.16),
            vector4(-990.13, -3022.86, 14.55, 15.42),
            vector4(-1010.91, -3012.56, 14.55, 2.31),
            vector4(-968.09, -3004.59, 14.55, 62.25)
        },

    },
}



HouseGarages = {} -- DO NOT TOUCH!
