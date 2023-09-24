EventList = {
    on_draw:        {}
    on_update:      {}
    on_keypressed:  {}
    on_keyreleased: {}

    on_gamepadpressed:   {}
    on_gamepadreleased:  {}
    on_joystickpressed:  {}
    on_joystickreleased: {}
    on_joystickadded:    {}
    on_joystickremoved:  {}

    on_mousepressed:  {}
    on_mousereleased: {}
    on_mousemoved:    {}
    on_wheelmoved:    {}

    on_threaderror: {}

    on_touchpressed:  {}
    on_touchreleased: {}
    on_touchmoved:    {}

    on_resize:     {}
    on_focus:      {}
    on_mousefocus: {}
    on_visible:    {}

    on_textinput: {}
}

Event = { defines: {} }

Event.on_event = (event_name, callback) ->
    if EventList[event_name] == nil 
        return false

    EventList[event_name][#EventList[event_name] + 1] = callback

    return true
    

Event.init = ->
    love.draw = (...) ->
        for k, v in pairs(EventList.on_draw)
            v(...)

    love.update = (...) ->
        for k, v in pairs(EventList.on_update)
            v(...)

    love.keypressed = (...) ->
        for k, v in pairs(EventList.on_keypressed)
            v(...)

    love.keyreleased = (...) ->
        for k, v in pairs(EventList.on_keyreleased)
            v(...)

    love.gamepadpressed = (...) ->
        for k, v in pairs(EventList.on_gamepadpressed)
            v(...)

    love.gamepadreleased = (...) ->
        for k, v in pairs(EventList.on_gamepadreleased)
            v(...)

    love.joystickpressed = (...) ->
        for k, v in pairs(EventList.on_joystickpressed)
            v(...)

    love.joystickreleased = (...) ->
        for k, v in pairs(EventList.on_joystickreleased)
            v(...)

    love.joystickadded = (...) ->
        for k, v in pairs(EventList.on_joystickadded)
            v(...)

    love.joystickremoved = (...) ->
        for k, v in pairs(EventList.on_joystickremoved)
            v(...)

    love.mousepressed = (...) ->
        for k, v in pairs(EventList.on_mousepressed)
            v(...)

    love.mousereleased = (...) ->
        for k, v in pairs(EventList.on_mousereleased)
            v(...)

    love.mousemoved = (...) ->
        for k, v in pairs(EventList.on_mousemoved)
            v(...)

    love.wheelmoved = (...) ->
        for k, v in pairs(EventList.on_wheelmoved)
            v(...)

    love.threaderror = (...) ->
        for k, v in pairs(EventList.on_threaderror)
            v(...)

    love.touchpressed = (...) ->
        for k, v in pairs(EventList.on_touchpressed)
            v(...)

    love.touchreleased = (...) ->
        for k, v in pairs(EventList.on_touchreleased)
            v(...)

    love.touchmoved = (...) ->
        for k, v in pairs(EventList.on_touchmoved)
            v(...)

    love.resize = (...) ->
        for k, v in pairs(EventList.on_resize)
            v(...)

    love.focus = (...) ->
        for k, v in pairs(EventList.on_focus)
            v(...)

    love.mousefocus = (...) ->
        for k, v in pairs(EventList.on_mousefocus)
            v(...)

    love.visible = (...) ->
        for k, v in pairs(EventList.on_visible)
            v(...)

    love.textinput = (...) ->
        for k, v in pairs(EventList.on_textinput)
            v(...)

    for k, v in pairs EventList
        Event.defines[l\sub(4)] = k

{ :Event, :EventList }