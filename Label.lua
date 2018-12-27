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