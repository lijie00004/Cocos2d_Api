--Vec2(cc.p(1,1))
--Size(cc.size(100,100))
local node = Node:create()
local btn = tolua.cast(sender,"Button")
node:getDescription()--(String)
node:getLocalZOrder()--(int)
node:getScaleX()--(float)--getScale()
node:getPosition()--(Vec2)getPositionX
--node:getPositionNormalized()--(Vec2)
node:getSkewX()--(float)getSkewY
node:getAnchorPoint()--获得锚点相对坐标
node:getAnchorPointInPoints()--获得锚点绝对坐标
node:getContentSize()--(Size.width,Size.height)
node:isVisible()
node:getRotation()
node:getRotationSkewX()
node:getChildByTag(int)
node:getChildByName(string)
node:getChildren()--Returns the amount of children.
node:getChildrenCount()
node:getParent()--(Node)
node:getTag()
node:getName()
node:getUserData()
node:isRunning()--(boolean)
node:getScene()--Returns the Scene that contains the Node.
node:getBoundingBox()--(table){x = ,y = ,width = , height = }图片左下到父节点锚点的距离，图片大小
node:getActionByTag()--(action)Gets an action from the running action list by its tag.
node:getOpacity()
node:isCascadeOpacityEnabled()
node:getColor()--(Color3B){r = ,b = , g = }
node:getDisplayedColor()--(Color3B){r = ,b = , g = }
node:isCascadeColorEnabled()
node:isOpacityModifyRGB()

node:setLocalZOrder(int)--LocalZOrder is the 'key' used to sort the node relative to its siblings.
node:setScaleX(float)--setScale(0.7,1)
node:setPosition(cc.p(100,100))--or (100,100)setPositionX
--node:setPositionNormalized(cc.p(0.1,0.1))--Sets the position (x,y) using values between 0 and 1
node:setSkewX(float)--(setSkewY)Changes the X skew angle of the node in degrees.
node:setAnchorPoint(Vec2)-- or (0,0)
node:setContentSize(Size)-- or (100,100) ignoreContentAdaptWithSize(flase)
node:setVisible(Boolean)
node:setRotation(float)--0是默认的旋转角度。正值顺时针旋转节点，负值逆时针旋转节点。
node:setRotationSkewX(float)
node:addchild(childNode,ZOrder,tag)-- or childNode,ZOrder,string
node:setParent(Node)
node:removeFromParent()--(自带cleanup) == removeFromParentAndCleanup(true)
node:removeFromParentAndCleanup(flase)--cleanup true if all actions and callbacks on this node should be removed, false otherwise.
node:removeChild(Node,Boolean)--cleanup all running actions depending on the Boolean parameter.
node:removeChildByTag(tag,Boolean)--cleanup all running actions depending on the Boolean parameter.
node:removeChildByName(string,Boolean)--cleanup all running actions depending on the Boolean parameter.
node:removeAllChildren()--Removes all children from the container with a cleanup
node:removeAllChildrenWithCleanup(Boolean)
node:reorderChild(child,localZOrder)--根据新的z值重新排序子元素。
node:sortAllChildren()--在绘制之前对子数组排序一次，而不是每次添加或重新排序子数组。
node:setTag()
node:setName()
node:scheduleUpdateWithPriorityLua(handler,priority)
node:cleanup()--Stops all running actions and schedulers
node:runAction(Action)
node:stopAllActions()--Stops and removes all actions from the running action list
node:stopAction(Action)--Stops and removes an action from the running action list.
node:stopActionByTag(tag)--Removes an action from the running action list by its tag.
node:stopAllActionsByTag(tag)--Removes all actions from the running action list by its tag.
node:resume()--(lua没用)Resumes all scheduled selectors, actions and event listeners.
node:pause()--(lua没用)Pauses all scheduled selectors, actions and event listeners.
node:setOpacity(opacity)
node:updateDisplayedOpacity(opacity)--忽视setCascadeOpacityEnabled(true),Update the displayed opacity of node with it's parent opacity;.
node:setCascadeOpacityEnabled(boolen)--开启后父节点的透明度会影响子节点透明度
node:setColor(cc.c3b(255,255,0))
node:updateDisplayedColor(cc.c3b(255,255,0))
node:setCascadeColorEnabled(boolen)
node:setOpacityModifyRGB(boolen)--如果您希望不透明度影响颜色属性，则将其设置为true。













    
--node
  --暂停当前层中的node
    Layer:pause()
    if (schedulerId ~= nil) then
        scheduler:unscheduleScriptEntry(schedulerId)
    end

    --layer子节点暂停
    local pChildren = Layer:getChildren()
    for i = 1, #pChildren, 1 do
        local child = pChildren[i]
        child:pause()
    end


    --继续
    Layer:resume()
    schedulerId = nil
    schedulerId = scheduler:scheduleScriptFunc(shootBullet, 0.2, false)

    local pChildren = Layer:getChildren()
    for i = 1, #pChildren, 1 do
        local child = pChildren[i]
        child:resume()
    end


--定时器
    --当Node被移除出场景或者其他情况下，调定时器将会被取消
	layer:scheduleUpdateWithPriorityLua(update, 0)--update表示回调函数，0表示优先级
	layer:unscheduleUpdate()--停止调度

    --当Node被移除出场景或者其他情况下，调定时器依旧在
    local function shootBullet(delta)
    end
    --每0.2秒调用shootBullet函数,false表示无限次
    schedulerId = cc.Director:getInstance():getScheduler():scheduleScriptFunc(shootBullet, 0.2, false)--cc.Director:getInstance():getScheduler()全局定时器
    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(schedulerId)

    setTimeScale--未确认，动作和动画执行速度
    local scheduler = cc.Scheduler:new()--未确认
    local actionMgr = cc.ActionManager:new()--未确认



--坐标系
	cc.Director:getInstance():convertToGL(cc.p(930, 540))--UI原点在左上角--GL原点在左下角
                       --convertToUI
    --世界坐标表示以0,0,为原点，模型坐标是以节点为原点
	local posX, posY = node2:getPosition()
    local point1 = node1:convertToNodeSpace(cc.p(posX, posY))--将世界坐标转换为模型坐标
    local point3 = node1:convertToNodeSpaceAR(cc.p(posX, posY))--相对锚点将世界坐标转换为模型坐标

    local posX,posY = node2:getPosition()
    local point1 = node1:convertToWorldSpace(cc.p(posX,posY))----将模型坐标转换为世界坐标
    local point3 = node1:convertToWorldSpaceAR(cc.p(posX,posY))--相对锚点将模型坐标转换为世界坐标

    world2Local(point)--世界坐标转换为模型坐标
    local2World(point)--模型坐标转换为世界坐标