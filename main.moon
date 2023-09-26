import Vector2, pointOnSegment from require "libs.math"
import Entity from require "libs.graphics.entity"
import Event, EventList from require "libs.util.event"
import type from require "libs.type"
Event.init()
Camera = require "libs.graphics.camera"
Player = require "libs.graphics.base.player"

user = Player(Vector2(256, 256), Vector2(30, 30))

w, h = love.graphics.getWidth(), love.graphics.getHeight()

Camera.Velocity = 1
Camera\setOffset(Vector2(-w/2, -h/2))

ang = 0
av, bv = Vector2(32, 64), Vector2(256, 0)


sort_insertion_with_delay = (arr, delay) ->
    for i = 2, #arr
        key = arr[i]
        j = i - 1
  
        while j > 0 and arr[j] > key
            arr[j + 1] = arr[j]
            j -= 1
  
            -- Приостановка выполнения корутины на заданное время
            coroutine.yield(delay)
  
        arr[j + 1] = key
  
    return arr

arr = [math.random(0, 1000) for i = 1, 1000]

delay = 1-- Задержка в секундах

-- Создание корутины
sort_coroutine = coroutine.create(sort_insertion_with_delay)
-- Запуск корутины с передачей списка и времени задержки
coroutine.resume(sort_coroutine, arr, delay)
    

Event.on_event("draw", ->
    mx, my = Camera\getMousePosition()\unpack!
    love.graphics.print(love.timer.getFPS!)
    vlist = {
        Vector2(-35, -15)\rotate(ang)
        Vector2(15, -15)\rotate(ang)
        Vector2(15, 15)\rotate(ang)
        Vector2(-15, 15)\rotate(ang)
    }

    vertex_list = {}
    for k, v in pairs vlist
        vertex_list[#vertex_list + 1] = v.x
        vertex_list[#vertex_list + 1] = v.y
        
    Camera\attach!
    user\render!


    for k, v in pairs arr
        love.graphics.line(0, k * 0.5, (v / 1000) * 500, k * 0.5)
    Camera\detach!
)
t = 0
Event.on_event("update", (dt) ->
    Camera\update!
    Camera\lookAt(user\position())
    ang += dt
    user\contoller!
    for i = 1, 500
        if coroutine.status(sort_coroutine) != "dead"
            coroutine.resume(sort_coroutine)


)

love.conf = (t) ->
    t.window.width = 124
    t.window.height = 768