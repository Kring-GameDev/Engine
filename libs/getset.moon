mt =
    __type: "list"
    __index: (self, index) ->
            if index == "prop" then return rawget(self, "__properties")
            tt = rawget(self, "__properties")[index]
            return tt.__get(tt)

    __newindex: (self, index, value) ->
        tt = rawget(self, "__properties")[index]
        tt.__set(tt, value)

prop = ->
    t = __properties: {}
    setmetatable(t, mt)
    t

{ :prop }