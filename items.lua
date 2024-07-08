    -- data/items.lua
    ['adder'] = {
        label = 'adder Spawn',
        weight = 500,
        stack = true,
        close = true,
        client = {
            export = 'Stoic-CarItems.vehicleSpawn',
            usetime = 5000,
            anim = { dict = 'amb@world_human_seat_wall_tablet@female@base', clip = 'base' },
            prop = {
                model = 'prop_cs_tablet',
                pos = { x = 0.17, y = 0.10, z = -0.13 },
                rot = { x = 20.0, y = 180.0, z = 180.0 },
                bone = 57005
            }
        }
    },
