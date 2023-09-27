import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"

class physBase 
    -- Список физических объектов
    @list     = {}
    @objects  = {}
    

    -- Разметка карты
    new: (StartPositionWorld = Vector2(), EndPositionWorld = Vector2(), HeightPixel = 64) => 
        
        @world = love.physics.newWorld(
            StartPositionWorld.x, StartPositionWorld.y, 
            EndPositionWorld.x, EndPositionWorld.y
        )
        
        for key, value in pairs Entity.list
            @@list[#@@list + 1] = value
        
        for key, value in pairs @@list 
            switch value.physicBox.n
                when "box"
                    @@objects[value.id]         = {}
                    @@objects[value.id].body    = love.physics.newBody(@world, value.coord.x/2, (value.coord.x-value.coord.y) / 2, value.static and "static" or "dynamic")
                    @@objects[value.id].shape   = love.physics.newRectangleShape(value.size.x, value.size.y)
                    @@objects[value.id].fixture = love.physics.newFixture(@@objects[value.id].body, @@objects[value.id].shape) 
                    value.ptr = @@objects[value.id]
        love.graphics.setBackgroundColor(0.41, 0.53, 0.97)
                   
    update: (dt = 1) =>
        @world\update(dt)