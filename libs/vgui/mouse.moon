list = (source) ->
    t = source or {}
    setmetatable t,
        __call: (self, data) ->
            rawset self, #self + 1, data

        __add: (self, data) ->
            rawset self, #self + 1, data
            self
    t