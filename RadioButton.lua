-- RadioButton单击事件回调函数
    local function onChangedRadioButtonGroup(sender, index, eventType)
        cclog("RadioButton" .. index .. " Clicked")
    end

    -- 创建RadioButtonGroup对象
    local radioButtonGroup = ccui.RadioButtonGroup:create()
    layer:addChild(radioButtonGroup)--radioButtonGroup和radioButton都要添加到当前层

    -- 创建RadioButton
    local NUMBER_BUTTONS = 5
    local BUTTON_WIDTH  = 60--两个RadioButton中心点之间的距离
    local startPosX = size.width / 2.0 - ((NUMBER_BUTTONS - 1) / 2.0) * BUTTON_WIDTH
    for i = 0, NUMBER_BUTTONS - 1 do
        local radioButton = ccui.RadioButton:create("icon/btn_radio_off_holo.png", "icon/btn_radio_on_holo.png")
        local posX = startPosX + BUTTON_WIDTH * i
        radioButton:setPosition(posX, size.height / 2 + 10)
        radioButtonGroup:addRadioButton(radioButton)
        radioButtonGroup:addEventListener(onChangedRadioButtonGroup)

        layer:addChild(radioButton)
    end