--old version
card:getTouchMovePos()
self.cardBg[i]:hitTest(card:getTouchEndPos())
self.layer:removeFromParentAndCleanup(true)
self.layer:stopAllActions()


local layer = CCLayer:create()
local colorBg = CCLayerColor:create(ccc4(0, 0, 0, 180), 480, 854)

self.uiLayer = TouchGroup:create()
self.layer:addChild(self.uiLayer)

self.layout = Layout:create()
self.uiLayer:addWidget(self.layout)


--new version
local layer = cc.Layer:create()
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
listener1:setSwallowTouches(true)--是否吞没事件
listener1:registerScriptHandler(touchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
							--touchMoved,cc.Handler.EVENT_TOUCH_MOVED
							--touchEnded,cc.Handler.EVENT_TOUCH_ENDED
local listener2 = listener1:clone()							
local eventDispatcher = scene:getEventDispatcher()--scene could be cc.Director:getInstance()
eventDispatcher:addEventListenerWithSceneGraphPriority(listener1, node)--和node绑定，such as:layer,sprite,无需手动删除
eventDispatcher:addEventListenerWithFixedPriority(listener1,int)--int越小，先响应事件,int不能为0，eventDispatcher:removeEventListener(listener1)




local bg = cc.LayerColor:create(cc.c3b(255, 255, 255))

图层触摸事件
local function onTouch(eventType, x, y)
	MainLayer:removeLayer("GetItemLayer");
end
self.layer:registerScriptTouchHandler(onTouch)
self.layer:setTouchEnabled(true)

local function onNodeEvent(tag)
	if tag == "exit" then--判断是否为退出层事件,enter
		layer:unsheduleUpdate()--停止游戏调度
	end
end
layer:registerScriptHandler(onNodeEvent)--注册层事件监听器
										--sprite也可以注册层级事件监听器


