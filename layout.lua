self.menuNode = Layout:create()
self.menuNode:setSize(CCSizeMake(480,40))
self.menuNode:setPosition(ccp(0,760))
self.layout:addChild(self.menuNode)
self.menuNode:addNode(self.tab.layer)--如果用addchild会报错