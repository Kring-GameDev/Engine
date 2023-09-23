import Vector2 from require "libs.math"


class Entity 
    
    @coord      = Vector2()
    @size       = Vector2()
    @static     = false

    new: (coord = Vector2(5, 5), size = Vector2(), static = false) =>
        @coord = coord
        @size = size
        @static = static


Entity
-- Что хранит ентити: Позицию, Размер, Статичность;