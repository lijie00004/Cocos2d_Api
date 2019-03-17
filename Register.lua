--event事件 touch触碰
local node = event:getCurrentTarget()--获取事件所绑定的node
local position = touch:getLocation()--获取坐标


--registerScriptHandler, 触屏 场景 和层的进入退出
	--对象为layer
		local function onNodeEvent(event)--event包括exit enter 
		    if event == "exit" then
		    end
		end
	layer:registerScriptHandler(onNodeEvent)
	scene:registerScriptHandler(function(event)
	    if event == "enter" then--进入场景时触发
	    elseif event == "enterTransitionFinish" then--场景进入并且过渡动画完成时候触发
	    elseif event == "exit" then--退出场景时触发
	    elseif event == "exitTransitionStart" then--场景退出过渡动画开始时候触发
	    elseif event == "cleanup" then--场景销毁时候触发
	    end
	end)

	--对象为listener 、scrollview、tableView 等
		--单点触摸
		local function touchBegan(touch, event)
		    local node = event:getCurrentTarget()--获取事件所绑定的 node
		    local tag = node:getTag()
		    local locationInNode = node:convertToNodeSpace(touch:getLocation())--获取当前点击点所在相对按钮的位置坐标
		    local s = node:getContentSize()
		    local rect = cc.rect(0, 0, s.width, s.height)
		    -- 点击范围判断检测
		    if cc.rectContainsPoint(rect, locationInNode) then
		        return true
		    end
		    return false--if return false, onTouchMoved, onTouchEnded, onTouchCancelled will never called.
		end
		local listener1 = cc.EventListenerTouchOneByOne:create()
		listener1:setSwallowTouches(true)--是否吞没事件,default true
		listener1:registerScriptHandler(touchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
									--touchMoved,cc.Handler.EVENT_TOUCH_MOVED
									--touchEnded,cc.Handler.EVENT_TOUCH_ENDED
		local listener2 = listener1:clone()							
		local eventDispatcher = scene:getEventDispatcher()--scene could be cc.Director:getInstance()
		eventDispatcher:addEventListenerWithSceneGraphPriority(listener1, node)--和node绑定，such as:layer,sprite,无需手动删除
		eventDispatcher:addEventListenerWithFixedPriority(listener1,int)--int越小，先响应事件,int不能为0
		eventDispatcher:removeEventListener(listener1)

--registerScriptTapHandler
	--registerScriptTapHandler用于menuItem,注册点击事件
	local function connectToSwitch(tag,menuItem)-- tag为menuItem设置的标签 ，menuItem为相应对象
   		if menuItem:getSelectedIndex() == 0 then
   		end
   	end
	menuItem:registerScriptTapHandler(connectToSwitch)

--registerScriptTouchHandler,注册触屏事件(layer)
	local function onTouch(eventType, x, y)
		--log("eventType = "..tostring(eventType))
		if eventType == "began" then
			--需要返回true
			return onTouchBegan(touch, event)
		elseif eventType == "moved" then
			onTouchMoved(touch, event)
		elseif eventType == "ended" then
			onTouchEnded(touch, event)
		end
	end
	layer:registerScriptTouchHandler(onTouch)
	layer:setTouchEnabled(true)
	

