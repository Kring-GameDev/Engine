import Vector2 from require "libs.math"


class Entity 
    @list       = {}    
    @coord      = Vector2()
    @size       = Vector2()
    @static     = false

    new: (coord = Vector2(), size = Vector2(), static = false) =>
        @@list[#@@list + 1] = self
        @coord = coord
        @size = size
        @static = static
        


Entity
-- Что хранит ентити: Позицию, Размер, Статичность;