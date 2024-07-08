-- client.lua
local function spawnVehicle(vehicleName)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    -- Load the vehicle model
    RequestModel(vehicleName)
    while not HasModelLoaded(vehicleName) do
        Citizen.Wait(0)
    end

    -- Create the vehicle
    local vehicle = CreateVehicle(vehicleName, playerCoords.x, playerCoords.y, playerCoords.z, GetEntityHeading(playerPed), true, false)
    
    -- Set the player into the vehicle
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)

    -- Notify the server to give vehicle ownership
    TriggerServerEvent('Stoic-CarItems:giveVehicleOwnership', NetworkGetNetworkIdFromEntity(vehicle))
end

exports('vehicleSpawn', function(data, slot)
    local playerPed = PlayerPedId()
    local vehicleName = data.name
    
    -- Use the item
    exports.ox_inventory:useItem(data, function(data)
        -- The item has been used, so trigger the effects
        if data then
            spawnVehicle(vehicleName)
            lib.notify({description = 'Vehicle spawned successfully!'})
        else
            lib.notify({type = 'error', description = 'Failed to spawn vehicle.'})
        end
    end)
end)
