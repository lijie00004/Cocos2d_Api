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
