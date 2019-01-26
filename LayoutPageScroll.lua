--cocos2d-2
    --Layout
    self.menuNode = Layout:create()
    self.menuNode:setSize(CCSizeMake(480,40))
    self.menuNode:setPosition(ccp(0,760))
    self.layout:addChild(self.menuNode)
    self.menuNode:addNode(self.tab.layer)--如果用addchild会报错

    --PageView
    self.pageView = PageView:create()
    self.pageView:setTouchEnabled(false)
    self.pageView:setClippingEnabled(false)
    self.pageView:setSize(CCSizeMake(480, 854))
    self.pageView:setAnchorPoint(ccp(0.5,1))
    self.pageView:setPosition(ccp(240,854))
    uiLayer:addWidget(self.pageView)
    self.pageView:scrollToPage(self.activityPos)
    local pos = self.pageView:getCurPageIndex()+1
    local count = self.pageView:getPages():count()
    self.pageView:addPage(layer.layer)
    self.pageView:removeAllChildren()
    self.pageView:addEventListenerPageView(eventHandler)

    --ScrollView
    scrollList = ScrollView:create()
    scrollList:setSize(CCSizeMake(380,100))
    scrollList:setAnchorPoint(ccp(0,0))
    scrollList:setPosition(ccp(50,734))
    scrollList:setEnabled(true)
    scrollList:setBounceEnabled(true)
    scrollList:setDirection(SCROLLVIEW_DIR_HORIZONTAL)--SCROLLVIEW_DIR_VERTICAL
    uiLayer:addWidget(scrollList)
    local innerWidth = self.scrollViewRecruit:getSize().width
    local innerHeight = self.scrollViewRecruit:getSize().height
    scrollList:removeAllChildren()
    scrollList:setInnerContainerSize(CCSizeMake(innerWidth,innerHeight))
    self.scrollViewMallPos = self.scrollViewMall:getInnerContainer():getPositionY()

    self.scrollList1:getInnerContainer():getChildByTag(curpos):getPositionX() - self.scrollList1:getInnerContainer():getChildByTag(1):getPositionX() > 220 then
    self.scrollViewMallPos = 220 - self.scrollList1:getInnerContainer():getChildByTag(pos):getPositionX()

    self.scrollViewMall:getInnerContainer():setPosition(ccp(0,self.scrollViewMallPos))--设置scrollview的子容器位置

    scrollList:isEnabled()--true or false


--cocos2d-3
    --layout
    layout:setBackGroundColorType(LAYOUT_COLOR_SOLID)--必须设置
    layout:setBackGroundColor(cc.c3b(255,255,0))
    layout:setBackGroundColorOpacity(0)--可选

    layout:setClippingEnabled(true)--超出部分隐藏
    layout:setContentSize(cc.size(200,100))

    layout:setBackGroundImage("nd3_rank_3.png")
    layout:setBackGroundImageScale9Enabled(true)
    layout:setBackGroundImageCapInsets(cc.rect(40,40,40,40))
    layout:setContentSize(cc.size(100,100))

    --PageView
    local pageView=ccui.PageView:create()--锚点(0,0)
    pageView:setContentSize(cc.size(200,100))
    pageView:setTouchEnabled(true)
    pageView:setPosition(cc.p(60,30))
    pageView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)--cc.SCROLLVIEW_DIRECTION_HORIZONTAL
    pageView:scrollToPage(2,0.1)--翻到第几页，从0开始,第二个参数是持续时间

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
    	    lblNotice:setString("pageview"..pageView:getCurrentPageIndex())
    	    print(pageView:getCurrentPageIndex())
    	end
    end)


    --ScrollView
    local scrollview=ccui.ScrollView:create() 
    scrollview:setTouchEnabled(true) 
    scrollview:setBounceEnabled(true)--这句必须要不然就不会滚动噢 
    scrollview:setDirection(ccui.ScrollViewDir.vertical)
    scrollview:setContentSize(cc.size(200,100))
    scrollview:setPosition(cc.p(160,100)) 
    scrollview:setAnchorPoint(cc.p(0.5,0.5))
    layer:addChild(scrollview)

    scrollview:setScrollBarWidth(30)--滚动条的宽度 
    scrollview:setScrollBarColor(cc.RED)--滚动条的颜色 
    scrollview:setScrollBarPositionFromCorner(cc.p(20,20))--滚动条位置
    scrollview:setScrollBarEnabled(false)--隐藏滚动条
    
    local function scrollviewEvent(sender,eventType)
        if eventType==ccui.ScrollviewEventType.scrollToBottom then
           print("1111111111111")
        elseif eventType==ccui.ScrollviewEventType.scrollToTop then
          print("2222222222")
        end
    end
    scrollview:addTouchEventListener(scrollviewEvent)
    local innerWidth=scrollview:getContentSize().width
    local innerHeight=scrollview:getContentSize().height

    scrollview:setInnerContainerSize(cc.size(innerWidth,innerHeight+200))
    for i=0,6 do
        local layout = ccui.Layout:create()
        layout:setContentSize(cc.size(200,10))
        layout:setBackGroundColorType(LAYOUT_COLOR_SOLID)
        layout:setBackGroundColor(cc.c3b(255,35*i,35*i))
        layout:setPositionY(300-15*i)
        print(i)
        local lbl3 = cc.Label:create()
        lbl3:setString("Hello"..i)
        lbl3:setPosition(100,5)
        layout:addChild(lbl3)
        scrollview:addChild(layout)---一个layout 为一个 page内容
    end
    scrollview:scrollToBottom(1,true)--scrollToTop--scrollToLeft--scrollToRight
    scrollview:scrollToPercentVertical(50,1,true)--scrollToPercentHorizontal
    scrollview:jumpToPercentVertical(50)--jumpToPercentHorizontal
    scrollview:getChildrenCount()