lerp = (a, b, t) -> a * (1 - t) + b * t



class Vector2 
    -- Инцилизиация начальных параметров
    @x = 0
    @y = 0
    @xy = {x: @x, y: @y} 


    -- Инцилизация объекта
    new: (x = 5, y = 0) =>
        @x = x
        @y = y
        @xy = {x: x, y: y}


    -- (+) Сумма
    __add: (v) =>
       Vector2(@x + v.x, @y + v.y)

    -- (-) Разность
    __sub: (v) =>
       Vector2(@x - v.x, @y - v.y)
    
    -- (/) Частное
    __div: (v) =>
       Vector2(@x / v.x, @y / v.y)

    -- (*) Произведение
    __mul: (v) =>
       Vector2(@x * v.x, @y * v.y)

    -- (==) Равность
    __eq: (v) =>
       (@x == v.x and @y == v.y)
    
    -- (<) Сравнение меньше
    __lq: (v) =>
       (@x < v.x and @y < v.y)
    
    -- (>) сравнине больше
    __rq: (v) =>
       (@x > v.x and @y > v.y)

    -- (<<) Дистанция
    __shl: (v) =>
       math.abs( (@x - v.x) + (@y - v.y) )

    -- Получение длинны
    length: =>
        math.sqrt((@x^2) + (@y^2))


{:lerp, :Vector2}