--old version
local listView = UIListView2:create()
listView:setSize(CCSizeMake(480, 560))
listView:setAnchorPoint(ccp(0,0))
listView:setPosition(ccp(0,132))
uiLayer:addWidget(listView)
listView:removeAllChildren()
local innerWidth = listView:getSize().width
local innerHeight = listView:getSize().height
for i = 1,6 do
    local layout = Layout:create()
    layout:setSize(CCSizeMake(480, 112))
    layout:setPosition(ccp(0,innerHeight-112*i))
    listView:addChild(layout)
    for j = 0,3 do
        local btn = Button:create()
        layout:addChild(btn)
    end
end
local function eventHandler(eventType)
    if eventType == "initChild" then
        --local layout = tolua.cast(self.scrollList1:getUpdateChild(),"Layout")
        local layout = listView:getUpdateChild()
        for i = 0,3 do
            local btn = tolua.cast(layout:getChildByName("frm"..i),"Button")
        end
    elseif eventType == "updateChild" then
        local index = listView:getUpdateDataIndex()
        if index < 0 or index >= listViewgetDataLength() then
            listView:setUpdateSuccess(false)
        else
            local layout = tolua.cast(listView:getUpdateChild(),"Layout")
            for i = 0,3 do
                local frm = tolua.cast(layout:getChildByName("frm"..i),"Button")
            end
            listView:setUpdateSuccess(true)
        end
    end
end

listView:registerScriptHandler(eventHandler)
listView:initChildWithDataLength(int)--child number