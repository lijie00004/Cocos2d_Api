--old version
    local scrollView = ScrollView:create()
    scrollView:setSize(CCSizeMake(380,100))
    scrollView:setPosition(ccp(50,734))
    scrollView:setEnabled(true)
    scrollView:setBounceEnabled(true)
    scrollView:setDirection(SCROLLVIEW_DIR_HORIZONTAL)--SCROLLVIEW_DIR_VERTICAL--ccui.ScrollViewDir.vertical
    uiLayer:addWidget(scrollView)
    local innerWidth = self.scrollViewRecruit:getSize().width
    local innerHeight = self.scrollViewRecruit:getSize().height
    scrollView:removeAllChildren()
    scrollView:setInnerContainerSize(CCSizeMake(innerWidth,innerHeight))

    local positionY =scrollView:getInnerContainer():getPositionY()
    local node = scrollView:getInnerContainer():getChildByTag(tag)
    local boolean = scrollView:isEnabled()--true or false
    scrollView:getInnerContainer():setPosition(ccp(0,0))--设置scrollview的子容器位置

--new version
    scrollview:addChild(layout)---一个layout 为一个 page内容
    local innerWidth=scrollview:getContentSize().width
    local innerHeight=scrollview:getContentSize().height
    local scrollView = cc.ScrollView:create()
    scrollView:getDirection()--(direction)
    scrollView:getInnerContainer()--(Layout)Get inner container of scrollview.Inner container is a child of scrollview
    scrollView:getInnerContainer():getPostion()--获取当前坐标
    scrollView:getInnerContainerSize()--(size)
    scrollView:getInnerContainerPosition()--(Vec2)
    scrollView:getChildren()--(array)
    scrollView:getChildrenCount()--(int)
    scrollView:getChildByTag(tag)--(child)
    scrollView:setInnerContainerPosition(Vec2)
    scrollView:setDirection(SCROLLVIEW_DIR_HORIZONTAL)
    scrollView:isBounceEnabled()--boolean
    scrollView:setInertiaScrollEnabled(boolean)--滚动惯性
    scrollView:setTouchTotalTimeThreshold(float)--Set the touch total time threshold
    scrollView:getTouchTotalTimeThreshold(float)--Get the touch total time threshold

    scrollview:setTouchEnabled(true)
    scrollview:setBounceEnabled(true)
    scrollview:setContentSize(cc.size(200,100))


    --scroll bar position and size and color and opacity
    scrollView:getScrollBarPositionFromCornerForVertical()--Vec2
    scrollView:getScrollBarPositionFromCornerForHorizontal()--Vec2
    scrollView:getScrollBarWidth()
    scrollView:getScrollBarColor()
    scrollView:getScrollBarOpacity()
    scrollView:getScrollBarAutoHideTime()--float

    scrollView:setScrollBarPositionFromCorner(Vec2)--Set the scroll bar positions from the left-bottom corner (horizontal) and right-top corner (vertical)(设置滚动条水平位置和垂直位置)
    scrollView:setScrollBarPositionFromCornerForVertical(Vec2)--Set the vertical scroll bar position from right-top corner
    scrollView:setScrollBarPositionFromCornerForHorizontal(Vec2)--Set the horizontal scroll bar position from left-bottom corner
    scrollView:setScrollBarWidth(width)
    scrollView:setScrollBarColor(color)
    scrollView:setScrollBarOpacity(opacity)
    scrollView:setScrollBarAutoHideEnabled(boolean)--Set scroll bar auto hide state
    scrollView:setScrollBarAutoHideTime(float)--Set scroll bar auto hide time
    --scrollView:setScrollBarEnabled(boolean)--启用滚动条



    scrollView:scrollToBottom(float,boolean)--Scroll inner container to bottom boundary of scrollview.boolean(滚动速度衰减与否)
    scrollView:scrollToTop(float,boolean)--Scroll inner container to top boundary of scrollview.float(所需时间),boolean(滚动速度衰减与否)
    scrollView:scrollToTop(float,boolean)
    scrollView:scrollToRight(float,boolean)
    scrollView:scrollToTopLeft(float,boolean)
    scrollView:scrollToTopRight(float,boolean)
    scrollView:scrollToBottomLeft(float,boolean)
    scrollView:scrollToBottomRight(float,boolean)
    scrollView:scrollToPercentVertical(float_1,float_2,boolean)--Scroll inner container to vertical percent position of scrollview.
                --float_1( A value between 0 and 100),float_2(Time in seconds),boolean(Whether scroll speed attenuate or not)
    scrollView:scrollToPercentHorizontal(float_1,float_2,boolean)
    scrollView:scrollToPercentBothDirection(float_1,float_2,boolean)--float_1(percent or Vec2)
    scrollView:jumpToPercentVertical(float)--float(0~100)
    scrollView:jumpToPercentHorizontal(float)--float(0~100)
    scrollView:jumpToPercentBothDirection(float)--float(0~100 or Vec2)
    scrollView:setInnerContainerSize(Size)

    local function scrollviewEvent(sender,eventType)
        if eventType==ccui.ScrollviewEventType.scrollToBottom then
           print("1111111111111")
        elseif eventType==ccui.ScrollviewEventType.scrollToTop then
          print("2222222222")
        end
    end
    scrollview:addTouchEventListener(scrollviewEvent)

    -- scrollView:addEventListenerScrollView(target,selector)--Add callback function which will be called when scrollview event triggered
    -- scrollView:addEventListener(callback)--Add callback function which will be called when scrollview event triggered
    -- onTouchBegan(Touch,Event)

