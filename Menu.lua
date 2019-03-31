
--Menu是继承至Layer，也就继承了触摸的相关事件，而MenuItem只是从Node继承而来，并不响应触摸，因此无法调用回调函数
--Menu的默认原点坐标为屏幕正中心
--MenuItem的位置是相对于Menu层的偏移位置
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
    --cc.MenuItemToggle:create参数不限
    local toggleMenuItem = cc.MenuItemToggle:create参数不限(on_ImageMenuItem,off_ImageMenuItem)
    local function toggleCallback(tag,sender)
        print(tag)--soundToggleMenuItem的tag
        sender:setSelectedIndex(0)
    end
    toggleMenuItem:registerScriptTapHandler(toggleCallback)
    local mn = cc.Menu:create(toggleMenuItem)

    toggleMenuItem:addSubItem(menuItem)--Add a menu item
    toggleMenuItem:getSelectedItem()--Return the selected item.
    toggleMenuItem:getSelectedIndex()--Gets the index of the selected item.
    toggleMenuItem:setSelectedIndex(index)--Sets the index of the selected item.
    toggleMenuItem:getSubItems()--Gets the array that contains the subitems.
        --You can add/remove items in runtime, and you can replace the array with a new one.
    toggleMenuItem:setSubItems(array)--Sets the array that contains the subitems.

    toggleMenuItem:activate()--The item was selected (not activated), similar to "mouse-over".
    toggleMenuItem:selected()--Activate the item.
    toggleMenuItem:unselected()--The item was unselected.
    toggleMenuItem:setEnabled()--Enables or disables the item.
    toggleMenuItem:cleanup()--Stops all running actions and schedulers. 