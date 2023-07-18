local QBCore = exports['qb-core']:GetCoreObject()
local dinlendi = false
local oyuncuid = PlayerPedId()
local PlayerData = QBCore.Functions.GetPlayerData()
local hazir = true

local GetGroundCoords = function(coords)
    local rayCast               = StartShapeTestRay(coords.x, coords.y, coords.z, coords.x, coords.y, -10000.0, 1, 0)
    local _, hit, hitCoords     = GetShapeTestResult(rayCast)
    return (hit == 1 and hitCoords) or coords
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(50)
    end
end



RegisterNetEvent("torpak-yoga:yap", function()
    if hazir then
        local mat = GetEntityCoords(acilmis)
        print(mat)
        SetEntityCoords(GetPlayerPed(-1), mat.x, mat.y, mat.z , 1, 0, 0, 1)
        loadAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        PlayAnimOnRunningScenario(ped, animDict, animName)
        TaskStartScenarioAtPosition(oyuncuid, "WORLD_HUMAN_YOGA", mat.x, mat.y, mat.z, GetEntityHeading(oyuncuid), 0, true, false)
        QBCore.Functions.Progressbar("yogayapiyo", Config.ProgTextv3, Config.ProgTime, false, Config.CanCancel, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() 
            ClearPedTasks(oyuncuid)
            TriggerServerEvent('hud:server:RelieveStress', 100)
            hazir = false
            Wait(Config.Cooldown)
            hazir = true
            QBCore.Functions.Notify(Config.NotifyTextv4, Config.NotifyTypev4, 5500)
        end, function() -- Cancel
            ClearPedTasks(oyuncuid)
            hazir = false
            Wait(Config.Cooldown)
            hazir = true
        end)
    else
        QBCore.Functions.Notify(Config.NotifyTextv3, Config.NotifyTypev3, 5000)
    end
end)



RegisterNetEvent("torpak-yoga:useitem", function()
    local oyuncu = PlayerPedId()
    local groundCoords = GetGroundCoords(GetEntityCoords(oyuncuid))
    print(groundCoords)
    local head = GetEntityHeading(oyuncuid)
    print(head)
    sarilmis = CreateObject(GetHashKey("prop_rolled_yoga_mat"), groundCoords.x, groundCoords.y, groundCoords.z, true, true, true)
    AttachEntityToEntity(sarilmis, oyuncuid, GetPedBoneIndex(oyuncuid, 6286), 0, 0, 0, 0, 0, 0, true, true, false, true, 1, true)
    loadAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
    TaskPlayAnim(oyuncuid, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
    QBCore.Functions.Progressbar("mataciliyor", Config.ProgText, Config.ProgTime, false, Config.CanCancel, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
     }, {}, {}, {}, function() 
        StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
        QBCore.Functions.Notify(Config.NotifyText, Config.NotifyType, 5500)
        DeleteObject(sarilmis)
            acilmis = CreateObject(GetHashKey("p_yoga_mat_03_s"), groundCoords.x, groundCoords.y, groundCoords.z, true, true, true)
        SetEntityHeading(acilmis, head+90)
        TriggerServerEvent("torpak-yoga:itemsil")
        exports['qb-target']:AddTargetEntity(acilmis, {
            options = {
                {
                    type = "client",
                    event = "torpak-yoga:yap",
                    icon = "fas fa-heart",
                    label = "Yoga Yap",
                },
                {
                    type = "client",
                    event = "torpak-yoga:matal",
                    icon = "fas fa-hand-holding-medical",
                    label = "Matı Yerden Al",
                },
            },
            distance = 3.0
        })
     end, function() -- Cancel
        DeleteObject(sarilmis)
        StopAnimTask(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
     end)
end)

RegisterNetEvent("torpak-yoga:matal", function()
    QBCore.Functions.Progressbar("mataliyo", Config.ProgTextv2, 1000, false, Config.CanCancel, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {    animDict = 'pickup_object',
            anim = 'pickup_low',
            flags = 16,
}, {}, {}, function() 
    ClearPedTasks(oyuncuid)
    DeleteObject(acilmis)
    TriggerServerEvent("torpak-yoga:itemver")
        QBCore.Functions.Notify(Config.NotifyTextv2, Config.NotifyTypev2, 5500)
    end, function()
end)
end)

