import Vector2, pointOnSegment from require "libs.math"
import Entity from require "libs.graphics.entity"
import Event, EventList from require "libs.util.event"
import type from require "libs.type"
import Color from require "libs.graphics.color"

Event.init()
Camera = require "libs.graphics.camera"
Player = require "libs.graphics.base.player"

user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.Velocity = 1
Camera\setOffset(Vector2(-w/2, -h/2))

ang = 0
av, bv = Vector2(32, 64), Vector2(256, 0)



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

    for i = 1,64
        love.graphics.setColor(Color((i * 360 / 64), 1, 1)\hsvToRgb!)
        love.graphics.ellipse("fill", i * 12, 0, 6, 6)
    
    Camera\detach!
)
t = 0
Event.on_event("update", (dt) ->
    Camera\update!
    Camera\lookAt(user\position())
    ang += dt
    user\contoller!
)