import Event from require "libs.util.event"
import Frame, Label from require "libs.vgui"
import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"
Player = require "libs.graphics.base.player"

Camera = require "libs.graphics.camera"
pixelcode = love.filesystem.read("shader.glsl")
shader = love.graphics.newShader(pixelcode)
init = (path, require) ->
    w, h = love.graphics.getWidth!, love.graphics.getHeight!
    MainFrame = Frame(Vector2(0, 0), Vector2(w, h))
    Camera\setOffset(Vector2(-(w/2), -(h/2)))

    ihand = love.mouse.getSystemCursor("hand")
    icurs = love.mouse.getSystemCursor("arrow")

    MyLabel  = Label(Vector2(32, 32), Vector2(256 - 64, 32), {{1, 0, 0}, "speed" , {0, 1, 0}, "hack"})
    MyLabel.state = false
    MyLabel.time = 0
    MyLabel.onMouseEnter += (self) ->
        self._localdata.clr_mul = 1.5
        love.mouse.setCursor(ihand)

    MyLabel.onMouseLeave += (self) ->
        self._localdata.clr_mul = 1
        love.mouse.setCursor(icurs)

    MyLabel.onMouseDown += (self) ->
        Player.list[1].power += 0.1
    
    MainFrame.children += MyLabel

    MyLabel  = Label(Vector2(32, 32+64), Vector2(256 - 64, 32), {{1, 0, 0}, "apply" , {0, 1, 0}, "torque"})
    MyLabel.state = false
    MyLabel.time = 0
    MyLabel.onMouseEnter += (self) ->
        self._localdata.clr_mul = 1.5
        love.mouse.setCursor(ihand)

    MyLabel.onMouseLeave += (self) ->
        self._localdata.clr_mul = 1
        love.mouse.setCursor(icurs)

    MyLabel.onMouseDown += (self) ->
        Player.list[1].ent.ptr.body\applyTorque(10000)

    MainFrame.onUpdate += (self, dt) ->
        shader\send("resolution", {w, h})

    MainFrame.children += MyLabel
        
    Event.on_event "draw", ->
        
        love.graphics.setShader(shader)
        MainFrame\draw!
        love.graphics.setShader()
    t = 0
    Event.on_event "update", (dt) ->
        t += dt 
        shader\send("time", t)
        
        MainFrame\update(dt)
        Camera\update(dt)

init