--瞬间动作
	local p = cc.p(math.random() * size.width, math.random() * size.height)
	sprite:runAction(cc.Place:create(p))--移动到制定位置
	sprite:runAction(cc.FlipX:create(true))
	sprite:runAction(cc.FlipY:create(true))
	sprite:runAction(cc.Hide:create())
	sprite:runAction(cc.Show:create())
	sprite:runAction(cc.ToggleVisibility:create())--将对象显示/隐藏切换

--间隔动作
	sprite:runAction(cc.MoveTo:create(2,cc.p(-50, -50)))
    sprite:runAction(cc.MoveBy:create(2,cc.p(-50, -50)))
    sprite:runAction(cc.JumpTo:create(2,cc.p(150, 50),30,5))
    sprite:runAction(cc.JumpBy:create(2,cc.p(100, 100),30,5))

    local bezier = {
        cc.p(0, 240),--第一控制点
        cc.p(300, 240),--第二控制点
        cc.p(100, 100)--结束点
    }
    sprite:runAction(cc.BezierBy:create(3,bezier))--贝塞尔曲线动作

    sprite:runAction(cc.ScaleTo:create(2, 4))
    sprite:runAction(cc.ScaleBy:create(2, 0.5))
    sprite:runAction(cc.RotateTo:create(2,180))
    sprite:runAction(cc.RotateBy:create(2,-180))
    sprite:runAction(cc.Blink:create(3, 5))--闪烁
    sprite:runAction(cc.TintTo:create(2, 255, 0, 0))--染色，后面三个参数是色值
    sprite:runAction(cc.TintBy:create(0.5,0, 255, 255))
    sprite:runAction(cc.FadeTo:create(1, 80))--80表示不透明的占80%

    sprite:setOpacity(10)--取值0~255
    sprite:runAction(cc.FadeIn:create(5))--渐显，5是持续时间

    sprite:runAction(cc.FadeOut:create(5))--渐弱

--组合动作
	local ac1 = sprite:runAction(cc.MoveTo:create(2,cc.p(size.width - 100, size.height - 100)))
	local ac2 = sprite:runAction(cc.RotateTo:create(2, 40))
	sprite:runAction(cc.Spawn:create(ac1,ac2))--同时执行

	local ac1 = sprite:runAction(cc.MoveTo:create(2,cc.p(size.width - 100, size.height - 100)))
	local ac2 = sprite:runAction(cc.JumpBy:create(2,cc.p(10, 10), 20,5))
	local ac3 = sprite:runAction(cc.JumpBy:create(2,cc.p(-10, -10),20,3))
	local seq = cc.Sequence:create(ac1, ac2, ac3)--按顺序执行
	sprite:runAction(cc.Repeat:create(seq,3))--重复执行指定次数

	local bezier = {
        cc.p(0, size.height / 2),
        cc.p(10, - size.height / 2),
        cc.p(10,20)
    }
    local ac1 = sprite:runAction(cc.BezierBy:create(2,bezier))
    local ac2 = sprite:runAction(cc.TintBy:create(0.5, 0, 255, 255))
    local ac1Reverse = ac1:reverse()
    local ac2Repeat = sprite:runAction(cc.Repeat:create(ac2, 4))
    local ac3 = sprite:runAction(cc.Spawn:create(ac1,ac2Repeat))
    local ac4 = sprite:runAction(cc.Spawn:create(ac1Reverse,ac2Repeat))
    local seq = cc.Sequence:create(ac3, ac4)
    sprite:runAction(cc.RepeatForever:create(seq))--无限重复

    local ac1 = sprite:runAction(cc.MoveBy:create(2,cc.p(40, 60)))
    local ac2 = ac1:reverse()--反动作
    local seq = cc.Sequence:create(ac1, ac2)
    sprite:runAction(cc.Repeat:create(seq,2))

--动作速度控制
	local ac1 = cc.MoveBy:create(2, cc.p(200, 0))
    local ac2 = ac1:reverse()
    local ac = cc.Sequence:create(ac1, ac2)

    sprite:runAction(cc.EaseIn:create(ac, 3))--以三倍速度由慢到快
    sprite:runAction(cc.EaseOut:create(ac, 3))--三倍速度由快到慢
    sprite:runAction(cc.EaseInOut:create(ac, 3))--三倍速度由慢到快再由快到慢
    sprite:runAction(cc.EaseSineIn:create(ac))--采用正弦变换速度由慢到快
    sprite:runAction(cc.EaseSineOut:create(ac))--采用正弦变换速度由快到慢
    sprite:runAction(cc.EaseSineInOut:create(ac))--采用正弦变换速度由慢到快再由快到慢
    sprite:runAction(cc.EaseExponentialIn:create(ac))--采用指数变换速度由慢到快
    sprite:runAction(cc.EaseExponentialOut:create(ac))--采用指数变换速度由快到慢
    sprite:runAction(cc.EaseExponentialInOut:create(ac))--采用指数变换速度由慢到快再由快到慢
    sprite:runAction(cc.Speed:create(ac, (math.random() * 5)))--随机设置变换速度

--函数调用
	local function CallBack1()
	    sprite:runAction(cc.TintBy:create(0.5, 255, 0, 255))
	end
	local ac1 = cc.MoveBy:create(2, cc.p(100, 100))
    local ac2 = ac1:reverse()
    local acf = cc.CallFunc:create(CallBack1)
    local seq = cc.Sequence:create(ac1, acf, ac2)
    sprite:runAction(cc.Sequence:create(seq))

    local function CallBack3(pSender, table)--pSender是精灵本身，table是函数调用时传过来的
    	local sp = pSender
	    cclog("CallBack3 %d", table[1])
	    sp:runAction(cc.TintBy:create(table[1], table[2], table[3], table[4]))
	end

	function MyActionScene:OnCallFuncND()
	    local ac1 = cc.MoveBy:create(2, cc.p(100, 100))
	    local ac2 = ac1:reverse()
	    local acf = cc.CallFunc:create(CallBack3, { 1, 255, 0, 255 })
	    local seq = cc.Sequence:create(ac1, acf, ac2)
	    sprite:runAction(cc.Sequence:create(seq))
	end

--帧动画
	local spriteFrame  = cc.SpriteFrameCache:getInstance()
    spriteFrame:addSpriteFrames("run.plist")

    local sprite = cc.Sprite:createWithSpriteFrameName("h1.png")
    sprite:setPosition(cc.p(size.width/2, size.height/2))
    layer:addChild(sprite)

    local animation = cc.Animation:create()--动画开始
    for i=1,4 do
        local frameName = string.format("h%d.png",i)
        cclog("frameName = %s",frameName)
        local spriteFrame = spriteFrame:getSpriteFrameByName(frameName)
        animation:addSpriteFrame(spriteFrame)
    end

    animation:setDelayPerUnit(0.15)           --设置两个帧播放时间
    animation:setRestoreOriginalFrame(true)    --动画执行后还原初始状态

    local action = cc.Animate:create(animation)
    sprite:runAction(cc.RepeatForever:create(action))


    sprite:stopAllActions()--停止动画