local class = require "lib.lua-oop"
local Vector2 = require ("amour.util.math.vector").Vector2

require "amour.util.color"
require "amour.stage.object"
require "amour.core"

local Basic = {}

-- BASIC SHAPES

local RectangleObj = class("Obj-Rect", StageObject)
Basic.RectangleObj = RectangleObj

function RectangleObj:constructor(position, size, color)

    StageObject.constructor(self, position, size, color)

end

function RectangleObj:draw()

    if not self.visible then
        return
    end

    local r, g, b, a = self.color:getDecimal()

    love.graphics.setColor(r, g, b, a)
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.size.x, self.size.y)

end

StaticSpriteObj = class("Obj-StaticSprite", StageObject)
Basic.StaticSpriteObj = StaticSpriteObj

function StaticSpriteObj:constructor(position, size, color, image)

    StageObject.constructor(self, position, size, color)

    self.image = image

end

function StaticSpriteObj:init()

    if type(self.image) == "string" then
        self.image = love.graphics.newImage(self.image)
    end

end

function StaticSpriteObj:draw()

    local r, g, b, a = self.color:getDecimal()

    local scaleX, scaleY = getImageScaleForNewDimensions(self.image, self.size.x, self.size.y)

    love.graphics.setColor(r, g, b, a)
    love.graphics.draw(self.image, self.position.x, self.position.y, nil, scaleX, scaleY)

end

function StaticSpriteObj:setOriginalDimensions()

    local w, h = self.image:getDimensions()
    self.size:set(w, h)

end

-- MISCELANEOUS

FpsObj = class("Obj-Fps", StageObject)
Basic.FpsObj = FpsObj

function FpsObj:constructor(position, color)

    StageObject.constructor(self, position, nil, color)

end

function FpsObj:draw()

    love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
    love.graphics.print(tostring(love.timer.getFPS()), self.position.x, self.position.y)

end

MouseObj = class("Obj-Mouse", StageObject)
Basic.MouseObj = MouseObj

function MouseObj:constructor()

    StageObject.constructor(self, nil, Vector2:new(6, 6), nil)

end

function MouseObj:update()
    self.position:set(love.mouse.getX(), love.mouse.getY())
end

TextObj = class("Obj-Text", StageObject)
Basic.TextObj = TextObj

function TextObj:constructor(position, color, text, fontSize)

    StageObject.constructor(self, position, nil, color)

    if not fontSize then
        fontSize = 12
    end

    if not text then
        text = ""
    end

    self.text = text
    self.fontSize = fontSize

end

function TextObj:draw()

    love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
    love.graphics.setNewFont(self.fontSize)
    love.graphics.print(tostring(self.text), self.position.x, self.position.y)

end

return Basic
