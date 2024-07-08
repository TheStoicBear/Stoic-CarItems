
![STOIC](https://github.com/TheStoicBear/Stoic-CarItems/assets/112611821/1b8776a9-b90f-43e5-aab0-78d9af9b3ef1)


# Stoic CarItems
- ox_inventory Standalone support | ✅ 
- qb-core support | hypothetical 
- esx support | hypothetical 

## Features
- Define a usable item that spawns a vehicle when used.
- Automatically handles vehicle ownership for ESX and QBCore frameworks.
- Uses built-in progress bar and animations for item usage.
- Provides notifications for successful or failed actions.

## How It Works
1. **Define the Item**: The item is defined in `items.lua` with properties such as label, weight, stack, close, and client-side usage settings.
2. **Item Usage**: When the item is used, it triggers a client-side export function that spawns a vehicle with the same name as the item.
3. **Vehicle Spawning**: The client script requests and spawns the vehicle model, then places the player inside the vehicle.
4. **Server-Side Ownership**: A server-side event assigns vehicle ownership to the player using either ESX or QBCore framework, or handles it without a framework if neither is found.

# Item Images 
https://docs.fivem.net/docs/game-references/vehicle-models/


1. **Add the Item to Your Inventory**: Ensure the item is added to your player's inventory.
2. **Use the Item**: When used, the item will spawn a vehicle with the same name as the item and assign ownership to the player.



# How to Create Custom Car Images for Items

If you have an addon car and want to create a custom image for it in your FiveM inventory, follow these steps:

1. **Take a Screenshot of the Car In-Game:**
   - Spawn your addon car in the game.
   - Position the camera to get a clear and aesthetically pleasing view of the car.
   - Take a screenshot.

2. **Remove the Background:**
   - Go to [remove.bg](https://www.remove.bg/).
   - Upload the screenshot you took.
   - Use the tool to remove the background from the image.
   - Download the edited image.

3. **Rename the Image:**
   - Rename the image file to match the spawn name of the vehicle. For example, if your vehicle spawn name is `addoncar`, rename the image to `addoncar.png`.

4. **Add the Image to ox_inventory:**
   - Place the renamed image file (`addoncar.png`) into the `ox_inventory/web/images/` directory of your FiveM server.

5. **Refresh and Ensure ox_inventory:**
   - Refresh the inventory images by ensuring `ox_inventory` twice. You can do this by running the following commands in your server console:
     ```bash
     ensure ox_inventory
     ensure ox_inventory
     ```

By following these steps, you can have custom car images for your addon vehicles in your FiveM inventory.
