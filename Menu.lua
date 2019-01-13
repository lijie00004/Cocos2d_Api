--cocos2d-x-3
--文本菜单
    item1 = cc.MenuItemLabel:create(labelAtlas)--通过Atlas文本创建MenuItemLabel菜单项
    item2 = cc.MenuItemFont:create("Start")--创建文本菜单项
    cc.MenuItemFont:setFontName("Times New Roman")--设置文本菜单项的字体
    cc.MenuItemFont:setFontSize(86)


--public function
    mn = cc.Menu:create(item1, item2)
    mn = cc.Menu:create(Array)--Array是数组

    function menuItem1Callback(tag, sender)--点击事件
        cclog("Touch Start Menu Item.")
    end
    item:registerScriptTapHandler(menuItem1Callback)--注册点击事件

	mn:alignItemsVertically()--垂直方向
	mn:alignItemsHorizontally()--水平
	mn:alignItemsVerticallyWithPadding(100)--垂直排列间距
	mn:alignItemsHorizontallyWithPadding(100)--水平
	mn:alignItemsInColumns(3, 3, 3, 3, 3)--三列五行

   

--精灵与图片菜单
    SpriteMenuItem = cc.MenuItemSprite:create(NormalSprite, SelectedSprite)
    ImageMenuItem = cc.MenuItemImage:create(
        "menu/setting-up.png",
        "menu/setting-down.png")



--开关菜单
	local soundOnMenuItem = cc.MenuItemImage:create("menu/on.png", "menu/on.png")
    local soundOffMenuItem = cc.MenuItemImage:create("menu/off.png", "menu/off.png")
    local soundToggleMenuItem = cc.MenuItemToggle:create(soundOnMenuItem, soundOffMenuItem)
    local function menuSoundToggleCallback(sender)
        cclog("Sound Toggle.")
    end
    soundToggleMenuItem:registerScriptTapHandler(menuSoundToggleCallback)

    local mn = cc.Menu:create(soundToggleMenuItem)

    --设置选中状态
    if  defaults:getBoolForKey(MUSIC_KEY, false) then
        soundToggleMenuItem:setSelectedIndex(0)
    else
        soundToggleMenuItem:setSelectedIndex(1)
    end
  