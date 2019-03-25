--old version
local function buttonEvent(sender,eventType)
    if eventType == TOUCH_EVENT_BEGAN then
        startPos = ccp(btn_bg:getPosition())
    elseif eventType == TOUCH_EVENT_MOVED then
        btn:setPosition(btn:getTouchMovePos())
    elseif eventType == TOUCH_EVENT_ENDED then
        if btn_bg:hitTest(btn:getTouchEndPos()) then--判断触摸点是否在节点范围内,超出return true
            self:change_req()--根据新数据，刷新卡牌布局
        else
            btn:setPosition(startPos)--放回原位
        end     
    end
end

local btn = Button:create()
btn:loadTextures("images/common_3/jiantou-1.png","images/common_3/jiantou-1.png")
btn:setPressedActionEnabled(true)
uiLayer:addWidget(btn)
btn:addTouchEventListener(buttonEvent)

btn:setEnabled(false)--子控件都不响应触摸
btn:setTouchEnabled(false)

--new version
btn:setBright(false)--先设置后才能显示禁止图片
btn:setTouchEnabled(false)
btn:setEnabled(false)--子控件都不响应触摸,不知道为什么会把图片隐藏

local function menuCloseCallback(sender, eventType)
    if eventType == ccui.TouchEventType.began then --手指触碰屏幕
    elseif eventType == ccui.TouchEventType.moved then --手指在屏幕上移动
    elseif eventType == ccui.TouchEventType.ended then --手指离开屏幕
    else
    end
end
local button = ccui.Button:create("CloseNormal.png", "CloseSelected.png")
button:addTouchEventListener(menuCloseCallback)
button:setPressedActionEnabled(true)

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

--输入框
    local EditBox = ccui.EditBox:create(cc.size(180, 47),image)--第一个参数是大小，第二个参数图片，可以是九宫格，也可以是正常图片
    EditBox:setMaxLength(6)--最大长度
    EditBox:setText("")--设置内容
    EditBox:getText()--获取内容
    EditBox:setFontColor(color_1)--设置内容字体颜色
    EditBox:setFont(font,font_24)--设置内容字体和大小
    EditBox:setPlaceholderFont(font,font_24)----设置提示内容字体和大小
    EditBox:setPlaceHolder("请输入账号")--设置提示内容
    EditBox:setInputFlag(cc.EDITBOX_INPUT_FLAG_PASSWORD)--内容加密（*****）
    EditBox:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)--输入内容只能是数字
    eb_account:registerScriptEditBoxHandler(function)--点击输入框，每输入一个字符和退出都会调用回调函数