import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"


class box 
    
    
    new: (Coord, Size) =>
        @ent = Entity(Coord, Size, true)
    
    render: => 
        @x, @y = @ent.ptr.body\getWorldVector(@ent.coord.x, @ent.coord.y)
        
        love.graphics.setColor(0.20, 0.20, 0.20)

        love.graphics.polygon("fill", @ent.ptr.body\getWorldPoints(@ent.ptr.shape\getPoints()))
    
    update: (dt = 1) =>
        1

box
