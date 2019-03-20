mn = cc.Menu:create()--or create(menuItem)
mn:addChild(menuItem,localZOrder,tag)
mn:alignItemsVertically()--垂直方向
mn:alignItemsHorizontally()--水平
mn:alignItemsVerticallyWithPadding(100)--垂直排列间距
mn:alignItemsHorizontallyWithPadding(100)--水平
mn:alignItemsInColumns(3, 3, 3, 3, 3)--三列五行
mn:alignItemsInRows(3, 3, 3, 3, 3)--五列三行
mu:setEnabled(false)--无法交互
--文本菜单
    local menuLabel = cc.MenuItemLabel:create(menuItemLabel)
    menuLabel:setString(string)
    menuLabel:getString(color3b)
    menuLabel:getDisabledColor()--获取禁用项时将使用的颜色。
    menuLabel:setDisabledColor()
    menuLabel:getLabel()
    menuLabel:setLabel(node)
    menuLabel:activate()--Activate the item.
    menuLabel:selected()--可以设置item处理选中状态
    menuLabel:unselected()
    menuLabel:setEnabled(boolean)--false时，就会显示setDisabledColor
    menuLabel:initWithLabel(node,callback)
    local function callback(tag, menuItemSender)
        --tag为menuItem设置的标签 ，menuItem为相应对象
    end
    local function callback(sender)
    end
    menuItem:registerScriptTapHandler(callback)
   
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
  