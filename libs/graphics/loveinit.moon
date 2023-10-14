import type from require "libs.type"
import Vector2 from require "libs.vector"
import Angle from require "libs.angle"
import Color from require "libs.color"

_color = love.graphics.setColor
love.graphics.setColor = (clr=Color(1,1,1)\zn!) ->
    if Color.mode == "Z1"
        _color clr.r, clr.g, clr.b, clr.a

    if Color.mode == "Z255"
        _color clr.r/255, clr.g/255, clr.b/255, clr.a/255
    Color.mode = "Z1"

_ellipse = love.graphics.ellipse
love.graphics.ellipse = (mode, pos, size, seg) ->
    _ellipse mode, pos.x, pos.y, size.x, size.y, seg

_arc = love.graphics.arc
love.graphics.arc = (mode, pos, radius, ang1, ang2, seg ) ->
    _arc mode, pos.x, pos.y, radius, ang1, ang2, seg

_circle = love.graphics.circle
love.graphics.circle = (mode, pos, radius) ->
    _circle mode, pos.x, pos.y, radius

_draw = love.graphics.draw
love.graphics.draw = ( drawable, pos=Vector2!, r=Angle!, size=Vector2(1, 1), offset=Vector2!, shearing=Vector2!) ->
    _draw  drawable, pos.x, pos.y, r.value, size.x, size.y, offset.x, offset.y, shearing.x, shearing.y

_idraw = love.graphics.drawInstanced
love.graphics.drawInstanced = ( mesh, instancecount, pos=Vector2!, r=Angle!, size=Vector2(1, 1), offset=Vector2!, shearing=Vector2! ) ->
    _idraw mesh, instancecount, pos.x, pos.y, r.value, size.x, size.y, offset.x, offset.y, shearing.x, shearing.y

_drawtx = love.graphics.drawLayer
love.graphics.drawLayer = (texture, layerindex, pos=Vector2!, r=Angle!, size=Vector2(1, 1), offset=Vector2!, shearing=Vector2!) ->
    _drawtx texture, layerindex, pos.x, pos.y, r.value, size.x, size.y, offset.x, offset.y, shearing.x, shearing.y
    
_drawq = love.graphics.drawq
love.graphics.drawq = (image, quad, pos=Vector2!, r=Angle!, size=Vector2(1, 1), offset=Vector2!, shearing=Vector2!) ->
    _drawq image, quad, pos.x, pos.y, r.value, size.x, size.y, offset.x, offset.y, shearing.x, shearing.y

_line = love.graphics.line
love.graphics.line = (...) ->
    points = {}
    for k, v in pairs {...}
        points[#points + 1] = v.x
        points[#points + 1] = v.y
    _line points

_poly = love.graphics.polygon
love.graphics.polygon = (mode, ...) ->
    points = {}
    for k, v in pairs {...}
        points[#points + 1] = v.x
        points[#points + 1] = v.y

    if #points >= 6
        _poly mode, points

_print = love.graphics.print
love.graphics.print = ( text, pos=Vector2!, r=Angle!, size=Vector2(1, 1), offset=Vector2!, shearing=Vector2!) ->
    _print text, pos.x, pos.y, r.value, size.x, size.y, offset.x, offset.y, shearing.x, shearing.y

_printf = love.graphics.printf
love.graphics.printf = ( text, pos, limit, align="left", r=Angle!, size=Vector2(1, 1), offset=Vector2!, shearing=Vector2!) ->
    _printf text, pos.x, pos.y, limit, align, r.value, size.x, size.y, offset.x, offset.y, shearing.x, shearing.y

    
_rect = love.graphics.rectangle
love.graphics.rectangle = (mode, pos, size, round=Vector2!, segments) ->
    _rect mode, pos.x, pos.y, size.x, size.y, round.x, round.y, segments