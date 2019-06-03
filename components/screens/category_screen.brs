function init()
    m.category_list = m.top.findNode("category_list")
    m.category_list.setFocus(true)
    m.category_label = m.top.findNode("category_label")
    m.category_list.observeField("itemFocused", "onCategorySelected")
    
    m.category_list.content = createContentNode()
end function

function createContentNode() as Object
    contentNode = createObject("roSGNode","ContentNode")
    for each key in getCategoryEntries()
        categoryNode = createCategoryNode(key.title, key.url)
        contentNode.appendChild(categoryNode)
    end for

    return contentNode
end function

function createCategoryNode(title as String, url as String) as Object
    category_node = createObject("roSGNode", "category_node")
    category_node.title = title
    category_node.feed_url = url

    return category_node
end function

function getCategoryEntries() as Object
    return [
        { title: "HORROR", url: "google.ro" },
        { title: "DRAMA", url: "google.ro" },
        { title: "COMEDY", url: "google.ro" }
        { title: "SERIES", url: "google.ro" }
    ]
end function

sub onCategorySelected(event as Object)
    currnet_item_focused = event.getData()

    m.category_label.text = "Current category selected:" + getCategoryTitle(currnet_item_focused)
end sub

function getCategoryTitle(currnet_item as Integer) as String
    return m.category_list.content.getChild(currnet_item).title
end function
