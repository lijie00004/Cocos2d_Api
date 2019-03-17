--old version
    --触摸使用uiLayer和addWidget
    local uiLayer = TouchGroup:create()
    local colorBg = CCLayerColor:create(ccc4(0, 0, 0, 180), 480, 854)
    local layer = CCLayer:create()
    layer:retain()


--new version
--默认尺寸大小为窗口大小
--设置layerColor混合模式https://blog.51cto.com/shahdza/1548560
    local layer = cc.Layer:create()
    layer:ignoreAnchorPointForPosition(false)--设置锚点为(0.5,0.5)，默认锚点在(0,0),

    local layerColor = cc.LayerColor:create(cc.c3b(255, 255, 255),width,height)--cc.c4b(255, 255, 255,255)
    layerColor:changeWidth(width)--Change width in Points.
    layerColor:changeHeight(height)--Change height in Points.
    layerColor:changeWidthAndHeight(width,height)--Change height in Points.
    layerColor:setContentSize(Size)--Sets the untransformed size of the node.
    layerColor:getDescription()--It makes debugging easier

    local layerGradient = cc.LayerGradient:create(cc.c3b(255, 255, 255),cc.c3b(0,0,0),ccp(1,1))--cc.c4b(255, 255, 255,255)

    local layerGradient = cc.LayerMultiplex:create()
    local layerGradient = cc.LayerMultiplex:createWithLayer(Layer)--Creates a LayerMultiplex with one layer.
    local layerGradient = cc.LayerMultiplex:createWithArray(Vector)--Creates a LayerMultiplex with an array of layers.
    layerGradient:addLayer(Layer)--Add a certain layer to LayerMultiplex.
    layerGradient:switchTo(int)--int(从0开始），Switches to a certain layer indexed by n.
    layerGradient:switchToAndReleaseMe(int)--不能用release the current layer and switches to another layer indexed by n

    local function onNodeEvent(event)
    	if event == "exit" then--判断是否为退出层事件,enter
    		layer:unsheduleUpdate()--停止游戏调度
        elseif event == "exit" then
    	end
    end
    layer:registerScriptHandler(onNodeEvent)--注册层事件监听器
										--sprite也可以注册层级事件监听器


