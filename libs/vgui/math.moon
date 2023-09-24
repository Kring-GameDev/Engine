aabb = (px, py, x, y, w, h) ->
    px > x and px < x + w and py > y and py < y + h

clamp = (min, val, max) ->
    val > max and max or val < min and min or val

lerp = (a, b, t) ->
    a * (1 - t) + b * t

pointOnSegment = (px, py, x1, y1, x2, y2) ->
    cx, cy = px - x1, py - y1
    dx, dy = x2 - x1, y2 - y1
    d = dx * dx + dy * dy
    if d == 0 then return x1, y1
    u = (cx * dx + cy * dy) / d
    if u < 0 then u = 0
    else if u > 1 then u = 1
    x1 + u * dx, y1 + u * dy

distance = (x1, y1, x2, y2) ->
    dx = x1 - x2
    dy = y1 - y2
    math.sqrt(dx * dx + dy * dy)

list = (source) ->
    t = source or {}
    setmetatable t,
        __call: (self, data) ->
            rawset self, #self + 1, data

        __add: (self, data) ->
            rawset self, #self + 1, data
            self
    t

pp = {x: 0, y: 0, stack: {}}
orig_translate = love.graphics.translate
love.graphics.translate = (x, y) ->
    pp.x += x
    pp.y += y
    orig_translate(x, y)

orig_push = love.graphics.push
love.graphics.push = () ->
    pp.stack[#pp.stack + 1] = {x: pp.x, y: pp.y}
    orig_push()

orig_pop = love.graphics.pop
love.graphics.pop = () ->
    orig_pop()
    pp.x = pp.stack[#pp.stack].x
    pp.y = pp.stack[#pp.stack].y
    table.remove(pp.stack, #pp.stack)

orig_cursor = love.mouse.getPosition
love.mouse.getPosition = () ->
    mx, my = orig_cursor()
    (mx - pp.x), (my - pp.y)

love.mouse.getGlobalPosition = orig_cursor

{ :aabb, :clamp, :lerp}