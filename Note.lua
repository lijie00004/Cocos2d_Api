Ref-->Node-->Scene-->TransitionScene
		  -->Layer-->ScrollView-->TableView
		  		  -->LayerColor-->LayerGradient
		  		  -->LayerMultiplex
		  		  -->Menu
		  -->Sprite
		  -->Label
		  -->MenuItem
		  --ParticleSystem
		  --TMXTiledMap

--坐标系
    --世界坐标表示以0,0,为原点，模型坐标是以节点为原点
	local posX, posY = node2:getPosition()
    local point1 = node1:convertToNodeSpace(cc.p(posX, posY))--将世界坐标转换为模型坐标
    local point3 = node1:convertToNodeSpaceAR(cc.p(posX, posY))--相对锚点将世界坐标转换为模型坐标

    local point1 = node1:convertToWorldSpace(cc.p(posX,posY))----将模型坐标转换为世界坐标
    local point3 = node1:convertToWorldSpaceAR(cc.p(posX,posY))--相对锚点将模型坐标转换为世界坐标

--暂停
Layer:pause()
if (schedulerId ~= nil) then
scheduler:unscheduleScriptEntry(schedulerId)
end
local pChildren = Layer:getChildren()
for i = 1, #pChildren, 1 do
	local child = pChildren[i]
	child:pause()
end

--继续
Layer:resume()
scheduler:scheduleScriptFunc(shootBullet, 0.2, false)
local pChildren = Layer:getChildren()
for i = 1, #pChildren, 1 do
local child = pChildren[i]
child:resume()
end


--定时器
node:getScheduler()--得到调度器对象

node:scheduleUpdate()--开启默认定时器.刷新次数为60次/秒.即每秒60帧
node:update(float delta)--update为scheduleUpdate定时器的回调函数

node:scheduleUpdateWithPriority(priority)--priority越小,优先级越高
node:unscheduleUpdate()--取消默认定时器

node:scheduleOnce(SEL_SCHEDULE selector, float delay)--只执行一次,delay秒后执行
node:unschedule(SEL_SCHEDULE selector)--取消一个自定义定时器

--后面三个参数可选
node:schedule(e(SEL_SCHEDULE selector, float interval, int repeat, float delay))--设置自定义定时器.默认为每秒60帧

node:unscheduleAllSelectors()--取消所有定时器
node:resume()--恢复所有定时器和动作
node:pause()--暂停所有定时器和动作


--当Node被移除出场景或者其他情况下，调定时器将会被取消
layer:scheduleUpdateWithPriorityLua(update, 0)--update表示回调函数，0表示优先级
layer:unscheduleUpdate()--停止调度

--当Node被移除出场景或者其他情况下，调定时器依旧在
--每0.2秒调用shootBullet函数,false表示无限次
schedulerId = cc.Director:getInstance():getScheduler():scheduleScriptFunc(callback, 0.2, false)--cc.Director:getInstance():getScheduler()全局定时器
cc.Director:getInstance():getScheduler():unscheduleScriptEntry(schedulerId)

cc.Director:getInstance():getScheduler():setTimeScale(1.0)--动作、动画执行速度

--cocos命令指令
    cocos new HelloLua -p com.work6 -l lua -d D:/cocos
--old version
getCastChild(layout,0,"ImageView"):setScaleY(0.64)--cocos2d

--new version
invalid 'cobj'--node值相当于一个弱引用,手动增加引用retain()
UIWidget--所有UI控件的基类
addChild--添加UIWidget类型的节点
addRenderer--添加CCNode类型的节点
setTouchEnable(true)--所有UIWidget，都可以设置成触摸
--如果一个节点频繁显示用hide不用if
--短周期缓存：玩家使用的少，不跨场景，没必要长时间缓存。
--可以在onEnter()中创建，在Exit()中清除
--长周期缓存：玩家花费时间长，可能跨场景。建议将差不多周期纹理图放在一个拼图里
--长周期的可以在main()添加缓存

--D:\cocos2dx\HelloLua\frameworks\runtime-src\proj.android\app\AndroidManifest.xml
--android:screenOrientation="portrait"--竖屏

--size_1与size_2不同，因为适配方案
--size_1 = cc.Director:getInstance():getWinSize()--屏幕实际大小
--glview:setDesignResolutionSize(designResolutionSize.width, designResolutionSize.height, cc.ResolutionPolicy.FIXED_WIDTH)
--size_2 = cc.Director:getInstance():getWinSize()--size_2.width是designResolutionSize.width，size.height值是size.width/实际宽度*实际高度