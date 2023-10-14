import Vector2 from require "libs.vector"
import type from require "libs.type"




class Angle
    new: (@value=0) =>

    toVector2: =>
        Vector2(math.sin(@value), math.cos(@value))

    __add: (v) =>
        if type(v) == "Angle"
            Angle(@value + v.value)
        elseif type(v) == "number"
            Angle(@value + v)

    __sub: (v) =>
        if type(v) == "Angle"
            Angle(@value - v.value)
        elseif type(v) == "number"
            Angle(@value - v)

{ :Angle }