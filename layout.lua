--old vertion
local layout = Layout:create()
layout:setSize(CCSizeMake(480,40))
layout:setPosition(ccp(0,760))
layer:addChild(layout)


--new version
local layout = ccui.Layout:create()
layout:setBackGroundColorType(LAYOUT_COLOR_SOLID)--必须设置
layout:setBackGroundColor(cc.c3b(255,255,0))
layout:setBackGroundColorOpacity(0)--可选

layout:setClippingEnabled(true)--超出部分隐藏
layout:setContentSize(cc.size(200,100))

layout:setBackGroundImage("nd3_rank_3.png")
layout:setBackGroundImageScale9Enabled(true)
layout:setBackGroundImageCapInsets(cc.rect(40,40,40,40))
