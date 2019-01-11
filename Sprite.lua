
-- 创建ImageView对象
local imageView = ccui.ImageView:create("HelloWorld.png")
imageView:setPosition(size.width / 2, size.height / 2)
layer:addChild(imageView)



--创建sprite
    local sprite = cc.Sprite:create("HelloWorld.png")
                --cc.Sprite:create(filename,cc.rect(x,y,width,height))--指定图片和裁剪的矩形区域来创建
                --cc.Sprite:createWithTexture(texture)--指定纹理来创建
                --cc.Sprite:createWithTexture(texture，rect,rotated=false)--指定纹理和裁剪的矩形区域来创建,第三个参数表示是否旋转，默认不旋转
                --cc.Sprite:createWithSpriteFrame(pSpriteFrame)--通过一个精灵帧对象来创建
                --cc.Sprite:createWithSpriteFrameName(spriteFrameName)--通过指定帧缓存中精灵帧名来创建
    --不知道为什么多此一举
    local cache = cc.Director:getInstance():getTextureCache():addImage("HelloWorld.png")--创建纹理Texture2D对象
    --cc.Director:getInstance():getTextureCache()--获得TextureCache实例，
    local tree2 = cc.Sprite:create()
    tree2:setSpriteFrame(enemyFramName)
    --也可
    tree2:setTexture(cache)
    tree2:setTextureRect(cc.rect(73, 72,182,270))

--纹理图集(Texture Atlas)也称为精灵表(Sprite Sheet)：把许多小的精灵图片组合到一张大图中
    --制作纹理图集工具网站：https://zwopple.com https://www.codeandweb.com
        local mountain1 = cc.Sprite:create("SpirteSheet.png",cc.rect(2,391, 934, 388))
        --裁剪范围参考.plist文件中的<string>[{0,16},{934,388}]</string>,第一个参数表示图片位置，第二个位置表示图片大小
    --也可以用纹理Texture2D对象
        local cache = cc.Director:getInstance():getTextureCache():addImage("SpirteSheet.png")
        local hero1 = cc.Sprite:create()
        hero1:setTexture(cache)
        hero1:setTextureRect(cc.rect(2,1706,391,327))

--精灵帧缓存(SpriteFrameCache)
    cc.SpriteFrameCache:getInstance():addSpriteFrames("SpirteSheet.plist")
    local mountain1 = cc.Sprite:createWithSpriteFrameName("mountain1.png")
    --也可
    local heroSpriteFrame = cc.SpriteFrameCache:getInstance():getSpriteFrameByName("hero1.png")
    local hero1 = cc.Sprite:createWithSpriteFrame(heroSpriteFrame)
    --移除精灵帧
        cc.SpriteFrameCache:getInstance():removeSpriteFrameByName(name)--指定精灵帧名移除
        cc.SpriteFrameCache:getInstance():removeSpriteFrames()--移除精灵缓存
        cc.SpriteFrameCache:getInstance():removeSpriteFramesFromFile(plist)--指定坐标文件移除精灵帧
        cc.SpriteFrameCache:getInstance():removeUnusedSpriteFrames()--移除没有使用精灵帧


-- 如果频率高，就在游戏初始化时加载
-- 如果频率第，就在进入场景时加载
-- 如果图片比较大，可以考虑异步加载

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
    _imageOffset = 0

    local sharedFileUtils = cc.FileUtils:getInstance()--获取FileUtils实例
    local fullPathForFilename = sharedFileUtils:fullPathForFilename("ImageMetaData.plist")--获取全路径

    local vec = sharedFileUtils:getValueVectorFromFile(fullPathForFilename)--读入到vec中
    _numberOfSprites = table.getn(vec)----要加载的图片总数
    cclog(_numberOfSprites)

    for i=1, table.getn(vec) do
        local row = vec[i]
        local filename = "icons/" .. row["filename"]
        cc.Director:getInstance()
            :getTextureCache():addImageAsync(filename, loadingCallBack)--第一个参数是文件路径，第二个参数是回调函数
    end
    
    return layer
    
end