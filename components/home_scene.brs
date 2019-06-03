function init()
	m.top.backgroundColor = "0x004325"
	m.content_screen = m.top.findNode("content_screen")
	m.category_screen = m.top.findNode("category_screen")
end function

function onKeyEvent(key, press) as Boolean
	? "[home_scene] onKeyEvent", key, press
  return false
end function
