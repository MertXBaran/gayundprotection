--anti uber exploit
AntiUberExploit = true --Telefonda uber yoksa kapatmamız gerektiği hakkında bilgi vermiş öz abim gaunth
UberWhitelist = {
    {x= 8.91, y= -242.82, z= 51.8},
    {x= 113.74, y= -277.95, z= 54.51},
    {x= 201.56, y= -148.76, z= 61.47},
    {x= -206.84, y= 159.49, z= 74.08},
    {x= 38.83, y= -71.64, z= 63.83},
    {x= 47.84, y= -29.16, z= 73.71},
    {x= -264.41, y= 98.82, z= 69.27},
    {x= -419.34, y= 221.12, z= 83.6},
    {x= -998.43, y= 158.42, z= 62.31},
    {x= -1026.57, y= 360.64, z= 71.36},
    {x= -967.06, y= 510.76, z= 82.07},
    {x= -1009.64, y= 478.93, z= 79.41},
    {x= -1308.05, y= 448.59, z= 100.86},
    {x= 557.39, y= -1759.57, z= 29.31},
    {x= 325.1, y= -229.59, z= 54.22},
    {x= 414.82, y= -217.57, z= 59.91},
    {x= 430.85, y= -941.91, z= 29.19},
    {x= -587.79, y= -783.53, z= 25.4},
    {x= -741.54, y= -982.28, z= 17.44},
    {x= -668.23, y= -971.58, z= 22.34},
    {x= -664.21, y= -1218.25, z= 11.81},
    {x= 249.99, y= -1730.79, z= 29.67},
    {x= 405.77, y= -1751.18, z= 29.71 },
    {x= 454.96, y= -1580.25, z= 32.82},
    {x= 278.81, y= -1117.96, z= 29.42},
    {x= 101.82, y= -819.49, z= 31.31},
    {x= -416.72, y= -186.79, z= 37.45},
}

local banlicamseni = true

RegisterNetEvent("kontroletbeniya")
AddEventHandler("kontroletbeniya", function()
    local player = PlayerPedId()
    local playercoords = GetEntityCoords()
    banlicamseni = true
    for k, v in pairs(UberWhitelist) do
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.x, v.y, v.z, true) < 10 then
            
            banlicamseni = false
        end
    end
    if banlicamseni == true then
        print("banland,n")
        TriggerServerEvent("dropme", "Uberden para basmayi denedim ya of")
    end
end)


--testing
--if you get test an open this strings
-- RegisterCommand("ubertest", function()
--     TriggerServerEvent("esx_uber:pay", 40)
-- end)
-- RegisterCommand("weaponbas", function()
--     TriggerServerEvent("m3:armor:additem", "WEAPON_PISTOL", 3)
-- end)