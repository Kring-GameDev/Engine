EventList = {
    draw:        {}
    update:      {}
    keypressed:  {}
    keyreleased: {}

    gamepadpressed:   {}
    gamepadreleased:  {}
    joystickpressed:  {}
    joystickreleased: {}
    joystickadded:    {}
    joystickremoved:  {}

    mousepressed:  {}
    mousereleased: {}
    mousemoved:    {}
    wheelmoved:    {}

    threaderror: {}

    touchpressed:  {}
    touchreleased: {}
    touchmoved:    {}

    resize:     {}
    focus:      {}
    mousefocus: {}
    visible:    {}

    textinput: {}
}

Event = {}

Event.on_event = (event_name, callback) ->
    if EventList[event_name] == nil 
        return false

    EventList[event_name][#EventList[event_name] + 1] = callback

    return true
    

Event.init = ->
    love.draw = (...) ->
        for k, v in pairs(EventList.draw)
            v(...)

    love.update = (...) ->
        for k, v in pairs(EventList.update)
            v(...)

    love.keypressed = (...) ->
        for k, v in pairs(EventList.keypressed)
            v(...)

    love.keyreleased = (...) ->
        for k, v in pairs(EventList.keyreleased)
            v(...)

    love.gamepadpressed = (...) ->
        for k, v in pairs(EventList.gamepadpressed)
            v(...)

    love.gamepadreleased = (...) ->
        for k, v in pairs(EventList.gamepadreleased)
            v(...)

    love.joystickpressed = (...) ->
        for k, v in pairs(EventList.joystickpressed)
            v(...)

    love.joystickreleased = (...) ->
        for k, v in pairs(EventList.joystickreleased)
            v(...)

    love.joystickadded = (...) ->
        for k, v in pairs(EventList.joystickadded)
            v(...)

    love.joystickremoved = (...) ->
        for k, v in pairs(EventList.joystickremoved)
            v(...)

    love.mousepressed = (...) ->
        for k, v in pairs(EventList.mousepressed)
            v(...)

    love.mousereleased = (...) ->
        for k, v in pairs(EventList.mousereleased)
            v(...)

    love.mousemoved = (...) ->
        for k, v in pairs(EventList.mousemoved)
            v(...)

    love.wheelmoved = (...) ->
        for k, v in pairs(EventList.wheelmoved)
            v(...)

    love.threaderror = (...) ->
        for k, v in pairs(EventList.threaderror)
            v(...)

    love.touchpressed = (...) ->
        for k, v in pairs(EventList.touchpressed)
            v(...)

    love.touchreleased = (...) ->
        for k, v in pairs(EventList.touchreleased)
            v(...)

    love.touchmoved = (...) ->
        for k, v in pairs(EventList.touchmoved)
            v(...)

    love.resize = (...) ->
        for k, v in pairs(EventList.resize)
            v(...)

    love.focus = (...) ->
        for k, v in pairs(EventList.focus)
            v(...)

    love.mousefocus = (...) ->
        for k, v in pairs(EventList.mousefocus)
            v(...)

    love.visible = (...) ->
        for k, v in pairs(EventList.visible)
            v(...)

    love.textinput = (...) ->
        for k, v in pairs(EventList.textinput)
            v(...)

{ :Event, :EventList }