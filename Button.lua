--cocos2d-x-2
local function buttonEvent(sender,eventType)
    if eventType == TOUCH_EVENT_BEGAN then
        startPos = ccp(btn_bg:getPosition())
    elseif eventType == TOUCH_EVENT_MOVED then
        btn:setPosition(btn:getTouchMovePos())
    elseif eventType == TOUCH_EVENT_ENDED then
        if btn_bg:hitTest(btn:getTouchEndPos()) then--判断触摸点是否在节点范围内,超出return true
            self:change_req()--根据新数据，刷新卡牌布局
        else
            btn:setPosition(startPos)--放回原位
        end     
    end
end
btn:addTouchEventListener(buttonEvent)

local function scrollOffsetBtn(sender,eventType)
	if eventType == TOUCH_EVENT_ENDED then
	end
end
local btn = Button:create()
btn:loadTextures("images/common_3/jiantou-1.png","images/common_3/jiantou-1.png")
btn:setPressedActionEnabled(true)
uiLayer:addWidget(btn)
btn:addTouchEventListener(scrollOffsetBtn)

btn:setEnabled(false)--子控件都不响应触摸
btn:setTouchEnabled(false)--

--cocos2d-x-3
btn:setBright(false)--先设置后才能显示禁止图片
btn:setTouchEnabled(false)

btn:setEnabled(false)--子控件都不响应触摸,不知道为什么会把图片隐藏
 --Button对象事件处理
    local function menuCloseCallback(sender, eventType)
        if eventType == ccui.TouchEventType.began then --手指触碰屏幕
        elseif eventType == ccui.TouchEventType.moved then --手指在屏幕上移动
        elseif eventType == ccui.TouchEventType.ended then --手指离开屏幕
        else
        end
    end
    
local button = ccui.Button:create("CloseNormal.png", "CloseSelected.png")
button:setPosition(size.width - button:getContentSize().width / 2, 
                        button:getContentSize().height / 2)
--添加事件监听器
button:addTouchEventListener(menuCloseCallback)
--设置单击时会有放大效果
button:setPressedActionEnabled(true)