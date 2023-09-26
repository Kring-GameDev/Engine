import Vector2 from require "libs.vector"
import Color from require "libs.graphics.color"
import type from require "libs.type"

class Math
    -- Сглаживание
    @lerp = (a, b, t) ->
        if type(a) == "Color" and type(b) == "Color"
            return Color(@.lerp(a.r, b.r, t), @.lerp(a.g, b.g, t), @.lerp(a.b, b.b, t), @.lerp(a.a, b.a, t))

        if type(a) == "Vector2" and type(b) == "Vector2"
            return Vector2(@.lerp(a.x, b.x, t), @.lerp(a.y, b.y, t))

        if type(a) == "number" and type(b) == "number"
            return a * (1 - t) + b * t
        
    -- Пересечение точки с прямоугольником
    @aabb = (TargetVector, PositionVector, SizeVector) ->
        PositionVector = PositionVector + SizeVector
        return PositionVector.x > TargetVector.x and PositionVector.x < TargetVector.x + SizeVector.x and PositionVector.y > TargetVector.y and PositionVector.y < TargetVector.y + SizeVector.y

    -- Здать минимальное и максимальное число
    @clamp = (min, val, max) ->
        return val > max and max or val < min and min or val

    
    @PointOnSegment = (TargetVector, FirstVector, SecondVector) ->
        cx, cy = TargetVector.x - FirstVector.x, TargetVector.y - FirstVector.y
        dx, dy = SecondVector.x - FirstVector.x, SecondVector.y - FirstVector.y
        d = dx * dx + dy * dy
        if d == 0 then return FirstVector.x, FirstVector.y
        u = (cx * dx + cy * dy) / d
        if u < 0 then u = 0
        else if u > 1 then u = 1
        return Vector2(FirstVector.x + u * dx, FirstVector.y + u * dy)

    -- Направление угла
    @direction = (t) ->
        Vector2(math.cos(t), -math.sin(t))

{ :Math }