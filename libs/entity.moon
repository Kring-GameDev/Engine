


class Entity 
    
    @coord      = {x: 0, y: 0}
    @size       = {x: 0, y: 0}
    @static     = false


    new: (coord = {x: 0, y: 0}, size = {x: 0, y: 0}, static = false) => 
        assert type(static) != "bool" 

        -- Инцилизация начальный параметров
        @coord = coord
        @size = size
        @static = static
    

Entity
-- Что хранит ентити: Позицию, Размер, Статичность;