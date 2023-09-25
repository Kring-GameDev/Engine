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