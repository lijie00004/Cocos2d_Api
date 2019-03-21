--old version
    --动画
    local anim = Animation:create("anim/choujiang.ani", parentNode)
    anim:setFps(anim:getFps() * speed)

    local array = CCArray:create()
    array:addObject(anim)

    parent = image:getVirtualRenderer()--获取渲染节点,ImageView对渲染节点进行了一层封装
    parent:runAction(CCSequence:create(array))
    or
    parent:runAction(anim)


    local armatureDataManager = CCArmatureDataManager:sharedArmatureDataManager()
    armatureDataManager:addArmatureFileInfo("export/shouchong_daochu.ExportJson")--"images/shengfu.csb"
    local animation_1 = CCArmature:create("shouchong_daochu")
    local animation_2 = CCArmature:create("shouchong_daochu")
    animation_1:setPosition(ccp(240, 180))--energyAnim is equivalent to node
    animation_1:getAnimation():setSpeedScale(self.speed * speed * 2)
    node:addNode(energyAnim)--有时用addchild可以

    animation_1:getAnimation():playWithIndex(0)
    animation_1:getAnimation():play("sheng_2")--胜利光圈
    animation_2:getAnimation():play("sheng")--胜利文字

    

    local function finish(sender)
        energyAnim:getAnimation():stop()
        animation_1:removeFromParentAndCleanup(true)
        CCArmatureDataManager:sharedArmatureDataManager():removeArmatureFileInfo("images/naruto/csb/shengfu.csb")
        --可选
        energyAnim = nil
        layer:stopAllActions()
    end
    local array = CCArray:create()
    array:addObject(CCFadeTo:create(1,50))
    array:addObject(CCFadeTo:create(1,255))
    array:addObject(CCCallFuncN:create(finish))

    energyAnim:runAction(CCRepeatForever:create(CCSequence:create(array)))
    energyAnim:getAnimation():setMovementEventCallFunc(finish)--动画播放完后执行

    




    action:reverse()--(action)
    action:clone()--(action)
    action:getTarget()--(node)
    action:setTarget(target)--仅在单个动作有用，并且在runaction之前使用
    action:setTag(tag)--设置标识
    action:getTag()
    action:getDuration()--返回持续时间
    action:setDuration(float)--设置持续时间
--瞬间动作
	local p = cc.p(math.random() * size.width, math.random() * size.height)
	cc.Place:create(p)--移动到指定位置
	cc.FlipX:create(true)
	cc.FlipY:create(true)
	cc.Hide:create()
	cc.Show:create()
	cc.ToggleVisibility:create()--将对象显示/隐藏切换  
--间隔动作
    cc.Animate:create(animation)
    cc.DelayTime:create(2)
	cc.MoveTo:create(2,cc.p(-50, -50))--移动
    cc.MoveBy:create(2,cc.p(-50, -50))
    cc.JumpTo:create(2,cc.p(150, 50),30,5)--跳跃，第二个参数是最终位置，第三个参数是高度，第四个参数是次数
    cc.JumpBy:create(2,cc.p(100, 100),30,5)--cc.p(100, 100)是移动的总距离
    cc.ScaleTo:create(2, 4)--只在原精灵的基础上拉伸指定倍数
    cc.ScaleBy:create(2, 0.5)--考虑到原来对精灵的拉伸
    cc.RotateTo:create(2,180)
    cc.RotateBy:create(2,-180)
    cc.Blink:create(3, 5)--闪烁,第一个参数是时间，第二个参数是次数
    cc.TintTo:create(2, 255, 0, 0)--第一个参数是持续时间，后面三个参数是色值
    cc.TintBy:create(0.5,0, 255, 255)
    cc.FadeTo:create(1, 80)--80表示不透明的占80%
    cc.FadeIn:create(5)--渐显，5是持续时间
    cc.FadeOut:create(5)--渐弱
    cc.BezierBy:create(3,bezier)--贝塞尔曲线动作
    local bezier = {
        cc.p(0, 240),--第一控制点
        cc.p(300, 240),--第二控制点
        cc.p(100, 100)--结束点
    }
--组合动作
    cc.Repeat:create(seq,3)--重复执行3次
    cc.RepeatForever:create(seq)--无限重复
    cc.Spawn:create(ac1)
    cc.Sequence:create(ac1)

--动作速度控制
    --排在组合之前
    cc.EaseIn:create(ac, 3)--以三倍速度由慢到快
    cc.EaseOut:create(ac, 3)--三倍速度由快到慢
    cc.EaseInOut:create(ac, 3)--三倍速度由慢到快再由快到慢
    cc.EaseSineIn:create(ac)--采用正弦变换速度由慢到快
    cc.EaseSineOut:create(ac)--采用正弦变换速度由快到慢
    cc.EaseSineInOut:create(ac)--采用正弦变换速度由慢到快再由快到慢
    cc.EaseExponentialIn:create(ac)--采用指数变换速度由慢到快
    cc.EaseExponentialOut:create(ac)--采用指数变换速度由快到慢
    cc.EaseExponentialInOut:create(ac)--采用指数变换速度由慢到快再由快到慢
    cc.Speed:create(ac,(math.random() * 5)))--随机设置变换速度

    action = cc.Speed:create(cc.RotateBy:create(3,180),1)
    action:setSpeed(5)--(getSpeed)
    action:setInnerAction(5)--替换内部动作(getInnerAction)
    action:clone()
    action:reverse()
    action:startWithTarget(node)
    action:initWithAction(action,float)

    --跟随，第一个参数是要跟随的节点，第二个参数是范围
    layer:runAction(cc.Follow:create(sprite,cc.rect(0,0,480,854)))

--函数调用(可以嵌套动作函数，和判断条件if来执行那个函数，尤其是重复循环)
    local function CallBack(pSender, table)--pSender是精灵本身，table是函数调用时传过来的
    	local sp = pSender
	    sp:runAction(cc.TintBy:create(table[1], table[2], table[3], table[4]))
	end
    local acf = cc.CallFunc:create(CallBack, { 1, 255, 0, 255 })
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


--特效(特效节点放在gridNodeTarget上)
    gridNodeTarget = cc.NodeGrid:create()
    layer:addChild(gridNodeTarget)
    --翻转特效，第一个参数持续时间
    gridNodeTarget:runAction(cc.FlipX3D:create(3.0))
    --翻页特效，第一个参数持续时间，第二个参数网格大小
    gridNodeTarget:runAction(cc.PageTurn3D:create(3.0, cc.size(15,10)))
    --凸透镜特效，第一个参数持续时间，第二个参数网格大小，第三个参数网透镜中心点，第四个参数是透镜半径
    gridNodeTarget:runAction(cc.Lens3D:create(3.0, cc.size(15,10), cc.p(size.width/2,size.height/2), 240))
    --晃动特效，第一个参数持续时间，第二个参数网格大小，第三个参数晃动范围，第四个参数是否伴有Z轴晃动
    gridNodeTarget:runAction(cc.Shaky3D:create(3.0, cc.size(15,10), 5, false))
    --波动特效，第一个参数持续时间，第二个参数网格大小，第三个参数波动次数，第四个参数波动振幅
    gridNodeTarget:runAction(cc.Waves3D:create(3.0, cc.size(15,10), 5, 40))
    --瓦片跳动，第一个参数持续时间，第二个参数网格大小，第三个参数跳动次数，第四个参数跳动振幅
    gridNodeTarget:runAction(cc.JumpTiles3D:create(3.0, cc.size(15,10), 2, 30))
    --瓦片晃动，第一个参数持续时间，第二个参数网格大小，第三个参数晃动范围，第四个参数是否伴有Z轴晃动
    gridNodeTarget:runAction(cc.ShakyTiles3D:create(3.0, cc.size(16,12), 5, false))
    --瓦片波动，第一个参数持续时间，第二个参数网格大小，第三个参数波动次数，第四个参数波动振幅
    gridNodeTarget:runAction(cc.WavesTiles3D:create(3.0, cc.size(15,10), 4, 120))



    --消耗动画
    node:runAction(CCScaleTo:create(0.4,1.5))--amplification
    local lb_num = Label:create()
    lb_num:setFontName(LFont())
    lb_num:setFontSize(15)
    lb_num:setText(num_3)
    lb_num:setColor(ccc3(255, 0, 0))
    lb_num:setAnchorPoint(ccp(0,0.5))
    node:addChild(lb_num)

    local function moveFinish(node)
        node:removeFromParentAndCleanup(true)
    end
    local array_1 = CCArray:create()
    array_1:addObject(CCMoveBy:create(1.0, ccp(0, 10)))
    array_1:addObject(CCCallFuncN:create(moveFinish))
    lb_num:runAction(CCSequence:create(array_1))

    local count = math.ceil(-num/10)
    local array_2 = CCArray:create()
    for i=1,count do
        local function modify_1(node)
            node:setText(bigNumSwith(num-10*i))
            node:runAction(CCScaleTo:create(0.4,1))
        end
        local function modify_2(node)
            node:setText(num-10*i)
        end
        array_2:addObject(CCDelayTime:create(0.1))
        if i == count then
            array_2:addObject(CCCallFuncN:create(modify_1))
        else
            array_2:addObject(CCCallFuncN:create(modify_2))
        end
        
    end
    node:runAction(CCSequence:create(array_2))
