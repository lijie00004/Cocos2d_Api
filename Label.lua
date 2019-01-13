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
--创建Label
	label:setString("HelloLua\nHelloCocos")
	label:getString()
	label:getStringNumLines()--获取行数
	label:getStringLength()--获取字符长度，换行符也算一个字符
	label:setTextColor(ccc3(60,60,60))
	label:enableBold()--开启粗体
	label:enableUnderline()--开启下划线
	label:enableStrikethrough()--开启删除线
	label:disableEffect()--清楚文本所有效果
	--设置水平方向对齐方式
	label:setAlignment(cc.TEXT_ALIGNMENT_LEFT)
	label:setAlignment(cc.TEXT_ALIGNMENT_CENTER)
	label:setAlignment(cc.TEXT_ALIGNMENT_RIGHT)

	label:setBMFontSize(10)
	


	--创建系统字体标签对象
	local label = cc.Label:createWithSystemFont("HelloWorld", "Arial", 36)
	--创建TTF字体标签对象
	local label = cc.Label:createWithTTF("HelloWorld", "fontFile", 36)
	--也可
	local ttfConfig  = {}
    ttfConfig.fontFilePath="fonts/Marker Felt.ttf"
    ttfConfig.fontSize = 32
    ttfConfig.outlineSize = 4--描边距离
    local label3 = cc.Label:createWithTTF(ttfConfig, "Hello World1")
	--创建位图字体标签对象
	local label2 = cc.Label:createWithBMFont("fonts/BMFont.fnt", "Hello World")
	--创建Text对象
	local label = ccui.Text:create("Hello World", "fonts/Marker Felt.ttf", 24)
	--创建LabelAtlas对象
	local label = cc.LabelAtlas:create("HelloWorld", 
						"fonts/tuffy_bold_italic-charmap.png", 48, 66, string.byte(" "))
	--tuffy_bold_italic-charmap是文字图片，48字符高度，66字符宽度，string.byte(" ")开始字符
	--设置文本颜色
	label:setColor(cc.c3b(159, 168, 176))
	label4:enableShadow(cc.c4b(255,255,255,128), cc.size(4, -4))--阴影

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

