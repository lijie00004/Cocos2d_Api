--创建LoadingBar
    loadingBar = ccui.LoadingBar:create("progressbar.png")
    loadingBar:setPosition(size.width / 2, size.height / 2 + loadingBar:getContentSize().height / 2.0)
    loadingBar:setDirection(ccui.LoadingBarDirection.LEFT)--(从左到右)RIGHT(从右到左)

    layer:addChild(loadingBar)
    local count = 0

    local function update(dt)        
        count = count + 1
        if count > 100 then 
            count = 0
        end
        loadingBar:setPercent(count)
    end
    layer:scheduleUpdateWithPriorityLua(update,0)