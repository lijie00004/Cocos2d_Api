--cocos2d-x-2
	local label= Label:create()
	label:setFontName(LFont())
	label:setText(bigNumSwith(CurPlayer.gonghui_gold))
	label:setFontSize(18)
	label:setColor(ccc3(248,251,15))
	label:enableStroke(ccc3(131,67,17),0.5)

	label:setTextAreaSize(CCSize(420,50))--自动换行
	label:ignoreContentAdaptWithSize(false)
	label:setSize(CCSize(420, 50))
	     
	label:setTextHorizontalAlignment(kCCTextAlignmentLeft)--设置文本水平对齐方式--Right
	label:setTextVerticalAlignment(kCCVerticalTextAlignmentCenter)--设置文本垂直对齐方式--垂直文本对齐中心

--cocos2d-x-3
	local label = cc.Label:createWithSystemFont("HelloWorld", "Arial", 36)
	--创建Text对象
	local label = ccui.Text:create("Hello World", "fonts/Marker Felt.ttf", 24)
	--设置文本颜色
	label:setColor(cc.c3b(159, 168, 176))
	label:setPosition(size.width/2, size.height - label:getContentSize().height)
	layer:addChild(label)

	--创建TextBMFont对象
	local textBMFont = ccui.TextBMFont:create("Hello World", "fonts/BMFont.fnt")
	--设置缩放
	textBMFont:setScale(0.8)

	--创建RichText对象，可以显示文本，图片等超文本，还可以设置文本的字体、颜色和链接
	local richText = ccui.RichText:create()
	--设置是否忽略用户定义的内容大小
	richText:ignoreContentAdaptWithSize(false)
	--设置内容大小
	richText:setContentSize(cc.size(200, 200))

	--创建文本类型的RichElement对象
	local re1 = ccui.RichElementText:create(1, cc.c3b(0, 255, 0), 255, "Hello World", "fonts/Marker Felt.ttf", 20)
	local re2 = ccui.RichElementText:create(2, cc.c3b(255, 0, 0), 255, "Last one is red ", "Helvetica", 20)
	--创建图片类型的RichElement对象
	local re3 = ccui.RichElementImage:create(3, cc.c3b(255, 0, 0), 255, "CloseSelected.png")
	--创建换行RichElement对象
	local newLine = ccui.RichElementNewLine:create(77, cc.c3b(255, 255, 255), 255)

	richText:pushBackElement(re1)
	richText:pushBackElement(newLine)--换行作用
	richText:pushBackElement(re2)	
	richText:pushBackElement(re3)
	richText:pushBackElement(newLine)
	


	richText:removeElement(4)--可以传数字，也可以传名字
	richText:removeElement(re3)

	richText:insertElement(newLine, 3)

