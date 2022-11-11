
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fuelcaller-1-2:removemoney')
AddEventHandler('fuelcaller-1-2:removemoney', function(target,amount)
	local _source = target
	local xPlayer = ESX.GetPlayerFromId(_source)

	amount = tonumber(amount)

	if not tonumber(amount) then return end
	amount = ESX.Math.Round(amount)
    print(xPlayer.getMoney())
	-- if amount == nil or amount <= 0 or amount > xPlayer.getMoney() then
	-- 	TriggerClientEvent('chatMessage',"[Server Side]",{255,255,0},"Nadari Polo")
	-- else
		xPlayer.removeMoney(amount)
	-- end
end)