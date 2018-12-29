-- RadioButton单击事件回调函数
    local function onChangedCheckBox(sender, eventType)
        cclog(eventType)
        if eventType == ccui.CheckBoxEventType.selected then
            label2:setString("CheckBox Selected")
        elseif eventType == ccui.CheckBoxEventType.unselected then
            label2:setString("CheckBox Unselected")
        end
    end
    --创建CheckBox对象
    local ckb = ccui.CheckBox:create("icon/btn_check_off_holo.png", "icon/btn_check_on_holo.png")
    --设置CheckBox位置
    local posX, posY = label1:getPosition()
    ckb:setPosition(cc.p(posX, posY - 60))
    --添加事件监听器
    ckb:addEventListener(onChangedCheckBox)
    layer:addChild(ckb)

    --创建Text对象，显示CheckBox选中状态
    label2 = ccui.Text:create("CheckBox Unselected", "fonts/Marker Felt.ttf", 24)
    posX, posY = ckb:getPosition()
    label2:setPosition(cc.p(posX, posY - 60))
    layer:addChild(label2)