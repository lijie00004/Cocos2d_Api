--场景过渡动画
    local ts = cc.TransitionJumpZoom:create(1.0, settingScene)--第一个参数是动画持续时间，第二个是场景对象
    cc.Director:getInstance():pushScene(ts)
               --TransitionFadeTR       网格过渡动画，从左下到右上
               --TransitionJumpZoom     跳动过渡动画
               --TransitionCrossFade    交叉渐变过渡动画
               --TransitionMoveInL      从左边推入覆盖过渡动画
               --TransitionShrinkGrow   放缩交替的过渡动画
               --TransitionRotoZoom     类似照相机镜头旋转放缩交替的过渡动画
               --TransitionSlideInL     从左侧推入的过渡动画
               --TransitionSplitCols    按列分割界面的过渡动画
               --TransitionSplitRows    按行分割界面的过渡动画
               --TransitionTurnOffTiles 生产随机瓦片方格的过渡动画

    
--切换场景
    cc.Director:getInstance():runWithScene(gameScene)--只能启动第一个场景时调用
    cc.Director:getInstance():replaceScene(gameScene)--切换到下个场景
    cc.Director:getInstance():pushScene(settingScene)--将当前场景挂起放到场景堆栈中，然后切换到下个场景
    cc.Director:getInstance():popScene()--与pushScene配合使用，返回上个场景
    cc.Director:getInstance():popToRootScene()--与pushScene配合使用，返回根场景
--场景生命周期
    --pushScene
        nextScene:ctor()
        --currentScene:onExitTransitionStart()
        nextScene:onEnter()
        --currentScene:onExit()
        nextScene:enterTransitionFinish()
     --replaceScene
        nextScene:ctor()
        --currentScene:onExitTransitionStart()
        nextScene:onEnter()
        --currentScene:onExit()
        nextScene:enterTransitionFinish()
        --currentScene:cleanup()
    --popScene
        --currentScene:onExitTransitionStart()
        --currentScene:onExit()
        --currentScene:cleanup()
        nextScene:onEnter()
        nextScene:enterTransitionFinish()

--场景原版
    local scene = require("MyActionScene")

    local size = cc.Director:getInstance():getWinSize()

    local LoadingScene = class("LoadingScene",function()
        return cc.Scene:create()
    end)

    function LoadingScene.create()
        cclog("SceneName    LoadingScene")
        local scene = LoadingScene.new()
        scene:addChild(scene:createLayer())
        return scene
    end

    --不常用资源在onEnter()中创建缓冲，在onExit()中清除
    function LoadingScene:ctor()--相当init
        --场景生命周期事件处理
        --cc.SpriteFrameCache:getInstance():addSpriteFrames("help/help.plist")--缓存资源（长周期），一直都在的可以在main中加载
        local function onNodeEvent(event)
            if event == "enter" then--进入场景时触发
                self:onEnter()
            elseif event == "enterTransitionFinish" then--场景进入并且过渡动画完成时候触发
                self:onEnterTransitionFinish()
            elseif event == "exit" then--退出场景时触发
                self:onExit()
            elseif event == "exitTransitionStart" then--场景退出过渡动画开始时候触发
                self:onExitTransitionStart()
            elseif event == "cleanup" then--场景销毁时候触发
                self:cleanup()
            end
        end
        self:registerScriptHandler(onNodeEvent)
    end

    -- 创建层
    function LoadingScene:createLayer()
        cclog("LoadingScene init")
        local layer = cc.Layer:create()
        return layer
    end

    function LoadingScene:onEnter()
        cclog("LoadingScene onEnter")
    end

    function LoadingScene:onEnterTransitionFinish()
        cclog("LoadingScene onEnterTransitionFinish")
    end

    function LoadingScene:onExit()
        cclog("LoadingScene onExit")
    end

    function LoadingScene:onExitTransitionStart()
        cclog("LoadingScene onExitTransitionStart")
    end

    function LoadingScene:cleanup()
        cclog("LoadingScene cleanup")
    end

    return LoadingScene



    

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
        -- avoid memory leak
        collectgarbage("setpause", 100)
        collectgarbage("setstepmul", 5000)

        --添加路径
        local sharedFileUtils = cc.FileUtils:getInstance()
        sharedFileUtils:addSearchPath("src")
        sharedFileUtils:addSearchPath("res")
        --获取所有路径
        local searchPaths = sharedFileUtils:getSearchPaths()
        --获取屏幕大小frameSize
        local director = cc.Director:getInstance()
        local glview = director:getOpenGLView()
        local frameSize = glview:getFrameSize()

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

