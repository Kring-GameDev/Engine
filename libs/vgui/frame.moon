class Frame
    new: (Pos, Size) =>
        @pos  = Pos
        @size = Size
        @_localdata = {}

    update: (dt=1) =>
