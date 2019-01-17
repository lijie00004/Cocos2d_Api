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
	label:disableEffect()--清楚文本所有效果
	label:enableBold()--开启粗体
	label:enableUnderline()--开启下划线
	label:enableStrikethrough()--开启删除线
	label:enableShadow(cc.c4b(255,255,255,128), cc.size(4, -4))--阴影,也可用ccc3(132,38,5), cc.size(2,-2)
	label:getString()
	label:getStringNumLines()--获取行数
	label:getStringLength()--获取字符长度，换行符也算一个字符
	label:setString("HelloLua\nHelloCocos")
	label:setTextColor(ccc3(60,60,60))
	label:setBMFontSize(10)
	label:setSystemFontName(font)
	label:setSystemFontSize(float)
	label:setDimensions(20,200)--类似遮罩大小
	label:setContentSize(20,200)--没用
	label:enableOutline(cc.c4b(0, 0, 0, 255),2)--用ttf字体可以显示描边，其它的只能在手机上显示，电脑上不显示
		--enableOutline(ccc3(132,38,5),2)--也可

	--设置水平方向对齐方式
	label:setAlignment(cc.TEXT_ALIGNMENT_LEFT)
	label:setAlignment(cc.TEXT_ALIGNMENT_CENTER)
	label:setAlignment(cc.TEXT_ALIGNMENT_RIGHT)

	label = cc.Label:create()
	label = cc.Label:createWithSystemFont("HelloWorld", "Arial", 36)
	label = cc.Label:createWithTTF("HelloWorld", "fontFile", 36)
	label = cc.Label:createWithBMFont("fonts/BMFont.fnt", "Hello World")
	label = cc.LabelAtlas:create("HelloWorld", 
						"fonts/tuffy_bold_italic-charmap.png", 48, 66, string.byte(" "))
	--tuffy_bold_italic-charmap是文字图片，48字符高度，66字符宽度，string.byte(" ")开始字符


	label = ccui.TextBMFont:create("Hello World", "fonts/BMFont.fnt")
	label = ccui.Text:create("Hello World", "fonts/Marker Felt.ttf", 24)--可以展示系统字体和TTF字体

	--配置
	ttfConfig  = {}
    ttfConfig.fontFilePath="fonts/Marker Felt.ttf"
    ttfConfig.fontSize = 20
    ttfConfig.outlineSize = 2--描边距离
    label = cc.Label:createWithTTF(ttfConfig, "Hello World1")



    --创建RichText对象，可以显示文本，图片等超文本，还可以设置文本的字体、颜色和链接
	richText = ccui.RichText:create()
	--设置是否忽略用户定义的内容大小
	richText:ignoreContentAdaptWithSize(false)
	--设置内容大小
	richText:setContentSize(cc.size(423,370))

	--创建文本类型的RichElement对象
	local re1 = ccui.RichElementText:create(1, cc.c3b(0, 255, 0), 255, "Hello World", "fonts/Marker Felt.ttf", 20)
	local re2 = ccui.RichElementText:create(2, cc.c3b(255, 0, 0), 255, "Last one is red ", "Helvetica", 20)
	--创建图片类型的RichElement对象
	local re3 = ccui.RichElementImage:create(3, cc.c3b(255, 0, 0), 255, "CloseSelected.png")--第一个参数是tag，第二个元素是色值，第三个元素是opacity
	--创建换行RichElement对象
	local newLine = ccui.RichElementNewLine:create(77, cc.c3b(255, 255, 255), 255)--第一个参数是tag，第二个元素是色值，第三个元素是opacity

	richText:pushBackElement(re1)--末尾添加元素
	richText:pushBackElement(newLine)--相当于\n
	richText:pushBackElement(re2)	
	richText:pushBackElement(re3)
	richText:pushBackElement(newLine)

	richText:removeElement(4)--删除指定位置元素
	richText:removeElement(re3)--删除指定名字元素

	richText:insertElement(newLine, 3)--插入元素

