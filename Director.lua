local director = cc.Director:getInstance()--Gets current running Scene

local FPS = director:getAnimationInterval()--Gets the FPS value(获取每帧的时间)
local boolean = director:isDisplayStats()--Whether or not displaying the FPS on the bottom-left corner of the screen
local count = director:getSecondsPerFrame()--GL calls OpenGL绘制（渲染）的次数，即每一帧中OpenGL指令调用的次数(获取每帧的时间（单位为秒）)
local boolean = director:isNextDeltaTimeZero()--Whether or not _nextDeltaTimeZero is set to 0
local boolean = director:isPaused()--Whether or not the Director is paused.
local boolean = director:isSendCleanupToScene()--Whether or not the replaced scene will receive the cleanup message(切换的场景是否接收清除信息)
local Node = director:getNotificationNode()--This object will be visited after the main scene is visited(获取一个在主场景遍历后遍历的节点对象)
local Size = director:getWinSize()--Returns the size of the OpenGL view in points(获取的尺寸是手机屏幕实际大小)
local Size = director:getWinSizeInPixels()--Returns the size of the OpenGL view in pixels
local Size = director:getVisibleSize()--Returns visible size of the OpenGL view in points
local Vec2 = director:getVisibleOrigin()--Returns visible origin coordinate of the OpenGL view in points(获取可见屏幕的方向)
local Vec2 = director:convertToGL(cc.p(10,10))--Converts a screen coordinate to an OpenGL coordinate
local Vec2 = director:convertToUI(cc.p(10,10))--Converts an OpenGL coordinate to a screen coordinate
local float = director:getZEye()--Gets the distance between camera and near clipping frame
local float = director:getContentScaleFactor()--Gets content scale factor.(获取表面像素大小)
local Scheduler = director:getScheduler()--Gets the Scheduler associated with this director(获取时间调度对象)
local ActionManager = director:getActionManager()--Gets the ActionManager associated with this director.(获取动作管理对象)
local EventDispatcher = director:getEventDispatcher()--Gets the EventDispatcher associated with this director.(获取事件调度对象)
local Renderer = director:getRenderer()--Returns the Renderer associated with this director.(返回渲染器)
local Console = director:getConsole()--Returns the Console associated with this director.
local const Mat4 = director:getProjectionMatrix(size_t index)--Gets the top matrix of projection matrix stack.
local const std::thread::id = director:getCocos2dThreadId()--returns the cocos2d thread id.Useful to know if certain code is already running on the cocos2d thread
local float = director:getFrameRate()--Gets Frame Rate. (获取帧率)


director:setAnimationInterval(number)--Sets the FPS value,FPS = 1/interval 	director->setAnimationInterval(1.0/ 60);
director:setDisplayStats(boolean)--Display the FPS on the bottom-left corner of the screen
director:setNextDeltaTimeZero(boolean)--true,Sets the delta time between current frame and next frame is 0(是否设置两帧之前时间增量为0)
director:setProjection(Projection projection)--Sets OpenGL projection(设置OpenGL投影)
director:setViewport()--Sets the glViewport(设置OpenGL接口)
director:setNotificationNode(node)--Sets the notification node(设置一个在主场景遍历后遍历的节点对象)
director:stopAnimation()--(停止动画)Stops the animation.Nothing will be drawn. The main loop won't be triggered anymore. If you don't want to pause your animation call [pause] instead.
director:startAnimation()--The main loop is triggered again.Call this function only if [stopAnimation] was called earlier.
director:drawScene()--Draw the scene.This method is called every frame. Don't call it manually.(绘制场景)
director:purgeCachedData()--Removes all cocos2d cached data.It will purge the TextureCache, SpriteFrameCache, LabelBMFont cache
director:setDefaultValues()--Sets the default values based on the Configuration info.(基于配置信息设置默认值)
director:setGLDefaultValues()--Sets the OpenGL default values.It will enable alpha blending, disable depth test.(设置OpenGL默认值)
director:setAlphaBlending(bool on)--Enables/disables OpenGL alpha blending(设置OpenGL是否使用alpha通道)
director:setDepthTest(bool on)--Enables/disables OpenGL depth test.(设置是否测试OpenGL深度)
director:setContentScaleFactor(float scaleFactor)--The size in pixels of the surface(设置表面像素大小（不同于屏幕大小）)
director:setScheduler(Scheduler* scheduler)--Sets the Scheduler associated with this director.(设置时间调度对象)
director:setActionManager(ActionManager* actionManager)--Sets the ActionManager associated with this director.(设置动作管理对象)
director:setEventDispatcher(EventDispatcher* dispatcher)--Sets the EventDispatcher associated with this director.(设置事件调度对象)
director:pushProjectionMatrix(size_t index)--Clones a projection matrix and put it to the top of projection matrix stack.
director:popProjectionMatrix(size_t index)--Pops the top matrix of the projection matrix stack.
director:loadProjectionIdentityMatrix(size_t index)--Adds an identity matrix to the top of projection matrix stack.
director:loadMatrix(MATRIX_STACK_TYPE type,const Mat4 & mat)--Adds a matrix to the top of specified type of matrix stack.
director:loadProjectionMatrix(const Mat4&mat,size_t index )--Adds a matrix to the top of projection matrix stack.
director:multiplyMatrix(MATRIX_STACK_TYPE type,const Mat4 & mat)--Multiplies a matrix to the top of specified type of matrix stack.
director:multiplyProjectionMatrix(const Mat4 & mat,size_t index)--Multiplies a matrix to the top of projection matrix stack.
director:initProjectionMatrixStack(size_t stackCount)--Init the projection matrix stack.