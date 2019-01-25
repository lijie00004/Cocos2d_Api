--cocos2d-x-3
--文本菜单
    --用节点创建
        local function OnClickMenu(tag, menuItemSender)
            cclog("tag = %d", tag)
            actionFlag = menuItemSender:getTag()
        end
        local pItmLabel1 = cc.Label:createWithBMFont("fonts/fnt8.fnt", "Explosion")
        local pItmMenu1 = cc.MenuItemLabel:create(pItmLabel1)
        pItmMenu1:setTag(tag)
        pItmMenu1:registerScriptTapHandler(OnClickMenu)

    --用string创建
        cc.MenuItemFont:setFontName("Times New Roman")
        cc.MenuItemFont:setFontSize(86)
        local item1 = cc.MenuItemFont:create("Start")
        local function menuItem1Callback(sender)
            cclog("Touch Start Menu Item.")
        end
        item1:registerScriptTapHandler(menuItem1Callback)
        local mn = cc.Menu:create(item1)
        layer:addChild(mn)


--public function
    mn = cc.Menu:create(Array)--Array是数组

	mn:alignItemsVertically()--垂直方向
	mn:alignItemsHorizontally()--水平
	mn:alignItemsVerticallyWithPadding(100)--垂直排列间距
	mn:alignItemsHorizontallyWithPadding(100)--水平
	mn:alignItemsInColumns(3, 3, 3, 3, 3)--三列五行

    mu:isEnabled()--判断是否开启
    mu:setEnabled(false)--无法交互

   
--精灵与图片菜单
    local sprite = cc.Sprite:create("blue_tiles.png")
    SpriteMenuItem = cc.MenuItemSprite:create(sprite,sprite_1,sprite_2)--三个参数不能是同一个节点
    SpriteMenuItem:setEnabled(false)--禁用，如果有disabledImage,会显示disabledImage
    SpriteMenuItem:selected()--显示selectedImage
    SpriteMenuItem:unselected()--显示unselectedImage
    SpriteMenuItem:setPosition(cc.p(100,0))--可设，可不设,设置位移太大，会导致无法响应事件
    local menu = cc.Menu:create(SpriteMenuItem)--方法一
    menu:addChild(SpriteMenuItem)--方法二
    menu:setPosition(cc.p(0,0))

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
  