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
		listener1:setSwallowTouches(true)--是否吞没事件,default false
		listener1:registerScriptHandler(touchBegan,cc.Handler.EVENT_TOUCH_BEGAN )--return true时吞没
									--touchMoved,cc.Handler.EVENT_TOUCH_MOVED
									--touchEnded,cc.Handler.EVENT_TOUCH_ENDED
		local listener2 = listener1:clone()							
		local eventDispatcher = scene:getEventDispatcher()--scene could be cc.Director:getInstance()
		eventDispatcher:addEventListenerWithSceneGraphPriority(listener1, node)--和node绑定，such as:layer,sprite,无需手动删除
		eventDispatcher:addEventListenerWithFixedPriority(listener1,int)--int越小，先响应事件,int不能为0
		eventDispatcher:removeEventListener(listener1)
		eventDispatcher:removeCustomEventListeners(customEventName)--注销自定义事件监听器
    	eventDispatcher:removeAllEventListeners()--注销所有事件监听器，包括菜单项

--registerScriptTapHandler
	--registerScriptTapHandler用于menuItem,注册点击事件
	local function connectToSwitch(tag,sender)-- tag为menuItem设置的标签 ，menuItem为相应对象
   		if sender:getSelectedIndex() == 0 then
   		end
   	end
	menuItem:registerScriptTapHandler(connectToSwitch)

--registerScriptTouchHandler,注册触屏事件(layer)
	--began、moved、ended都会执行一次print("111")
	local function onTouch(eventType, x, y)
		print("111")
		if eventType == "began" then
			return true--返回false,moved和ended将不响应
		elseif eventType == "moved" then
		elseif eventType == "ended" then
		end
	end
	layer:registerScriptTouchHandler(onTouch)--第一个参数callback,第二个参数boolean设置多点开关，第三个参数int优先级,第四个参数boolean吞没事件
	layer:setTouchEnabled(true)
	

