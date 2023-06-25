ESX = exports["es_extended"]:getSharedObject()
local tempo = false

local options = {
    {
        name = 'ox:option1',
        event = 'prendi:armamento',
        icon = 'fa-solid fa-shield-halved',
        label = 'Prendi Armamento',
        groups = 'polizia',
    },
}
local armamento = { 
    's_m_m_armoured_01'
}
exports.ox_target:addModel(armamento, options)

-- BLIP IN MAPPA -- 
ydblip = AddBlipForCoord(454.0460, -980.0172, 30.6896, 90.4297)
    SetBlipSprite(ydblip, 137)
    SetBlipScale(ydblip, 0.8)
    SetBlipColour(ydblip, 17)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Police Armory")
    EndTextCommandSetBlipName(ydblip)

-- MODELLO PED --
Citizen.CreateThread(function()
  if not HasModelLoaded('s_m_m_armoured_01') then
     RequestModel('s_m_m_armoured_01')
     while not HasModelLoaded('s_m_m_armoured_01') do
        Citizen.Wait(5)
     end
  end

npc = CreatePed(4, 's_m_m_armoured_01', 454.0460, -980.0172, 29.6896, 90.4297, false, true)
FreezeEntityPosition(npc, true)
SetEntityInvincible(npc, true)
SetBlockingOfNonTemporaryEvents(npc, true)
end)
-------------------------------------------------------------------------------------------------
------------------------------------ FUNZIONE POLIZIA -------------------------------------------
-------------------------------------------------------------------------------------------------
RegisterNetEvent('prendi:armamento', function()
    if not tempo then 
        tempo = true
        TriggerServerEvent('polizia', 0)
        lib.notify({
            title = 'YD DEV',
            description = 'Hai Preso il tuo Armamento',
            type = 'success'
        })
        Wait(60000) -- 60 secondi
        tempo = false
    else
        lib.notify({
            title = 'YD DEV',
            description = 'Hai Già Preso il tuo Armamento',
            type = 'error'
        })
    end
end)

