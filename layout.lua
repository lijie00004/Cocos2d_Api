self.menuNode = Layout:create()
self.menuNode:setSize(CCSizeMake(480,40))
self.menuNode:setPosition(ccp(0,760))
self.layout:addChild(self.menuNode)
self.menuNode:addNode(self.tab.layer)--如果用addchild会报错


--cocos2d_3
layout:setBackGroundColorType(LAYOUT_COLOR_SOLID)--必须设置
layout:setBackGroundColor(cc.c3b(255,255,0))
layout:setBackGroundColorOpacity(0)--可选

layout:setClippingEnabled(true)--超出部分隐藏

layout:setBackGroundImage("nd3_rank_3.png")
layout:setBackGroundImageScale9Enabled(true)
layout:setBackGroundImageCapInsets(cc.rect(40,40,40,40))
layout:setContentSize(cc.size(100,100))