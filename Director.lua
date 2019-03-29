local director = cc.Director:getInstance()--Returns a shared instance of the director

director:getRunningScene()
director:isPaused()--(boolean)Whether or not the Director is paused.
director:getSecondsPerFrame()--(count)GL calls OpenGL绘制（渲染）的次数，即每一帧中OpenGL指令调用的次数,每秒执行帧数
director:getAnimationInterval()--(FPS)Gets the FPS value(获取每帧的间隔时间)
director:getWinSize()--(Size)Returns the size of the OpenGL view in points(获取的尺寸是手机屏幕实际大小)
director:getWinSizeInPixels()--(Size)Returns the size of the OpenGL view in pixels
director:getVisibleSize()--(Size)Returns visible size of the OpenGL view in points(表示获得视口(可视区域)的大小，如果DesignResolutionSize跟屏幕尺寸一样大，则getVisibleSize等于getWinSize)
director:getVisibleOrigin()--(Vec2)Returns visible origin coordinate of the OpenGL view in points(获取可视区域的原点坐标，这在处理相对位置的时候非常有用，确保节点在不同分辨率下的位置一致
director:getContentScaleFactor()--(float)Gets content scale factor.(获取表面像素大小)
director:getFrameRate()--(float)Gets Frame Rate. (获取帧率)
director:convertToGL(cc.p(10,10))--GL原点在左下角(Vec2)Converts a screen coordinate to an OpenGL coordinate
director:convertToUI(cc.p(10,10))--UI原点在左上角(Vec2)Converts an OpenGL coordinate to a screen coordinate

--设置后节点独立于场景之外单独绘制的，不会随着场景的切换而消失,即使父节点不在。
director:setNotificationNode(node)--Sets the notification node(设置一个在主场景遍历后遍历的节点对象)
director:setNotificationNode(nil)--delete notificationNode
director:getNotificationNode()--(Node)This object will be visited after the main scene is visited


director:stopAnimation()--(停止动画)Stops the animation.Nothing will be drawn. The main loop won't be triggered anymore. If you don't want to pause your animation call [pause] instead.
director:startAnimation()--The main loop is triggered again.Call this function only if [stopAnimation] was called earlier.
director:purgeCachedData()--Removes all cocos2d cached data.It will purge the TextureCache, SpriteFrameCache, LabelBMFont cache
director:setDefaultValues()--Sets the default values based on the Configuration info.(基于配置信息设置默认值)
director:setContentScaleFactor(float scaleFactor)--The size in pixels of the surface(设置表面像素大小（不同于屏幕大小）)
director:setAnimationInterval(number)--Sets the FPS value,FPS = 1/interval 	director->setAnimationInterval(1.0/ 60);
director:setDisplayStats(boolean)--Display the FPS on the bottom-left corner of the screen