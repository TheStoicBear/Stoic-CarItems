-- server.lua
local function giveVehicleOwnership(playerId, vehicleNetId)
    local src = playerId
    local xPlayer

    if GetResourceState('esx_core') == 'started' then
        xPlayer = ESX.GetPlayerFromId(src)
        -- Add code to give vehicle ownership in ESX
        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle) VALUES (@owner, @vehicle)', {
            ['@owner'] = xPlayer.identifier,
            ['@vehicle'] = json.encode({model = vehicleNetId})
        })
    elseif GetResourceState('qb-core') == 'started' then
        xPlayer = QBCore.Functions.GetPlayer(src)
        -- Add code to give vehicle ownership in QBCore
        MySQL.Async.execute('INSERT INTO player_vehicles (citizenid, vehicle) VALUES (@citizenid, @vehicle)', {
            ['@citizenid'] = xPlayer.PlayerData.citizenid,
            ['@vehicle'] = json.encode({model = vehicleNetId})
        })
    else
        -- Handle ownership for neither framework
        print("Giving vehicle ownership to player without framework")
    end
end

RegisterNetEvent('Stoic-CarItems:giveVehicleOwnership', function(vehicleNetId)
    local src = source
    giveVehicleOwnership(src, vehicleNetId)
end)


-- Register a server-side event for using qs-inventory item
RegisterServerEvent('Stoic-CarItems:useQsInventoryItem')
AddEventHandler('Stoic-CarItems:useQsInventoryItem', function(data, vehicleName)
    local source = source

    -- Use qs-inventory item
    exports['qs-inventory']:CreateUsableItem(data.name, function(success)
        -- The item has been used, so trigger the effects
        if success then
            -- Notify client to spawn the vehicle
            TriggerClientEvent('Stoic-CarItems:spawnVehicleClient', source, vehicleName)
            TriggerClientEvent('chat:addMessage', source, {
                color = { 0, 255, 0},
                multiline = true,
                args = {"System", "Vehicle spawned successfully!"}
            })
        else
            TriggerClientEvent('chat:addMessage', source, {
                color = { 255, 0, 0},
                multiline = true,
                args = {"System", "Failed to spawn vehicle."}
            })
        end
    end)
end)
