
sub main()
    app_info = CreateObject("roAppInfo")
    ? "AppTitle: ", app_info.getTitle()
    ? "App Verson: ", app_info.getVersion()
    ? "Channel ID: ", app_info.getID()
    ? "IsDev: ", app_info.IsDev()
    ? "custom_field", app_info.getValue("custom_field")


    device_info = CreateObject("roDeviceInfo")
	? "Model: ", device_info.GetModel()
	? "Display Name: ", device_info.GetModelDisplayName()
	? "Firmware: ", device_info.GetVersion()
	? "Device ID: ", device_info.GetDeviceUniqueId()
	? "Friendly Name: ", device_info.GetFriendlyName()
	display_size = device_info.getDisplaySize()
	? "Display Size: ", display_size.w;"x";display_size.h
	? "UI Resolution: ", device_info.GetUIResolution()
	? "Video Mode: ", device_info.GetVideoMode()
	? "IP Address: ",device_info.GetExternalIp()

    m.port = CreateObject("roMessagePort")
	screen = CreateObject("roSGScreen")
	screen.setMessagePort(m.port)
	scene = screen.CreateScene("home_scene")
	screen.Show()

    while(true)
		msg = wait(0, m.port)
		msgType = type(msg)
		if msgType = "roSGScreenEvent"
			if msg.isScreenClosed() then return
		end if
	end while

end sub
