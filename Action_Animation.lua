--瞬间动作
	local p = cc.p(math.random() * size.width, math.random() * size.height)
	sprite:runAction(cc.Place:create(p))--移动到指定位置
	sprite:runAction(cc.FlipX:create(true))
	sprite:runAction(cc.FlipY:create(true))
	sprite:runAction(cc.Hide:create())
	sprite:runAction(cc.Show:create())
	sprite:runAction(cc.ToggleVisibility:create())--将对象显示/隐藏切换

    acReverse = action:reverse()--相反动作
    acClone = action:clone()--复制动作
    acDone = action:isDone()--如果动作结束，会返回true。在Follow, RepeatForever, Speed, Repeat, ActionInterval, and ActionInstant重定义了
    target = action:getTarget()--返回执行的对象
    action:setTarget(target)--在执行过程中更换对象
    action:setTag(tag)--设置标识
--间隔动作
	sprite:runAction(cc.MoveTo:create(2,cc.p(-50, -50)))--移动
    sprite:runAction(cc.MoveBy:create(2,cc.p(-50, -50)))
    sprite:runAction(cc.JumpTo:create(2,cc.p(150, 50),30,5))--跳跃，第二个参数是最终位置，第三个参数是高度，第四个参数是次数
    sprite:runAction(cc.JumpBy:create(2,cc.p(100, 100),30,5))--cc.p(100, 100)是移动的总距离
    sprite:runAction(cc.ScaleTo:create(2, 4))--只在原精灵的基础上拉伸指定倍数
    sprite:runAction(cc.ScaleBy:create(2, 0.5))--考虑到原来对精灵的拉伸
    sprite:runAction(cc.RotateTo:create(2,180))
    sprite:runAction(cc.RotateBy:create(2,-180))
    sprite:runAction(cc.Blink:create(3, 5))--闪烁,第一个参数是时间，第二个参数是次数
    sprite:runAction(cc.TintTo:create(2, 255, 0, 0))--第一个参数是持续时间，后面三个参数是色值
    sprite:runAction(cc.TintBy:create(0.5,0, 255, 255))
    sprite:runAction(cc.FadeTo:create(1, 80))--80表示不透明的占80%
    local bezier = {
        cc.p(0, 240),--第一控制点
        cc.p(300, 240),--第二控制点
        cc.p(100, 100)--结束点
    }
    sprite:runAction(cc.BezierBy:create(3,bezier))--贝塞尔曲线动作

    sprite:setOpacity(10)--取值0~255
    sprite:runAction(cc.FadeIn:create(5))--渐显，5是持续时间
    sprite:runAction(cc.FadeOut:create(5))--渐弱

--组合动作
	ac1 = cc.MoveTo:create(2,cc.p(size.width - 100, size.height - 100))
	ac2 = cc.RotateTo:create(2, 40)

	sprite:runAction(cc.Spawn:create(ac1,ac2))--同时执行
	seq = cc.Sequence:create(ac1, ac2)--按顺序执行
	sprite:runAction(cc.Repeat:create(seq,3))--重复执行3次
    sprite:runAction(cc.RepeatForever:create(seq))--无限重复


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
	local function CallBack1()--默认传pSender，必须用pSender，否则动作不执行
                                --函数动作会和下个动作一起执行
	    sprite:runAction(cc.TintBy:create(0.5, 255, 0, 255))
	end
    local acf = cc.CallFunc:create(CallBack1)


    local function CallBack3(pSender, table)--pSender是精灵本身，table是函数调用时传过来的
    	local sp = pSender
	    sp:runAction(cc.TintBy:create(table[1], table[2], table[3], table[4]))
	end
	function MyActionScene:OnCallFuncND()
	    local ac1 = cc.MoveBy:create(2, cc.p(100, 100))
	    local ac2 = ac1:reverse()
	    local acf = cc.CallFunc:create(CallBack3, { 1, 255, 0, 255 })
	    sprite:runAction(cc.Sequence:create(ac1, acf, ac2))
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