--cocos2d-x-2
	local label= Label:create()
	label:setFontName(LFont())
	label:setText(bigNumSwith(CurPlayer.gonghui_gold))
	label:setFontSize(18)
	label:setColor(cc.c3b(248,251,15))
	label:enableStroke(cc.c3b(131,67,17),0.5)

	label:setTextAreaSize(CCSize(420,50))--可有可无
	label:ignoreContentAdaptWithSize(false)
	label:setSize(CCSize(420, 50))
	     
	label:setTextHorizontalAlignment(kCCTextAlignmentLeft)--设置文本水平对齐方式--Right--Center
	label:setTextVerticalAlignment(kCCVerticalTextAlignmentCenter)--设置文本垂直对齐方式--垂直文本对齐中心

--cocos2d-x-3
--创建Label
--配置
	cc.c4b(255,255,255,255) == cc.c3b(255,255,255)
	local ttfConfig  = {}
    ttfConfig.fontFilePath="fonts/Marker Felt.ttf"
    ttfConfig.fontSize = 20
    ttfConfig.outlineSize = 2--描边距离
	local label = cc.Label:create()
	local label_system = cc.Label:createWithSystemFont(text,font,fontSize)--"HelloWorld", "Arial", 36
	local label_TTF = cc.Label:createWithTTF(text,fontFilePath,fontSize)--"HelloWorld", "fontFile", 36
	local label_TTF = cc.Label:createWithTTF(ttfConfig,text)
	local label_BMFont = cc.Label:createWithBMFont(bmfontPath,text)--"fonts/BMFont.fnt", "Hello World"
	local label_CharMap = cc.Label:createWithCharMap(charMapFile,itemWidth,itemHeight,startCharMap)--("lab_3.png", 27, 27, string.byte(’/’))

	label:setString("HelloLua\nHelloCocos")
	label:getString()
	label:getStringNumLines()--获取行数
	label:getStringLength()--获取字符长度，换行符也算一个字符
	label:setTextColor(cc.c3b(60,60,60))
	label:enableShadow(cc.c3b(255,255,255), cc.size(4, -4))--阴影
	label:enableOutline(cc.c3b(0, 0, 0),2)--轮廓，在电脑上仅支持TTF，系统字体仅手机支持
	label:enableGlow(cc.c3b(0, 0, 0))--发光，仅支持TTF
	label:setLineBreakWithoutSpace(boolean)--(失效，和setWidth配合）是否开启自动换行
	label:setMaxLineWidth(int)--最大行宽,仅支持TTF自动换行,超出看不见
	label:setWidth(int)--Label宽，仅支持TTF自动换行
	label:setHeight(int)--Label高
	label:setDimensions(int)--只有大于内容尺寸，设置对齐方式才起作用。仅支持TTF自动换行，超出看不见
	label:setLineHeight(int)--Sets the line height of the Label.Not support system font.
	label:setAdditionalKerning(int)--设置文字间距,Not support system font
	label:getLetter(int)--(sprite)获取第int个位置上的字符,从0开始.提供了一种将每个角色视为精灵的方法。
	label:enableItalics()--倾斜（幅度很小）
	label:enableBold()--开启粗体
	label:enableUnderline()--开启下划线
	label:enableStrikethrough()--开启删除线
	label:disableEffect()--禁用应用于标签的所有效果
	label:setBMFontSize(10)
	label:enableWrap(false)--禁止换行(default true)
	label:updateContent()--Update content immediately.
	label:setOpacityModifyRGB(boolean)--如果您希望不透明度影响颜色属性，则将其设置为true。
	label:updateDisplayedColor(c3b)--更新节点显示的颜色及其父颜色。
	label:updateDisplayedOpacity(int)--用节点的父节点不透明度更新节点显示的不透明度;。
	label:getContentSize()--返回节点的未转换大小
	label:setSystemFontName(font)
	label:setSystemFontSize(float)
	
	label:setAlignment(hAlignment,vAlignment)--(可以用0 1 2)cc.TEXT_ALIGNMENT_LEFT TOP
	label:setHorizontalAlignment(hAlignment,vAlignment)--cc.TEXT_ALIGNMENT_CENTER
	label:setVerticalAlignment(hAlignment,vAlignment)--cc.TEXT_ALIGNMENT_RIGHT BOTTOM


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

