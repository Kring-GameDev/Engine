import Angle, prop from require "libs.all"
import Vector2 from require "libs.vector"
cons = {}
print = (val) ->
   cons[#cons + 1] = val
   if #cons > 32
      table.remove(cons, 1)

love.draw = ->
   pos = love.mouse.getPosition!
   --love.graphics.line(Vector2(), pos)
   --love.graphics.polygon("fill", Vector2!, pos + (Vector2(256, 0)\rotate(math.rad(pos\length!))), pos + (Vector2(256, 0)\rotate(math.rad(pos\length! + 555))))

   love.graphics.rectangle("fill", pos - Vector2(32), Vector2(64, 64))
   print(pos)
   for k, v in pairs(cons)
      love.graphics.print(v\toString!, Vector2(0, k * 12))