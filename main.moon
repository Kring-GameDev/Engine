import Vector2, pointOnSegment from require "libs.math"
import Entity from require "libs.graphics.entity"
import Event, EventList from require "libs.util.event"
Event.init()
Camera = require "libs.graphics.camera"
Player = require "libs.graphics.base.player"

user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.Velocity = 1
Camera\setOffset(Vector2(-w/2, -h/2))

ang = 0
av, bv = Vector2(32, 64), Vector2(256, 0)

print(type(Camera.TargetVector))
Event.on_event("draw", ->
    mx, my = Camera\getMousePosition()\unpack!
    love.graphics.print(love.timer.getFPS!)
    vlist = {
        Vector2(-35, -15)\rotate(ang)
        Vector2(15, -15)\rotate(ang)
        Vector2(15, 15)\rotate(ang)
        Vector2(-15, 15)\rotate(ang)
    }

    vertex_list = {}
    for k, v in pairs vlist
        vertex_list[#vertex_list + 1] = v.x
        vertex_list[#vertex_list + 1] = v.y
        
    Camera\attach!
    user\render!
    love.graphics.polygon("fill", vertex_list)
    love.graphics.line(av.x, av.y, bv.x, bv.y)
    tar = pointOnSegment(Vector2(mx, my), av, bv)
    love.graphics.line(mx, my, tar.x, tar.y)
    love.graphics.print(Vector2(x, y)\distance(bv)/av\distance(bv), mx, my)
    love.graphics.print(user.ent.coord\distance(Vector2(0, 0)))
    for k, v in pairs Entity.list
        love.graphics.ellipse("line", v.coord.x, v.coord.y, 32, 32)
    Camera\detach!
)

Event.on_event("update", (dt) ->
    Camera\update(dt)
    Camera\lookAt(user\position())
    ang += dt
    user\contoller!
)

love.conf = (t) ->
    t.window.width = 124
    t.window.height = 768