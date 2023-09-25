import lerp, Vector2 from require "libs.math"

Camera = {PositionVector: Vector2!, TargetVector: Vector2!, OffsetVector: Vector2!, Scale: 1, Velocity: 0.05, mouse: {}, stack: {}}

-- Юзать в начале
Camera.attach = ->
    love.graphics.push()
    love.graphics.scale(Camera.Scale, Camera.Scale)
    love.graphics.translate(Camera.PositionVector.x / Camera.Scale, Camera.PositionVector.y / Camera.Scale)
    
-- Юзать в конце
Camera.detach = ->
    love.graphics.pop()


-- Фиксировать камеру к точке
Camera.lookAt = (x, y) ->
    Camera.TargetVector.x = -x * Camera.Scale
    Camera.TargetVector.y = -y * Camera.Scale

-- Получение глобальных координат курсора
Camera.mouse.getPosition = ->
    mx, my = love.mouse.getPosition()
    (mx - Camera.PositionVector.x) / Camera.Scale, (my - Camera.PositionVector.y) / Camera.Scale

Camera.update = ->
    Camera.PositionVector.x = lerp(Camera.PositionVector.x, Camera.TargetVector.x + Camera.OffsetVector.x, Camera.Velocity)
    Camera.PositionVector.y = lerp(Camera.PositionVector.y, Camera.TargetVector.y + Camera.OffsetVector.y, Camera.Velocity)

-- Смещение камеры
Camera.setOffset = (x, y) ->
    Camera.OffsetVector.x = -x
    Camera.OffsetVector.y = -y

Camera.identity = ->
    Camera.PositionVector.x  = 0
    Camera.PositionVector.y  = 0 
    Camera.TargetVector.x = 0
    Camera.TargetVector.y = 0 
    Camera.OffsetVector.x = 0
    Camera.OffsetVector.y = 0
    Camera.Scalecale  = 1
    Camera.Velocity  = 0.05

Camera.push = ->
    stack[#stack + 1] = {
        x:  Camera.PositionVector.x
        y:  Camera.PositionVector.y
        tx: Camera.TargetVector.x
        ty: Camera.TargetVector.y
        ox: Camera.OffsetVector.x
        oy: Camera.OffsetVector.y
        s:  Camera.Scale
        v:  Camera.Velocity
    }

Camera.pop = ->
    frame = stack[#stack]
    Camera.PositionVector.x  = frame.x
    Camera.PositionVector.y  = frame.y 
    Camera.TargetVector.x = frame.tx
    Camera.TargetVector.y = frame.ty 
    Camera.OffsetVector.x = frame.ox
    Camera.OffsetVector.y = frame.oy
    Camera.Scalecale  = frame.s
    Camera.Velocity  = frame.v

    table.remove(stack, #stack)

Camera