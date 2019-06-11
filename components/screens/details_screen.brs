sub init()
    m.title = m.top.findNode("title")
    m.description = m.top.findNode("description")
    m.thumbnail = m.top.findNode("thumbnail")
    m.play_button = m.top.findNode("play_button")
    m.top.observeField("visible", "onVisibleChange")

    m.play_button.setFocus(true)
end sub

sub onVisibleChange()
    if m.top.visible = true then
        m.play_button.setFocus(true)
    end if
end sub

sub OnContentChange(obj)
    item = obj.getData()
    m.title.text = item.title
    m.description.text = item.description
    m.thumbnail.uri = item.HDGRIDPOSTERURL
end sub
