  --old version
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

--new version
    local scrollView = ScrollView:create()
    scrollView:setDirection(SCROLLVIEW_DIR_HORIZONTAL)
    scrollView:getDirection()--(direction)
    scrollView:getInnerContainer()--(Layout)Get inner container of scrollview.Inner container is a child of scrollview
    scrollView:getInnerContainer():getPostion()--获取当前坐标
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
