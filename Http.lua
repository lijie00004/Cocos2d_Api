--local data = string.format(参数含义
    --type是数据交换类型：JSON,XML,SOAP
    --action是指定调用WebService的方法：add,remove,modify,query.插入、删除、修改、查询
    --id是一个日志中的数字
    --date是日期
    --content是内容
    --email是在www.51work6.com注册用的邮箱

--xhr:open("GET", url)--post不用加？和地址，get需要
--xhr:open("POST", BASE_URL)--

--XMLHTTPREQUEST_RESPONSE_JSON返回的是JSON字符串
--XMLHTTPREQUEST_RESPONSE_STRING返回的是文本字符
--XMLHTTPREQUEST_RESPONSE_ARRAY_BUFFER返回的是二进制数据

local selectedRowId = 6212--id
local BASE_URL = 'http://www.51work6.com/service/mynotes/WebService.php'

--查询数据函数
local function onMenuReadCallback(pSender)
    cclog("onMenuReadCallback")
    local data = string.format("email=%s&type=%s&action=%s", "lijie00004@163.com", "JSON", "query")
    local url = BASE_URL .. "?" .. data
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON--应答类型
    xhr:open("GET", url)--第一个参数是类型，第二个是地址

    
    local function onReadyStateChange()
        if xhr.readyState == 4 and xhr.status == 200 then--4表示响应已完成，可以访问服务器，200表示ok
            local response = xhr.responseText
            cclog(response)
            local jsonObj = json.decode(response)
            local resultCode = jsonObj['ResultCode']
            if resultCode == 0 then
                cclog("read success")
                local jsonArray = jsonObj['Record']
                for i = 1,table.getn(jsonArray) do
                    cclog("-----------%d------------",i)
                    local row = jsonArray[i]
                    cclog("ID:%s", row["ID"])
                    cclog("CDate:%s",row["CDate"])
                    cclog("Content:%s", row["Content"])
                    cclog("selectedRowId = %s", selectedRowId)
                    selectedRowId = row["Id"]
                end
            else
                cclog(getErrorMessage(resultCode))
            end
        end
    end
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send()
end

  --更新数据函数
local function onMenuUpdateCallback(pSender)
    cclog("onMenuUpdateCallback")
    local data = string.format("email=%s&type=%s&action=%s&date=%s&content=%s&id=%s", "lijie00004@163.com", "JSON", "modify", "2014-09-18", "Tom modify data", selectedRowId)
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
    xhr:open("POST", BASE_URL)

    local function onReadyStateChange()
        if xhr.readyState == 4 and xhr.status == 200 then
            local response = xhr.responseText
            cclog(response)
        end
    end
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send(data)
end

 --插入数据函数
local function onMenuInsertCallback(pSender)
    cclog("onMenuInsertCallback")

    local data = string.format("email=%s&type=%s&action=%s&date=%s&content=%s", "lijie00004@163.com", "JSON", "add", "2014-09-18", "Tony insert data")
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
    xhr:open("POST", BASE_URL)

    local function onReadyStateChange()
        if xhr.readyState == 4 and xhr.status == 200 then--4：已响应，200表示ok
            local response = xhr.responseText
            cclog(response)
        end
    end
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send(data)
end

--删除数据函数
local function onMenuDeleteCallback(pSender)
    cclog("onMenuDeleteCallback")
    
    local data = string.format("email=%s&type=%s&action=%s&id=%s", "lijie00004@163.com", "JSON", "remove", selectedRowId)
    local xhr = cc.XMLHttpRequest:new()
    xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_JSON
    xhr:open("POST", BASE_URL)

    local function onReadyStateChange()
        if xhr.readyState == 4 and xhr.status == 200 then
            local response = xhr.responseText
            cclog(response..selectedRowId)
        end
    end
    xhr:registerScriptHandler(onReadyStateChange)
    xhr:send(data)
end
local pItmLabel1 = cc.Label:createWithBMFont("fonts/fnt8.fnt","Update Data")
local pItmMenu1 = cc.MenuItemLabel:create(pItmLabel1)
pItmMenu1:registerScriptTapHandler(onMenuUpdateCallback)

local pItmLabel2 = cc.Label:createWithBMFont("fonts/fnt8.fnt","Insert Data")
local pItmMenu2 = cc.MenuItemLabel:create(pItmLabel2)
pItmMenu2:registerScriptTapHandler(onMenuInsertCallback)

local pItmLabel3 = cc.Label:createWithBMFont("fonts/fnt8.fnt","Delete data")
local pItmMenu3 = cc.MenuItemLabel:create(pItmLabel3)
pItmMenu3:registerScriptTapHandler(onMenuDeleteCallback)

local pItmLabel4 = cc.Label:createWithBMFont("fonts/fnt8.fnt","Read data")
local pItmMenu4 = cc.MenuItemLabel:create(pItmLabel4)
pItmMenu4:registerScriptTapHandler(onMenuReadCallback)

self.mn = cc.Menu:create(pItmMenu1,pItmMenu2,pItmMenu3,pItmMenu4)
self.mn:alignItemsVertically()
layer:addChild(self.mn)