import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"
import Event from require "libs.util.event"
import type from require "libs.type"
import Color from require "libs.graphics.color"
import Math from require "libs.math"
import Frame, Label from require "libs.vgui"



Camera = require "libs.graphics.camera"
Player = require "libs.graphics.base.player"
Phys   = require "libs.graphics.physic.base"
Box    = require "libs.graphics.base.box"



w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.Velocity = 1
Camera\setOffset(Vector2(-w/2, -h/2))





init = (path) ->

    Event.on_event("load", -> 
        export WorldEntity = {
            Rect:       Box(Vector2(0, 0), Vector2(100, 50))
            User:       Player(Vector2(200, 200), Vector2(32, 32))
        }
        export Physic = Phys(Vector2(), Vector2(2048, 2048)) 
    )

    Event.on_event("draw", ->
        Camera\attach!

        for _, ent in pairs WorldEntity
            ent\render()


        Camera\detach!
    )

    Event.on_event("update", (dt) ->
        Camera\update!
        Physic\update(dt)
        Camera\lookAt(Vector2(WorldEntity.User.ent.ptr.body\getX(), WorldEntity.User.ent.ptr.body\getY()))

        for _, ent in pairs WorldEntity
            ent\update(dt)

        if love.keyboard.isDown("escape")
            exit()
    )
init