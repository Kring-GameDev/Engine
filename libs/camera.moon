import lerp from require "libs.math"

Camera = {x: 0, y: 0, tx: 0, ty: 0, ox: 0, oy: 0, s: 1, v: 0.05, mouse: {}}


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

Camera