--cocos2d-2
    local image= ImageView:create()
    image:loadTexture("images/common_3/banner_chenggong.png")
    image:ignoreContentAdaptWithSize(false)
    image:setSize(CCSize(60,60))
    image:setScale9Enabled(true)
    image:setCapInsets(CCRect(117,13,117,13))
    image:setSize(CCSize(370,89))
    image:setOpacity(150)
    image:setFlipX(true)
    mainBg:addChild(image)
    image1:setTextureRect(CCRectMake(0,0,100,100))
--动画
    local file = "shilianzhimen_01"
    CCArmatureDataManager:sharedArmatureDataManager():removeArmatureFileInfo(armatureAnimPath(file))
    local armatureDataManager = CCArmatureDataManager:sharedArmatureDataManager()
    armatureDataManager:addArmatureFileInfo("export/"..file..".ExportJson")
    local armature = CCArmature:create(file)
    self.layer:addChild(armature)
    armature:setPosition(ccp(240,140*(1-i)+720))
    armature:getAnimation():playWithIndex(0)



--cocos2d-3
    local sprite = cc.Sprite:create()--create(filePath) create(filePath,cc.rect(20,20,100,100))
    
    local cache = cc.Director:getInstance():getTextureCache():addImage(".png")--纹理缓存
    local sprite_texture = cc.Sprite:createWithTexture(cache)--createWithTexture(filePath,cc.rect(20,20,100,100))
    
    local frameCache = cc.Director:getInstance():addSpriteFrames("SpirteSheet.plist")--精灵帧缓存
    local sprite_frame = cc.Sprite:createWithSpriteFrameName(".png")--参数是精灵帧名字
    sprite_frame:setSpriteFrame(".png")
    --不使用要移除精灵帧
    cc.SpriteFrameCache:getInstance():removeSpriteFrameByName(name)--指定精灵帧名移除
    cc.SpriteFrameCache:getInstance():removeSpriteFrames()--移除精灵缓存
    cc.SpriteFrameCache:getInstance():removeSpriteFramesFromFile(plist)--指定文件移除精灵帧
    cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()--移除没有使用精灵帧

    --主要用于精灵动画
    local frameCache = cc.Director:getInstance():addSpriteFrames("SpirteSheet.plist")
    local frame = cc.Director:getInstance():getSpriteFrameByName(".png")--创建精灵帧对象
    local sprite_frame = cc.Sprite:createWithSpriteFrame(frame)
    sprite_frame:setDisplayFrame(frame)

    sprite:setTexture(".png")--update texture,纹理的矩形没有改变。
    sprite:getTexture()
    sprite:setTextureRect(cc.rect(10,10,50,50))
    sprite:getCenterRect()
    sprite:setDisplayFrameWithAnimationName(string_animation)
    sprite:setFlippedX(boolean)--翻转沿X轴
    sprite:setFlippedY(boolean)
    sprite:setStretchEnabled(boolean)--(default true) 控制图片是否填满节点大小setContentSize
    sprite:isStrechEnabled()
    sprite:reorderChild()--子节点重新排序

    sprite:initWithTexture(cache)
    sprite:initWithSpriteFrame(frame)
    sprite:initWithSpriteFrameName(string)
    sprite:initWithFile(string)--参数个数为1，清空所有,比如翻转

    sprite:init()--参数个数为0，清空所有，包括图片


-- 创建ImageView对象
    local imageView = ccui.ImageView:create("HelloWorld.png")
    imageView:loadTexture(filePath)
    imageView:setTextureRect(cc.rect(0,0,20,20))
    imageView:getVirtualRendererSize()--获取的是原图大小

    imageView:setScale9Enabled(true)--default false
    imageView:setCapInsets(cc.rect(10,10,10,10))
    imageView:setContentSize(cc.size(200, 100))

    imageView:ignoreContentAdaptWithSize(false)--true将忽略用户定义的内容大小
    imageView:setContentSize(cc.size(200, 100))


--创建sprite
    --九宫格
    local sprite = cc.Scale9Sprite:create("bg/bg_3.png")--create(cc.rect(0,0,100,100),"bg/character.png")
                                --createWithSpriteFrame
                                --createWithSpriteFrameName
    sprite:setScale9Enabled(true)--默认开启，所以不用写
    sprite:setCapInsets(cc.rect(25,25,3,4))--自动识别大小，可以不用写
    sprite:setContentSize(cc.size(265,46))

    sprite:getSprite()--(sprite)Get the original no 9-sliced sprite.
    sprite:getOriginalSize()--(size)Query the sprite's original size

    sprite:setState(int)--0显示正常图片，1显示变灰图片


    -- 如果图片比较大，如背景图，可以考虑异步加载
    --异步加载图片
    function GameScene:createLayer()
        local layer = cc.Layer:create()

        local function loadingCallBack(texture)
            _numberOfLoadedSprites  = _numberOfLoadedSprites + 1
            local str = string.format("%d%%",(_numberOfLoadedSprites / _numberOfSprites)*100)--%%是起到转义作用
            _labelPercent:setString(str)
            _imageOffset = _imageOffset +1
            local i = _imageOffset * 60
            cclog("i,_imageOffset = %d,  %d",i,_imageOffset)

            local sprite = cc.Sprite:createWithTexture(texture)
            sprite:setAnchorPoint(cc.p(0,0))
            layer:addChild(sprite, -1)
            --math.floor取小于该数的最大整数
            local x =  math.floor(i % size.width)--取余
            local y =  math.floor(i / size.width) * 60

            cclog("x,y = %d,  %d",x,y)

            sprite:setPosition(cc.p( x, y))

            if _numberOfLoadedSprites == _numberOfSprites then--判读是否结束
                _numberOfLoadedSprites = 0--初始化
            end
        end

        _labelLoading = cc.Label:createWithTTF("loading...", "fonts/Marker Felt.ttf", 35)
        _labelPercent = cc.Label:createWithTTF("0%%", "fonts/Marker Felt.ttf", 35)

        _labelLoading:setPosition(cc.p(size.width / 2, size.height / 2 - 20))
        _labelPercent:setPosition(cc.p(size.width / 2, size.height / 2 + 20))

        layer:addChild(_labelLoading)
        layer:addChild(_labelPercent)

        _numberOfLoadedSprites = 0--已加载图片数
        _imageOffset = 0--控制sprite位置

        local sharedFileUtils = cc.FileUtils:getInstance()--获取FileUtils实例
        local fullPathForFilename = sharedFileUtils:fullPathForFilename("ImageMetaData.plist")--获取全路径

        local vec = sharedFileUtils:getValueVectorFromFile(fullPathForFilename)--读入到vec中
        _numberOfSprites = table.getn(vec)----要加载的图片总数
        cclog(_numberOfSprites)

        for i=1, table.getn(vec) do
            local row = vec[i]
            local filename = "icons/" .. row["filename"]--图片位置
            cc.Director:getInstance()--TextureCache类异步加载函数
                :getTextureCache():addImageAsync(filename, loadingCallBack)--第一个参数是文件路径，第二个参数是回调函数
        end
        
        return layer
        
    end