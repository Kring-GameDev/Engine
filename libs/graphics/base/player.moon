import Vector2 from require "libs.math"
import Entity from require "libs.graphics.entity"

class Player
    
    -- Инцилизация
    new: (Coord, Size) => 
        @ent = Entity(Coord, Size, false)
    
    -- Управление персонажа
    update: (dt = 0) => 
        if (love.keyboard.isDown('w')) 
            @ent.coord.y = @ent.coord.y - 2

        if (love.keyboard.isDown('s')) 
            @ent.coord.y = @ent.coord.y + 2

        if (love.keyboard.isDown('d')) 
            @ent.coord.x = @ent.coord.x + 2

        if (love.keyboard.isDown('a')) 
            @ent.coord.x = @ent.coord.x - 2

    -- Отрисовка модели игрока
    render: (type = "fill") =>
        love.graphics.rectangle(type, @ent.coord.x, @ent.coord.y, @ent.size.x, @ent.size.y)

    position: =>  
        @ent.coord
    
    size: =>  
        @ent.size
    




{ :Player }