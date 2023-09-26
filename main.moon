import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"
import Event from require "libs.util.event"
import type from require "libs.type"
import Color from require "libs.graphics.color"
import Math from require "libs.math"

Event.init()
Camera = require "libs.graphics.camera"
Player = require "libs.graphics.base.player"

user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.Velocity = 1
Camera\setOffset(Vector2(-w/2, -h/2))

val = 0
value = 10000000
Event.on_event("draw", ->
    MPos = Camera\getMousePosition!
    love.graphics.print(love.timer.getFPS!)

    Camera\attach!
    
    for i = 1, value
        --love.graphics.setColor(Color((i + val) * 360 / value, 1, 1)\hsvToRgb!)
        love.graphics.ellipse("fill", math.sin(math.rad(i * 360 / value)) * 100, math.cos(math.rad(i * 360 / value)) * 100, 6, 6)
    love.graphics.setColor(Color!)
    user\render!
    Camera\detach!
)

Event.on_event("update", (dt) ->
    Camera\update!
    Camera\lookAt(user\position())
    user\contoller!
    val += 100
)