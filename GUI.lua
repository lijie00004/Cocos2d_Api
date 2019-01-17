-- RadioButton
    local function onChangedRadioButtonGroup(sender, index, eventType)
        cclog("RadioButton" .. index .. " Clicked")
    end

    -- 创建RadioButtonGroup对象
    local radioButtonGroup = ccui.RadioButtonGroup:create()
    layer:addChild(radioButtonGroup)--radioButtonGroup和radioButton都要添加到当前层

    -- 创建RadioButton
    for i = 0, 4 do
        local radioButton = ccui.RadioButton:create("icon/btn_radio_off_holo.png", "icon/btn_radio_on_holo.png")
        local posX = 200+ 5 * i
        radioButton:setPosition(posX, size.height / 2 + 10)
        radioButtonGroup:addRadioButton(radioButton)
        --radioButtonGroup与radioButton都可以添加事件监听器
        radioButtonGroup:addEventListener(onChangedRadioButtonGroup)
        layer:addChild(radioButton)
    end



--CheckBox
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
    --添加事件监听器
    ckb:addEventListener(onChangedCheckBox)
    layer:addChild(ckb)
    --创建Text对象，显示CheckBox选中状态
    label2 = ccui.Text:create("CheckBox Unselected", "fonts/Marker Felt.ttf", 24)
    posX, posY = ckb:getPosition()
    label2:setPosition(cc.p(posX, posY - 60))
    layer:addChild(label2)



--LoadingBar加载进度条
    loadingBar = ccui.LoadingBar:create("progressbar.png")
    loadingBar:setPosition(size.width / 2, size.height / 2)
    loadingBar:setDirection(ccui.LoadingBarDirection.LEFT)--(从左到右)RIGHT(从右到左)
    local count = 0
    local function update(dt)        
        count = count + 1
        if count > 100 then 
            count = 0
        end
        loadingBar:setPercent(count)--0~100
    end
    layer:scheduleUpdateWithPriorityLua(update,0)



--Slider滑块控件
    local function onChangedSlider(sender, eventType)--滑块对象，事件类型
        if eventType == ccui.SliderEventType.percentChanged then --滑块值改变事件
            local percent = slider:getPercent()
            label2:setString(percent)
        end        
    end

    --创建滑块控件
    slider = ccui.Slider:create()
    --加载滑杆纹理
    slider:loadBarTexture("sliderTrack.png")--加载滑杆纹理
    --加载滑块按钮纹理
    slider:loadSlidBallTextures("sliderThumb.png", "sliderThumb.png", "")--加载滑块按钮纹理，第一个是正常，第二个是按下，第三个是不可用
    --加载滑块进度栏纹理
    slider:loadProgressBarTexture("sliderProgress.png")--滑块进度栏纹理
    --The max percent of Slider.
    slider:setMaxPercent(1000)--0~1000，默认是0~100
    slider:addEventListener(onChangedSlider)
    layer:addChild(slider)

    --创建Text对象，显示CheckBox选中状态
    label2 = ccui.Text:create("0", "fonts/Marker Felt.ttf", 24)
    posX, posY = slider:getPosition()
    label2:setPosition(cc.p(posX, posY - 100))
    layer:addChild(label2)