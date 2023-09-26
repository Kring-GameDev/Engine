import Math from require "libs.math"
import Vector2 from require "libs.vector"
import Frame from require "libs.vgui"
Camera = class CameraClass
    @PositionVector = Vector2! -- Позиция камеры
    @TargetVector   = Vector2! -- Цель камеры
    @OffsetVector   = Vector2! -- Смещение камеры от цели
    @Scale          = 1        -- Масштаб камеры
    @Velocity       = 1        -- Скорость сближения до цели+смещения
    @Stack          = {}       -- Стек для сохранения настроек камеры

    -- Начало блока камеры
    attach: =>
        love.graphics.push()
        love.graphics.scale(@Scale, @Scale)
        love.graphics.translate(Vector2(@PositionVector.x / @Scale, @PositionVector.y / @Scale))

    -- Конец блока камеры
    detach: =>
        love.graphics.pop()

    -- Назначить цель камеры
    lookAt: (TargetVector) =>
        @TargetVector = -TargetVector * @Scale

    -- Обработка камеры
    update: (dt=1) =>
        @PositionVector = Math.lerp(@PositionVector, @TargetVector + @OffsetVector, Math.clamp(0, @Velocity * dt, 1))

    -- Смещение камеры
    setOffset: (OffsetVector) =>
        @OffsetVector = -OffsetVector

    -- Стандартные настройки камеры
    identity: =>
        @PositionVector.x  = 0
        @PositionVector.y  = 0 
        @TargetVector.x = 0
        @TargetVector.y = 0 
        @OffsetVector.x = 0
        @OffsetVector.y = 0
        @Scale  = 1
        @Velocity  = 1

    -- Сохранение настроек камеры в стек
    push: =>
        @Stack[#@Stack + 1] = {
            x:  @PositionVector.x
            y:  @PositionVector.y
            tx: @TargetVector.x
            ty: @TargetVector.y
            ox: @OffsetVector.x
            oy: @OffsetVector.y
            s:  @Scale
            v:  @Velocity
        }

    -- Dpznm настройки камеры из стека и применить их
    pop: =>
        if #@Stack == 0 then return
        frame = @Stack[#@Stack]
        @PositionVector.x  = frame.x
        @PositionVector.y  = frame.y 
        @TargetVector.x = frame.tx
        @TargetVector.y = frame.ty 
        @OffsetVector.x = frame.ox
        @OffsetVector.y = frame.oy
        @Scale  = frame.s
        @Velocity  = frame.v

        table.remove(@Stack, #@Stack)


Camera