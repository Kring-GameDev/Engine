lerp = (a, b, t) -> a * (1 - t) + b * t



class Vector2 
    -- Инцилизиация начальных параметров
    @x = 0
    @y = 0
    @xy = {x: @x, y: @y} 


    -- Инцилизация объекта
    new: (x = 0, y = 0) =>
        @x = x
        @y = y
        @xy = {x: x, y: y}


    -- (+) Сумма
    __add: (v) =>
        if type(v) == "table"
            Vector2(@x + v.x, @y + v.y)
        elseif type(v) == "number"
            Vector2(@x + v, @y + v)

    -- (-) Разность
    __sub: (v) =>
        if type(v) == "table"
            Vector2(@x - v.x, @y - v.y)
        elseif type(v) == "number"
            Vector2(@x - v, @y - v)
    
    -- (/) Частное
    __div: (v) =>
        if type(v) == "table"
            Vector2(@x / v.x, @y / v.y)
        elseif type(v) == "number"
            Vector2(@x / v, @y / v)

    -- (*) Произведение
    __mul: (v) =>
        if type(v) == "table"
            Vector2(@x * v.x, @y * v.y)
        elseif type(v) == "number"
            Vector2(@x * v, @y * v)
        
    
    -- (==) Сравнение
    __eq: (v) =>
       (@x == v.x and @y == v.y)
    
    -- (<) Сравнение меньше
    __lq: (v) =>
       (@x < v.x and @y < v.y)
    
    -- (<<) Дистанция
    __shl: (v) =>
       math.abs( (@x - v.x) + (@y - v.y) )

    -- Получение длинны
    length: =>
        math.sqrt((@x^2) + (@y^2))

    normalize: =>
        locLength = self\length()
        inv_length = (1 / locLength)
        @x *= inv_length
        @y *= inv_length
<<<<<<< HEAD
        @z *= inv_length
        self
        

=======
        self
>>>>>>> 763ec79f60c5071e1cc247388afad27205068fc9

{:lerp, :Vector2}