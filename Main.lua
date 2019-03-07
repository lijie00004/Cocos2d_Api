--main()函数
    require "cocos.init"
    --设计分辨率大小
    local designResolutionSize = cc.size(320, 568)--设计大小
    local smallResolutionSize = cc.size(640, 1136)
    local largeResolutionSize = cc.size(750, 1334)
    cclog = function(...)
        print(string.format(...))
    end

    local function main()
        collectgarbage("collect")
        -- avoid memory leak(避免内存泄漏)
        collectgarbage("setpause", 100)
        collectgarbage("setstepmul", 5000)

        --获得当前平台
        local targetPlatform = cc.Application:getInstance():getTargetPlatform()
        (cc.PLATFORM_OS_IPHONE == targetPlatform) or (cc.PLATFORM_OS_IPAD == targetPlatform)--判断io设备

        --添加路径
        local sharedFileUtils = cc.FileUtils:getInstance()
        sharedFileUtils:addSearchPath("src")
        sharedFileUtils:addSearchPath("res")
        --获取所有路径
        local searchPaths = sharedFileUtils:getSearchPaths()
        --获取屏幕大小frameSize
        local director = cc.Director:getInstance()
        local glview = director:getOpenGLView()
        local frameSize = glview:getFrameSize()--FrameSize是画框，WinSize是画布

        -- 如果屏幕分辨率高度大于small尺寸的资源分辨率高度，选择large资源。
        if frameSize.height > smallResolutionSize.height then
            director:setContentScaleFactor(math.min(largeResolutionSize.height / designResolutionSize.height, largeResolutionSize.width / designResolutionSize.width))
            table.insert(searchPaths, 1, "res/large")
        --如果屏幕分辨率高度小等于small尺寸的资源分辨率高度，选择small资源。
        else
            director:setContentScaleFactor(math.min(smallResolutionSize.height / designResolutionSize.height, smallResolutionSize.width / designResolutionSize.width))
            table.insert(searchPaths, 1, "res/small")
        end

        --设置资源搜索路径
        sharedFileUtils:setSearchPaths(searchPaths)

        -- 设置设计分辨率策略
        glview:setDesignResolutionSize(designResolutionSize.width, designResolutionSize.height, cc.ResolutionPolicy.FIXED_WIDTH)

        --设置是否显示帧率和精灵个数
        director:setDisplayStats(true)

        --设置帧率
        director:setAnimationInterval(1.0 / 60)
        
        --create scene 
        local scene = require("LoadingScene")
        local gameScene = scene.create()

        if cc.Director:getInstance():getRunningScene() then
            cc.Director:getInstance():replaceScene(gameScene)
        else
            cc.Director:getInstance():runWithScene(gameScene)
        end

    end


    local status, msg = xpcall(main, __G__TRACKBACK__)
    if not status then
        error(msg)
    end