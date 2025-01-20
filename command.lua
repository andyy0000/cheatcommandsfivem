RegisterCommand("giveweapon", function(source, args, rawCommand)
    local player = GetPlayerPed(-1) -- Get the player's ped (character)
    local weaponName = args[1] -- First argument as weapon name

    if weaponName then
        GiveWeaponToPed(player, GetHashKey(weaponName), 250, false, true)
        TriggerEvent('chat:addMessage', {
            args = {"[Cheats]", "You have been given a " .. weaponName .. "!"}
        })
    else
        TriggerEvent('chat:addMessage', {
            args = {"[Cheats]", "Usage: /giveweapon [weapon_name]"}
        })
    end
end, false)

RegisterCommand("sethealth", function(source, args, rawCommand)
    local player = GetPlayerPed(-1) -- Get the player's ped (character)
    local health = tonumber(args[1]) -- First argument as health value

    if health and health > 0 then
        SetEntityHealth(player, health)
        TriggerEvent('chat:addMessage', {
            args = {"[Cheats]", "Your health has been set to " .. health .. "!"}
        })
    else
        TriggerEvent('chat:addMessage', {
            args = {"[Cheats]", "Usage: /sethealth [amount]"}
        })
    end
end, false)

RegisterCommand("spawnvehicle", function(source, args, rawCommand)
    local player = GetPlayerPed(-1) -- Get the player's ped (character)
    local vehicleName = args[1] -- First argument as vehicle name

    if vehicleName then
        local vehicleHash = GetHashKey(vehicleName)

        RequestModel(vehicleHash)
        while not HasModelLoaded(vehicleHash) do
            Wait(500)
        end

        local coords = GetEntityCoords(player)
        local vehicle = CreateVehicle(vehicleHash, coords.x, coords.y, coords.z, GetEntityHeading(player), true, false)
        SetPedIntoVehicle(player, vehicle, -1)
        TriggerEvent('chat:addMessage', {
            args = {"[Cheats]", "You have spawned a " .. vehicleName .. "!"}
        })
    else
        TriggerEvent('chat:addMessage', {
            args = {"[Cheats]", "Usage: /spawnvehicle [vehicle_name]"}
        })
    end
end, false)
