-- fxmanifest.lua
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'TheStoicBear'
description 'ox_inventory based Vehicle Spawn Item Script'

client_scripts {
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua', -- Add this line if you're using MySQL for vehicle ownership
    'server.lua'
}

files {
    'data/items.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
}

exports {
    'vehicleSpawn'
}
