sub init()
    m.content_grid = m.top.findNode("content_grid")
    m.header = m.top.findNode("header")
end sub

sub onFeedChanged(obj)
    feed = obj.getData()
	m.header.text = "Make your choice!"
    postercontent = createObject("roSGNode","ContentNode")
    For each item in feed
        node = createObject("roSGNode","ContentNode")
        node.streamformat = "hls"
        node.HDGRIDPOSTERURL = item.url
        node.id = item.id
        node.HDPosterUrl = item.url
        node.description = item.description
        node.SHORTDESCRIPTIONLINE1 = item.title
        node.SHORTDESCRIPTIONLINE2 = item.description
        node.url = "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"

        postercontent.appendChild(node)
    End For
    showpostergrid(postercontent)
end sub

sub showpostergrid(content)
    m.content_grid.content=content
    m.content_grid.visible=true
    m.content_grid.setFocus(true)
end sub
