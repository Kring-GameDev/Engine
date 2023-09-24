import lerp, Vector2 from require "libs.math"
import Entity from require "libs.graphics.entity"
import Event, EventList from require "libs.util.event"
Event.init()
Camera = require "libs.graphics.camera"
Player = require "libs.graphics.base.player"

user = Player(Vector2(0, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.v = 0.25
Camera.setOffset(-w/2, -h/2)

Event.on_event("draw", ->
    Camera.attach!
    user\render!   

    love.graphics.print(user.ent.coord\distance(Vector2(0, 0)))
    for k, v in pairs Entity.list
        love.graphics.ellipse("line", v.coord.x, v.coord.y, 32, 32)
    Camera.detach!
)

Event.on_event("update", (dt) ->
    Camera.update!
    Camera.lookAt(user\position().x, user\position().y)

    user\contoller!
)
