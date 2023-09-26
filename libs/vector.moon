class Vector2
    -- Конструктор объекта
    new: (x = 0, y = x) =>
        @x = x
        @y = y
    
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
    
    -- (==) Равенство
    __eq: (v) =>
       (@x == v.x and @y == v.y)
    
    -- (</>) меньше/больше
    __lq: (v) =>
       (@x < v.x and @y < v.y)

    -- (-v) Инверсия вектора
    __unm: (v) =>
        Vector2(-@x, -@y)

    -- Преобразование в строку
    __tostring: =>
        @x .. "," .. @y

    -- Метод преобразования в строку
    toString: =>
        @x .. "," .. @y

    -- Длинна вектора
    length: =>
        math.sqrt((@x^2) + (@y^2))
    
    -- Расстояние между векторами
    distance: (v) =>
        math.sqrt((v.x - self.x)^2 + (v.y - self.y)^2)

    -- Поворот вектора на угол 'r'
    rotate: (r) =>
        new_x = @x*math.cos(r)-@y*math.sin(r)
        new_y = @x*math.sin(r)+@y*math.cos(r)
        Vector2(new_x, new_y)
    
    -- Вытащить из вектора 'x', 'y' координаты
    unpack: =>
        @x, @y

    -- Преобразовать вектор в массив из 2 чисел {x, y}
    toTable: =>
        {@x, @y}

    -- Клонировать вектор без изменений
    clone: =>
        Vector2(@x, @y)
        
    -- Нормализация вектора
    normalize: =>
        new_vec = Vector2(self.x, self.y)
        locLength = new_vec\length()
        inv_length = (1 / locLength)
        new_vec.x *= inv_length
        new_vec.y *= inv_length
        new_vec

    -- Скалярное произведение
    dot: (v=Vector2!) =>
        (@x* v.x) + (@y * v.y)
    
    
    --- Calculate the angle between two points
    angle: (v=Vector2!) =>
        p = Vector2(v.x-@x, v.y-@y)
        math.atan2(p.y, p.x)
    

{ :Vector2 }