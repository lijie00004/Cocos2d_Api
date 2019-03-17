local director = cc.Director:getInstance()--Gets current running Scene

director:isDisplayStats()--(boolean)Whether or not displaying the FPS on the bottom-left corner of the screen
director:isPaused()--(boolean)Whether or not the Director is paused.
director:getSecondsPerFrame()--(count)GL calls OpenGL绘制（渲染）的次数，即每一帧中OpenGL指令调用的次数,每秒执行帧数
director:getAnimationInterval()--(FPS)Gets the FPS value(获取每帧的间隔时间)
director:getWinSize()--(Size)Returns the size of the OpenGL view in points(获取的尺寸是手机屏幕实际大小)
director:getContentScaleFactor()--(float)Gets content scale factor.(获取表面像素大小)
director:getFrameRate()--(float)Gets Frame Rate. (获取帧率)
director:getTotalFrames()--(int)(总共已经渲染了多少帧)

director:setAnimationInterval(number)--Sets the FPS value,FPS = 1/interval 	director->setAnimationInterval(1.0/ 60);
director:setDisplayStats(boolean)--Display the FPS on the bottom-left corner of the screen

--设置后节点独立于场景之外单独绘制的，不会随着场景的切换而消失,即使父节点不在。
director:setNotificationNode(node)--Sets the notification node(设置一个在主场景遍历后遍历的节点对象)
director:setNotificationNode(nil)--delete notificationNode
director:getNotificationNode()--(Node)This object will be visited after the main scene is visited


director:stopAnimation()--(停止动画)Stops the animation.Nothing will be drawn. The main loop won't be triggered anymore. If you don't want to pause your animation call [pause] instead.
director:startAnimation()--The main loop is triggered again.Call this function only if [stopAnimation] was called earlier.
director:purgeCachedData()--Removes all cocos2d cached data.It will purge the TextureCache, SpriteFrameCache, LabelBMFont cache
director:setDefaultValues()--Sets the default values based on the Configuration info.(基于配置信息设置默认值)
director:setContentScaleFactor(float scaleFactor)--The size in pixels of the surface(设置表面像素大小（不同于屏幕大小）)
director:setScheduler(Scheduler* scheduler)--Sets the Scheduler associated with this director.(设置时间调度对象)
director:setActionManager(ActionManager* actionManager)--Sets the ActionManager associated with this director.(设置动作管理对象)
director:setEventDispatcher(EventDispatcher* dispatcher)--Sets the EventDispatcher associated with this director.(设置事件调度对象)



--expand
director:setNextDeltaTimeZero(boolean)--true,Sets the delta time between current frame and next frame is 0(是否设置两帧之前时间增量为0)
director:setProjection(Projection projection)--Sets OpenGL projection(设置OpenGL投影)
director:setViewport()--Sets the glViewport(设置OpenGL接口)
director:getWinSizeInPixels()--(Size)Returns the size of the OpenGL view in pixels
director:getVisibleSize()--(Size)Returns visible size of the OpenGL view in points(表示获得视口(可视区域)的大小，如果DesignResolutionSize跟屏幕尺寸一样大，则getVisibleSize等于getWinSize)
director:getVisibleOrigin()--(Vec2)Returns visible origin coordinate of the OpenGL view in points(获取可视区域的原点坐标，这在处理相对位置的时候非常有用，确保节点在不同分辨率下的位置一致
director:getZEye()--(float)Gets the distance between camera and near clipping frame
director:convertToGL(cc.p(10,10))--(Vec2)Converts a screen coordinate to an OpenGL coordinate
director:convertToUI(cc.p(10,10))--(Vec2)Converts an OpenGL coordinate to a screen coordinate
director:isSendCleanupToScene()--(boolean)Whether or not the replaced scene will receive the cleanup message(是否已经给切出场景发送了清理的命)
director:isNextDeltaTimeZero()--(boolean)Whether or not _nextDeltaTimeZero is set to 0
director:getConsole()--(Console)Returns the Console associated with this director.
director:getScheduler()--(Scheduler)Gets the Scheduler associated with this director(获取时间调度对象)
director:getActionManager()--(ActionManager)Gets the ActionManager associated with this director.(获取动作管理对象)
director:getEventDispatcher()--(EventDispatcher)Gets the EventDispatcher associated with this director.(获取事件调度对象)
director:getRenderer()--(Renderer)Returns the Renderer associated with this director.(返回渲染器)
director:getProjectionMatrix(size_t index)--(Mat4)Gets the top matrix of projection matrix stack.
director:getCocos2dThreadId()--(id)returns the cocos2d thread id.Useful to know if certain code is already running on the cocos2d thread
director:drawScene()--Draw the scene.This method is called every frame. Don't call it manually.(绘制场景)
director:setGLDefaultValues()--Sets the OpenGL default values.It will enable alpha blending, disable depth test.(设置OpenGL默认值)
director:setAlphaBlending(bool on)--Enables/disables OpenGL alpha blending(设置OpenGL是否使用alpha通道)
director:setDepthTest(bool on)--Enables/disables OpenGL depth test.(设置是否测试OpenGL深度)
director:pushProjectionMatrix(size_t index)--Clones a projection matrix and put it to the top of projection matrix stack.
director:popProjectionMatrix(size_t index)--Pops the top matrix of the projection matrix stack.
director:loadProjectionIdentityMatrix(size_t index)--Adds an identity matrix to the top of projection matrix stack.
director:loadMatrix(MATRIX_STACK_TYPE type,const Mat4 & mat)--Adds a matrix to the top of specified type of matrix stack.
director:loadProjectionMatrix(const Mat4&mat,size_t index )--Adds a matrix to the top of projection matrix stack.
director:multiplyMatrix(MATRIX_STACK_TYPE type,const Mat4 & mat)--Multiplies a matrix to the top of specified type of matrix stack.
director:multiplyProjectionMatrix(const Mat4 & mat,size_t index)--Multiplies a matrix to the top of projection matrix stack.
director:initProjectionMatrixStack(size_t stackCount)--Init the projection matrix stack.
