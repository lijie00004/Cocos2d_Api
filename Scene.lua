--场景过渡动画
    local ts = cc.TransitionJumpZoom:create(1.0, settingScene)--第一个参数是动画持续时间，第二个是场景对象
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

    cc.Director:getInstance():pushScene(ts)
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


local size = cc.Director:getInstance():getWinSize()

local scene = require("MyActionScene")
local nextScene  =scene.create()
local ts = cc.TransitionJumpZoom:create(1, nextScen保e)--动画效果
cc.Director:getInstance():pushScene(ts)--留本场景，切换到新场景
cc.Director:getInstance():popScene()--返回之前场景

local LoadingScene = class("LoadingScene",function()
    return cc.Scene:create()
end)

function LoadingScene.create()
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
    --cc.SpriteFrameCache:getInstance():addSpriteFrames("help/help.plist")--缓存资源（短周期）
end

function LoadingScene:onEnterTransitionFinish()
    cclog("LoadingScene onEnterTransitionFinish")
end

function LoadingScene:onExit()
    cclog("LoadingScene onExit")
    --cc.SprteFrameCache:getInstance():removeSpriteFramesFromFile("help/help.plist")（短周期）
    --cc.SprteFrameCache:getInstance():removeSpriteFrameByName(name)--清除特定名字帧（短周期）
    --cc.SprteFrameCache:getInstance():removeSpriteFrames()--清除所有缓存中的帧（短周期）
    --cc.SprteFrameCache:getInstance():removeUnusedSpriteFrames()--清除所有缓存中未使用的帧（短周期）
end

function LoadingScene:onExitTransitionStart()
    cclog("LoadingScene onExitTransitionStart")
end

function LoadingScene:cleanup()
    cclog("LoadingScene cleanup")
end

return LoadingScene
