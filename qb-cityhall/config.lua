Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vec3(-265.0, -963.6, 31.2),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 0.65,
            colour = 0,
            title = "City Services"
        },
        licenses = {
            ["id_card"] = {
                label = "ID Card",
                cost = 50,
            },
            ["driver_license"] = {
                label = "Driver License",
                cost = 50,
                metadata = "driver"
            },
            ["weaponlicense"] = {
                label = "Weapon License",
                cost = 50,
                metadata = "weapon"
            },
        }
    },
}

Config.DrivingSchools = {
    { -- Driving School 1
        coords = vec3(240.3, -1379.89, 33.74),
        showBlip = true,
        blipData = {
            sprite = 225,
            display = 4,
            scale = 0.65,
            colour = 3,
            title = "Driving School"
        },
        instructors = {
            "DJD56142",
            "DXT09752",
            "SRI85140",
        }
    },
}

Config.Peds = {
    -- Cityhall Ped
    {
        model = 'a_m_m_hasjew_01',
        coords = vec4(-543.8, -195.96, 37.23, 85.09),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0,
            debugPoly = false
        }
    },
    -- Driving School Ped
    {
        model = 'a_m_m_eastsa_02',
        coords = vec4(240.91, -1379.2, 32.74, 138.96),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        drivingschool = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0
        }
    }
}

-- THE ARRAY NAME MUST BE THE SAME AS THE JOB IN QB-CORE/SHARED/JOBS.LUA
Config.AvaiableJobs = {
    ["trucker"] = {
        title = "Trucker",
        salary = 100,
        description = "Rent a company van and distribute deliveries around town.",
        gpsCoords = vector3(145.48, -3210.43, 5.86),
    },
    ["taxi"] = {
        title = "Taxi",
        salary = 200,
        description = "Rent a taxi and take the passengers to the requested destination.",
        gpsCoords = vector3(909.51, -177.36, 74.22),
    },
    ["tow"] = {
        title = "Tow Truck",
        salary = 300,
        description = "Rents a Tow Truck and tows the wrongly parked or requested vehicles.",
        gpsCoords = vector3(491.27, -1316.17, 29.26),
    },
    ["reporter"] = {
        title = "News Reporter",
        salary = 400,
        description = "Cover the latest news and be the best journalist in town.",
        gpsCoords = vector3(-604.94, -931.29, 23.86),
    },
    ["garbage"] = {
        title = "Garbage Collector",
        salary = 500,
        description = "Rent a garbage truck and collect the garbage at the indicated points throughout the city.",
        gpsCoords = vector3(-313.84, -1522.81, 27.55),
    },
    ["bus"] = {
        title = "Bus Driver",
        salary = 600,
        description = "Rent a bus and transport passengers to various stops throughout the city.",
        gpsCoords = vector3(462.21, -641.32, 28.45),
    },
}
