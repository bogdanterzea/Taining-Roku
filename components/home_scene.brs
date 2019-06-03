function init()
	? "[home_scene] init"
	m.top.backgroundURI = ""
	m.top.backgroundColor = "0x004325"
	m.center_square = m.top.findNode("center_square")
	m.category_screen = m.top.findNode("category_screen")
	m.label_hello = m.top.findNode("label_hello")
'	m.category_screen = m.top.SetFocus("true")

	'? m.top.getChild(2) 'no longer display all the details in console

	m.category_screen.visible = true

'	m.label_hello = m.top.findNode("label_hello")
'	m.label_hello.text = "Holla! :D"
'	m.label_hello = m.top.findNode("label_hello")
'	m.label_hello.text = "Salut Bogdan !"
'	m.label_hello.translation = [1320, 980]
	m.label_hello.visible = false						'Hello! message hided
	m.center_square.visible = false						'CENTER SQUARE HIDED

end function
function onKeyEvent(key, press) as Boolean
	? "[home_scene] onKeyEvent", key, press
  return false
end function
