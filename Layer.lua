--cocos2d-x-2
self.layer:removeFromParentAndCleanup(true)
self.layer:stopAllActions()


local layer = CCLayer:create()
local colorBg = CCLayerColor:create(ccc4(0, 0, 0, 180), 480, 854)

self.uiLayer = TouchGroup:create()
self.layer:addChild(self.uiLayer)

self.layout = Layout:create()
self.uiLayer:addWidget(self.layout)


--cocos2d-x-3
local layer = cc.Layer:create()

图层触摸事件
local function onTouch(eventType, x, y)
	MainLayer:removeLayer("GetItemLayer");
end
self.layer:registerScriptTouchHandler(onTouch)
self.layer:setTouchEnabled(true)

local function onNodeEvent(tag)
	if tag == "exit" then--判断是否为退出层事件
		layer:unsheduleUpdate()--停止游戏调度
	end
end
layer:scheduleUpdateWithPriorityLua(function,0)--开始游戏调度，参数2是优先级
layer:registerScriptHandler(onNodeEvent)--注册层事件监听器

--每一帧调度器
local function update(dt)        
    count = count + 1
    if count > 100 then 
        count = 0
    end
    loadingBar:setPercent(count)
end
layer:scheduleUpdateWithPriorityLua(update,0)

