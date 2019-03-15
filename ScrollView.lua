  --old version
    scrollList = ScrollView:create()
    scrollList:setSize(CCSizeMake(380,100))
    scrollList:setAnchorPoint(ccp(0,0))
    scrollList:setPosition(ccp(50,734))
    scrollList:setEnabled(true)
    scrollList:setBounceEnabled(true)
    scrollList:setDirection(SCROLLVIEW_DIR_HORIZONTAL)--SCROLLVIEW_DIR_VERTICAL
    uiLayer:addWidget(scrollList)
    local innerWidth = self.scrollViewRecruit:getSize().width
    local innerHeight = self.scrollViewRecruit:getSize().height
    scrollList:removeAllChildren()
    scrollList:setInnerContainerSize(CCSizeMake(innerWidth,innerHeight))
    self.scrollViewMallPos = self.scrollViewMall:getInnerContainer():getPositionY()

    self.scrollList1:getInnerContainer():getChildByTag(curpos):getPositionX() - self.scrollList1:getInnerContainer():getChildByTag(1):getPositionX() > 220 then
    self.scrollViewMallPos = 220 - self.scrollList1:getInnerContainer():getChildByTag(pos):getPositionX()

    self.scrollViewMall:getInnerContainer():setPosition(ccp(0,self.scrollViewMallPos))--设置scrollview的子容器位置

    scrollList:isEnabled()--true or false

    self.scrollList1 = UIListView2:create()
    self.scrollList1:setSize(CCSizeMake(480, 560))
    self.scrollList1:setAnchorPoint(ccp(0,0))
    self.scrollList1:setPosition(ccp(0,132))
    uiLayer:addWidget(self.scrollList1)
    self.scrollList1:removeAllChildren()
    local innerWidth = self.scrollList1:getSize().width
    local innerHeight = self.scrollList1:getSize().height
    local temp = {}
    for k,v in pairs(XmlCharacter) do
        table.insert(temp,k)
    end
    table.sort(temp,function(a,b) return(XmlCharacter[a].star > XmlCharacter[b].star) end)
    for i = 1,6 do
        local layout = Layout:create()
        layout:setSize(CCSizeMake(480, 112))
        layout:setPosition(ccp(0,innerHeight-112*i))
        self.scrollList1:addChild(layout)
        for j = 0,3 do
            local function cInfoBtnEvent(node,eventType)
                if eventType == TOUCH_EVENT_ENDED then
                    SimpleAudioEngine:sharedEngine():playEffect("music/click.mp3")
                    local character = Character:create(temp[(i-1)*4+j+1],1)
                    CharacterInfoLayer.fromLayer = "CardGuideLayer"
                    local layer = CharacterInfoLayer:create(character, nil, false)
                    print("layer.fromLayer", layer.fromLayer)
                    MainLayer:addLayer(layer,"CharacterInfoLayer",1025)
                end
            end
            local frm = Button:create()
            frm:setName("frm"..j)
            frm:setTouchEnabled(true)
            frm:setPosition(ccp(90+(j%4)*100, 63))
            layout:addChild(frm)
            frm:addTouchEventListener(cInfoBtnEvent)
            local frmBg = ImageView:create()
            frmBg:setName("frmBg"..j)
            frm:addChild(frmBg, 10)
        end
    end   
    local nCount = 0
    local function eventHandler(eventType)
        print(eventType)
        if eventType == "initChild" then
            --local layout = tolua.cast(self.scrollList1:getUpdateChild(),"Layout")
            local layout = self.scrollList1:getUpdateChild()
            for i = 0,3 do
                local frm = tolua.cast(layout:getChildByName("frm"..i),"Button")
                local frmBg = tolua.cast(frm:getChildByName("frmBg"..i),"ImageView")
                frm:loadTextures("images/face/"..XmlCharacter[temp[nCount*4+i+1]].body,"images/face/"..XmlCharacter[temp[nCount*4+i+1]].body)
                frmBg:loadTexture("images/playerFrame/frame_"..XmlCharacter[temp[nCount*4+i+1]].star..".png")
                local name = Label:create()
                name:setName("name"..i)
                name:setFontName(LFont())
                name:setFontSize(16)
                name:setColor(getCardQualityColor(XmlCharacter[temp[nCount*4+i+1]].star))
                name:setText(LStr(XmlCharacter[temp[nCount*4+i+1]].nickname))
                name:setPosition(ccp(0,-54))
                frm:addChild(name)
                local cover = ImageView:create()
                cover:setName("cover"..i)
                cover:ignoreContentAdaptWithSize(false)
                cover:setSize(CCSizeMake(89,89))
                cover:loadTexture("images/spr51_z.png")
                frm:addChild(cover,2)
                if self.C_CollectId[temp[nCount*4+i+1]] ~= 1 then
                    -- frm:setTouchEnable(true)
                    -- name:setVisible(true)
                    cover:setVisible(true)
                else
                    cover:setVisible(false)
                end
            end
            nCount = nCount + 1
        elseif eventType == "updateChild" then
            local index = self.scrollList1:getUpdateDataIndex()
            if index < 0 or index >= self.scrollList1:getDataLength() then
                self.scrollList1:setUpdateSuccess(false)
            else
                local layout = tolua.cast(self.scrollList1:getUpdateChild(),"Layout")
                for i = 0,3 do
                    local function cInfoBtnEvent(node,eventType)
                        if eventType == TOUCH_EVENT_ENDED then
                            SimpleAudioEngine:sharedEngine():playEffect("music/click.mp3")
                            print("temId = "..temp[index*4+i+1])
                            local character = Character:create(temp[index*4+i+1],1)
                            CharacterInfoLayer.fromLayer = "CardGuideLayer"
                            local layer = CharacterInfoLayer:create(character, nil, false)
                            MainLayer:addLayer(layer,"CharacterInfoLayer",1025)
                        end
                    end
                    local frm = tolua.cast(layout:getChildByName("frm"..i),"Button")
                    local frmBg = tolua.cast(frm:getChildByName("frmBg"..i),"ImageView")
                    frm:addTouchEventListener(cInfoBtnEvent)
                    if temp[index*4+i+1] == nil then
                        frm:setVisible(false)
                        frm:setTouchEnabled(false)
                    else
                        frm:setVisible(true)
                        frm:setTouchEnabled(true)
                        frmBg:loadTexture("images/playerFrame/frame_"..XmlCharacter[temp[index*4+i+1]].star..".png")
                        frm:loadTextures("images/face/"..XmlCharacter[temp[index*4+i+1]].body,"images/face/"..XmlCharacter[temp[index*4+i+1]].body)
                        local name = tolua.cast(layout:getChildByName("name"..i),"Label")
                        name:setColor(getCardQualityColor(XmlCharacter[temp[index*4+i+1]].star))
                        name:setText(LStr(XmlCharacter[temp[index*4+i+1]].nickname))
                        local cover = tolua.cast(layout:getChildByName("cover"..i),"Label")
                        if self.C_CollectId[temp[index*4+i+1]] ~= 1 then
                            cover:setVisible(true)
                            -- name:setVisible(false)
                            -- frm:setTouchEnable(false)
                        else
                            cover:setVisible(false)
                            -- name:setVisible(true)
                            -- frm:setTouchEnable(true)
                        end
                    end
                end
                self.scrollList1:setUpdateSuccess(true)
            end
        end
    end
    
    self.scrollList1:registerScriptHandler(eventHandler)
    self.scrollList1:initChildWithDataLength(math.ceil(#temp / 4))

--new version
    local scrollView = ScrollView:create()
    scrollView:setDirection(SCROLLVIEW_DIR_HORIZONTAL)
    scrollView:getDirection()--(direction)
    scrollView:getInnerContainer()--(Layout)Get inner container of scrollview.Inner container is a child of scrollview
    scrollView:getInnerContainer():getPostion()--获取当前坐标
    scrollView:scrollToBottom(float,boolean)--Scroll inner container to bottom boundary of scrollview.boolean(滚动速度衰减与否)
    scrollView:scrollToTop(float,boolean)--Scroll inner container to top boundary of scrollview.float(所需时间),boolean(滚动速度衰减与否)
    scrollView:scrollToTop(float,boolean)
    scrollView:scrollToRight(float,boolean)
    scrollView:scrollToTopLeft(float,boolean)
    scrollView:scrollToTopRight(float,boolean)
    scrollView:scrollToBottomLeft(float,boolean)
    scrollView:scrollToBottomRight(float,boolean)
    scrollView:scrollToPercentVertical(float_1,float_2,boolean)--Scroll inner container to vertical percent position of scrollview.
                --float_1( A value between 0 and 100),float_2(Time in seconds),boolean(Whether scroll speed attenuate or not)
    scrollView:scrollToPercentHorizontal(float_1,float_2,boolean)
