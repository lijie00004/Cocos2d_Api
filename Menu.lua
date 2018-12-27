--cocos2d-x-3
--创建菜单项
local function OnClickMenu(tag,menuItemSender)--tag为menuItem设置的标签setTag,menuItemSender为相应对象
    cclog("content = %s",content)
end
local pItmLabel = cc.Label:createWithBMFont("fonts/fnt8.fnt","Test ResourcesDirInfo")
local pItmMenu = cc.MenuItemLabel:create(pItmLabel)
pItmMenu1:registerScriptTapHandler(OnClickMenu)

local mn = cc.Menu:create()--创建一个空菜单
local mn = cc.Menu:create(pItmMenu1,pItmMenu2)--用多个菜单项创建一个菜单
local mn = cc.Menu:create(Array)--Array是数组

mn:alignItemsVertically()--垂直方向默认间隙排列
mn:alignItemsHorizontally()--水平
mn:alignItemsVerticallyWithPadding(100)--垂直排列间距
mn:alignItemsHorizontallyWithPadding(100)--水平