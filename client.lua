--@author:Poisskail

local tzCheck = false

Citizen.CreateThread(function()
    
    while true do 
        if not tzCheck then 
            FreezeEntityPosition(PlayerPedId(), true)
            Wait(150)

            local vx, vy, vz = table.unpack(GetEntityVelocity(PlayerPedId()))
            if vx == 0.0 and vy == 0.0 and vz < 0.0001 and vz ~= 0 and not IsPedWalking(PlayerPedId()) then    
                tzCheck = true 
                print("TZ Project Detected")
            else 
                if vx == 0.0 and vy == 0.0 then 
                    tzCheck = true 
                    FreezeEntityPosition(PlayerPedId(), false)
                end
            end
            
        end
        Wait(1000)
    end
end)
