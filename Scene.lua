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
        if event == "enter" then
            self:onEnter()
        elseif event == "enterTransitionFinish" then--是场景进入并且过渡动画完成时候触发
            self:onEnterTransitionFinish()
        elseif event == "exit" then
            self:onExit()
        elseif event == "exitTransitionStart" then--是场景退出过渡动画开始时候触发
            self:onExitTransitionStart()
        elseif event == "cleanup" then--是场景销毁时候触发
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
