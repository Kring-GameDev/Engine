import Vector2 from require "libs.math"
import Entity from require "libs.graphics.entity"


class player
    new: (Coord, Size) =>
        @ent = Entity(Coord, Size, false)
        @speed = 500

    position: => 
        @ent.coord
    
    worldPosition: =>
        @ent.ptr.getWorldVector()
    
    size: =>
        @ent.size

    -- Управление игроком  
    update: (dt = 1) =>
        if love.keyboard.isDown("d")
            @ent.ptr.body\applyForce(@speed, 0)    
        else if love.keyboard.isDown("a")
            @ent.ptr.body\applyForce(-@speed, 0)
        else if love.keyboard.isDown("w")
            @ent.ptr.body\applyForce(0, -@speed)
        else if love.keyboard.isDown("s")
            @ent.ptr.body\applyForce(0, @speed)
        else 
            @ent.ptr.body\setLinearVelocity(0, 0)

    -- Отрисовка графики
    render: => 
        love.graphics.polygon("fill", @ent.ptr.body\getWorldPoints(@ent.ptr.shape\getPoints()))

player