import Vector2 from require "libs.math"
import Entity from require "libs.graphics.entity"


class player
    new: (Coord, Size) =>
        @ent = Entity(Coord, Size, false)

        @speed = 500
        @power = 15

    position: => 
        @ent.coord
    
    size: =>
        @ent.size

    -- Управление игроком  
    update: (dt = 1) =>
        if love.keyboard.isDown("d")
            @ent.ptr.body\applyForce((@speed * @ent.ptr.body\getMass() * @power), 0)    
        if love.keyboard.isDown("a")
            @ent.ptr.body\applyForce(-(@speed * @ent.ptr.body\getMass() * @power), 0)
        if love.keyboard.isDown("w")
            @ent.ptr.body\applyForce(0, -(@speed * @ent.ptr.body\getMass() * @power))
        if love.keyboard.isDown("s")
            @ent.ptr.body\applyForce(0, (@speed * @ent.ptr.body\getMass() * @power))
         
        @ent.ptr.body\setLinearVelocity(0, 0)

    -- Отрисовка графики
    render: => 
        love.graphics.polygon("fill", @ent.ptr.body\getWorldPoints(@ent.ptr.shape\getPoints()))

player