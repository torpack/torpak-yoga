Config = {}

Config.ItemName = "sports_mat"

Config.ProgTime = 10000 -- default : 10 second
Config.ProgText = "Mat Açılıyor.." -- Progressbar Text
Config.ProgTextv2 = "Mat Yerden Alınıyor.." -- Progressbar Text for Taking
Config.ProgTextv3 = "Yoga Yapıyorsun.." -- Progressbar for Doing Yoga

Config.NotifyText = "Mat Hazır" -- Notify For Opening
Config.NotifyType = 'success' -- Type

Config.NotifyTextv2 = "Mat Yerden Alındı" -- Notify for Taking 
Config.NotifyTypev2 = 'success' -- Type

Config.NotifyTextv3 = "Bu Kadar Hızlı Yoga Yapamazsın!" -- Notify for Cooldown
Config.NotifyTypev3 = 'error' -- Type

Config.NotifyTextv4 = "Yoga Yapmaya Hazırsın"
Config.NotifyTypev4 = "success"

Config.Cooldown = 15000 -- default : 15 second
Config.CanCancel = true -- Cancel Progbar (On Every Progress)