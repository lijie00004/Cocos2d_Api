function movementEventSecondAnim(pArmature,movementType,animName)
    if movementType == 1 then
        CCArmatureDataManager:sharedArmatureDataManager():addArmatureFileInfo("images/naruto/csb/zhaomu1.csb")   
        local pArmature1 = CCArmature:create("zhaomu1")  
        pArmature1:setPosition(ccp(240,427))  
        RecruitResponseLayer.layer:addChild(pArmature1)
        pArmature1:getAnimation():setFrameEventCallFunc(frameEventShowHero)
        pArmature1:getAnimation():play("Animation1")
    end
end

CCArmatureDataManager:sharedArmatureDataManager():addArmatureFileInfo("images/naruto/csb/chouka_danchou.csb")
local pArmature = CCArmature:create("chouka_danchou")
pArmature:setPosition(ccp(240,427))
pArmature:setScale(1.3)
self.layer:addChild(pArmature)

pArmature:getAnimation():setMovementEventCallFunc(movementEventSecondAnim)
pArmature:getAnimation():play("Animation1")


CCArmatureDataManager:sharedArmatureDataManager():removeArmatureFileInfo("images/naruto/csb/zhaomu2.csb")