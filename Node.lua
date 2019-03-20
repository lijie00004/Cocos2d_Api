--Vec2(cc.p(1,1))
--Size(cc.size(100,100))
local node = Node:create()
local btn = tolua.cast(sender,"Button")
node:getDescription()--(String)
node:getLocalZOrder()--(int)
node:getScaleX()--(float)--getScale()
node:getPosition()--(Vec2)getPositionX
node:getPositionNormalized()--(Vec2)
node:getSkewX()--(float)getSkewY
node:getAnchorPoint()--获得锚点相对坐标
node:getAnchorPointInPoints()--获得锚点绝对坐标
node:getContentSize()--(Size.width,Size.height)
node:isVisible()
node:getRotation()
node:getRotationSkewX()
node:getChildByTag(int)
node:getChildByName(string)
node:getChildren()
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
node:getColor()--(Color3B){r = ,b = , g = }
node:getDisplayedColor()--(Color3B){r = ,b = , g = }

node:setLocalZOrder(int)--LocalZOrder is the 'key' used to sort the node relative to its siblings.
node:setScaleX(float)--setScale(0.7,1)
node:setPosition(cc.p(100,100))--or (100,100)setPositionX
node:setPositionNormalized(cc.p(0.1,0.1))--(cc.p(1,1)表示节点的锚点在父节点右上角)
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
node:updateDisplayedOpacity(opacity)--忽视setCascadeOpacityEnabled(true),Update
node:setCascadeOpacityEnabled(boolen)--开启后父节点的透明度会影响子节点透明度
node:setColor(cc.c3b(255,255,0))
node:updateDisplayedColor(cc.c3b(255,255,0))--更新节点颜色及其父颜色
node:setCascadeColorEnabled(boolen)--(true)父节点颜色会影响子节点颜色
node:setOpacityModifyRGB(boolen)--(true)透明度不会影响颜色属性
node:retain()