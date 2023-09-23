import Vector from require "libs.vector"

myvec = Vector(3, 5)

love.draw = ->
    love.graphics.print(myvec.xx)

