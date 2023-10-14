import Math from require "libs.math"
import Color from require "libs.color"
import Vector2 from require "libs.vector"
require "libs.graphics.loveinit"

list = (source={}) ->
    setmetatable source, {
        __call: (self, data) ->
            rawset self, #self + 1, data
            return self

        __add: (self, data) ->
            rawset self, #self + 1, data
            return self

        __sub: (self, addr) ->
            table.remove(self, addr)
            return self
    }


pp = {x: 0, y: 0, stack: {}}
orig_translate = love.graphics.translate
love.graphics.translate = (TranslateVector) ->
    pp.x = pp.x + TranslateVector.x
    pp.y = pp.y + TranslateVector.y
    orig_translate(TranslateVector.x, TranslateVector.y)
    
orig_push = love.graphics.push
love.graphics.push = ->
    pp.stack[#pp.stack + 1] = {x: pp.x, y: pp.y}
    orig_push()

orig_pop = love.graphics.pop
love.graphics.pop = ->
    orig_pop()
    pp.x = pp.stack[#pp.stack].x
    pp.y = pp.stack[#pp.stack].y
    table.remove(pp.stack, #pp.stack)
    
orig_cursor = love.mouse.getPosition
love.mouse.getPosition = ->
    mx, my = orig_cursor()
    Vector2((mx-pp.x), (my-pp.y))

class Frame
    new: (Pos, Size) =>
        @pos  = Pos
        @size = Size
        @_localdata = {
            mouse_hover:    false
            mouse_pressed:  false
            mouse_up:       true
            mouse_position: Vector2!
        }
        

        @onDraw = list({
            (self) ->
                love.graphics.setColor(Color(0, 0, 0))
                love.graphics.rectangle("fill", Vector2(4), @size, Vector2(4))

                love.graphics.setColor(Color(32, 32, 48, 255)\ub!)
                love.graphics.rectangle("fill", Vector2!, @size, Vector2(4))
        })

        @children = list!

        @onUpdate       = list!
        @onMouseEnter   = list!
        @onMouseLeave   = list!
        @onMouseHover   = list!
        @onMouseDown    = list!
        @onMousePressed = list!
        @onMouseUp      = list!

        
    update: (dt=1) =>
        MPos = @_localdata.mouse_position + @pos
        ab = Math.aabb(MPos, @pos, @size)

        for k, v in pairs @onUpdate
            v(self, dt)

        if ab
            for k, v in pairs @onMouseHover
                v(self, dt)

            if love.mouse.isDown(1)
                for k, v in pairs @onMouseDown
                    v(self, dt)

                if @_localdata.mouse_pressed == false
                    for k, v in pairs @onMousePressed
                        v(self, dt)
                    @_localdata.mouse_pressed = true
                    @_localdata.mouse_up = false
            else
                @_localdata.mouse_pressed = false
                if @_localdata.mouse_up == false
                    for k, v in pairs @onMouseUp
                        v(self, dt)
                    @_localdata.mouse_up = true

        if ab and @_localdata.mouse_hover == false
            for k, v in pairs @onMouseEnter
                v(self, dt)
            @_localdata.mouse_hover = true

        if not ab and @_localdata.mouse_hover == true
            for k, v in pairs @onMouseLeave
                v(self, dt)
            @_localdata.mouse_hover = false


        for k, v in pairs @children
            v\update(v, dt)

    draw: =>
        love.graphics.push()
        love.graphics.translate(@pos)
        for k, v in pairs @onDraw
            v(@)
        
        for k, v in pairs @children
            v\draw(v, dt)
        @_localdata.mouse_position = love.mouse.getPosition!
        love.graphics.pop()

class Label extends Frame
    @_toString = (tbl) ->
        ret = ""
        for k, v in pairs tbl
            if type(v) == "string"
                ret ..= v
        ret

    new: (Pos, Size, Text) =>
        super(Pos, Size)
        @_localdata.font_width  = love.graphics.getFont()\getWidth(Label._toString(Text))
        @_localdata.font_height = love.graphics.getFont()\getHeight(Label._toString(Text))
        @_localdata.text_obj   = love.graphics.newText( love.graphics.getFont(), Text )
        @_localdata.clr = Color(40, 40, 55, 255)
        @_localdata.clr_mul = 1
        @onDraw -= 1
        @onDraw += (self) ->
            love.graphics.setColor(Color(0, 0, 0))
            love.graphics.rectangle("fill", Vector2(4), @size, Vector2(4))
            love.graphics.setColor((@_localdata.clr\ub!) * @_localdata.clr_mul)
            love.graphics.rectangle("fill", Vector2!, @size, Vector2(4))

            love.graphics.setColor(Color(1, 1, 1))
            love.graphics.draw(@getText!, Vector2((-@_localdata.font_width / 2) + @size.x/2, (-@_localdata.font_height / 2) + @size.y/2))

    getText: =>
        @_localdata.text_obj

    getTextString: =>
        @_localdata.text

{ :Frame, :Label }