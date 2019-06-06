function init()
    m.category_list = m.top.findNode("category_list")
    m.category_list.setFocus(true)
    m.category_label = m.top.findNode("category_label")
    m.content_image = m.top.findNode("content_image")
    m.ranking_list = m.top.findNode("ranking_list")
    m.rating_label = m.top.findNode("rating_label")
    m.category_list.observeField("itemFocused", "onCategorySelected")

    runGetCategoryListContentTask()
    runGetRankListContentTask()
end function

function onKeyEvent(key, press) as Boolean
    if press Then
        if (key = "right") then
            m.ranking_list.setFocus(true)
        else if (key = "left") then
            m.category_list.setFocus(true)
        end if
    end if

    return false
end function

function runGetRankListContentTask() as Void
    task = createObject("roSgNode", "getRankListContentTask")
    task.observeField("rankListContent", "getRankListContent")
    task.control = "RUN"
end function

function getRankListContent(message as Object) as Void
    rank_content = message.getData()
    m.ranking_list.content = rank_content
end function

function runGetCategoryListContentTask() as Void
    task = CreateObject("roSgNode", "getCategoryListContentTask")
    task.observeField("categoryListContent", "getCategoryListContent")
    task.control = "RUN"
end function

function getCategoryListContent(message as Object) as Void
    category_list_content = message.getData()
    m.category_list.content = category_list_content
end function

sub onCategorySelected(event as Object)
    currnet_item_index = event.getData()
    current_item_data = getCurentItemData(currnet_item_index)

    m.category_label.text = "Current category selected:" + current_item_data.title
    m.content_image.uri = current_item_data.feed_url
    m.rating_label.text = current_item_data.rank
end sub

function getCurentItemData(current_item as Integer) as Object
    return m.category_list.content.getChild(current_item)
end function
