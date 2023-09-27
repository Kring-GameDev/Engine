import Vector2 from require "libs.vector"

class Entity 
    @list = {}
    @id = 0

    new: (coord = Vector2(0, 0), size = Vector2(), static = false, physicBox = {n: "box", v: {}, r: 0}) =>
        @coord          = coord
        @size           = size
        @physicBox      = physicBox
        @static         = static

        @@list[#@@list + 1] = self
        @id = #@@list



{ :Entity }
-- Что хранит ентити: Позицию, Размер, Статичность;