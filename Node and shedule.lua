
--cocos命令指令
    cocos new HelloLua -p com.work6 -l lua -d D:/cocos
--node
    local childNode = cc.Node:create()
    node:addchild(childNode,0,123)--0表示绘制顺序，123表示标签
    local node = node:getChildByTag(123)
    node:removeChildByTag(123,true)--true表示停止该子节点上一切动作
    node:removeChild(childNode,true)

    node:removeAllChildren()--在onExit()先听着各种监听，再删除节点
    node:removeFromParent()
    node = nil

    node:removeAllChildrenWithCleanup(true)--删除所有节点，并停止该子节点上一切动作
    node:removeFromParentAndCleanup(true)--从父节点删除node节点，并停止该节点上一切动作
    node:setAnchorPoint(cc.p(0.5,0.5))
    node:setPosition(cc.p(0.5,0.5))
    node:getChildren()
    local posX, posY = node2:getPosition()



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
    --每0.2秒调用function函数
    schedulerId = cc.Director:getInstance():getScheduler():scheduleScriptFunc(shootBullet, 0.2, false)
    --callback: 回调函数，Scheduler会传递给回调函数一个参数dt，表示距离上次回调所经过的时间
    --delay:每次调用回调函数的时间间隔
    --pause: 是否停住，一般设为false就行，否则定时器停住不执行
    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(schedulerId)

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