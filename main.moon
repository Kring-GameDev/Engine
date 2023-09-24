import lerp, Vector2 from require "libs.math"
import Entity from require "libs.entity"
Camera = require "libs.camera"
Player = require "libs.graphics.player"

user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.v = 0.25
Camera.setOffset(-w/2, -h/2)

serialize_list = (tabl, indent) ->
    indent = indent and (indent .. "  ") or ""
    str = ''
    str ..= indent .. "{\n"
    for key, value in pairs(tabl)
      pr = (type(key) == "string") and ('["' .. key .. '"]=') or ""
      if type(value) == "table"
        str ..= pr .. serialize_list(value, indent)
      else if type(value) == "string"
        str ..= indent .. pr .. '"' .. tostring(value) .. '",\n'
      else
        str ..= indent .. pr .. tostring(value) .. ',\n'
    str ..= indent .. "},\n"
    str

love.draw = ->
    Camera.attach!
    user\render!   
    

    
    for k, v in pairs Entity.list
        love.graphics.ellipse("line", v.coord.x, v.coord.y, 32, 32)
    Camera.detach!


love.update = (dt) ->
        Camera.update!
        Camera.lookAt(user\position().x, user\position().y)

        user\contoller!
        
        

    
    
    
