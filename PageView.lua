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