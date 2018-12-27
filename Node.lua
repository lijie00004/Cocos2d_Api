
--在服务器文件夹进入Dos终端窗口，输入npm install ws

--服务器代码，后缀是.js
var WebSocketServer = require('ws').Server;--Server引入WebSocket模块
console.log('Server on port 3000.');

var wss = new WebSocketServer({port: 3000});--监听3000窗口

--wss.on是WebSocketServer与客户端WebSocket建立连接时触发的
--wss是是WebSocketServer对象，ws是WebSocket对象
wss.on('connection', function(ws) {
	ws.send('Hello Cocos2d-x Lua');--会触发下面message事件
	//注册客户端消息
	ws.on('message', function (data){
        console.log(data);
    });
});
--open连接打开事件
--message接收消息事件
--close连接关闭事件
--error错误发生事件

--客户端代码，后缀是.lua
    local function OnClickMenu1(menuItemSender)
        if cc.WEBSOCKET_STATE_OPEN == wsSendText:getReadyState() then--判断是否是打开状态
            cclog("Send Text WS is waiting...")
            wsSendText:sendString("Hello WebSocket")
        else
            local warningStr = "WebSocket实例还没有准备好!"
            cclog(warningStr)
        end
    end

    local pItmLabel1 = cc.Label:createWithBMFont("fonts/fnt8.fnt", "Send Message")
    local pItmMenu1 = cc.MenuItemLabel:create(pItmLabel1)
    pItmMenu1:registerScriptTapHandler(OnClickMenu1)

    local mn = cc.Menu:create(pItmMenu1)
    mn:alignItemsVertically()
    layer:addChild(mn)
    
    --/////////////////// WebSocket start /////////////////
    --ws是WebSocket协议，主机IP是127.0.0.1，端口是3000 
    wsSendText  = cc.WebSocket:create("ws://127.0.0.1:3000")--实例化wsSendText对象

    local function wsSendTextOpen(strData)
        cclog("WebSocket实例打开")
    end

    local function wsSendTextMessage(strData)
        local strInfo= "response text msg: "..strData   
        cclog(strInfo)
    end

    local function wsSendTextClose(strData)
        cclog("WebSocket实例关闭")
    end

    local function wsSendTextError(strData)
        cclog("WebSocket错误发生")
    end
    --监听WebSocket的各种事件
    wsSendText:registerScriptHandler(wsSendTextOpen,cc.WEBSOCKET_OPEN)
    wsSendText:registerScriptHandler(wsSendTextMessage,cc.WEBSOCKET_MESSAGE)
    wsSendText:registerScriptHandler(wsSendTextClose,cc.WEBSOCKET_CLOSE)
    wsSendText:registerScriptHandler(wsSendTextError,cc.WEBSOCKET_ERROR)
    --/////////////////// WebSocket end ///////////////// 