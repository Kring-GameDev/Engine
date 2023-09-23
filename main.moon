import lerp, Vector2 from require "libs.math"


Camera = require "libs.camera"
Player = require "libs.graphics.player"

user = Player(Vector2(256, 256), Vector2(30, 30))

Camera.v = 0.25



love.draw = ->
    Camera.attach!
    user\render!   
    Camera.detach!

love.update = (dt) ->
        Camera.update!
        Camera.lookAt(user\position().x / 5, user\position().y / 5)

        user\contoller!

        Camera.setOffset(user\position().x / 8000, user\position().y / 8000)
        
        

    
    
    
