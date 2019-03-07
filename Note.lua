--old version
getCastChild(self.mainLayout,0,"ImageView"):setScaleY(0.64)--cocos2d

--new version
Uppercase constant identifier（大写常量标识符）
Variable is nil before assignment
object type 	Start with a capital letter(以大写字母开头)
function name	The first word is a verb(第一个词是动词)	such as : isButtonPressed
A function can be assigned to a variable(一个函数可以赋值给一个变量)
a function can be arguments to other functions(一个函数可以是其他函数的参数)
If the variable is assigned nil,The garbage collector deletes the variable,Free its memory
(如果变量被赋值为nil,垃圾收集器会删除该变量,释放它的内存)

local string = tostring(var)--Converts a Boolean or numeric type to a string type
local num = tonumber("AF",[16])--175
local num = tonumber("10")--10

print(20 and 100)--100
print(100 and true)--true
print(nil and 20)--nil

print(10 or false)--10
print(false or 10)--10

i = 0
repeat
	i = i + 1
until (i * i >= 1000)--if condition is true, exit a loop

for k,v in pairs(table_name) do
	print(k,v)
end

break--exit a loop
return--exit from the function

Nested function(函数嵌套)
Returns the function(返回函数)

returnFunction = function(width, height)--anonymous function(匿名函数)
	local area = width * height
	return area
end

--如果一个节点频繁显示用hide不用if
--短周期缓存：玩家使用的少，不跨场景，没必要长时间缓存。
--可以在onEnter()中创建，在Exit()中清除
--长周期缓存：玩家花费时间长，可能跨场景。建议将差不多周期纹理图放在一个拼图里
--长周期的可以在main()添加缓存

--size_1与size_2不同，因为适配方案
size_1 = cc.Director:getInstance():getWinSize()--屏幕实际大小
glview:setDesignResolutionSize(designResolutionSize.width, designResolutionSize.height, cc.ResolutionPolicy.FIXED_WIDTH)
size_2 = cc.Director:getInstance():getWinSize()--size_2.width是designResolutionSize.width，size.height值是size.width/实际宽度*实际高度


--D:\cocos2dx\HelloLua\frameworks\runtime-src\proj.android\app\AndroidManifest.xml
android:screenOrientation="portrait"--竖屏