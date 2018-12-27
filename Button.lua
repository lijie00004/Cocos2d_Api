local function heroBtnEvent(sender,nEvent)
    if nEvent == TOUCH_EVENT_ENDED then
        local btn = tolua.cast(sender,"Button")--获取button
        local tbIndex = btn:getTag()--获取tag
        local character = Character:create(temp[tbIndex], 1)
        local layer = CharacterInfoLayer:create(character, nil, false)
        layer.fromLayer = "RecruitPreview"
        MainLayer:addLayer(layer, "CharacterInfoLayer", 1035)    
    end
end

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