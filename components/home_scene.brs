function init()
	? "[home_scene] init"
	m.category_screen = m.top.findNode("category_screen")
	m.content_screen = m.top.findNode("content_screen")

	m.category_screen.observeField("category_selected", "onCategorySelected")
	m.category_screen.SetFocus(true)
end function

sub onCategorySelected(obj)
  selected_index = obj.getData()
  item = m.category_screen.findNode("category_list").content.getChild(selected_index)

  loadFeed(item.feed_url)
end sub

sub loadFeed(url)
  m.feed_task = CreateObject("roSGNode", "load_feed_task")
  m.feed_task.observeField("response", "onFeedResponse")
  m.feed_task.url = url
  m.feed_task.control = "RUN"
end sub

sub onFeedResponse(obj)
	m.category_screen.visible = false
	m.content_screen.visible = true
	response = obj.getData()
	data = parseJSON(response)
	? data
	? data[4]



	if data <> Invalid
		m.content_screen.feed_data = data
	else
		? "FEED RESPONSE IS EMPTY!"
	end if
end sub

function onKeyEvent(key, press) as Boolean
	if press Then
		if (key = "back") then m.top.appExit = true
	end if
	return false
end function
