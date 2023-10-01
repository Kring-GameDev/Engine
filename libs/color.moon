import type from require "libs.type"

min = math.min
max = math.max
abs = math.abs


class Color
    @Random = (r1, r2, g1, g2, b1, b2, a1=1, a2=1) ->
        Color(math.random(r1, r2 * 255) / 255, math.random(g1, g2 * 255) / 255, math.random(b1, b2 * 255) / 255, math.random(a1, a2 * 255) / 255)
    
    new: (r=1, g=1, b=1, a=1) =>
        @r = r
        @g = g
        @b = b
        @a = a
        
    -- Вернуть цвет 3-мя значениями r, g, b = unpack
    unpack: =>
        @r, @g, @b, @a

    -- Преобразовать цвет в массив из 3 чисел {r, g, b}
    toTable: =>
        {@r, @g, @b, @a}
    
    -- Сделать копию цвета
    clone: =>
        Color(@r, @g, @b, @a)

    -- Получить цвет в формате unsigned byte
    ub: =>
        Color(@r / 255, @g / 255, @b / 255, @a / 255)

    zn: =>
        Color(@r * 255, @g * 255, @b * 255, @a * 255)

    hexToRgb: =>
        rb = tonumber(string.sub(@r, 2, 3), 16) / 255
        gb = tonumber(string.sub(@r, 4, 5), 16) / 255
        bb = tonumber(string.sub(@r, 6, 7), 16) / 255
        ab = tonumber(string.sub(@r, 8, 9), 16) or nil
        Color( rb, gb, bb, ab )

    hsvToRgb: =>
        k1 = @b * (1 - @g)
        k2 = @b - k1
        r = min(max(3 * abs(((@r) / 180) % 2 - 1) - 1, 0), 1)
        g = min(max(3 * abs(((@r - 120) / 180) % 2 - 1) - 1, 0), 1)
        b = min(max(3 * abs(((@r + 120) / 180) % 2 - 1) - 1, 0), 1)
        Color(k1 + k2 * r, k1 + k2 * g, k1 + k2 * b, @a)

    -- (+) Сумма
    __add: (v) =>
        if type(v) == "Color"
            Color(@r + v.r, @g + v.g, @b + v.b, @a + v.a)
        
        if type(v) == "number"
            Color(@r + v, @g + v, @b + v, @a + v)

    -- (-) Разность
    __sub: (v) =>
        if type(v) == "Color"
            Color(@r - v.r, @g - v.g, @b - v.b, @a - v.a)
        
        if type(v) == "number"
            Color(@r - v, @g - v, @b - v, @a - v)
    
    -- (/) Частное
    __div: (v) =>
        if type(v) == "Color"
            Color(@r / v.r, @g / v.g, @b / v.b, @a / v.a )

        if type(v) == "number"
            Color(@r / v, @g / v, @b / v, @a / v)

    -- (*) Произведение
    __mul: (v) =>
        if type(v) == "Color"
            Color(@r * v.r, @g * v.g, @b * v.b, @a * v.a)

        if type(v) == "number"
            Color(@r * v, @g * v, @b * v, @a * v)

    setR: (r) =>
        Color(r, @g, @b, @a)

    setG: (g) =>
        Color(@r, g, @b, @a)

    setB: (b) =>
        Color(@r, @g, b, @a)

    setA: (a) =>
        Color(@r, @g, @b, a)

orig_setcolor = love.graphics.setColor
love.graphics.setColor = (r, g, b, a=1) ->
    if type(r) == "number"
        orig_setcolor(r, g, b, a)
        return
        
    if type(r) == "Color"
        orig_setcolor(r\unpack!)
        return
        
        
{ :Color }