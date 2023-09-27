import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"


class box 
    new: (Coord, Size) =>
        @ent = Entity(Coord, Size, true)
        
    render: => 
        love.graphics.polygon("fill", @ent.ptr.body\getWorldPoints(@ent.ptr.shape\getPoints()))
    
    update: (dt = 1) =>
        @ewqr = 2

box
