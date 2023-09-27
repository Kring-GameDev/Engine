import Vector2 from require "libs.math"
import Entity from require "libs.graphics.entity"


class player
    new: (Coord, Size) =>
        @ent = Entity(Coord, Size, false)
        
    position: => 
        @ent.coord
    
    size: =>
        @ent.size

    -- Управление игроком  
    update: (dt = 1) =>
        if (love.keyboard.isDown('w'))
            @ent.coord.y = @ent.coord.y - 20
        if (love.keyboard.isDown('s'))
            @ent.coord.y = @ent.coord.y + 20
        if (love.keyboard.isDown('d'))
            @ent.coord.x = @ent.coord.x + 20
        if (love.keyboard.isDown('a'))
            @ent.coord.x = @ent.coord.x - 20

    -- Отрисовка графики
    render: => 
        love.graphics.rectangle("fill", @ent.coord.x, @ent.coord.y, @ent.size.x, @ent.size.y)

player