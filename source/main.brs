
sub main()
        screen = createObject("roSGScreen")
        scene = screen.createScene("home_scene")
        screen.Show()
        port = createObject("roMessagePort")
        screen.setMessagePort(m.port)
        'keep app open
        while(true)
        'stay on
        end while

end sub
