import Vector2 from require "libs.vector"
import Entity from require "libs.graphics.entity"

class physBase 
    -- Список физических объектов
    @list_physic_entities = {}

    -- Разметка карты
    new: (StartPositionWorld = Vector2(), EndPositionWorld = Vector2(), HeightPixel  = 64) => 
        love.physics.setMeter(HeightPixel)
        @world = love.physics.newWorld(StartPositionWorld\unpack!, EndPositionWorld\unpack!)
        
    -- Получение всех физических объектов и инцилизация
    initialization: =>
        for key, value in pairs Entity.list
            if value.physic 
                @@list_physic_entitys[#@@list_physic_entities + 1] = value