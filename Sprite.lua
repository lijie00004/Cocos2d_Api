
local sprite = cc.Sprite:create("HelloWorld.png")

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