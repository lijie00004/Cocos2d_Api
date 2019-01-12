
local size = cc.Director:getInstance():getWinSize()
--创建物理世界
local GameScene = class("GameScene", function()
    local scene = cc.Scene:createWithPhysics()
    scene:getPhysicsWorld():setDebugDrawMask(cc.PhysicsWorld.DEBUGDRAW_ALL)--绘制调试遮罩
    return scene
end)

function GameScene.create()
    local scene = GameScene.new()
    scene:addChild(scene:createLayer())
    return scene
end

function GameScene:ctor()
end

function GameScene:addNewSpriteAtPosition(pos)
    local sp = cc.Sprite:create("Ball.png")
    sp:setTag(1)    
    local body = cc.PhysicsBody:createCircle(sp:getContentSize().width / 2)--createBox,createCircle,createPolygon,createEdgePolygon
    sp:setPhysicsBody(body)   
    sp:setPosition(pos)
    self:addChild(sp)
end

-- create layer
function GameScene:createLayer()--第一个例子

    local layer = cc.Layer:create()

    -- local body = cc.PhysicsBody:create()--也可
    -- body:addShape(cc.PhysicsShapeCircle:create(5))

    --定义世界的边界
    local body = cc.PhysicsBody:createEdgeBox(size, cc.PHYSICSBODY_MATERIAL_DEFAULT, 5.0)--矩形大小，材质，边的宽度
    local edgeNode = cc.Node:create()
    edgeNode:setPosition(cc.p(size.width/2,size.height/2))
    edgeNode:setPhysicsBody(body)--节点对象与物体关联
    layer:addChild(edgeNode)

    local function touchBegan(touch, event)
        local location = touch:getLocation()
        self:addNewSpriteAtPosition(location)
        return false
    end
    
    -- 创建一个事件监听器 OneByOne 为单点触摸
    local listener = cc.EventListenerTouchOneByOne:create()
    -- 设置是否吞没事件，在 onTouchBegan 方法返回 true 时吞没
    listener:setSwallowTouches(true)
    -- onTouchBegan 事件回调函数
    listener:registerScriptHandler(touchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    local eventDispatcher = self:getEventDispatcher()
    -- 添加监听器
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, layer)

    return layer
end


return GameScene


function GameScene:addNewSpriteAtPosition(pos)
    local sp = cc.Sprite:create("Ball.png")
    sp:setTag(1)
    local body = cc.PhysicsBody:createCircle(sp:getContentSize().width / 2)

    body:setContactTestBitmask(0x1)--设置物体接触时能否触发接触事件
    body:setCategoryBitmask(0x2)
    body:setCollisionBitmask(0x2)

    sp:setPhysicsBody(body)
    sp:setPosition(pos)
    self:addChild(sp)
end




-- 创建层
function GameScene:createLayer()--第二个例子

    local layer = cc.Layer:create()

    --定义世界的边界
    local body = cc.PhysicsBody:createEdgeBox(size, cc.PHYSICSBODY_MATERIAL_DEFAULT, 5.0)
    local edgeNode = cc.Node:create()
    edgeNode:setPosition(cc.p(size.width / 2, size.height / 2))
    edgeNode:setPhysicsBody(body)
    layer:addChild(edgeNode)

    local function touchBegan(touch, event)
        local location = touch:getLocation()
        self:addNewSpriteAtPosition(location)
        return false
    end

    local function onContactBegin(contact)
        local spriteA = contact:getShapeA():getBody():getNode()--从接触点中取出互相接触的两个节点对象
        local spriteB = contact:getShapeB():getBody():getNode()

        if spriteA and spriteA:getTag() == 1 and spriteB and spriteB:getTag() == 1 then--判断是否存在，并且判断tag值
            spriteA:setColor(cc.c3b(255, 255, 0))
            spriteB:setColor(cc.c3b(255, 255, 0))
        end
        cclog("onContactBegin")
        return true
    end

    local function onContactPreSolve(contact)
        cclog("onContactPreSolve")
        return true
    end

    local function onContactPostSolve(contact)
        cclog("onContactPostSolve")
    end

    local function onContactSeparate(contact)
        local spriteA = contact:getShapeA():getBody():getNode()
        local spriteB = contact:getShapeB():getBody():getNode()

        if spriteA and spriteA:getTag() == 1 and spriteB and spriteB:getTag() == 1 then
            spriteA:setColor(cc.c3b(255, 255, 255))
            spriteB:setColor(cc.c3b(255, 255, 255))
        end
        cclog("onContactSeparate")
    end


    -- 创建一个事件监听器 OneByOne 为单点触摸
    local listener = cc.EventListenerTouchOneByOne:create()
    -- 设置是否吞没事件，在EVENT_PHYSICS_CONTACT_BEGIN方法返回 true 时吞没
    listener:setSwallowTouches(true)
    -- onTouchBegan 事件回调函数
    listener:registerScriptHandler(touchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
    local eventDispatcher = self:getEventDispatcher()
    -- 添加监听器
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, layer)

    local contactListener = cc.EventListenerPhysicsContact:create()
    contactListener:registerScriptHandler(onContactBegin, cc.Handler.EVENT_PHYSICS_CONTACT_BEGIN)
    contactListener:registerScriptHandler(onContactPreSolve, cc.Handler.EVENT_PHYSICS_CONTACT_PRESOLVE)
    contactListener:registerScriptHandler(onContactPostSolve, cc.Handler.EVENT_PHYSICS_CONTACT_POSTSOLVE)
    contactListener:registerScriptHandler(onContactSeparate, cc.Handler.EVENT_PHYSICS_CONTACT_SEPARATE)

    eventDispatcher:addEventListenerWithSceneGraphPriority(contactListener, layer)

   

    return layer
end

function GameScene:addNewSpriteAtPosition(pos)--第三个例子

    local boxA = cc.Sprite:create("BoxA2.png")
    boxA:setPosition(pos)

    local boxABody = cc.PhysicsBody:createBox(boxA:getContentSize())
    boxA:setPhysicsBody(boxABody)
    self:addChild(boxA, 10, 100)

    local boxB = cc.Sprite:create("BoxB2.png")
    boxB:setPosition(pos.x + 100, pos.y -120)

    local boxBBody = cc.PhysicsBody:createBox(boxB:getContentSize())
    boxB:setPhysicsBody(boxBBody)
    self:addChild(boxB, 20, 101)
    --获得物理世界对象
    local world = cc.Director:getInstance():getRunningScene():getPhysicsWorld()
    --创建距离关节对象
    local joint = cc.PhysicsJointDistance:construct(boxABody, boxBBody,
        cc.p(0, 0), cc.p(0, boxB:getContentSize().width / 2))
    world:addJoint(joint)--添加到物理世界
end
