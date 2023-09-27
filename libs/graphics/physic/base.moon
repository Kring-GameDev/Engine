import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"

class physBase 
    -- Список физических объектов
    @list     = {}
    @objects  = {}

    
    new: (StartPositionWorld = Vector2(), EndPositionWorld = Vector2(), HeightPixel = 1) => 

        -- Разметка карты
        love.physics.setMeter(HeightPixel)
        @world = love.physics.newWorld(
            StartPositionWorld.x, StartPositionWorld.y, 
            EndPositionWorld.x, EndPositionWorld.y
        )
        
        -- Создание списка с объектами
        for key, value in pairs Entity.list
            @@list[#@@list + 1] = value
        
        -- Создание физических моделей
        for key, value in pairs @@list 
            switch value.physicBox.n
                when "box"
                    @@objects[value.id]         = {}
                    @@objects[value.id].body    = love.physics.newBody(@world, value.coord.x/2, (value.coord.x-value.coord.y) / 2, value.static and "static" or "dynamic")
                    @@objects[value.id].shape   = love.physics.newRectangleShape(value.size.x, value.size.y)
                    @@objects[value.id].fixture = love.physics.newFixture(@@objects[value.id].body, @@objects[value.id].shape) 
                    value.ptr = @@objects[value.id]
                
                when "poly"
                    @@objects[value.id]         = {}
                    @@objects[value.id].body    = love.physics.newBody(@world, value.coord.x/2, (value.coord.x-value.coord.y) / 2, value.static and "static" or "dynamic")
                    @@objects[value.id].shape   = love.physics.newPolygonShape(value.physicBox.v)
                    @@objects[value.id].fixture = love.physics.newFixture(@@objects[value.id].body, @@objects[value.id].shape) 
                    value.ptr = @@objects[value.id]
                
                when "circle"
                    @@objects[value.id]         = {}
                    @@objects[value.id].body    = love.physics.newBody(@world, value.coord.x/2, (value.coord.x-value.coord.y) / 2, value.static and "static" or "dynamic")
                    @@objects[value.id].shape   = love.physics.newCircleShape(value.physBox.r)
                    @@objects[value.id].fixture = love.physics.newFixture(@@objects[value.id].body, @@objects[value.id].shape) 
                    value.ptr = @@objects[value.id]
                else
                    error("[physic error] " .. value.physBox.n .. " class not found!")
    update: (dt = 1) =>
        @world\update(dt)