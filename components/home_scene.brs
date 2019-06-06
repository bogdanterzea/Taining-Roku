function init()
	m.top.backgroundColor = "0x004325"
	m.category_screen = m.top.findNode("category_screen")
end function


function onKeyEvent(key, press) as Boolean
	if press Then
		if (key = "back") then m.top.appExit = true
	end if

	return false
end function
