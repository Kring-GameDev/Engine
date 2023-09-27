import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"
import Event from require "libs.util.event"
import type from require "libs.type"
import Color from require "libs.graphics.color"
import Math from require "libs.math"
import Frame, Label from require "libs.vgui"

Camera = require "libs.graphics.camera"
Player = require "libs.graphics.base.player"

Event.init()
user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.Velocity = 1
Camera\setOffset(Vector2(-w/2, -h/2))

MainFrame = Frame(Vector2(256, 256), Vector2(256, 256))
Frame2 = Label(Vector2(64, 64), Vector2(96, 96), {{1, 0, 0}, "suck ", {0, 1, 0}, "my ", {0, 0, 1}, "dick\n", {1, 0, 1}, "OH NIGGA YOU GAY!"})

MainFrame.children += Frame2

Frame2.clr = Color(76, 76, 89)*1.2

MainFrame.clr = Color(76, 76, 89)
MainFrame.onDraw -= 1
MainFrame.onDraw += (self) ->
    love.graphics.setColor(Color(0, 0, 0))
    love.graphics.rectangle("fill", 4, 4, 256, 256, 4, 4)
    love.graphics.setColor((self.clr/255)\setA(1))
    love.graphics.rectangle("fill", 0, 0, self.size.x, self.size.y, 4, 4)
    

Event.on_event("draw", ->
    love.graphics.setColor(Color!)
    love.graphics.ellipse("fill", 0, 0, 5000, 5000)
    Camera\attach!
    user\render!
    
    MainFrame\draw!
    Camera\detach!
)

Event.on_event("update", (dt) ->
    Camera\update!
    Camera\lookAt(user\position!)
    user\contoller!
    MainFrame\update(dt)
)