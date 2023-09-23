import Vector2 from require "libs.math"
Entity = require "libs.entity"


class box 
    
    
    new: (Coord, Size) =>
        @ent = Entity(Coord, Size, false)
    
    render: (type = "fill") => 
        love.graphics.rectangle("fill", 256, 256, 256, 256)


box