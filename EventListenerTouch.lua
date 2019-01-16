
--单点触摸事件
    local function touchBegan(touch, event)
        -- 获取事件所绑定的 node
        local node = event:getCurrentTarget()
        -- 获取当前点击点所在相对按钮的位置坐标
        local locationInNode = node:convertToNodeSpace(touch:getLocation())--获取点击位置
        local s = node:getContentSize()
        local rect = cc.rect(0, 0, s.width, s.height)
        -- 点击范围判断检测
        if cc.rectContainsPoint(rect, locationInNode) then
            cclog("sprite x = %d, y = %d ", locationInNode.x, locationInNode.y)
            cclog("sprite tag = %d", node:getTag())
            node:runAction(cc.ScaleBy:create(0.06, 1.06))
            return true
        end
        return false
    end

    local function touchMoved(touch, event)
        cclog("touchMoved")
        local node = event:getCurrentTarget()
        local currentPosX, currentPosY = node:getPosition()
        local diff = touch:getDelta()
        --移动当前按钮精灵的坐标位置
        node:setPosition(cc.p(currentPosX + diff.x, currentPosY + diff.y))
    end

    local function touchEnded(touch, event)
        cclog("touchEnded")
        local node = event:getCurrentTarget()
        local locationInNode = node:convertToNodeSpace(touch:getLocation())
        local s = node:getContentSize()
        local rect = cc.rect(0, 0, s.width, s.height)
        -- 点击范围判断检测
        if cc.rectContainsPoint(rect, locationInNode) then
            cclog("sprite x = %f, y = %f ", locationInNode.x, locationInNode.y)
            cclog("sprite tag = %d", node:getTag())
            node:runAction(cc.ScaleTo:create(0.06, 1.0))
        end
    end

-- 创建一个事件监听器 OneByOne 为单点触摸
    local listener1 = cc.EventListenerTouchOneByOne:create()
    -- 设置是否吞没事件，在 onTouchBegan 方法返回 true 时吞没
    listener1:setSwallowTouches(true)
    -- EVENT_TOUCH_BEGAN事件回调函数
    listener1:registerScriptHandler(touchBegan, cc.Handler.EVENT_TOUCH_BEGAN)--EVENT_TOUCH_MOVED--EVENT_TOUCH_ENDED

    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    -- 添加监听器
    --设置触摸绑定node，优先级为默认的0，当节点销毁时，同时销毁添加的事件监听
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener1, boxA)--node来决定Listenter的优先级，node越靠前越优先
    local listener2 = listener1:clone()
    --指定Listenter的优先级，越小越优先,不绑定节点
    eventDispatcher:addEventListenerWithFixedPriority(listener2, 1)

    eventDispatcher:removeEventListener(listener1)--注销指定事件监听器
    eventDispatcher:removeCustomEventListeners(customEventName)--注销自定义事件监听器
    eventDispatcher:removeAllEventListeners()--注销所有事件监听器，包括菜单项