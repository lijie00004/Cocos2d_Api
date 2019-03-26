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

layout:requestDoLayout()--刷新布局


--Layout之绝对布局
layout:setLayoutType(ccui.LayoutType.ABSOLUTE)
ccui.LayoutType ={
	ABSOLUTE = 0, --绝对布局 只有在绝对布局内部，组件使用setPosition()方法来指定其位置，另外三种布局中的组件，setPosition()方法将不起任何作用！
	VERTICAL = 1, --垂直平铺
	HORIZONTAL = 2, --横向平铺
	RELATIVE = 3, --相对布局
}




ccui.LinearGravity ={
	none = 0,
	left = 1, --左侧对齐
	top = 2, --顶部对齐
	right = 3, --右侧对齐
	bottom = 4, --底部对齐
	centerVertical = 5, --垂直居中对齐线性布局
	centerHorizontal = 6, --水平居中对齐线性布局
}

--Layout之垂直平铺
--LinearLayoutParameter线性布局参数 它是专门为线性排列元素用线性布局管理器，
--通过该类可以指示子控件在水平方向的定位规则，即X坐标。
--如果垂直方向Layout容器中已定，那么只有决定X坐标的，Left，Right，Center有效。
local layout = ccui.Layout:create()
layout:setLayoutType(ccui.LayoutType.VERTICAL)
local lp1 = ccui.LinearLayoutParameter:create()
lp1:setGravity(ccui.LinearGravity.centerHorizontal)
lp1:setMargin({ left = 0, top = 5, right = 0, bottom = 10 })

local lp2 = ccui.LinearLayoutParameter:create()
lp2:setGravity(ccui.LinearGravity.centerHorizontal)
lp2:setMargin({left = 0, top = 10, right = 0, bottom  = 10} )

local lp3 = ccui.LinearLayoutParameter:create()
lp3:setGravity(ccui.LinearGravity.centerHorizontal)
lp3:setMargin({ left = 0, top = 10, right = 0, bottom  = 10 } )

button_1:setLayoutParameter(lp1)
button_2:setLayoutParameter(lp2)
button_3:setLayoutParameter(lp3)
layout:addChild(button)

--Layout之横向平铺
--LinearLayoutParameter线性布局参数 它是专门为线性排列元素用线性布局管理器
--通过该类可以指示子控件在垂直方向的定位规则，即Y坐标。
--如果水平方向Layout容器中已定，那么只有决定Y坐标的，Top，Bottom，Center有效。
local layout = ccui.Layout:create()
layout:setLayoutType(ccui.LayoutType.HORIZONTAL)

local lp1 = ccui.LinearLayoutParameter:create()
lp1:setGravity(ccui.LinearGravity.top)
lp1:setMargin({left = 0, top  = 10, right = 0, bottom = 10} )

local lp2 = ccui.LinearLayoutParameter:create()
lp2:setGravity(ccui.LinearGravity.centerVertical)
lp2:setMargin({left = 0,top = 10,right = 0,bottom = 50})

local lp3 = ccui.LinearLayoutParameter:create()
lp3:setGravity(ccui.LinearGravity.bottom)
lp3:setMargin({left = 0, top = 10, right = 0, bottom = 10})
