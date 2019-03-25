--old version
local function eventHandler(sender,eventType)
    if eventType == TOUCH_EVENT_ENDED then
	-- elseif eventType == "move" then
	-- elseif eventType == TOUCH_EVENT_ENDED then
	end
end

local pageView = PageView:create()
pageView:setTouchEnabled(false)
pageView:setClippingEnabled(false)
pageView:setSize(CCSizeMake(480, 854))
pageView:setAnchorPoint(ccp(0.5,1))
pageView:setPosition(ccp(240,854))
uiLayer:addWidget(pageView)
pageView:scrollToPage(index)
local pos = pageView:getCurPageIndex()+1
local count = self.pageView:getPages():count()
pageView:addPage(layer)
pageView:removeAllChildren()
pageView:addEventListenerPageView(eventHandler)

--new version
local pageView = ccui.PageView:create()--锚点(0,0)
pageView:setContentSize(cc.size(200,100))
pageView:setTouchEnabled(true)
pageView:setPosition(cc.p(60,30))
pageView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)--cc.SCROLLVIEW_DIRECTION_HORIZONTAL
pageView:scrollToPage(2,0.1)--翻到第几页，从0开始,第二个参数是持续时间
pageView:getCurrentPageIndex()

for i=0,3 do
    local layout=ccui.Layout:create()
    layout:setContentSize(cc.size(200,100))
    layout:setBackGroundColorType(LAYOUT_COLOR_SOLID)
    layout:setBackGroundColor(cc.c3b(255,80*i,80*i))
    local lbl3 = cc.Label:create()
    lbl3:setString("Hello"..i)
    lbl3:setPosition(100,50)
    layout:addChild(lbl3)
    pageView:addPage(layout)---一个layout 为一个 page内容
end

pageView:addEventListener(function(sender,event)
if event==ccui.PageViewEventType.turning then
	end
end)