import Vector2 from require "libs.vector"
each = (t, f) ->
    f(t)
    for k, v in pairs t
        each(v)

class QTree
    new: =>


{ :QTree }