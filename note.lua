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
