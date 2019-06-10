sub init()
    m.content_grid = m.top.findNode("content_grid")
    m.header = m.top.findNode("header")
    m.top.observeField("visible", "onVisibleChange")
end sub

sub onVisibleChange()
    if m.top.visible = true Then
        m.content_grid.setFocus(true)
    end if
end sub

sub onFeedChanged(obj)
    feed = obj.getData()
	m.header.text = "Make your choice!"
    postercontent = createObject("roSGNode","ContentNode")
    For each item in feed
        node = createObject("roSGNode","ContentNode")
        node.HDGRIDPOSTERURL = item.thumbnail
        node.id = item.id
        node.HDPosterUrl = item.url
        node.SHORTDESCRIPTIONLINE1 = item.title
        node.SHORTDESCRIPTIONLINE2 = item.description

        postercontent.appendChild(node)
    End For
    showpostergrid(postercontent)
end sub

sub showpostergrid(content)
    m.content_grid.content=content
    m.content_grid.visible=true
    m.content_grid.setFocus(true)
end sub
