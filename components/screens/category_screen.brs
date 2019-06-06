function init()
    m.category_list = m.top.findNode("category_list")
    m.category_list.setFocus(true)
    m.category_label = m.top.findNode("category_label")
    m.content_image = m.top.findNode("content_image")
    m.ranking_list = m.top.findNode("ranking_list")
    m.category_rank = m.top.findNode("category_rank")
    m.category_list.observeField("itemFocused", "onCategoryFocused")
    m.ranking_list.observeField("itemSelected", "onRankSelected")

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

sub onCategoryFocused(event as Object)
    current_item_index = event.getData()
    m.itemFocused = getCurentItemData(current_item_index)

    m.category_label.text = "Current category selected:" + m.itemFocused.title
    m.content_image.uri = m.itemFocused.feed_url
    m.category_rank.text = m.itemFocused.rank
end sub

function getCurentItemData(current_item as Integer) as Object
    return m.category_list.content.getChild(current_item)
end function

sub onRankSelected(event as Object)
    current_item_index = event.getData()
    itemSelected = getCurrentRankData(current_item_index)
    m.itemFocused.rank = itemSelected.rank
end sub

function getCurrentRankData(current_item as Integer) as Object
    return m.ranking_list.content.getChild(current_item)
end function
