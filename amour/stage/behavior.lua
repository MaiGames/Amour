local class = require "lib.lua-oop"

local Behavior = class "Behavior"

function Behavior:constructor()

    self.v.firstUpdate = true

end

function Behavior:init() end

function Behavior:_update()

    if self.v.firstUpdate then
        self.v.firstUpdate = false
        self:firstUpdate()
    end

    self:update()

end

function Behavior:firstUpdate() end

function Behavior:update() end

-- JUST MORE SHORCUTS
function Behavior:getCurrentStage()
    return parentObj.parentStage
end

function Behavior:changeStage(stage)
    self:getCurrentStage():changeStage(stage)
end

function Behavior:getObject(className)
    return self:getCurrentStage():getObject(className)
end

function Behavior:getObjects(className)
    return self:getCurrentStage():getObjects(className)
end

function Behavior:getAllObjects()
    return self:getCurrentStage():getAllObjects()
end

function Behavior:setTimeout(func, timeSecs)
    self:getCurrentStage():setTimeout(func, timeSecss)
end

function Behavior:setStaticTimeout(func, timeSecs)
    self:getCurrentStage():setStaticTimeout(func, timeSecs)
end

function Behavior:setInterval(func, timeSecs)
    self:getCurrentStage():setInterval(func, timeSecs)
end

function Behavior:setStaticInterval(func, timeSecs)
    self:getCurrentStage():setStaticInterval(func, timeSecs)
end

function Behavior:destroyTimer(timerID)
    self:getCurrentStage():destroyTimer(timerID)
end

return Behavior