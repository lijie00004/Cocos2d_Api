
scene:getDescription()--(String)Gets the description string.
scene:getPhysicsWorld()--(String)Get the physics world of the scene.
scene:registerScriptHandler(function(event)
    if event == "enter" then--进入场景时触发
    elseif event == "enterTransitionFinish" then--场景进入并且过渡动画完成时候触发
    elseif event == "exit" then--退出场景时触发
    elseif event == "exitTransitionStart" then--场景退出过渡动画开始时候触发
    elseif event == "cleanup" then--场景销毁时候触发
    end
end)

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
local cc.Director:getInstance():getRunningScene()
cc.Director:getInstance():runWithScene(scene)--Enters the Director's main loop with the given Scene
cc.Director:getInstance():pushScene(scene)--Suspends the execution of the running scene, pushing it on the stack of suspended scenes(暂停并挂起当前场景，进入下个场景)
cc.Director:getInstance():popScene()--Pops out a scene from the stack
cc.Director:getInstance():popToRootScene()--Pops out all scenes from the stack until the root scene in the queue
cc.Director:getInstance():popToSceneStackLevel(Int level)--Pops out all scenes from the stack until it reaches level（等级为0为导演，等级为1为根场景）
cc.Director:getInstance():replaceScene(Scene * scene)--Replaces the running scene with a new one
cc.Director:getInstance():pause()--Pauses the running scene.The running scene will be drawed but all scheduled timers will be paused. While paused, the draw rate will be 4 FPS to reduce CPU consumption
cc.Director:getInstance():resume()--Resumes the paused scene.The scheduled timers will be activated again. The "delta time" will be 0 (as if the game wasn't paused).
cc.Director:getInstance():end()--Ends the execution, releases the running scene(结束游戏)

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