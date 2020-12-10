ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('fish', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "stingray")
		
		xPlayer.removeInventoryItem('fish', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the fish onto your fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

ESX.RegisterUsableItem('fishbait', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "fish")
		
		xPlayer.removeInventoryItem('fishbait', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the fish meat onto your fishing rod")
		
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

ESX.RegisterUsableItem('stingray', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "dolphin")
		
		xPlayer.removeInventoryItem('stingray', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the stingray meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

ESX.RegisterUsableItem('dolphin', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "sharktiger")
		
		xPlayer.removeInventoryItem('dolphin', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the dolphin meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

ESX.RegisterUsableItem('sharktiger', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "sharkhammer")
		
		xPlayer.removeInventoryItem('sharktiger', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the tiger shark meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)

ESX.RegisterUsableItem('sharkhammer', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "killerwhale")
		
		xPlayer.removeInventoryItem('sharkhammer', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the hammerhead shark meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~You dont have a fishing rod")
	end
	
end)


ESX.RegisterUsableItem('fishingrod', function(source)

	local _source = source
	TriggerClientEvent('fishing:fishstart', _source)
	
	

end)

--[[Working Harpoon to use for Whales
ESX.RegisterUsableItem('harpoon', function(source)

	local _source = source
	TriggerClientEvent('fishing:fishstart', _source)
	
	

end)]]


-- Start catching shit			
RegisterNetEvent('fishing:catch')
AddEventHandler('fishing:catch', function(bait)
	local _source = source
	local weight = 2
	local rnd = math.random(1,100)
	local xPlayer = ESX.GetPlayerFromId(_source)
	if bait == "stingray" then
		if rnd >= 78 then
			if rnd >= 94 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				TriggerClientEvent('fishing:message', _source, "It was huge and it broke your ~y~fishing rod!")
				TriggerClientEvent('fishing:break', _source)
				xPlayer.removeInventoryItem('fishingrod', 1)
			else
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getInventoryItem('stingray').count > 10 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more stingrays")
				else
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~stingray!~s~\n ")
					TriggerClientEvent('stingray:spawnPed', _source)
					xPlayer.addInventoryItem('stingray', 1)
				end
			end
		else
			if rnd >= 75 then
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,9)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(2,6)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
		end
	else
		if bait == "fish" then
			if rnd >= 75 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,11)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end

			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(1,6)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
		end
		if bait == "none" then
			if rnd >= 70 then
			TriggerClientEvent('fishing:message', _source, "You are currently fishing without any equipped bait")
			if  xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(2,4)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			else
			TriggerClientEvent('fishing:message', _source, "You are currently fishing without any equipped bait")
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(1,2)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish~s~: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
		end
		if bait == "sharktiger" then
			if rnd >= 82 then
				if rnd >= 91 then
					TriggerClientEvent('fishing:setbait', _source, "none")
					TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
					TriggerClientEvent('fishing:break', _source)
					xPlayer.removeInventoryItem('fishingrod', 1)
				else
					if xPlayer.getInventoryItem('sharktiger').count > 1  then
						TriggerClientEvent('fishing:setbait', _source, "none")
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more tiger sharks")
					else
						TriggerClientEvent('fishing:message', _source, "You caught a ~y~tiger shark!~s~\nThese are endangered species and are ~r~illegal~s~ to possess")
						TriggerClientEvent('sharktiger:spawnPed', _source)
						xPlayer.addInventoryItem('sharktiger', 1)
					end
				end
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,8)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
		end
		if bait == "sharkhammer" then
			if rnd >= 82 then
				if rnd >= 91 then
					TriggerClientEvent('fishing:setbait', _source, "none")
					TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
					TriggerClientEvent('fishing:break', _source)
					xPlayer.removeInventoryItem('fishingrod', 1)
				else
					if xPlayer.getInventoryItem('sharkhammer').count > 1  then
						TriggerClientEvent('fishing:setbait', _source, "none")
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more hammerhead sharks")
					else
						TriggerClientEvent('fishing:message', _source, "You caught a ~y~hammerhead shark!~s~\nThese are endangered species and are ~r~illegal~s~ to possess")
						TriggerClientEvent('sharkhammer:spawnPed', _source)
						xPlayer.addInventoryItem('sharkhammer', 1)
					end
				end
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,8)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
        end
		if bait == "killerwhale" then
			if rnd >= 82 then
				if rnd >= 91 then
					TriggerClientEvent('fishing:setbait', _source, "none")
					TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
					TriggerClientEvent('fishing:break', _source)
					xPlayer.removeInventoryItem('fishingrod', 1)
				else
					if xPlayer.getInventoryItem('killerwhale').count > 0  then
						TriggerClientEvent('fishing:setbait', _source, "none")
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more killer whales")
					else
						TriggerClientEvent('fishing:message', _source, "You caught a ~y~killer whale!~s~\nThese are endangered species and are ~r~illegal~s~ to possess")
						TriggerClientEvent('killerwhale:spawnPed', _source)
						xPlayer.addInventoryItem('killerwhale', 1)
					end
				end
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,8)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
		end
		if bait == "dolphin" then
			if rnd >= 82 then
				if rnd >= 91 then
					TriggerClientEvent('fishing:setbait', _source, "none")
					TriggerClientEvent('fishing:message', _source, "~r~It was huge and it broke your fishing rod!")
					TriggerClientEvent('fishing:break', _source)
					xPlayer.removeInventoryItem('fishingrod', 1)
				else
					if xPlayer.getInventoryItem('dolphin').count > 1  then
						TriggerClientEvent('fishing:setbait', _source, "none")
						TriggerClientEvent('fishing:message', _source, "~r~You cant hold more dolphins")
					else
						TriggerClientEvent('fishing:message', _source, "You caught a ~y~dolphin!~s~\nThese are endangered species and are ~r~illegal~s~ to possess")
						TriggerClientEvent('dolphin:spawnPed', _source)
						xPlayer.addInventoryItem('dolphin', 1)
					end
				end
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~You cant hold more fish")
				else
					weight = math.random(4,8)
					TriggerClientEvent('fishing:message', _source, "You caught a ~y~fish: ~g~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
        end
	end
end)

RegisterServerEvent("fishing:lowmoney")
AddEventHandler("fishing:lowmoney", function(model)
    local _source = source	
	local myModel = model
	local xPlayer = ESX.GetPlayerFromId(_source)
	for k, v in ipairs(Server_Config.RentalBoats) do
		if GetHashKey(v.model) == myModel then
			xPlayer.removeMoney(v.price)
		end
	end
end)

RegisterServerEvent("fishing:returnDeposit")
AddEventHandler("fishing:returnDeposit", function(model)
	local _source = source
	local myModel = model
	local xPlayer = ESX.GetPlayerFromId(_source)
	for k, v in ipairs(Server_Config.RentalBoats) do
		if GetHashKey(v.model) == myModel then
			xPlayer.addMoney(v.price / 2)
		end
	end
end)

RegisterServerEvent('fishing:startSelling')
AddEventHandler('fishing:startSelling', function(yaItem)
	local _source = source
	local item = yaItem
	local xPlayer  = ESX.GetPlayerFromId(_source)
	if item == "legal" then
		local FishQuantity = xPlayer.getInventoryItem('fish').count
			if FishQuantity <= 4 then
			TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ fish')			
		else   
			xPlayer.removeInventoryItem('fish', 5)
			local payment = Server_Config.FishPrice.a
			payment = math.random(Server_Config.FishPrice.a, Server_Config.FishPrice.b) 
			xPlayer.addMoney(payment)		
		end	
	end
	if item == "illegal" then
		local FishQuantity = xPlayer.getInventoryItem('sharktiger').count
		if FishQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Tiger Sharks')			
		else   
			xPlayer.removeInventoryItem('sharktiger', 1)
			local payment = Server_Config.sharktigerPrice.a
			payment = math.random(Server_Config.sharktigerPrice.a, Server_Config.sharktigerPrice.b) 
			xPlayer.addAccountMoney('black_money', payment)
		end
	end
	if item == "illegal" then
		local FishQuantity = xPlayer.getInventoryItem('sharkhammer').count
		if FishQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Hammerhead Sharks')			
		else   
			xPlayer.removeInventoryItem('sharkhammer', 1)
			local payment = Server_Config.sharkhammerPrice.a
			payment = math.random(Server_Config.sharkhammerPrice.a, Server_Config.sharkhammerPrice.b)
			xPlayer.addAccountMoney('black_money', payment)
		end
	end
	if item == "illegal" then
		local FishQuantity = xPlayer.getInventoryItem('dolphin').count
		if FishQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Dolphins')			
		else   
			xPlayer.removeInventoryItem('dolphin', 1)
			local payment = Server_Config.dolphinPrice.a
			payment = math.random(Server_Config.dolphinPrice.a, Server_Config.dolphinPrice.b)
			xPlayer.addAccountMoney('black_money', payment)
		end
	end
	if item == "illegal" then
		local FishQuantity = xPlayer.getInventoryItem('killerwhale').count
		if FishQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Killer Whales')			
		else   
			xPlayer.removeInventoryItem('killerwhale', 1)
			local payment = Server_Config.killerwhalePrice.a
			payment = math.random(Server_Config.killerwhalePrice.a, Server_Config.killerwhalePrice.b)
			xPlayer.addAccountMoney('black_money', payment)
		end
	end
	if item == "legal" then
		local FishQuantity = xPlayer.getInventoryItem('stingray').count
		if FishQuantity <= 0 then
			TriggerClientEvent('esx:showNotification', source, 'You dont have enough~y~ Stingrays')			
		else   
			xPlayer.removeInventoryItem('stingray', 1)
			local payment = Server_Config.stingrayPrice.a
			payment = math.random(Server_Config.stingrayPrice.a, Server_Config.stingrayPrice.b)
			xPlayer.addMoney(payment)
		end
	end
end)