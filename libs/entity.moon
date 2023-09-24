import Vector2 from require "libs.math"


class Entity 
    @list = {}
    @coord      = Vector2()
    @size       = Vector2()
    @static     = false

    new: (coord = Vector2(0, 0), size = Vector2(), static = false) =>
        @coord = coord
        @size = size
        @static = static
        @@list[#@@list + 1] = self

{ :Entity }
-- Что хранит ентити: Позицию, Размер, Статичность;