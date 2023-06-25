ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("polizia", function()
    exports.ox_inventory:AddItem(source, 'weapon_pistol', 1, false, false, false)
    exports.ox_inventory:AddItem(source, 'weapon_pistol_mk2', 1, false, false, false)
end)