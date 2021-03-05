station_cfg={}
station_cfg.ssid="REMOVED"
station_cfg.pwd="REMOVED"
wifi.setmode(wifi.STATION)
wifi.sta.config(station_cfg)
wifi.sta.connect()

redDC = 1023
greenDC = 0

redPin = 3
greenPin = 4

pwm.setup(redPin, 1000, redDC)
pwm.start(redPin)

pwm.setup(greenPin, 1000, redDC)
pwm.start(redPin)


timer = tmr.create()
connected = false
timer:alarm(1000,tmr.ALARM_AUTO,function()
    if connected == false then
        if wifi.sta.getip() == nil then
            print("IP unavailable, Waiting...")
        else
            connected = true
            pwm.setduty(redPin, 0)
            pwm.setduty(greenPin, 1023)
            print("ESP8266 mode is: " .. wifi.getmode())
            print("The module MAC address is: " .. wifi.ap.getmac())
            print("Config done, IP is "..wifi.sta.getip())
        end
    end
end)
