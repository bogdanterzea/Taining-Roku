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
        node.url = "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"

        postercontent.appendChild(node)
    End For
    showpostergrid(postercontent)
end sub

sub showpostergrid(content)
    m.content_grid.content=content
    m.content_grid.visible=true
    m.content_grid.setFocus(true)
end sub
