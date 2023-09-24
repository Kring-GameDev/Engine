import lerp from require "libs.math"

Camera = {x: 0, y: 0, tx: 0, ty: 0, ox: 0, oy: 0, s: 1, v: 0.05, mouse: {}, stack: {}}

-- Юзать в начале
Camera.attach = ->
    love.graphics.push()
    love.graphics.scale(Camera.s, Camera.s)
    love.graphics.translate(Camera.x / Camera.s, Camera.y / Camera.s)
    
-- Юзать в конце
Camera.detach = ->
    love.graphics.pop()


-- Фиксировать камеру к точке
Camera.lookAt = (x, y) ->
    Camera.tx = -x * Camera.s
    Camera.ty = -y * Camera.s

-- Получение глобальных координат курсора
Camera.mouse.getPosition = ->
    mx, my = love.mouse.getPosition()
    (mx - Camera.x) / Camera.s, (my - Camera.y) / Camera.s

Camera.update = ->
    Camera.x = lerp(Camera.x, Camera.tx + Camera.ox, Camera.v)
    Camera.y = lerp(Camera.y, Camera.ty + Camera.oy, Camera.v)

-- Смещение камеры
Camera.setOffset = (x, y) ->
    Camera.ox = -x
    Camera.oy = -y

Camera.identity = ->
    Camera.x  = 0
    Camera.y  = 0 
    Camera.tx = 0
    Camera.ty = 0 
    Camera.ox = 0
    Camera.oy = 0
    Camera.s  = 1
    Camera.v  = 0.05

Camera.push = ->
    stack[#stack + 1] = {
        x:  Camera.x
        y:  Camera.y
        tx: Camera.tx
        ty: Camera.ty
        ox: Camera.ox
        oy: Camera.oy
        s:  Camera.s
        v:  Camera.v
    }

Camera.pop = ->
    frame = stack[#stack]
    Camera.x  = frame.x
    Camera.y  = frame.y 
    Camera.tx = frame.tx
    Camera.ty = frame.ty 
    Camera.ox = frame.ox
    Camera.oy = frame.oy
    Camera.s  = frame.s
    Camera.v  = frame.v

    table.remove(stack, #stack)

Camera