import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"
import Event from require "libs.util.event"
import type from require "libs.type"
import Color from require "libs.graphics.color"

Event.init()
Camera = require "libs.graphics.camera"
Player = require "libs.graphics.base.player"

user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.Velocity = 1
Camera\setOffset(Vector2(-w/2, -h/2))


Event.on_event("draw", ->
    Camera\attach!
    user\render!
    love.graphics.ellipse("fill", 0, 0, 256, 256)
    Camera\detach!
)

Event.on_event("update", (dt) ->
    Camera\update!
    Camera\lookAt(user\position())
    user\contoller!
)