--old version
getCastChild(self.mainLayout,0,"ImageView"):setScaleY(0.64)--cocos2d

--new version
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