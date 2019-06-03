function init()
    m.category_list = m.top.findNode("category_list")
    m.category_list.setFocus(true)
    addObservers()
end function

sub addObservers()
  m.category_list.observeField("itemSelected", "onCategorySelected")
end sub

sub onCategorySelected(obj)
  ? "onCategorySelected field: ";obj.getField()
  ? "onCategorySelected data: ";obj.getData()
  selected_index = obj.getData()
  ? "selected_index :";selected_index
  ? "checkedItem: ";m.category_list.checkedItem
  item = m.category_list.content.getChild(selected_index)
  ? item.title
  ? item.feed_url
  loadFeed(item.feed_url)
end sub

sub loadFeed(url)
    ? "loadFeed! ";url

''    variabilaMea = "asd"

    ' TODO: https://developer.roku.com/docs/developer-program/core-concepts/data-scoping.md
    m.feed_task = createObject("roSGNode", "load_feed_task")
    m.feed_task.observeField("response", "onFeedResponse")


    m.feed_task.url = url
    ' TODO: learn more about task.control = "command"
    m.feed_task.control = "RUN"
end sub

sub onFeedResponse(event as Object)
    ? "onFeedResponse: "
    ? event

    ? event.getData()
end sub
