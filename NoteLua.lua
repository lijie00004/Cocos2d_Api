	os.time()--从1970.1.1.08:00到现在的秒数
	os.date()--日期

	math.floor(9.9) = 9--向下取整
	math.ceil(9.9) = 10--向上取整
	math.max(...)
	math.min(...)
	math.randomseed(os.time())--配合下面三个使用
	math.random()--0~1
	math.random(3)--值：1,2,3
	math.random(1,10)--值：1,2,3,4~10
	a%b--取余
--字符串操作
	string.len("string")--返回所给字符串的长度，如果字符串中包含'\0'，也会被统计为一个字符。
	string.sub(string, n, m)--截取string字符串从n位置到m
	string.lower(s)--转换成小写
	string.upper(s)--转换成大写
	string.rep("Hello", 3)--返回“HelloHelloHello"
	string.reverse("Hello")--倒序排列，返回“olleH"
	string.find("HelloWorld","World")--返回6, 10
	string.format("%02d:%02d:%02d%s",hour,minute,second,LStr("TID_TIP_308"))--02d表示如果整数不够2列就补上0

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

returnFunction = function(width, height)--anonymous function(匿名函数)
	local area = width * height
	return area
end

table[1] = nil--#table不会改变，位置1的坑还在
--排序
table.sort(tempTable,function(a, b) return (a < b) end)--排序从小到大
--当比较函数没有写的时候，table.sort默认按照lua里面的排序规则升序排序
--table中不能有nil
--当两个数相等的时候，自定义函数一定要返回false，否则会报错

local function sortFunc(a,b)
    if XmlProp[a].price == XmlProp[b].price then
            return a < b
    else
            return XmlProp[a].price < XmlProp[b].price
    end
end
table.sort(tempTable,sortFunc)
--Uppercase constant identifier（大写常量标识符）
--Variable is nil before assignment
--object type 	Start with a capital letter(以大写字母开头)
--function name	The first word is a verb(第一个词是动词)	such as : isButtonPressed
--A function can be assigned to a variable(一个函数可以赋值给一个变量)
--a function can be arguments to other functions(一个函数可以是其他函数的参数)
--If the variable is assigned nil,The garbage collector deletes the variable,Free its memory
--(如果变量被赋值为nil,垃圾收集器会删除该变量,释放它的内存)
--Nested function(函数嵌套)
--Returns the function(返回函数)