import Event from require "libs.util.event"

init = ->
    Event.on_event "draw", ->
        love.graphics.rectangle("fill", 0, 0, 256, 256)


init