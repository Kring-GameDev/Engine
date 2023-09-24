import lerp, Vector2 from require "libs.math"


Camera = require "libs.camera"
Player = require "libs.graphics.player"

user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.v = 0.25
Camera.setOffset(-w/2, -h/2)

l = Entity!

tail = {0, 0, 0, 0}

love.draw = ->
    Camera.attach!
    user\render!  
    love.graphics.line(tail)
    Camera.detach!
    
    for v, k in pairs(l.allEntity() or {0})
       love.graphics.print(v)

love.update = (dt) ->
        Camera.update!
        Camera.lookAt(user\position().x + 16, user\position().y + 16)
        user\contoller!

        
        -- mx, my = Camera.mouse.getPosition()
        
        -- user.ent.coord += (Vector2((mx - user.ent.coord.x) / 15, (my - user.ent.coord.y) / 15)\normalize()) * 5

        -- tail[#tail + 1] = user\position().x
        -- tail[#tail + 1] = user\position().y
        

        
        

    
    
    
