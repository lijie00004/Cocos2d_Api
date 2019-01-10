--cocos2d-x-3
--文本菜单
	cc.MenuItemFont:setFontName("Times New Roman")--文本字体
    cc.MenuItemFont:setFontSize(86)--字体大小
    local item1 = cc.MenuItemFont:create("Start")--创建MenuItemFont文本菜单项
    local function menuItem1Callback(sender)--点击事件
        cclog("Touch Start Menu Item.")
    end
    item1:registerScriptTapHandler(menuItem1Callback)--注册点击事件
    local  labelAtlas = cc.LabelAtlas:create("Help",
        "menu/tuffy_bold_italic-charmap.png", 48, 65, string.byte(' '))--创建Atlas文本
    local  item2 = cc.MenuItemLabel:create(labelAtlas)--通过Atlas文本创建MenuItemLabel菜单项
    local function menuItem2Callback(sender)
        cclog("Touch Help Menu Item.")
    end
    item2:registerScriptTapHandler(menuItem2Callback)

    local mn = cc.Menu:create(item1, item2)
    mn:alignItemsVertically()
    layer:addChild(mn)

	local mn = cc.Menu:create(pItmMenu1,pItmMenu2)--用多个菜单项创建一个菜单
	local mn = cc.Menu:create(Array)--Array是数组

	mn:alignItemsVertically()--垂直方向默认间隙排列
	mn:alignItemsHorizontally()--水平
	mn:alignItemsVerticallyWithPadding(100)--垂直排列间距
	mn:alignItemsHorizontallyWithPadding(100)--水平
	mn:alignItemsInColumns(3, 3, 3, 3, 3)--三列五行

--精灵与图片菜单
	local startlocalNormal = cc.Sprite:create("menu/start-up.png")
    local startlocalSelected = cc.Sprite:create("menu/start-down.png")
    local startMenuItem = cc.MenuItemSprite:create(startlocalNormal, startlocalSelected)
    local function menuItemStartCallback(sender)
        cclog("Touch Start.")
    end
    startMenuItem:registerScriptTapHandler(menuItemStartCallback)

    local settingMenuItem = cc.MenuItemImage:create(
        "menu/setting-up.png",
        "menu/setting-down.png")
    local function menuItemSettingCallback(sender)
        cclog("Touch Setting.")
    end
    settingMenuItem:registerScriptTapHandler(menuItemSettingCallback)

    local mn = cc.Menu:create(startMenuItem, settingMenuItem)

--开关菜单
	local soundOnMenuItem = cc.MenuItemImage:create("menu/on.png", "menu/on.png")
    local soundOffMenuItem = cc.MenuItemImage:create("menu/off.png", "menu/off.png")
    local soundToggleMenuItem = cc.MenuItemToggle:create(soundOnMenuItem, soundOffMenuItem)
    local function menuSoundToggleCallback(sender)
        cclog("Sound Toggle.")
    end
    soundToggleMenuItem:registerScriptTapHandler(menuSoundToggleCallback)

    local mn = cc.Menu:create(soundToggleMenuItem)