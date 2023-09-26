import Vector2 from require "libs.vector"
import type from require "libs.type"



class Math
    @lerp = (a, b, t) ->
        if type(a) == "Vector2" and type(b) == "Vector2"
            return Vector2(a.x * (1 - t) + b.x * t, a.y * (1 - t) + b.y * t)
            --return Vector2!

        if type(a) == "number" and type(b) == "number"
            a * (1 - t) + b * t
        
    @aabb = (px, py, x, y, w, h) ->
        px > x and px < x + w and py > y and py < y + h

    @clamp = (min, val, max) ->
        val > max and max or val < min and min or val

    @PointOnSegment = (TargetVector, FirstVector, SecondVector) ->
        cx, cy = TargetVector.x - FirstVector.x, TargetVector.y - FirstVector.y
        dx, dy = SecondVector.x - FirstVector.x, SecondVector.y - FirstVector.y
        d = dx * dx + dy * dy
        if d == 0 then return FirstVector.x, FirstVector.y
        u = (cx * dx + cy * dy) / d
        if u < 0 then u = 0
        else if u > 1 then u = 1
        Vector2(FirstVector.x + u * dx, FirstVector.y + u * dy)

{ :Math }