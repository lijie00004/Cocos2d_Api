function Tab:create()
	local o =
	{
		layer					= nil,
		clickEvent				= nil,
		menuNormal				= nil,
		menuSelected			= nil,
		menuItemArray			= {},
		menuItemSelectedArray	= {},
		direction				= 0,
		index					= 0,
		focusSprite				= 0
	}
	setmetatable(o, self)
	self.__index = self
	o.layer = CCLayer:create()
	o:init()
	return o
end
function Tab:init()
	self.index = 0
	self.focusSprite = 0
end
-----------------------------未选中图片-----------选中图片---------文字----------字体----------坐标----------缩放
function Tab:addItemAndText(imageNormalFile, imageSelectFile, charImageFile, fontSize, charImageOffset,curTypeInfo)
	if charImageOffset == nil then
		charImageOffset = {0, 0}
	end

	function menuHandle(tag)--tag是选中的序号
		if self.focusSprite ~= tag then
			self.menuItemArray[tag]:setVisible(false)--
			self.menuItemSelectedArray[tag]:setVisible(true)
			self.menuItemArray[self.focusSprite]:setVisible(true)
			self.menuItemSelectedArray[self.focusSprite]:setVisible(false)
			self.focusSprite = tag
		end
		if self.clickEvent then--self.clickEvent被赋值，值是个函数
			self.clickEvent(tag)--把选中的序号传递给函数
		end
	end

	local item = CCMenuItemImage:create(imageNormalFile, imageNormalFile)
	item:registerScriptTapHandler(menuHandle)

	if charImageFile ~= nil then
		if curTypeInfo ~= nil then
			createEnableStrokeLabel(item,
				{charImageFile,255,255,255},
				{item:getContentSize().width/2 + charImageOffset[1],
					item:getContentSize().height/2 + charImageOffset[2],0.5,0.5,fontSize},
				{0,0,0,1})
			item:setScaleX(curTypeInfo[1])
			item:setScaleY(curTypeInfo[2])
		else
			local reelLab = Label:create()
        		  reelLab:setColor(ccc3(152,119,93))
        		  reelLab:setPosition(ccp(item:getContentSize().width/2 + charImageOffset[1], item:getContentSize().height/2 + charImageOffset[2]))
        		  reelLab:setFontSize(fontSize)
                  reelLab:setFontName(LFont())
                  reelLab:setText(charImageFile)
                  reelLab:enableStroke(ccc3(74,44,10),1)
			 item:addChild(reelLab)
		end
	end

	local itemSelected = CCMenuItemImage:create(imageSelectFile, imageSelectFile)
	itemSelected:registerScriptTapHandler(menuHandle)

	if charImageFile ~= nil then
		if curTypeInfo ~= nil then
			createEnableStrokeLabel(itemSelected,
				{charImageFile,255,255,255},
				{itemSelected:getContentSize().width/2 + charImageOffset[1],
					itemSelected:getContentSize().height/2 + charImageOffset[2],0.5,0.5,fontSize},
				{0,0,0,1})
			itemSelected:setScaleX(curTypeInfo[1])
			itemSelected:setScaleY(curTypeInfo[2])
		else
			local reelLab = Label:create()
        		  reelLab:setColor(ccc3(255,198,89))
        		  reelLab:setPosition(ccp(itemSelected:getContentSize().width/2 + charImageOffset[1], itemSelected:getContentSize().height/2 + charImageOffset[2]))
        		  reelLab:setFontSize(fontSize)
                  reelLab:setFontName(LFont())
                  reelLab:setText(charImageFile)
        		  reelLab:enableStroke(ccc3(74,44,10),1)
			itemSelected:addChild(reelLab)
		end
	end
	itemSelected:setVisible(false)
	self.menuItemArray[self.index] = item
	self.menuItemSelectedArray[self.index] = itemSelected
	self.index = self.index + 1
end

function Tab:setClickEvent(e)
	self.clickEvent = e
end

function Tab:tab(gap)

	if self.index > 0 then
		self.menuNormal = CCMenu:create()
		self.menuNormal:setPosition(ccp(0, 0))
		self.layer:addChild(self.menuNormal)

		self.menuSelected = CCMenu:create()
		self.menuSelected:setPosition(ccp(0, 0))
		self.layer:addChild(self.menuSelected)

		for i = 0, self.index - 1, 1 do
			if i == self.focusSprite then
				self.menuItemArray[i]:setVisible(false)
				self.menuItemSelectedArray[i]:setVisible(true)
			end
			self.menuNormal:addChild(self.menuItemArray[i], i, i)
			self.menuSelected:addChild(self.menuItemSelectedArray[i], i, i)
		end

		if self.direction == tabHorizontal then--tabHorizontal=0全局变量--self.direction设置方向
			self.menuNormal:alignItemsHorizontallyWithPadding(gap)--设置菜单间距
			self.menuSelected:alignItemsHorizontallyWithPadding(gap)
		elseif self.direction == tabVertical then--tabVertical=1全局变量
			self.menuNormal:alignItemsVerticallyWithPadding(gap)
			self.menuSelected:alignItemsVerticallyWithPadding(gap)
		end
	end
end


function ShopLayer:ShowTab()
    local function tabHandle(index)
        print("select index:"..index.." previous index:"..self.tabIdx)
        if self.tabIdx ~= index then
            SimpleAudioEngine:sharedEngine():playEffect("music/fanye.mp3")
            if index == 0 then
                self.scrollViewMall:setEnabled(false)
                self.scrollViewGiftPack:setEnabled(false)
                self.scrollViewRecruit:setEnabled(true)
                self.recruitTopLayout:setEnabled(true)
                self:ShowRecruit()
                self.bg:setVisible(false)
            elseif index == 1 then
                self.scrollViewRecruit:setEnabled(false)
                self.recruitTopLayout:setEnabled(false)
                self.scrollViewMall:setEnabled(true)
                self.scrollViewGiftPack:setEnabled(false)
                self:ShowMall()
                self.bg:setVisible(true)
            elseif index == 2 then
                self.scrollViewRecruit:setEnabled(false)
                self.recruitTopLayout:setEnabled(false)
                self.scrollViewMall:setEnabled(false)
                self.scrollViewGiftPack:setEnabled(true)
                self:ShowGiftPack()
                self.bg:setVisible(true)
            end
            self.tabIdx = index
        end
    end
    self.tab = Tab:create()
    self.tab.layer:setAnchorPoint(ccp(0,0))
    self.tab.layer:setPosition(ccp(180,0))
    self.menuNode:addNode(self.tab.layer)
    self.tab:addItemAndText("images/btn/dark_yeqian.png","images/btn/hight_yeqian.png",LStr("TID_HELP_NAME15"),24,{0,-3})
    self.tab:addItemAndText("images/btn/dark_yeqian.png","images/btn/hight_yeqian.png",LStr("TID_TEAMUI_66"),24,{0,-3})
    self.tab:addItemAndText("images/btn/dark_yeqian.png","images/btn/hight_yeqian.png",LStr("TID_SHANGCHENG_20"),24,{0,-3})
    self.tab:setClickEvent(tabHandle)
    self.tab:tab(10)
end        