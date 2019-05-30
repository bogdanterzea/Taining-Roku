function init()
	? "[home_scene] init"
	m.top.backgroundURI = ""
	m.top.backgroundColor = "0x004325"
	m.center_square = m.top.findNode("center_square")
	m.center_square.setFocus(true)
end function

function onKeyEvent(key, press) as Boolean
	? "[home_scene] onKeyEvent", key, press
  return false
end function
