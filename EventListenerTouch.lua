--单点触摸事件
local function touchBegan(touch, event)
    cclog("touchBegan")
    -- 获取事件所绑定的 node
    local node = event:getCurrentTarget()
    -- 获取当前点击点所在相对按钮的位置坐标
    local locationInNode = node:convertToNodeSpace(touch:getLocation())
    local s = node:getContentSize()
    local rect = cc.rect(0, 0, s.width, s.height)
    -- 点击范围判断检测
    if cc.rectContainsPoint(rect, locationInNode) then
        cclog("sprite x = %d, y = %d ", locationInNode.x, locationInNode.y)
        cclog("sprite tag = %d", node:getTag())
        node:runAction(cc.ScaleBy:create(0.06, 1.06))
        return true
    end

    return false
end

local function touchMoved(touch, event)
    cclog("touchMoved")
    -- 获取事件所绑定的 node
    local node = event:getCurrentTarget()

    local currentPosX, currentPosY = node:getPosition()
    local diff = touch:getDelta()
    -- 移动当前按钮精灵的坐标位置
    node:setPosition(cc.p(currentPosX + diff.x, currentPosY + diff.y))
end

local function touchEnded(touch, event)
    cclog("touchEnded")
    -- 获取事件所绑定的 node
    local node = event:getCurrentTarget()

    local locationInNode = node:convertToNodeSpace(touch:getLocation())
    local s = node:getContentSize()
    local rect = cc.rect(0, 0, s.width, s.height)

    -- 点击范围判断检测
    if cc.rectContainsPoint(rect, locationInNode) then
        cclog("sprite x = %f, y = %f ", locationInNode.x, locationInNode.y)
        cclog("sprite tag = %d", node:getTag())
        node:runAction(cc.ScaleTo:create(0.06, 1.0))
    end
end

--贴图的纹理图片宽高必须是2的n次幂，128x128
local bg = cc.Sprite:create("BackgroundTile.png", cc.rect(0, 0, size.width, size.height))
--贴图的纹理参数，水平重复平铺，垂直重复平铺
bg:getTexture():setTexParameters(gl.LINEAR, gl.LINEAR, gl.REPEAT, gl.REPEAT)
bg:setPosition(cc.p(size.width / 2, size.height / 2))
layer:addChild(bg, 0)

local boxA = cc.Sprite:create("BoxA2.png")
boxA:setPosition(cc.p(size.width / 2 - 120, size.height / 2 + 120))
layer:addChild(boxA, 10, kBoxA_Tag)

local boxB = cc.Sprite:create("BoxB2.png")
boxB:setPosition(cc.p(size.width / 2, size.height / 2))
layer:addChild(boxB, 20, kBoxB_Tag)

local boxC = cc.Sprite:create("BoxC2.png")
boxC:setPosition(cc.p(size.width / 2 + 120, size.height / 2 + 160))
layer:addChild(boxC, 30, kBoxC_Tag)



local function touchMoved(touch, event)
    -- 获取事件所绑定的 node
    local node = event:getCurrentTarget()
    local currentPosX, currentPosY = node:getPosition()
    local diff = touch:getDelta()
    -- 移动当前按钮精灵的坐标位置
    node:setPos(cc.p(currentPosX + diff.x, currentPosY + diff.y))
end
-- 创建一个事件监听器 OneByOne 为单点触摸
local listener1 = cc.EventListenerTouchOneByOne:create()
-- 设置是否吞没事件，在 onTouchBegan 方法返回 true 时吞没
listener1:setSwallowTouches(true)
-- EVENT_TOUCH_BEGAN事件回调函数
listener1:registerScriptHandler(touchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
-- EVENT_TOUCH_MOVED事件回调函数
listener1:registerScriptHandler(touchMoved, cc.Handler.EVENT_TOUCH_MOVED)
-- EVENT_TOUCH_ENDED事件回调函数
listener1:registerScriptHandler(touchEnded, cc.Handler.EVENT_TOUCH_ENDED)

local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
-- 添加监听器
eventDispatcher:addEventListenerWithSceneGraphPriority(listener1, boxA)
local listener2 = listener1:clone()
eventDispatcher:addEventListenerWithSceneGraphPriority(listener2, boxB)
local listener3 = listener1:clone()
eventDispatcher:addEventListenerWithSceneGraphPriority(listener3, boxC)

eventDispatcher:removeEventListener(listener1)