

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)



-- MENU FUNCTION --

local open = false 
local pizzaMain5 = RageUI.CreateMenu('~y~Bois~g~son', '~g~Interaction')
local pizzaMain6 = RageUI.CreateMenu('~y~Gob~g~elet', '~g~Interaction')
pizzaMain5.Display.Header = true 
pizzaMain5.Closed = function()
  open = false
end


function OpenCuisine2()
	if open then 
		open = false
		RageUI.Visible(pizzaMain5, false)
		return
	else
		open = true 
		RageUI.Visible(pizzaMain5, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(pizzaMain5,function() 

        RageUI.Button("Prendre le gobelet vide", "Sert à mettre de la boisson de dans ", {RightLabel = ""}, true , {
          onSelected = function()
            TriggerServerEvent('aurezia:Buygobeletvide')
          end
        })

        RageUI.Button("Boisson", nil, {RightLabel = "→→"}, true , {
          onSelected = function()
          end
        }, pizzaMain6)


    end)	

      RageUI.IsVisible(pizzaMain6,function() 

        RageUI.Separator("~y~↓ Bois~g~sion ↓")

        RageUI.Button("Préparer un gobelet de coca", "~r~Requis : ~w~Gobelet Vide", {RightLabel = "→→"}, true , {
          onSelected = function()
                      local playerPed = PlayerPedId()
                      Citizen.Wait(2000)
                      TriggerServerEvent('craftdunegobeletdecoca')
                      ClearPedTasksImmediately(playerPed)
                  end
        })

			RageUI.Button("Préparer un gobelet de IceTea", "~r~Requis : ~w~Gobelet Vide", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    Citizen.Wait(2000)
                    TriggerServerEvent('craftdunegobeletdeicetea')
                    ClearPedTasksImmediately(playerPed)
                end
			})

			RageUI.Button("Préparer un gobelet de hawai", "~r~Requis : ~w~Gobelet Vide", {RightLabel = "→→"}, true , {
				onSelected = function()
                    local playerPed = PlayerPedId()
                    Citizen.Wait(2000)
                    TriggerServerEvent('craftdunegobeletdehawai')
                    ClearPedTasksImmediately(playerPed)
                end
			})

       end)			
		Wait(0)
	   end
	end)
 end
end

        ----OUVRIR LE MENU------------
  local position = {
     {x = 288.98, y = -978.01, z = 29.43}
    }

    Citizen.CreateThread(function()
      while true do
  
        local wait = 750
  
          for k in pairs(position) do
  
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
  
              if dist <= 3.0 then
              wait = 0
              DrawMarker(22, 288.98, -978.01, 29.43, 0.0, 0.0, 0.0, 0.0,0.0,0.0, 0.3, 0.3, 0.3, 255, 235, 59, 255, true, true, p19, true)  
  
          
              if dist <= 3.0 then
                 wait = 0
                  Visual.Subtitle("Appuyer sur ~b~[E]~s~ pour ~g~intéragir", 1) 
                  if IsControlJustPressed(1,51) then
            OpenCuisine2()
              end
          end
      end
      Citizen.Wait(wait)
      end
  end
  end)