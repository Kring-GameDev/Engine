import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"
import Event from require "libs.util.event"
import type from require "libs.type"
import Color from require "libs.graphics.color"
import Math from require "libs.math"
import Frame from require "libs.vgui"

Camera = require "libs.graphics.camera"
Player = require "libs.graphics.base.player"

Event.init()
user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.Velocity = 1
Camera\setOffset(Vector2(-w/2, -h/2))

MainFrame = Frame(Vector2(256, 256), Vector2(256, 256))
Frame2 = Frame(Vector2(64, 64), Vector2(96, 96))

MainFrame.children += Frame2

Frame2.clr = Color!
Frame2.onDraw -= 1
Frame2.onDraw += (self) ->
    love.graphics.setColor(self.clr)
    love.graphics.rectangle("fill", 0, 0, self.size.x, self.size.y)
MainFrame.clr = Color!

MainFrame.onDraw -= 1
MainFrame.onDraw += (self) ->
    love.graphics.setColor(self.clr)
    love.graphics.rectangle("fill", 0, 0, 256, 256)

MainFrame.onMousePressed += (self) ->
    self.clr = Color.Random(0, 1, 0, 1, 0, 1)

MainFrame.onMouseUp += (self) ->
    self.clr = Color.Random(0, 1, 0, 1, 0, 1)

Frame2.onMouseEnter += (self) ->
    self.clr = Color.Random(0, 1, 0, 1, 0, 1)
    
Frame2.onMouseLeave += (self) ->
    self.clr = Color.Random(0, 1, 0, 1, 0, 1)

Event.on_event("draw", ->
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