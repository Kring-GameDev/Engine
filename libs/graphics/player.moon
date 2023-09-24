import Vector2 from require "libs.math"
Entity = require "libs.entity"


class player

    @shift = 0

    new: (Coord, Size) =>
        @shift = 0
        @velocity = Vector2! 
    
        @ent = Entity(Coord, Size, false)

    position: => 
        @ent.coord
    
    size: =>
        @ent.size

    -- Управление игроком  
    contoller: =>
        @ent.coord = @ent.coord + @velocity


        if (love.keyboard.isDown("escape"))
            exit()

    -- Отрисовка графики
    render: (type = "fill") => 
        love.graphics.rectangle(type, @ent.coord.x, @ent.coord.y, @ent.size.x, @ent.size.y)

player