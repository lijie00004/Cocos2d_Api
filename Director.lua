local director = cc.Director:getInstance()--Gets current running Scene

local FPS = director:getAnimationInterval()--Gets the FPS value
local boolean = director:isDisplayStats()--Whether or not displaying the FPS on the bottom-left corner of the screen
local count = director:getSecondsPerFrame()--GL calls OpenGL绘制（渲染）的次数，即每一帧中OpenGL指令调用的次数
local boolean = director:isNextDeltaTimeZero()--Whether or not _nextDeltaTimeZero is set to 0
local boolean = director:isPaused()--Whether or not the Director is paused.
local boolean = director:isSendCleanupToScene()--Whether or not the replaced scene will receive the cleanup message
local Node = director:getNotificationNode()--This object will be visited after the main scene is visited
local Size = director:getWinSize()--Returns the size of the OpenGL view in points
local Size = director:getWinSizeInPixels()--Returns the size of the OpenGL view in pixels
local Size = director:getVisibleSize()--Returns visible size of the OpenGL view in points
local Vec2 = director:getVisibleOrigin()--Returns visible origin coordinate of the OpenGL view in points
local Vec2 = director:convertToGL(cc.p(10,10))--Converts a screen coordinate to an OpenGL coordinate
local Vec2 = director:convertToUI(cc.p(10,10))--Converts an OpenGL coordinate to a screen coordinate
local float = director:getZEye()--Gets the distance between camera and near clipping frame




director:setAnimationInterval(number)--Sets the FPS value,FPS = 1/interval
director:setDisplayStats(boolean)--Display the FPS on the bottom-left corner of the screen
director:setNextDeltaTimeZero(boolean)--true,Sets the delta time between current frame and next frame is 0(是否设置两帧之前时间增量为0)
director:setProjection(Projection projection)--Sets OpenGL projection
director:setViewport()--Sets the glViewport
director:setNotificationNode(node)--Sets the notification node
director:runWithScene(scene)--Enters the Director's main loop with the given Scene
director:pushScene(scene)--Suspends the execution of the running scene, pushing it on the stack of suspended scenes(暂停并挂起当前场景，进入下个场景)


