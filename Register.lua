
--registerScriptHandler, 注册基本事件 包括 触屏 层的进入 退出 事件
	--对象为layer
	local function onNodeEvent(event)--event包括exit enter 
	    if event == "exit" then
	    end
	end
	layer:registerScriptHandler(onNodeEvent)

	--对象为listener 、scrollview、tableView 等
	local function onTouchBegan(touch, event)
        return true
	end
	listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )--第一个为回调函数,第二个参数为发生调用的事件
								--onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED
								--onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED

--registerScriptTapHandler
	--registerScriptTapHandler用于menuItem,注册点击事件
	local function connectToSwitch(tag,menuItem)-- tag为menuItem设置的标签 ，menuItem为相应对象
   		if menuItem:getSelectedIndex() == 0 then
   		end
   	end
	menuItem:registerScriptTapHandler(connectToSwitch)

--registerScriptTouchHandler,注册触屏事件
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
	self.layer:registerScriptTouchHandler(onTouch)
	self.layer:setTouchEnabled(true)