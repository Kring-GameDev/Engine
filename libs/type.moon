orig_type = type
type = (t) ->
    if orig_type(t) == "table"
        if t.__class ~= nil
            return t.__class.__name
    orig_type(t)

{ :type }