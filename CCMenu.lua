self.menuNormal = CCMenu:create()
self.menuNormal:setPosition(ccp(0, 0))
self.layer:addChild(self.menuNormal)
self.menuNormal:addChild(self.menuItemArray[i], i, i)
--二选一，水平排列，垂直排列
self.menuNormal:alignItemsHorizontallyWithPadding(gap)--设置菜单间距
self.menuNormal:alignItemsVerticallyWithPadding(gap)--