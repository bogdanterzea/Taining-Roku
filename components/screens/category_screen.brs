function init()
    m.category_list = m.top.findNode("category_list")
    m.category_list.setFocus(true)
    m.category_label = m.top.findNode("category_label")
    m.content_image = m.top.findNode("content_image")
    m.category_list.observeField("itemFocused", "onCategorySelected")

    runGetPhotosApiTask()
end function

function createCategoryListContent(response as Object) as Object
    contentNode = createObject("roSGNode","ContentNode")
    for each item in response
        categoryNode = createCategoryNode(item.title, item.url)
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

function runGetPhotosApiTask() as Void
    task = CreateObject("roSgNode", "getPhotosApiTask")
    task.observeField("response", "onResponseChanged")
    task.control = "RUN"
end function

function onResponseChanged(event as Object) as Void
    individual_data = ParseJson(event.getData())
    category_list_content = createCategoryListContent(individual_data)

    m.category_list.content = category_list_content
end function

sub onCategorySelected(event as Object)
    currnet_item_focused = event.getData()

    m.category_label.text = "Current category selected:" + getCategoryTitle(currnet_item_focused)
    m.content_image.uri = getCategoryURL(currnet_item_focused)
end sub

function getCategoryTitle(current_item as Integer) as String
    return m.category_list.content.getChild(current_item).title
end function

function getCategoryURL(current_item as Integer) as String
    return m.category_list.content.getChild(current_item).feed_url
end function
