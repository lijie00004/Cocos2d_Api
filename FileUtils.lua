--FileUtils
local sharedFileUtils = cc.FileUtils:getInstance()--获取实例
--获取文件路径fullPathForFilename = D:/HelloLua/HelloLua/res/text.txt
local fullPathForFilename = sharedFileUtils:fullPathForFilename("test.txt")
--判断文件是否存在
local isExist = sharedFileUtils:isFileExist("test.txt")--参数是路径
--获取文件内容
local content = sharedFileUtils:getStringFromFile(fullPathForFilename)--fullPathForFilename先获取路径
label:setPosition(cc.p(100,100))


sharedFileUtils:purgeCachedEntries()--清理文件查找缓存，一般是更新资源后，进行搜索前调用
--获取所有搜索路径，searchPaths是个table
local searchPaths = sharedFileUtils:getSearchPaths()
--获得可写入目录 writablePath = D:\HelloLua\HelloLua\
local writablePath = sharedFileUtils:getWritablePath()
local resPrefix = "res/"
table.insert(searchPaths,1,resPrefix.."dir2")
--先插入新增，重新设置搜索路径
sharedFileUtils:setSearchPaths(searchPaths)
--追加路径
sharedFileUtils:addSearchPath("res/fonts")--必须在setSearchPaths后添加


--XML保存游戏设置，和精灵状态等
local defaults = cc.UserDefault:getInstance()
--根据键获取布尔值，第二个参数可选，如果第一个参数的值不存在，返回defaultValue
local ret = cc.UserDefault:getInstance():getBoolForKey("bool", true)--注意值不要加“”
local ret = cc.UserDefault:getInstance():getIntegerForKey("first", "11")
local ret = cc.UserDefault:getInstance():getFloatForKey("second", "1.1")
local ret = cc.UserDefault:getInstance():getDoubleForKey(pKey, defaultValue)
local ret = cc.UserDefault:getInstance():getStringForKey(pKey, defaultValue)
local ret = cc.UserDefault:getInstance():getBoolForKey(pKey, defaultValue)

--储存函数
cc.UserDefault:getInstance():setStringForKey("string","value2")
cc.UserDefault:getInstance():setIntegerForKey("integer","11")
cc.UserDefault:getInstance():setFloatForKey("float","2.5")
cc.UserDefault:getInstance():setDoubleForKey("double","2.6")
cc.UserDefault:getInstance():setBoolForKey("bool",false)



--PLIST
	--根为字典结构的属性列表
local sharedFileUtils = cc.FileUtils:getInstance()--获取实例
local fullPathForFilename = sharedFileUtils:fullPathForFilename("NotesList.plist")
local dict = sharedFileUtils:getValueMapFromFile(fullPathForFilename)
for key,value in pairs(dict) do
    for i = 1, table.getn(value) do--
        cclog("--------%d--------",i)
        local row = value[i]
        local date = row["date"]
        local content = row["content"]
        cclog("date = %s", date)
        cclog("content : %s", content)
    end
end
	--根为列表结构的属性列表
local sharedFileUtils = cc.FileUtils:getInstance()--获取实例
local fullPathForFilename = sharedFileUtils:fullPathForFilename("NotesList.plist")
local vector = sharedFileUtils:getValueVectorFromFile(fullPathForFilename)
    for i = 1, table.getn(vector) do
        cclog("--------%d--------",i)
        local row = vector[i]
        local date = row["date"]
        local content = row["content"]
        cclog("date = %s", date)
    	cclog("content : %s", content)
    end
end	
