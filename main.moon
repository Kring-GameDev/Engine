Camera = require "camera"
w, h = love.graphics.getWidth(), love.graphics.getHeight()
Camera.s = 0.3
Camera.v = 0.1
p = {
    x: 0
    y: 0
    vx: 0
    vy: 0
}

ps = {
    x: 0
    y: 0
}

1

lock = false

tail = {0,0, 0,0}


love.draw = ->
    Camera.attach!
    love.graphics.ellipse("fill", p.x, p.y, 16, 16)
    mx, my = Camera.mouse.getPosition()
    mx = lock == false and mx or ps.x
    my = lock == false and my or ps.y
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.ellipse("fill", mx, my, 6)
    love.graphics.line(mx, my, p.x, p.y)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.line(tail)
    Camera.detach!

    

love.update = (dt) ->
    dt = dt * 2
    Camera.update()
    Camera.lookAt(lock == false and p.x or ps.x, lock == false and p.y or ps.y)
    mx, my = love.mouse.getPosition()
    mx = mx - w/2
    my = my - h/2

    Camera.setOffset(-w/2 + mx, -h/2 + my)

    p.x += p.vx * dt
    p.y += p.vy * dt

    tail[#tail + 1] = p.x
    tail[#tail + 1] = p.y

    mx, my = Camera.mouse.getPosition()

    mx = lock == false and mx or ps.x
    my = lock == false and my or ps.y

    p.vx += ((mx - p.x) * dt)
    p.vy += ((my - p.y) * dt)

    if love.mouse.isDown(1)
        lock = false

    if love.mouse.isDown(2)
        lock = true 
        ps.x = mx
        ps.y = my