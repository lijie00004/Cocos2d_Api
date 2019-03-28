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


--new version
local listView = ccui.ListView:create()
listView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)     -- 设置方向为垂直方向  
listView:setBounceEnabled(true)                             -- 滑动惯性
listView:setBackGroundImage("white_bg.png")                 -- 背景图片
listView:setBackGroundImageScale9Enabled(true)              -- 设置背景图片九宫格
listView:setContentSize(500,400)  
listView:setPosition(cc.p(0,0)) 
listView:setItemsMargin(0.1)--getItemsMargin(item间距)
listView:setScrollBarEnabled(false)                         -- 设置滚动条隐藏
for i = 1,10 do
    local layout = ccui.Layout:create()
    layout:setContentSize(300,300)
    layout:setAnchorPoint(cc.p(0.5,0.5))
    listView:addChild(layout)
end

listView:setItemModel(layout)--Set an item model for listview(设为模板)
listView:pushBackDefaultItem()--Insert a default item(create by a cloned model) at the end of the listview. 
listView:insertDefaultItem(index)--Insert a default item(create by cloning model) into listview at a give index.

listView:pushBackCustomItem(item)--item An item in Widget
listView:insertCustomItem(item,index)--item An item in Widget

listView:removeLastItem()--Removes the last item of ListView. 
listView:removeItem(index)--Remove an item at given index.
listView:removeAllItems()--Remove all items in current ListView. 

listView:getItem(index)--Return an item at a given index.
listView:getItems()--Return all items in a ListView.
listView:getIndex(item)--Return the index of specified widget.

listView:requestDoLayout()--request to refresh widget layout 

listView:getClosestItemToPosition(Position,AnchorPoint)--Query the closest item to a specific position in inner container.
listView:getClosestItemToPositionInCurrentView(Vec2::ANCHOR_MIDDLE, Vec2::ANCHOR_MIDDLE)--Query the closest item to a specific position in current view.
listView:getCenterItemInCurrentView()--Query the center item.
listView:getLeftmostItemInCurrentView()--Query the leftmost item in horizontal list.
listView:getRightmostItemInCurrentView()--Query the rightmost item in horizontal list.
listView:getTopmostItemInCurrentView()--Query the topmost item in horizontal list.
listView:getBottommostItemInCurrentView()--Query the bottommost item in horizontal list.

listView:jumpToBottom()
listView:jumpToTop()--Move inner container to top boundary of scrollview. 
listView:jumpToItem()
listView:jumpToLeft()
listView:jumpToRight()
listView:jumpToTopLeft()
listView:jumpToTopRight()
listView:jumpToBottomLeft()
listView:jumpToBottomRight()
listView:jumpToPercentVertical(float)--1~100
listView:jumpToPercentHorizontal(float)--1~100
listView:jumpToPercentBothDirection(Vec2)

listView:setScrollDuration(float)--getScrollDuration  Set the time in seconds to scroll between items.
listView:scrollToItem(itemIndex,positionRatioInView,itemAnchorPoint)--Scroll to specific item.

listView:getCurSelectedIndex()--Query current selected widget's index.
listView:setCurSelectedIndex(int)--Set current selected widget's index and call TouchEventType::ENDED event.

listView:addEventListenerListView(Ref,SEL_ListViewEvent )--Add an event click callback to ListView, then one item of Listview is clicked, the callback will be called.
listView:addEventListener(callback)--Add an event click callback to ListView, then one item of Listview is clicked, the callback will be called.

listView:requestRefreshView()--Refresh view and layout of ListView manually.
listView:refreshView()--Refresh content view of ListView.
