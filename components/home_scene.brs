function init()
	? "[home_scene] init"
	m.category_screen = m.top.findNode("category_screen")
	m.content_screen = m.top.findNode("content_screen")
	m.details_screen = m.top.findNode("details_screen")

	m.videoplayer = m.top.findNode("videoplayer")
	initializedVideoPlayer()

	m.content_grid = m.content_screen.findNode("content_grid")
	m.play_button = m.details_screen.findNode("play_button")
	m.category_list = m.category_screen.findNode("category_list")

	m.category_screen.observeField("category_selected", "onCategorySelected")
	m.content_screen.observeField("content_selected", "onContentSelected")
	m.details_screen.observeField("play_button_pressed", "onPlayButtonPressed")

	m.category_screen.SetFocus(true)
end function

sub initializedVideoPlayer()
	m.videoplayer.enableCookies()
	m.videoplayer.setCertificatesFile("common:/certs/ca-bundle.crt")
	m.videoplayer.InitClientCertificates()
	m.videoplayer.observeFieldScoped("position", "onPlayerPositionChanged")
	m.videoplayer.observeFieldScoped("state", "onPlayerStateChanged")
end sub

sub onPlayerPositionChanged(obj)
	?"Player Position: ", obj.getData()
end sub

sub onPlayerStateChanged(obj)
	state = obj.getData()
	? "player STATE changed: ", state
end sub


sub onCategorySelected(obj)
  	selected_index = obj.getData()
  	item = m.category_screen.findNode("category_list").content.getChild(selected_index)

  	loadFeed(item.feed_url)
end sub

sub onContentSelected(obj)
	selected_index = obj.getData()
	m.selected_media = m.content_screen.findNode("content_grid").content.getChild(selected_index)
	m.details_screen.content = m.selected_media
	m.content_screen.visible = false
	m.details_screen.visible = true
end sub

sub onPlayButtonPressed(obj)
	m.details_screen.visible = false
	m.videoplayer.visible = true
	m.videoplayer.setFocus(true)
	m.videoplayer.content = m.selected_media
	m.videoplayer.control = "play"
end sub

sub loadFeed(url)
  	m.feed_task = CreateObject("roSGNode", "load_feed_task")
  	m.feed_task.observeField("response", "onFeedResponse")
  	m.feed_task.url = url
  	m.feed_task.control = "RUN"
end sub

sub onFeedResponse(obj)
	response = obj.getData()
	data = parseJSON(response)
	if data <> Invalid
		m.category_screen.visible = false
		m.content_screen.visible = true
		m.content_screen.feed_data = data
		m.content_grid.setFocus(true)
	else
		? "FEED RESPONSE IS EMPTY!"
	end if
end sub

function onKeyEvent(key, press) as Boolean
	if press Then
		if (key = "back")
			if m.content_screen.visible
				m.content_screen.visible = false
				m.category_screen.visible = true
				m.category_list.setFocus(true)
				return true
			else if m.details_screen.visible
				m.details_screen.visible = false
				m.content_screen.visible = true
				m.content_grid.setFocus(true)
				return true
			else if m.videoplayer.visible
				m.videoplayer.control = "stop"
				m.videoplayer.visible = false
				m.details_screen.visible = true
				m.play_button.setFocus(true)
				return true
			end if
		end if
	end if
	return false
end function
