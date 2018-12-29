 -- Slider滑动事件回调函数
    local function onChangedSlider(sender, eventType)--滑块对象，事件类型
        if eventType == ccui.SliderEventType.percentChanged then --滑块值改变事件
            local percent = slider:getPercent()
            label2:setString(percent)
        end        
    end

    --创建Text对象，显示静态文本Slider
    local label1 = ccui.Text:create("Slider", "fonts/Marker Felt.ttf", 24)
    --设置文本颜色
    label1:setColor(cc.c3b(159, 168, 176))
    label1:setPosition(size.width / 2, size.height - 100)
    layer:addChild(label1)

    --创建滑块控件
    slider = ccui.Slider:create()
    --加载滑杆纹理
    slider:loadBarTexture("sliderTrack.png")--加载滑杆纹理
    --加载滑块按钮纹理
    slider:loadSlidBallTextures("sliderThumb.png", "sliderThumb.png", "")--加载滑块按钮纹理，第一个是正常，第二个是按下，第三个是不可用
    --加载滑块进度栏纹理
    slider:loadProgressBarTexture("sliderProgress.png")--加载滑块进度栏纹理
    --The max percent of Slider.
    slider:setMaxPercent(1000)
    slider:setPosition(size.width / 2.0, size.height / 2.0)
    slider:addEventListener(onChangedSlider)
    layer:addChild(slider)

    --创建Text对象，显示CheckBox选中状态
    label2 = ccui.Text:create("0", "fonts/Marker Felt.ttf", 24)
    posX, posY = slider:getPosition()
    label2:setPosition(cc.p(posX, posY - 100))
    layer:addChild(label2)