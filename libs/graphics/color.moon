import type from require "libs.type"

min = math.min
max = math.max
abs = math.abs

class Color
    new: (r=1, g=1, b=1) =>
        @r = r
        @g = g
        @b = b

    -- Вернуть цвет 3-мя значениями r, g, b = unpack
    unpack: =>
        @r, @g, @b

    -- Преобразовать цвет в массив из 3 чисел {r, g, b}
    toTable: =>
        {@r, @g, @b}
    
    -- Сделать копию цвета
    clone: =>
        Color(@r, @g, @b)

    -- Получить цвет в формате unsigned byte
    ub: =>
        Color(255 * @r, 255 * @g, 255 * @b)

    hsvToRgb: =>
        k1 = @b * (1 - @g)
        k2 = @b - k1
        r = min(max(3 * abs(((@r) / 180) % 2 - 1) - 1, 0), 1)
        g = min(max(3 * abs(((@r - 120) / 180) % 2 - 1) - 1, 0), 1)
        b = min(max(3 * abs(((@r + 120) / 180) % 2 - 1) - 1, 0), 1)
        Color(k1 + k2 * r, k1 + k2 * g, k1 + k2 * b)

    -- (+) Сумма
    __add: (v) =>
        if type(v) == "Color"
            Color(@r + v.r, @g + v.g, @b + v.b)
        
        if type(v) == "number"
            Color(@r + v, @g + v, @b + v)

    -- (-) Разность
    __sub: (v) =>
        if type(v) == "Color"
            Color(@r - v.r, @g - v.g, @b - v.b)
        
        if type(v) == "number"
            Color(@r - v, @g - v, @b - v)
    
    -- (/) Частное
    __div: (v) =>
        if type(v) == "Color"
            Color(@r / v.r, @g / v.g, @b / v.b)

        if type(v) == "number"
            Color(@r / v, @g / v, @b / v)

    -- (*) Произведение
    __mul: (v) =>
        if type(v) == "Color"
            Color(@r * v.r, @g * v.g, @b * v.b)

        if type(v) == "number"
            Color(@r * v, @g * v, @b * v)

orig_setcolor = love.graphics.setColor
love.graphics.setColor = (r, g, b) ->
    if type(r) == "number"
        orig_setcolor(r, g, b)
        
    if type(r) == "Color"
        orig_setcolor(r\unpack!)
        
        
{ :Color }