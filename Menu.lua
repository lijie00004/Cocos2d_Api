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
    menuLabel:setString(string)--getString()
    menuLabel:getDisabledColor()--获取禁用项时将使用的颜色。
    menuLabel:setDisabledColor(color3b)--(getDisabledColor())设置禁用颜色
    menuLabel:setLabel(node)--getLabel()
    menuLabel:activate()--Activate the item.
    menuLabel:selected()--(unselected())可以设置item处理选中状态
    menuLabel:setEnabled(boolean)--false时，就会显示setDisabledColor
    menuLabel:initWithLabel(node,callback)
    local function callback(tag, menuItemSender)
        --tag为menuItem设置的标签 ，menuItem为相应对象
    end
    local function callback(sender)
    end
    menuItem:registerScriptTapHandler(callback)
   
--精灵与图片菜单
    SpriteMenuItem = cc.MenuItemSprite:create(sprite,sprite_1,sprite_2)--三个参数不能是同一个节点
    SpriteMenuItem:setEnabled(false)--禁用，如果有disabledImage,会显示disabledImage
    SpriteMenuItem:selected()--(unselected())显示selectedImage
    SpriteMenuItem:setPosition(cc.p(100,0))--可设，可不设,设置位移太大，会导致无法响应事件

    ImageMenuItem = cc.MenuItemImage:create(
        "menu/setting-up.png",
        "menu/setting-down.png")



--开关菜单
    local soundToggleMenuItem = cc.MenuItemToggle:create(on_ImageMenuItem,off_ImageMenuItem)
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
  