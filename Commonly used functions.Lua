	
	os.time()--从1970.1.1.08:00到现在的秒数
	os.date()--日期

	table[1] = nil--#table不会改变，位置1的坑还在
	
	math.floor(9.9) = 9--向下取整
	math.ceil(9.9) = 10--向上取整
	math.max(...)
	math.min(...)
	math.randomseed(os.time())--配合下面三个使用
	math.random()--0~1
	math.random(3)--值：1,2,3
	math.random(1,10)--值：1,2,3,4~10

	print(a%b)--取余
	

	local hour = math.floor(self.goldRecruitInterval / 3600)
	local minute = math.floor((self.goldRecruitInterval %3600) /60)
	local second = math.floor(self.goldRecruitInterval % 60)
	
--字符串操作
	string.len("string")--返回所给字符串的长度，如果字符串中包含'\0'，也会被统计为一个字符。
	string.sub(string, n, m)--截取string字符串从n位置到m
	string.lower(s)--转换成小写
	string.upper(s)--转换成大写
	string.rep("Hello", 3)--返回“HelloHelloHello"
	string.reverse("Hello")--倒序排列，返回“olleH"
	string.find("HelloWorld","World")--返回6, 10
	string.format("%02d:%02d:%02d%s",hour,minute,second,LStr("TID_TIP_308"))--02d表示如果整数不够2列就补上0



for k, v in pairs(XmlProp) do
    if v.isShow == 1 and (v.type == 5 or v.type == 6 or v.type == 7 or v.type ==8 or v.type == 9) then
            table.insert(tempTable, k)
    end
end

table.sort(tempTable,function(a, b) return (a < b) end)--排序从小到大

local function sortFunc(a,b)
    if XmlProp[a].price == XmlProp[b].price then
            return a < b
    else
            return XmlProp[a].price < XmlProp[b].price
    end
end
table.sort(tempTable,sortFunc)


--return结束函数
--break只是跳出循环
