lerp = (a, b, t) -> a * (1 - t) + b * t

aabb = (px, py, x, y, w, h) ->
    px > x and px < x + w and py > y and py < y + h

clamp = (min, val, max) ->
    val > max and max or val < min and min or val
--px, py, x1, y1, x2, y2
pointOnSegment = (TargetVector, FirstVector, SecondVector) ->
    cx, cy = TargetVector.x - FirstVector.x, TargetVector.y - FirstVector.y
    dx, dy = SecondVector.x - FirstVector.x, SecondVector.y - FirstVector.y
    d = dx * dx + dy * dy
    if d == 0 then return FirstVector.x, FirstVector.y
    u = (cx * dx + cy * dy) / d
    if u < 0 then u = 0
    else if u > 1 then u = 1
    FirstVector.x + u * dx, FirstVector.y + u * dy


class Vector2
    -- Конструктор объекта
    new: (x = 0, y = 0) =>
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
        return Vector2(new_x, new_y)
    
    -- Вытащить из вектора 'x', 'y' координаты
    unpack: =>
        @x, @y

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

{:lerp, :Vector2, :aabb, :clamp, :pointOnSegment}