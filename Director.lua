local director = cc.Director:getInstance()--Gets current running Scene

local FPS = director:getAnimationInterval()--Gets the FPS value
local boolean = director:isDisplayStats()--Whether or not displaying the FPS on the bottom-left corner of the screen
local count = director:getSecondsPerFrame()--GL calls OpenGL绘制（渲染）的次数，即每一帧中OpenGL指令调用的次数
local boolean = director:isNextDeltaTimeZero()--Whether or not _nextDeltaTimeZero is set to 0

director:setAnimationInterval(number)--Sets the FPS value,FPS = 1/interval
director:setDisplayStats(boolean)--Display the FPS on the bottom-left corner of the screen
director:setNextDeltaTimeZero(boolean)--true,Sets the delta time between current frame and next frame is 0(是否设置两帧之前时间增量为0)

