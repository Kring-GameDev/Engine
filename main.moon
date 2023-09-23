import Lerp Vector2 from require "libs.math"


Camera = require "libs.camera"
Rect    = require "libs.graphics.box"

c = Rect(Vector2(256, 256), Vector2(30, 30))


love.draw = ->
    c\render()
    
    
