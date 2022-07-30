Config = {}

Config.CommandPermission = 'god' -- permission level for creating new doors
Config.AdminAccess = false -- Enable admins to unlock any door
Config.AdminPermission = 'god' -- The permission needed to get AdminAccess if it is enabled
Config.Warnings = false -- if true it will show warnings in the console when certain requirements aren't met
Config.FallbackDistance = 3.0 -- Distance to fall back on when it is not set
Config.EnableSounds = true -- Enable sounds when unlocking/locking doors (doors triggered by scripts can have the sound manually disabled)
Config.EnableAnimation = true -- Enable the animation when unlocking/locking doors (doors triggered by scripts can have the animation manually disabled)
Config.SaveDoorDialog = true -- Saves the door dialogue popup between door saves
Config.PersistentDoorStates = false -- Persists the door state between server restarts
Config.PersistentSaveInternal = 60000 -- How often door states are saved to the file system, in miliseconds. 

Config.ChangeColor = true -- Change the color of the box of the popup text based on if it is locked or not
Config.DefaultColor = 'rgb(19, 28, 74)' -- The default color of the box of the popup text if Config.ChangeColor is false
Config.LockedColor = 'rgb(230 50 50)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is locked
Config.UnlockedColor = 'rgb(59 235 70)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is unlocked
Config.UseDoorLabelText = false -- Will use the LABEL field as the nui text instead of locked/unlocked
Config.DoorDebug = false -- Enable DRAWTEXT in the world at the coords where the door 'center' is
Config.RemoteTriggerDistance = 15.0 -- This is how far from your camera the raycast will go to try to hit something solid
Config.RemoteTriggerMinDistance = 5.0 -- This is the minimum distance required for the raycast hit to count near a door. It will take the larger two between this and 'distance' option

Config.Consumables = { ['ticket'] = 1, ['paperclip'] = 1, ['key'] = 1 } -- The items will get removed once used on a door that has the item on it

--[[ -- Configuration Options
Config.DoorList['configname-identifier'] = {
	fixText = false, -- Adjusts guess of center of door
	textCoords = vector3(x, y, z) -- Set the text coordinates to a specific location
	setText = true -- Use with above setting
		distance = 2.0, -- Max interact distance
		lockpick = true, -- Alows for lockpicking
	allAuthorized = true, -- Anyone can use door
	authorizedJobs = { ['police']=0, ['bcso']=0, ['sasp]=0 } -- Authorize door access based on job grade
	authorizedGangs = { ['vagos']=0, ['ballas']=0 } -- Authorize door access based on gang grade
	authorizedCitizenIDs = { 'ABC123', 'DEF456' } -- Authorize door access based on citizenid
	items = {'item_1','item_2'} -- Authorize based on items. Must have all items in this list.
		doorLabel = 'Cloakroom', -- Label of room that shows up when nearby
		locked = true, -- Default lock state
		audioRemote = true, -- Play sound from the player instead of the door
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6}, -- Play sound on door lock
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}, -- Play sound on door unlock
		autoLock = 1000, -- Auto lock after this many miliseconds
		doorRate = 1.0,  -- Time till auto closes? Needs more testing
	cantUnlock = true -- Set to true to not allow the player to unlock the door, only lock it. This means a script will have to trigger the unlock.
	pickable = true, -- Can use a lockpick to unlock, only need if true
	hideLabel = true, -- Set to true to hide the popup label, for hiding doors ;)
		remoteTrigger = true, -- If you want to be able to remote trigger a door with H, put this here 
} 
]]

Config.DoorStates = {}
Config.DoorList = {



-- 247-01 entrance left
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 165.91,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1196685123,
	fixText = false,
	locked = false,
	objCoords = vector3(375.35, 323.8, 103.71),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-01 entrance right
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 345.56,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 997554217,
	fixText = false,
	locked = false,
	objCoords = vector3(377.87, 323.16, 103.71),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-01 backroom
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 346.25,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1266035946,
	fixText = false,
	locked = true,
	objCoords = vector3(373.68, 331.71, 103.72),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-02 entrance left
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 153.84,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1196685123,
	fixText = false,
	locked = false,
	objCoords = vector3(1730.03, 6412.07, 35.18),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-02 entrance right
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 333.64,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 997554217,
	fixText = false,
	locked = false,
	objCoords = vector3(1732.36, 6410.91, 35.18),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-02 backroom
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 333.83,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1266035946,
	fixText = false,
	locked = true,
	objCoords = vector3(1730.07, 6420.15, 35.19),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-03 entrance left
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 265.07446289062,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1196685123,
	fixText = false,
	locked = false,
	objCoords = vector3(-3240.122, 1003.154, 12.97671),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-03 entrance right
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 85.074501037598,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 997554217,
	fixText = false,
	locked = false,
	objCoords = vector3(-3239.899, 1005.745, 12.97671),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-03 backroom
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 85.074501037598,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1266035946,
	fixText = false,
	locked = true,
	objCoords = vector3(-3247.665, 1000.241, 12.98199),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-04 entrance left
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 7.7,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1196685123,
	fixText = false,
	locked = false,
	objCoords = vector3(545.51, 2672.75, 42.3),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-04 entrance right
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 187.51,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 997554217,
	fixText = false,
	locked = false,
	objCoords = vector3(542.93, 2672.41, 42.3),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-04 backroom
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 187.69,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1266035946,
	fixText = false,
	locked = true,
	objCoords = vector3(549.97, 2666.01, 42.31),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-05 entrance left
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 180.13,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1196685123,
	fixText = false,
	locked = false,
	objCoords = vector3(27.81, -1349.17, 29.64),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-05 entrance right
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 0.11,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 997554217,
	fixText = false,
	locked = false,
	objCoords = vector3(30.41, -1349.17, 29.64),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-05 backroom
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 359.61,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1266035946,
	fixText = false,
	locked = true,
	objCoords = vector3(24.27, -1341.91, 29.65),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-06 entrance front
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 287.76,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1196685123,
	fixText = false,
	locked = false,
	objCoords = vector3(-3038.21, 588.29, 8.05),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-06 entrance right
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 107.76,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 997554217,
	fixText = false,
	locked = false,
	objCoords = vector3(-3039.01, 590.79, 8.05),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-06 backroom
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 107,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1266035946,
	fixText = false,
	locked = true,
	objCoords = vector3(-3044.05, 582.69, 8.06),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-07 entrance left
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 210.2,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1196685123,
	fixText = false,
	locked = false,
	objCoords = vector3(1963.92, 3740.07, 32.49),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-07 entrance right
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 29.85,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 997554217,
	fixText = false,
	locked = false,
	objCoords = vector3(1966.17, 3741.37, 32.49),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-07 backroom
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 30.35,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1266035946,
	fixText = false,
	locked = true,
	objCoords = vector3(1957.21, 3744.59, 32.5),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-08 entrance left
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 267.71597290039,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1196685123,
	fixText = false,
	locked = false,
	objCoords = vector3(2559.206, 384.0841, 108.769),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-08 entrance right
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 87.715995788574,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 997554217,
	fixText = false,
	locked = false,
	objCoords = vector3(2559.309, 386.6826, 108.769),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- 247-08 backroom
Config.DoorList, {
	authorizedJobs = { ['247']=0 },
	maxDistance = 2.0,
	objHeading = 87.715995788574,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 1266035946,
	fixText = false,
	locked = true,
	objCoords = vector3(2551.805, 380.8271, 108.7743),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},



-- Ammu big 01 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 160.00003051758,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(16.12787, -1114.605, 29.94694),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- Ammu big 01 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 340.00003051758,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(18.57201, -1115.495, 29.94694),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- Ammu big 01 - store to shooting 01
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 340.00003051758,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 44561767,
	fixText = false,
	locked = true,
	objCoords = vector3(7.14657, -1101.126, 29.89739),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- Ammu big 01 - store to shooting 02
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 340.00003051758,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 44561767,
	fixText = false,
	locked = true,
	objCoords = vector3(8.044436, -1098.659, 29.89739),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- Ammu big 01 - shooting to range
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 340.00003051758,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 44561767,
	fixText = false,
	locked = true,
	objCoords = vector3(8.490857, -1094.39, 29.91464),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- Ammu big 02 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 5.0089556680177e-06,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(813.1779, -2148.27, 29.76892),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- Ammu big 02 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 179.99998474121,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(810.5768, -2148.27, 29.76892),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- Ammu big 02 - store to shooting 01
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 179.99998474121,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 44561767,
	fixText = false,
	locked = true,
	objCoords = vector3(826.2278, -2157.865, 29.71938),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- Ammu big 02 - store to shooting 02
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 179.99998474121,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 44561767,
	fixText = false,
	locked = true,
	objCoords = vector3(826.2278, -2160.49, 29.71938),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- Ammu big 02 - shooting to range
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 179.99998474121,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 44561767,
	fixText = false,
	locked = true,
	objCoords = vector3(827.2682, -2164.654, 29.73663),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},




-- ammu-small 01 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 69.999885559082,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(244.7306, -44.08021, 70.09095),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 01 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 249.99990844727,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(243.8412, -46.52396, 70.09095),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 02 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 41.827117919922,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(-1112.073, 2691.508, 18.70404),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 02 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 221.82711791992,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(-1114.011, 2689.773, 18.70404),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 03 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 246.58126831055,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(-3164.848, 1081.393, 20.98864),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 03 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 66.581260681152,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(-3163.815, 1083.779, 20.98864),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 04 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 0.0,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(-662.6419, -944.3221, 21.97913),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 04 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 179.99998474121,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(-665.2425, -944.3221, 21.97913),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 05 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 360.0,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(845.3695, -1024.543, 28.34475),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 05 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 179.99998474121,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(842.7689, -1024.543, 28.34475),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 06 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 179.99998474121,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(2568.304, 303.3523, 108.8848),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 06 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 360.0,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(2570.905, 303.3523, 108.8848),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 07 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 75.778289794922,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(-1313.823, -389.1266, 36.84571),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 07 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 255.77828979492,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(-1314.462, -391.6476, 36.8457),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 08 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 47.391891479492,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(1699.934, 3753.422, 34.85524),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 08 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 227.39189147949,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(1698.174, 3751.508, 34.85524),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 09 - entrance left
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 224.99993896484,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = 97297972,
	fixText = false,
	locked = false,
	objCoords = vector3(-326.1146, 6075.272, 31.60468),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ammu-small 09 - entrance right
Config.DoorList, {
	authorizedJobs = { ['Ammunation']=0 },
	maxDistance = 2.0,
	objHeading = 44.999935150146,
	garage = false,
	lockpick = false,
	audioRemote = false,
	objHash = -8873588,
	fixText = false,
	locked = false,
	objCoords = vector3(-324.2757, 6077.111, 31.60468),
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- ## GABZ - MISSION ROW POLICE DEPARTMENT (MRPD)
-- ## COORDINATES: 427.120, -979.559, 30.716

-- Front doors
Config.DoorList, {
	maxDistance = 2,
	locked = false,
	lockpick = true,
	doors = {
		{
			objHash = -1547307588, -- gabz_mrpd_reception_entrancedoor
			objHeading = 90,
			objCoords = vector3(434.7444, -983.0781, 30.8153),
		},
		{
			objHash = -1547307588, -- gabz_mrpd_reception_entrancedoor
			objHeading = 270,
			objCoords = vector3(434.7444, -980.7556, 30.8153),
		},
	},
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- North doors
Config.DoorList, {
	maxDistance = 2,
	locked = true,
	doors = {
		{
			objHash = -1547307588, -- gabz_mrpd_reception_entrancedoor
			objHeading = 180,
			objCoords = vector3(458.2087, -972.2543, 30.8153),
		},
		{
			objHash = -1547307588, -- gabz_mrpd_reception_entrancedoor
			objHeading = 0,
			objCoords = vector3(455.8862, -972.2543, 30.8153),
		},
	},
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- South doors
Config.DoorList, {
	maxDistance = 2,
	locked = true,
	doors = {
		{
			objHash = -1547307588, -- gabz_mrpd_reception_entrancedoor
			objHeading = 0,
			objCoords = vector3(440.7392, -998.7462, 30.8153),
		},
		{
			objHash = -1547307588, -- gabz_mrpd_reception_entrancedoor
			objHeading = 180,
			objCoords = vector3(443.0618, -998.7462, 30.8153),
		},
	},
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- Lobby left
Config.DoorList, {
	fixText = true,
	objHash = -1406685646, -- gabz_mrpd_door_04
	objCoords = vector3(441.13, -977.93, 30.82319),
	locked = true,
	objHeading = 0,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Lobby right
Config.DoorList, {
	objHash = -96679321, -- gabz_mrpd_door_05
	objCoords = vector3(440.5201, -986.2335, 30.82319),
	locked = true,
	objHeading = 180,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- Garage entrance 1
Config.DoorList, {
	fixText = true,
	objHash = 1830360419, -- gabz_mrpd_garage_singledoorframe
	objCoords = vector3(464.1591, -974.6656, 26.3707),
	locked = true,
	objHeading = 269.78,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- Garage entrance 2
Config.DoorList, {
	fixText = true,
	objHash = 1830360419, -- gabz_mrpd_garage_singledoorframe
	objCoords = vector3(464.1566, -997.5093, 26.3707),
	locked = true,
	objHeading = 89.87,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- Garage roller door 1
Config.DoorList, {
	objCoords = vector3(431.4119, -1000.772, 26.69661),
	objHeading = 0,
	slides = true,
	garage = true,
	objHash = 2130672747, -- gabz_mrpd_garage_door
	locked = true,
	audioRemote = true,
	maxDistance = 6,
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- Garage roller door 2
Config.DoorList, {
	objCoords = vector3(452.3005, -1000.772, 26.69661),
	objHeading = 0,
	slides = true,
	garage = true,
	objHash = 2130672747, -- gabz_mrpd_garage_door
	locked = true,
	audioRemote = true,
	maxDistance = 6,
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- Back gate
Config.DoorList, {
	objCoords = vector3(488.8948, -1017.212, 27.14935),
	objHeading = 90,
	slides = true,
	objHash = -1603817716, -- hei_prop_station_gate
	locked = true,
	audioRemote = true,
	maxDistance = 6,
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- Back doors
Config.DoorList, {
	maxDistance = 2,
	locked = true,
	doors = {
		{
			objHash = -692649124, -- gabz_mrpd_door_03
			objHeading = 0,
			objCoords = vector3(467.3686, -1014.406, 26.48382),
		},
		{
			objHash = -692649124, -- gabz_mrpd_door_03
			objHeading = 180,
			objCoords = vector3(469.7743, -1014.406, 26.48382),
		},
	},
	authorizedJobs = {
		['police'] = 0,
		['offpolice'] = 0,
	}
},

-- Mugshot
Config.DoorList, {
	objHash = -1406685646, -- gabz_mrpd_door_04
	objCoords = vector3(475.9539, -1010.819, 26.40639),
	locked = true,
	fixText = true,
	objHeading = 180,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Cell entrance 1
Config.DoorList, {
	objCoords = vector3(476.6157, -1008.875, 26.48005),
	objHeading = 270,
	objHash = -53345114, -- gabz_mrpd_cells_door
	maxDistance = 2,
	locked = true,
	audioLock = {
		['file'] = 'metal-locker.ogg',
		['volume'] = '0.35',
	},
	audioUnlock = {
		['file'] = 'metallic-creak.ogg',
		['volume'] = '0.7',
	},
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Cell entrance 2
Config.DoorList, {
	objCoords = vector3(481.0084, -1004.118, 26.48005),
	objHeading = 180,
	objHash = -53345114, -- gabz_mrpd_cells_door
	maxDistance = 2,
	locked = true,
	audioLock = {
		['file'] = 'metal-locker.ogg',
		['volume'] = '0.35',
	},
	audioUnlock = {
		['file'] = 'metallic-creak.ogg',
		['volume'] = '0.7',
	},
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Cell 1
Config.DoorList, {
	objCoords = vector3(477.9126, -1012.189, 26.48005),
	objHeading = 0,
	objHash = -53345114, -- gabz_mrpd_cells_door
	maxDistance = 2,
	locked = true,
	audioLock = {
		['file'] = 'metal-locker.ogg',
		['volume'] = '0.35',
	},
	audioUnlock = {
		['file'] = 'metallic-creak.ogg',
		['volume'] = '0.7',
	},
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Cell 2
Config.DoorList, {
	objCoords = vector3(480.9128, -1012.189, 26.48005),
	objHeading = 0,
	objHash = -53345114, -- gabz_mrpd_cells_door
	maxDistance = 2,
	locked = true,
	audioLock = {
		['file'] = 'metal-locker.ogg',
		['volume'] = '0.35',
	},
	audioUnlock = {
		['file'] = 'metallic-creak.ogg',
		['volume'] = '0.7',
	},
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Cell 3
Config.DoorList, {
	objCoords = vector3(483.9127, -1012.189, 26.48005),
	objHeading = 0,
	objHash = -53345114, -- gabz_mrpd_cells_door
	maxDistance = 2,
	locked = true,
	audioLock = {
		['file'] = 'metal-locker.ogg',
		['volume'] = '0.35',
	},
	audioUnlock = {
		['file'] = 'metallic-creak.ogg',
		['volume'] = '0.7',
	},
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Cell 4
Config.DoorList, {
	objCoords = vector3(486.9131, -1012.189, 26.48005),
	objHeading = 0,
	objHash = -53345114, -- gabz_mrpd_cells_door
	maxDistance = 2,
	locked = true,
	audioLock = {
		['file'] = 'metal-locker.ogg',
		['volume'] = '0.35',
	},
	audioUnlock = {
		['file'] = 'metallic-creak.ogg',
		['volume'] = '0.7',
	},
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Cell 5
Config.DoorList, {
	objCoords = vector3(484.1764, -1007.734, 26.48005),
	objHeading = 180,
	objHash = -53345114, -- gabz_mrpd_cells_door
	maxDistance = 2,
	locked = true,
	audioLock = {
		['file'] = 'metal-locker.ogg',
		['volume'] = '0.35',
	},
	audioUnlock = {
		['file'] = 'metallic-creak.ogg',
		['volume'] = '0.7',
	},
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Lineup
Config.DoorList, {
	fixText = true,
	objHash = -288803980, -- gabz_mrpd_door_01
	objCoords = vector3(479.06, -1003.173, 26.4065),
	locked = true,
	objHeading = 90,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Observation i
Config.DoorList, {
	fixText = true,
	objHash = -1406685646, -- gabz_mrpd_door_04
	objCoords = vector3(482.6694, -983.9868, 26.40548),
	locked = true,
	objHeading = 270,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Interrogation i
Config.DoorList, {
	fixText = true,
	objHash = -1406685646, -- gabz_mrpd_door_04
	objCoords = vector3(482.6701, -987.5792, 26.40548),
	locked = true,
	objHeading = 270,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Observation ii
Config.DoorList, {
	fixText = true,
	objHash = -1406685646, -- gabz_mrpd_door_04
	objCoords = vector3(482.6699, -992.2991, 26.40548),
	locked = true,
	objHeading = 270,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Interrogation ii
Config.DoorList, {
	fixText = true,
	objHash = -1406685646, -- gabz_mrpd_door_04
	objCoords = vector3(482.6703, -995.7285, 26.40548),
	locked = true,
	objHeading = 270,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Evidence
Config.DoorList, {
	fixText = true,
	objHash = -692649124, -- gabz_mrpd_door_03
	objCoords = vector3(475.8323, -990.4839, 26.40548),
	locked = true,
	objHeading = 134.7,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Armoury 1
Config.DoorList, {
	fixText = true,
	objHash = -692649124, -- gabz_mrpd_door_03
	objCoords = vector3(479.7507, -999.629, 30.78927),
	locked = true,
	objHeading = 90,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Armoury 2
Config.DoorList, {
	fixText = true,
	objHash = -692649124, -- gabz_mrpd_door_03
	objCoords = vector3(487.4378, -1000.189, 30.78697),
	locked = true,
	objHeading = 181.28,
	maxDistance = 2,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Shooting range
Config.DoorList, {
	maxDistance = 2,
	locked = true,
	doors = {
		{
			objHash = -692649124, -- gabz_mrpd_door_03
			objHeading = 0,
			objCoords = vector3(485.6133, -1002.902, 30.78697),
		},
		{
			objHash = -692649124, -- gabz_mrpd_door_03
			objHeading = 180,
			objCoords = vector3(488.0184, -1002.902, 30.78697),
		},
	},
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Rooftop
Config.DoorList, {
	objCoords = vector3(464.3086, -984.5284, 43.77124),
	objHeading = 90.000465393066,
	slides = false,
	garage = false,
	maxDistance = 2,
	fixText = true,
	objHash = -692649124, -- gabz_mrpd_door_03
	locked = true,
	lockpick = false,
	audioRemote = false,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Bollards 1
Config.DoorList, {
	textCoords = vector3(410.0258, -1028.32, 29.2202),
	objCoords = vector3(410.0258, -1024.22, 29.2202),
	objHeading = 270,
	slides = true,
	setText = true,
	garage = true,
	objHash = -1635161509, -- gabz_mrpd_bollards1
	maxDistance = 6,
	fixText = false,
	locked = true,
	lockpick = false,
	audioRemote = true,
	authorizedJobs = {
		['police'] = 0,
	}
},

-- Bollards 2
Config.DoorList, {
	textCoords = vector3(410.0258, -1020.19, 29.2202),
	objCoords = vector3(410.0258, -1024.226, 29.22022),
	objHeading = 270,
	slides = true,
	maxDistance = 6,
	garage = true,
	objHash = -1868050792, -- gabz_mrpd_bollards2
	setText = true,
	fixText = false,
	locked = true,
	lockpick = false,
	audioRemote = true,
	authorizedJobs = {
		['police'] = 0,
	}
},


-- ## GABZ - UWU CAFE
-- ## COORDINATES: -580.862, -1079.083, 22.330

-- main entry
Config.DoorList, {
	maxDistance = 2.5,
	authorizedJobs = { ['uwu']=0 },
	locked = true,
	slides = false,
	audioRemote = false,
	doors = {
		{objHash = -69331849, objHeading = 0.0, objCoords = vector3(-580.3611, -1069.627, 22.48975)}, -- denis3d_catcafe_maindoors_r
		{objHash = 526179188, objHeading = 0.0, objCoords = vector3(-581.6678, -1069.627, 22.48975)} -- denis3d_catcafe_maindoors_l
 },
	lockpick = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- employees access
Config.DoorList, {
	objHeading = 89.999977111816,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-587.34, -1051.899, 22.41301),
	objHash = -1283712428, -- denis3d_catcafe_doorsB
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- kitchen
Config.DoorList, {
	objHeading = 179.99998474121,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-590.1828, -1054.148, 22.41301),
	objHash = -60871655, -- denis3d_catcafe_doorsA		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- garage (from kitchen, sliding door)
Config.DoorList, {
	objHeading = 270.00003051758,
	locked = true,
	slides = true,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 6.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-591.7699, -1066.974, 22.53749),
	objHash = -562476388, -- denis3d_catcafe_fridgedoors
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},


-- employees office
Config.DoorList, {
	fixText = false,
	garage = false,
	slides = false,
	objHeading = 89.999977111816,
	locked = true,
	authorizedJobs = { ['uwu']=0 },
	lockpick = false,
	audioRemote = false,
	maxDistance = 2.0,
	objHash = 2089009131, -- sum_p_mp_yacht_door_02
	objCoords = vector3(-594.4123, -1049.769, 22.49713),		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- garage (from inside)
Config.DoorList, {
	objHeading = 0.0,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-592.4738, -1056.091, 22.41301),
	objHash = -60871655, -- denis3d_catcafe_doorsA		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- garage exit (from inside)
Config.DoorList, {
	objHeading = 89.999977111816,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-600.9008, -1055.124, 22.61267),
	objHash = -1283712428, -- denis3d_catcafe_doorsB			
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- garage exit (large gate from inside)
Config.DoorList, {
	objHeading = 270.00003051758,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = true,
	setText = true,
	textCoords = vector3(-600.940,-1059.249,23.049),
	audioRemote = false,
	objCoords = vector3(-600.9106, -1059.218, 21.72143),
	objHash = 522844070, -- denis3d_catcafe_garagedoors
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- toilet left
Config.DoorList, {
	objHeading = 270.00003051758,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-570.6216, -1053.211, 22.41301),
	objHash = 1717323416, -- denis3d_catcafe_doors
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- toilet right
Config.DoorList, {
	objHeading = 89.999977111816,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-570.6236, -1055.216, 22.41301),
	objHash = 1717323416, -- denis3d_catcafe_doors		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- entry (upper floor)
Config.DoorList, {
	objHeading = 0.0,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-571.7927, -1057.388, 26.76797),
	objHash = 2089009131, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- office 1 (upper floor)
Config.DoorList, {
	objHeading = 270.00003051758,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-575.0109, -1062.381, 26.76797),
	objHash = 2089009131, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- office 2 (upper floor)
Config.DoorList, {
	objHeading = 89.999977111816,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['uwu']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-575.0128, -1063.783, 26.76797),
	objHash = 2089009131, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- burgershot front left 1
Config.DoorList, {
	objHeading = 124.0,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['burgershot']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-1183.22, -885.79, 14.24),
	objHash = 1934064671, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},
-- burgershot front right 2
Config.DoorList, {
	objHeading = 124.0,
	locked = true,
	slides = false,
	garage = false,
	lockpick =true,
	authorizedJobs = { ['burgershot']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-1184.9, -883.29, 14.24),
	objHash = -186646702, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- burgershot right side left 1
Config.DoorList, {
	objHeading = 214.07,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['burgershot']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-1196.54, -883.49, 14.24),
	objHash = 1934064671, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},
-- burgershot right side right 2
Config.DoorList, {
	objHeading = 214.0,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['burgershot']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-1199.03, -885.17, 14.24),
	objHash = -186646702, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},
-- burgershot kitchen door 1
Config.DoorList, {
	objHeading = 33.81,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['burgershot']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-1201.11, -892.97, 14.24),
	objHash = -1448591934, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},
-- burgershot back drivethrew door
Config.DoorList, {
	objHeading = 304.0,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['burgershot']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(-1199.36, -903.97, 14.08),
	objHash = -1300743830, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},
-- Innocence benny door (mech only)
Config.DoorList, {
	objHeading = 0.0,
	locked = true,
	slides = true,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['mechanic']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = true,
	objCoords = vector3(-205.68, -1310.68, 30.3),
	objHash = -427498890, -- sum_p_mp_yacht_door_02
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- bank d1--
Config.DoorList, {
	objHeading = 340.13,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(237.77, 227.87, 106.43),
	objHash = 1956494919,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},
-- bank d2--
Config.DoorList, {
	objHeading = 340.14,
	locked = true,
	slides = false,
	garage = false,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	maxDistance = 2.0,
	fixText = false,
	audioRemote = false,
	objCoords = vector3(266.36, 216.57, 110.43),
	objHash = 1956494919,
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},


-- prison --




-- ## RECEPTION - COORDINATES: 1855.556 2586.384 45.673
-- entrance (big gates)
Config.DoorList, {
	objHash = 741314661, -- prop_gate_prison_01
	objCoords = vector3(1844.9, 2604.8, 44.6),
	textCoords = vector3(1845.28, 2608.5, 48.0),
	authorizedJobs = { ['police'] = 0 },
	locked = true,
	maxDistance = 12,
	fixText = true,
	size = 2,
	slides = true,
	lockpick = true,
},

Config.DoorList, {
	objHash = 741314661, -- prop_gate_prison_01
	objCoords = vector3(1818.5, 2604.8, 44.6),
	textCoords = vector3(1818.5, 2608.4, 48.0),
	authorizedJobs = { ['police'] = 0 },
	locked = true,
	maxDistance = 12,
	fixText = true,
	size = 2,
	slides = true,
	lockpick = true,
},

-- main entry
Config.DoorList, {
	objHash = 1373390714, -- prop_gate_prison_01
	objHeading = 89.999977111816,
	maxDistance = 2.0,
	audioRemote = false,
	objCoords = vector3(1845.336, 2585.348, 46.0855),
	authorizedJobs = { ['police'] = 0 },
	lockpick = false,
	fixText = true,
	locked = true,
	garage = false,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- reception staff entry
Config.DoorList, {
	objHash = 2024969025, -- sanhje_prison_recep_door01 
	slides = false,
	maxDistance = 2.0,
	objHeading = 0.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1844.404, 2576.997, 46.0356),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cloakroom reception
Config.DoorList, {
	objHash = 2024969025, -- sanhje_prison_recep_door01
	slides = false,
	maxDistance = 2.0,
	objHeading = 0.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1837.634, 2576.992, 46.0386),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- restroom reception
Config.DoorList, {
	objHash = -2051651622, -- v_ilev_fib_door1
	slides = false,
	maxDistance = 2.0,
	objHeading = 89.999977111816,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1838.09, 2572.297, 46.15969),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- visitors access
Config.DoorList, {
	objHash = -684929024, -- sanhje_prison_recep_door02
	slides = false,
	maxDistance = 2.0,
	objHeading = 89.999977111816,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1835.528, 2587.44, 46.03712),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- prison access reception
Config.DoorList, {
	objHash = -684929024, -- sanhje_prison_recep_door02
	slides = false,
	maxDistance = 2.0,
	objHeading = 0.0,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1837.742, 2592.162, 46.03957),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- prison access 2 reception
Config.DoorList, {
	objHash = -684929024, -- sanhje_prison_recep_door02
	slides = false,
	maxDistance = 2.0,
	objHeading = 89.999961853027,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1831.34, 2594.992, 46.03791),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- photography room door
Config.DoorList, {
	objHash = -684929024, -- sanhje_prison_recep_door02
	slides = false,
	maxDistance = 2.0,
	objHeading = 270.00003051758,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1838.617, 2593.705, 46.03636),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- prisoners visits access
Config.DoorList, {
	objHash = -684929024, -- sanhje_prison_recep_door02
	slides = false,
	maxDistance = 2.0,
	objHeading = 179.99998474121,
	lockpick = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	locked = true,
	audioRemote = false,
	objCoords = vector3(1827.981, 2592.157, 46.03718),
	garage = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- reception entry
Config.DoorList, {
	maxDistance = 2.0,
	objCoords = vector3(1835.902, 2584.903, 45.0169),
	audioRemote = false,
	garage = false,
	authorizedJobs = { ['police']=0 },
	fixText = false,
	lockpick = false,
	objHash = 673826957, -- prop_pris_door_03
	locked = true,
	objHeading = 89.999977111816,
	slides = false,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- reception back door (to outside)
Config.DoorList, {
	garage = false,
	authorizedJobs = { ['police']=0 },
	objHeading = 270.00003051758,
	maxDistance = 2.0,
	locked = true,
	slides = false,
	lockpick = false,
	audioRemote = false,
	objCoords = vector3(1819.073, 2594.873, 46.08695),
	fixText = true,
	objHash = 1373390714, -- prop_gate_prison_01		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},


-- ## CELL BLOCK - Coordinates: 1751.387 2505.984 45.565
-- cellblock entry (outside)
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 1373390714, -- prop_gate_prison_01
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = true,
	objCoords = vector3(1754.796, 2501.568, 45.80966),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cellblock entry 2 (inside)
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 241550507, -- sanhje_prison_block_door -- sanhje_prison_block_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1758.652, 2492.659, 45.88988),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 1
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1768.548, 2498.411, 45.88988),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 2
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1765.401, 2496.594, 45.88988),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 3
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1762.255, 2494.778, 45.88988),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 4
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1755.963, 2491.146, 45.88988),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 5
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1752.817, 2489.33, 45.88988),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 6
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1749.671, 2487.514, 45.88988),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 7
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1768.547, 2498.412, 49.84591),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 8
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1765.401, 2496.595, 49.84591),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 9
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1762.255, 2494.779, 49.84591),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 10
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1759.109, 2492.963, 49.84591),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 11
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1755.963, 2491.146, 49.84591),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 12
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1752.817, 2489.329, 49.84591),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 13
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1749.671, 2487.513, 49.84591),
	objHeading = 210.00001525879,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 14
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1758.078, 2475.393, 45.88988),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 15
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1761.225, 2477.21, 45.88988),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 16
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1764.369, 2479.026, 45.88988),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 17
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1767.515, 2480.843, 45.88988),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 18
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1770.661, 2482.659, 45.88988),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 19
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1773.807, 2484.476, 45.88988),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 20
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1776.952, 2486.292, 45.88988),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 21
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1758.078, 2475.391, 49.84636),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 22
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1761.225, 2477.209, 49.84636),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 23
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1764.369, 2479.025, 49.84636),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 24
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1767.515, 2480.843, 49.84636),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 25
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1770.66, 2482.659, 49.84636),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 26
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1773.807, 2484.477, 49.84636),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- cell 27
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 913760512, -- sanhje_prison_block_cell_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1776.951, 2486.293, 49.84636),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- gym
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 241550507, -- sanhje_prison_block_door 
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1751.147, 2481.178, 45.88988),
	objHeading = 300.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- recreational room
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 241550507, -- sanhje_prison_block_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1752.281, 2479.248, 45.88988),
	objHeading = 119.99996948242,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- security left
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 241550507, -- sanhje_prison_block_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1772.939, 2495.313, 49.84006),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- security right
Config.DoorList, {
	authorizedJobs = { ['police']=0 },
	objHash = 241550507, -- sanhje_prison_block_door
	maxDistance = 2.0,
	locked = true,
	slides = false,
	garage = false,
	audioRemote = false,
	lockpick = false,
	fixText = false,
	objCoords = vector3(1775.414, 2491.025, 49.84006),
	objHeading = 29.999996185303,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},


-- ## INFIRMARY - Coordinates: 1765.756 2561.949 45.565
-- infirmary entry (outdoor)
Config.DoorList, {
	objCoords = vector3(1765.118, 2566.524, 45.80285),
	authorizedJobs = { ['police']=0 },
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	fixText = true,
	objHeading = 3.8476657209685e-05,
	objHash = 1373390714, -- prop_gate_prison_01
	garage = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- infirmary reception
Config.DoorList, {
	objCoords = vector3(1772.813, 2570.296, 45.74467),
	authorizedJobs = { ['police']=0 },
	locked = true,
	audioRemote = false,
	slides = false,
	lockpick = false,
	fixText = false,
	objHeading = 4.8494574002689e-05,
	objHash = 2074175368, -- sanhje_prison_infirmary_door3 
	garage = false,
	maxDistance = 2.0,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- hallway entry
Config.DoorList, {
	lockpick = false,
	doors = {
		{objHash = -1624297821, objHeading = 4.8494574002689e-05, objCoords = vector3(1766.325, 2574.698, 45.75301)}, -- sanhje_prison_infirmary_door1
		{objHash = -1624297821, objHeading = 180.00001525879, objCoords = vector3(1764.025, 2574.698, 45.75301)} -- sanhje_prison_infirmary_door1
 },
	slides = false,
	audioRemote = false,
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- laboratory
Config.DoorList, {
	objCoords = vector3(1767.323, 2580.832, 45.74783),
	garage = false,
	maxDistance = 2.0,
	lockpick = false,
	objHash = -1392981450, -- sanhje_prison_infirmary_door2
	fixText = false,
	objHeading = 90.000007629395,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['police']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- surgery
Config.DoorList, {
	lockpick = false,
	doors = {
		{objHash = -1624297821, objHeading = 270.0, objCoords = vector3(1767.321, 2582.308, 45.75345)}, -- sanhje_prison_infirmary_door1
		{objHash = -1624297821, objHeading = 90.000007629395, objCoords = vector3(1767.321, 2584.607, 45.75345)} -- sanhje_prison_infirmary_door1
 },
	slides = false,
	audioRemote = false,
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- intensive care
Config.DoorList, {
	lockpick = false,
	doors = {
		{objHash = -1624297821, objHeading = 3.8476657209685e-05, objCoords = vector3(1766.325, 2589.564, 45.75309)}, -- sanhje_prison_infirmary_door1
		{objHash = -1624297821, objHeading = 180.00006103516, objCoords = vector3(1764.026, 2589.564, 45.75309)} -- sanhje_prison_infirmary_door1
 },
	slides = false,
	audioRemote = false,
	maxDistance = 2.5,
	authorizedJobs = { ['police']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},


-- ## CAFETERIA - Coordinates: 1772.354 2551.826 45.565
-- entry 1 (from recreational area)
Config.DoorList, {
	objCoords = vector3(1776.195, 2552.563, 45.74741),
	garage = false,
	maxDistance = 2.0,
	lockpick = false,
	objHash = 1373390714, -- prop_gate_prison_01
	fixText = false,
	objHeading = 270.00003051758,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['police']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},

-- entry 2
Config.DoorList, {
	objCoords = vector3(1791.595, 2551.462, 45.7532),
	garage = false,
	maxDistance = 2.0,
	lockpick = false,
	objHash = 1373390714, -- prop_gate_prison_01
	fixText = false,
	objHeading = 89.999977111816,
	audioRemote = false,
	slides = false,
	authorizedJobs = { ['police']=0 },
	locked = true,		
	-- oldMethod = true,
	-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
	-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
	-- autoLock = 1000
},


}
