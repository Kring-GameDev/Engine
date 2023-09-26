import Vector2 from require "libs.vector"

class Entity 
    @list = {}

    new: (coord = Vector2(0, 0), size = Vector2(), physic = false) =>
        @coord          = coord
        @size           = size
        @physic         = physic
        
        @@list[#@@list + 1] = self




{ :Entity }
-- Что хранит ентити: Позицию, Размер, Статичность;