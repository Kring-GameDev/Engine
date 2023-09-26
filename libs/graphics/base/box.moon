import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"


class box 
    
    
    new: (Coord, Size) =>
        @ent = Entity(Coord, Size, false)
    
    render: (type = "fill") => 
        love.graphics.rectangle(type, @ent.coord.x, @ent.coord.y, @ent.size.x, @ent.size.y)


box
