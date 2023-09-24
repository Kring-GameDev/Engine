import lerp, Vector2 from require "libs.math"
import Entity from require "libs.entity"
import Event, EventList from require "libs.event"
Event.init()
Camera = require "libs.camera"
Player = require "libs.graphics.player"

user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.v = 0.25
Camera.setOffset(-w/2, -h/2)

Event.on_event("draw", ->
    Camera.attach!
    user\render!   
    love.graphics.print("on_gay sex machgine"\sub(4))

    
    for k, v in pairs Entity.list
        love.graphics.ellipse("line", v.coord.x, v.coord.y, 32, 32)
    Camera.detach!
)


Event.on_event("update", (dt) ->
    Camera.update!
    Camera.lookAt(user\position().x, user\position().y)

    user\contoller!

)
