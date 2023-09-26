import Vector2 from require "libs.math"




class physBase 

    -- Разметка карты
    new: (StartPositionWorld = Vector2(), EndPositionWorld = Vector2(), HeightPixel  = 64) => 
        love.physics.setMeter(HeightPixel)
        @world = love.physics.newWorld(StartPositionWorld\unpack!, EndPositionWorld\unpack!)

    -- Получение всех физических объектов