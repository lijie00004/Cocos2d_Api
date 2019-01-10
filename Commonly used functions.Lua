
cclog("tag = %s",tag)

math.floor(9.9) = 9--取整数部分，不四舍五入

local hour = math.floor(self.goldRecruitInterval / 3600)
local minute = math.floor((self.goldRecruitInterval %3600) /60)
local second = math.floor(self.goldRecruitInterval % 60)
local strTip = string.format("%02d:%02d:%02d%s",hour,minute,second,LStr("TID_TIP_308"))     --后免费

string.len("string")--返回所给字符串的长度，如果字符串中包含'\0'，也会被统计为一个字符。

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
