Config = Config or {}

-- Dont forgot to setup the discord logs via the server.lua

Config.UseColors = false -- Want to use colors when player buys vehicle?

Config.UsePreviewMenuSync = true -- Sync for the prewview menu when player is inside the prewview menu other players cant get inside (can prevent bugs but not have to use)

Config.UseMarkerInsteadOfMenu = false -- Want to use the marker to return the vehice? if false you can do that by opening the menu

Config.SetVehicleTransparency = 'low' -- Want to make the vehicle more transparent? you have a lot of options to choose from: low, medium, high, none

Config.MS = 'high' -- MS for the script recommended using high if not the "close" will get a bit baggy. options high / low

Config.Job = 'ambulance' --The job needed to open the menu

--You Can Add As Many As You Like
--DO NOT add vehicles that are not in your shared ! otherwise the qb-garages wont work
Config.Vehicles = {
    [1] = {
        ['vehiclename'] = "emsv", --Name
        ['vehicle'] = "emsv", --Model
        ['price'] = 0, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [2] = {
        ['vehiclename'] = "emst", --Name
        ['vehicle'] = "emst", --Model
        ['price'] = 0, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [3] = {
        ['vehiclename'] = "emsf", --Name
        ['vehicle'] = "emsf", --Model
        ['price'] = 0, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [4] = {
        ['vehiclename'] = "emsc", --Name
        ['vehicle'] = "emsc", --Model
        ['price'] = 0, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [5] = {
        ['vehiclename'] = "emsa", --Name
        ['vehicle'] = "emsa", --Model
        ['price'] = 0, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
    [6] = {
        ['vehiclename'] = "ambulance", --Name
        ['vehicle'] = "ambulance", --Model
        ['price'] = 0, --Price
        ['r'] = 0, --Vehicle Color (Optional)
        ['g'] = 0,
        ['b'] = 0,
    }, 
}