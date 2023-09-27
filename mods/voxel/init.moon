import Event from require "libs.util.event"

init = (path) ->
    Event.on_event "draw", ->
        love.graphics.setColor(0, 1, 0)
        love.graphics.rectangle("fill", 256, 0, 256, 256)
init