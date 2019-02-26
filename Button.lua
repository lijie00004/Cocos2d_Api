--cocos2d-x-2
local function scrollOffsetBtn(sender,eventType)
	if eventType == TOUCH_EVENT_ENDED then
		SimpleAudioEngine:sharedEngine():playEffect("music/guanbi.mp3")
		if self.curTouch then
			self:changeScrollOffset(sender:getTag())
		end
	end
end
local leftBtn = Button:create()
btn:loadTextures("images/common_3/jiantou-1.png","images/common_3/jiantou-1.png")
btn:setTouchEnabled(true)
btn:setPressedActionEnabled(true)
uiLayer:addWidget(btn)
btn:addTouchEventListener(scrollOffsetBtn)

btn:setEnabled(false)--设置成false，无法响应任何触发事件

--cocos2d-x-3
btn:setBright(false)--先设置后才能显示禁止图片
btn:setTouchEnabled(false)

btn:setEnabled(false)--子控件都不响应触摸,不知道为什么会把图片隐藏
 --Button对象事件处理
    local function menuCloseCallback(sender, eventType)
        cclog("Call menuCloseCallback...")

        if eventType == ccui.TouchEventType.began then --手指触碰屏幕
            cclog("Touch Down")
        elseif eventType == ccui.TouchEventType.moved then --手指在屏幕上移动
            cclog("Touch Move")
        elseif eventType == ccui.TouchEventType.ended then --手指离开屏幕
            cclog("Touch Up")
        else
            cclog("Touch Cancelled")
        end
    end
    
local button = ccui.Button:create("CloseNormal.png", "CloseSelected.png")
button:setPosition(size.width - button:getContentSize().width / 2, 
                        button:getContentSize().height / 2)
--添加事件监听器
button:addTouchEventListener(menuCloseCallback)
--设置单击时会有放大效果
button:setPressedActionEnabled(true)