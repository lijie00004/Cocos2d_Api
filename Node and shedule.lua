
--cocos命令指令
    cocos new HelloLua -p com.work6 -l lua -d D:/cocos
--node
    local childNode = cc.Node:create()
    node:addchild(childNode,0,123)--0表示绘制顺序，123表示标签
    local node = node:getChildByTag(123)
    node:removeChildByTag(123,true)--true表示停止该子节点上一切动作
    node:removeChild(childNode,true)
    node:removeAllChildrenWithCleanup(true)--删除所有节点，并停止该子节点上一切动作
    node:removeFromParentAndCleanup(true)--从父节点删除node节点，并停止该节点上一切动作
    node:setAnchorPoint(cc.p(0.5,0.5))
    node:setPosition(cc.p(0.5,0.5))
    local posX, posY = node2:getPosition()

--定时器
	layer:scheduleUpdateWithPriorityLua(update, 0)--update表示回调函数，0表示优先级
	layer:unscheduleUpdate()--停止调度

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