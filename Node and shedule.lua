
--cocos命令指令
    cocos new HelloLua -p com.work6 -l lua -d D:/cocos


    
--node
    node:getParent()
    node:getDescription()--(String)
    node:isRunning()--(Boolean)Returns whether or not the node is "running".
    node:addchild(childNode,ZOrder,tag)
    node:getChildByTag(int)
    node:getChildByName(string)
    node:getContentSize()--获取文本内容大小
    node:getPosition()
    node:getScene()
    node:getName()--与Tag差不多
    node:getChildByTag(tag)
    node:getChildren()--返回一个数组
    node:getChildrenCount()
    node:removeChildByTag(tag,true)
    node:removeChildByName(tag,true)
    node:runAction(action)
    node:resume()
    node:pause()
    node:removeFromParent(true)--true表示clean一切
    node:setAnchorPoint(cc.p(0.5,0.5))
    node:setPosition(cc.p(100,100))--or (100,100)
    node:setGlobalZOrder(float)
    node:setScale(float)
    node:setSkewX(50)--设置倾斜
    node:setRotation(50)
    node:setVisible(flase)
    node:setTag(123)
    node:setName(string)
    node:setParent(node)
    node:stopAction(action)
    node:setPositionNormalized(cc.p(0.8,0.5))--0~1，百分比设置位置

    local btn = tolua.cast(sender,"Button")

    node:removeAllChildren()--自带clean
    node:removeAllChildrenWithCleanup(true)--清除所有子节点，并清理所有操作
    node:removeChild(nodeName, true)----清除子节点，并清理所有操作
    node:removeChildByTag(123,true)--true表示停止该子节点上一切动作
    node:removeFromParentAndCleanup(true)--从父节点删除node节点，并停止该节点上一切动作
    node:stopAllActions()


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