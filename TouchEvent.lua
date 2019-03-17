touch:getLocation()--(Vec2)Returns the current touch location in OpenGL coordinates(从触摸点获取到在OpenGL坐标系中的坐标)(原点左下角)
touch:getPreviousLocation()--(Vec2)Returns the previous touch location in OpenGL coordinates(以前的触摸位置)
touch:getStartLocation()--(Vec2)Returns the start touch location in OpenGL coordinates
touch:getDelta()--(Vec2)Returns the delta of 2 current touches locations in screen coordinates
touch:getLocationInView()--(Vec2)Returns the current touch location in screen coordinates(从触摸点获取到在屏幕坐标系中的坐标)(原点左上角)
touch:getPreviousLocationInView()--(Vec2)Returns the previous touch location in screen coordinates
touch:getStartLocationInView()--(Vec2)Returns the start touch location in screen coordinates

event:getType()--Gets the event type
event:getCurrentTarget()--Gets current target of the event
event:stopPropagation()--Stops propagation for current event
event:isStopped()--Checks whether the event has been stopped
