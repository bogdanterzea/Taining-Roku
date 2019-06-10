function init()
    m.category_list = m.top.findNode("category_list")
    m.category_list.SetFocus(true)
    m.top.observeField("visible", "onVisibleChange")
end function

sub onVisibleChange()
    if m.top.visible = true Then
        m.category_list.setFocus(true)
    end if
end sub
