
E=38

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                     
function openmenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fuels', {

        title = 'Fuel Station',

        align = 'top-left',

        elements = {
            { label = '10 Litre = 200 $', value = '10' },
            { label = 'Full Gas Tank = 1000 $', value = 'full' },

        }


    }, function(data, menu)
        if data.current.value == '10' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), '10litre', {

                title = 'Cash here',
        
                align = 'top-left',
        
                elements = {
                    { label = 'Cash', value = 'cash' },
                    { label = 'Bank', value = 'bank' },
        
                }
        
        
            }, function(data, menu)
                if data.current.value == 'cash' then
                    if cash>=200 then
                        SetVehicleFuelLevel(veh,10.0)
                        xPlayer.removeAccountMoney('money', 200)
                        menu.close()
                    else
                        TriggerEvent("chatMessage","[Error]",{255,255,0},"Pol kafi nadarid")
                    end
                elseif data.current.value == 'bank' then
                    if bank>=200 then
                        SetVehicleFuelLevel(veh,10.0)
                        xPlayer.removeAccountMoney('bank', 200)
                        menu.close()
                    else
                        TriggerEvent("chatMessage","[Error]",{255,255,0},"Pol kafi nadarid")
                    end
        
                end-----First If
        
            end,function(data, menu)menu.close()end)---end menu
                

        elseif data.current.value == 'full' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'full gas tank', {

                title = 'Cash here',
        
                align = 'top-left',
        
                elements = {
                    { label = 'Cash', value = 'cash' },
                    { label = 'Bank', value = 'bank' },
        
                }
        
        
            }, function(data, menu)
                if data.current.value == 'cash' then
                    if cash>=1000 then
                        SetVehicleFuelLevel(veh,100.0)
                        xPlayer.removeAccountMoney('money', 1000)
                        menu.close()
                    else
                        TriggerEvent("chatMessage","[Error]",{255,255,0},"Pol kafi nadarid")
                    end
                elseif data.current.value == 'bank' then
                    if bank>=1000 then
                        SetVehicleFuelLevel(veh,100.0)
                        xPlayer.removeAccountMoney('bank', 1000)
                        menu.close()
                    else
                        TriggerEvent("chatMessage","[Error]",{255,255,0},"Pol kafi nadarid")
                    end
        
                end-----First If
        
            end,function(data, menu)menu.close()end)---end menu

        end-----First If

    end,function(data, menu)menu.close()end)

end
------------منو ها با کم کردن پول کامل شد فقط باید تست کرد
CreateThread(function (source)
    
        _source = source
        xPlayer = ESX.GetPlayerFromId(_source)
        cash=xPlayer.getAccount('money')
        bank=xPlayer.getAccount('bank')
    
    while true do 
    Wait(100)
        ped=GetPlayerPed(-1)
        veh=GetVehiclePedIsIn(ped, true)
        fuellevel=GetVehicleFuelLevel(veh)
        if IsPedInAnyVehicle(PlayerPedId(), false) and fuellevel<=5 then
            while true do
                Wait(0)
                if IsControlJustReleased(0, E) then
                    openmenu()
                else
                    alert("~b~Press ~INPUT_PICKUP~ For Call Fuel Station")
                end
            end
        end
    end

end)


function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end


RegisterCommand("setf", function (player,level)
    SetVehicleFuelLevel(veh,3.2)
end, false)

