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
    -- 创建ImageView对象
        local imageView = ccui.ImageView:create("HelloWorld.png")
        imageView:setPosition(size.width / 2, size.height / 2)
        layer:addChild(imageView)

        imageView:setScale9Enabled(true)--四个角不变，截取的范围放大或缩小
        imageView:setCapInsets(cc.rect(10,10,10,10))
        imageView:setContentSize(cc.size(200, 100))

        imageView:ignoreContentAdaptWithSize(false)
        imageView:setContentSize(cc.size(200, 100))

        imageView:setTextureRect(cc.rect(0,0,20,20))--尺寸还是原先尺寸，截取范围放大或缩小



    --创建sprite
        --九宫格
        bg_3 = cc.Scale9Sprite:create("bg/bg_3.png")
        bg_3:setScale9Enabled(true)--默认开启，所以不用写
        bg_3:setCapInsets(cc.rect(25,25,3,4))--自动识别大小，可以不用写
        bg_3:setContentSize(cc.size(265,46))

        sprite:setContentSize(cc.size(423,370))--这是用sprite创建的精灵，直接设置大小，不用ignoreContentAdaptWithSize

        local sprite = cc.Sprite:create("HelloWorld.png")
                    --cc.Sprite:create(filename,cc.rect(x,y,width,height))--指定图片和裁剪的矩形区域来创建
                    --cc.Sprite:createWithTexture(texture)--指定纹理来创建
                    --cc.Sprite:createWithTexture(texture，rect,rotated=false)--指定纹理和裁剪的矩形区域来创建,第三个参数表示是否旋转，默认不旋转

    --纹理图集(Texture Atlas)把许多小的精灵图片组合到一张大图中
        --制作纹理图集工具网站：https://zwopple.com https://www.codeandweb.com
            local mountain1 = cc.Sprite:create("SpirteSheet.png",cc.rect(2,391, 934, 388))
            --裁剪范围参考.plist文件中的<string>[{0,16},{934,388}]</string>,第一个参数表示图片位置，第二个位置表示图片大小
        --也可以用纹理Texture2D对象
            local cache = cc.Director:getInstance():getTextureCache():addImage("SpirteSheet.png")
            local hero1 = cc.Sprite:create()
            hero1:setTexture(cache)
            hero1:setTextureRect(cc.rect(2,1706,391,327))



    --精灵帧缓存(SpriteFrameCache)

        cc.SpriteFrameCache:getInstance():addSpriteFrames("SpirteSheet.plist")--缓存文件
        --方法一
        local mountain1 = cc.Sprite:createWithSpriteFrameName("mountain1.png")
        --方法二，主要用于精灵动画
        local heroSpriteFrame = cc.SpriteFrameCache:getInstance():getSpriteFrameByName("hero1.png")
        local hero1 = cc.Sprite:createWithSpriteFrame(heroSpriteFrame)

        --移除精灵帧
        cc.SpriteFrameCache:getInstance():removeSpriteFrameByName(name)--指定精灵帧名移除
        cc.SpriteFrameCache:getInstance():removeSpriteFrames()--移除精灵缓存
        cc.SpriteFrameCache:getInstance():removeSpriteFramesFromFile(plist)--指定文件移除精灵帧
        cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()--移除没有使用精灵帧


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