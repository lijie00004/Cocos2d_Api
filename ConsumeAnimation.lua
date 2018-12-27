preAttr ={CurPlayer.gold,CurPlayer.diamond}--购买前数量
fromAttrObj={self.money,self.renMoney}--铜钱Label--钻石Label
attr={1,CurPlayer.gold,2,CurPlayer.diamond}--购买后数量

function playUpgradeAnimation(preAttr,fromAttrObj,attr)
    local count = math.floor(#attr/2)--4/2=2
    print("count=",count)
    for i=1,count do
        local maxValue = attr[(i-1)*2 + 2]--购买后数量
        print("dddddddddddddddmaxValue", maxValue)
        local value = maxValue - preAttr[i]--购买后的数量-购买前的数量--51-55
        print("dddddddddddddddpreAttr[attr[(i-1)*2+1]]", value,preAttr[i])-- -4 --55
        if value ~= 0 then-- -4
            local function finish(node)
                if preAttr[i] < maxValue and value > 0 then
                    if value < 10 then
                        preAttr[i] = math.ceil(preAttr[i] + 1)
                    else
                        preAttr[i] = math.ceil(preAttr[i] + (value / 10))
                    end
                    print("dddddddddddddddvalue", value)
                    node:setScale(1.5)
                    node:setText(preAttr[i])
                    node:enableStroke(ccc3(0,0,0), 0.8)
                elseif preAttr[i] > maxValue and value < 0 then
                    if value > -10 then
                        preAttr[i] = math.ceil(preAttr[i] + (-1))
                    else
                        preAttr[i] = math.ceil(preAttr[i] + (value / 10))
                    end
                    node:setScale(1.5)
                    node:setText(preAttr[i])
                    node:enableStroke(ccc3(0,0,0), 0.8)
                else
                    local function moveFinish(node)
                        node:setText("")
                        node:enableStroke(ccc3(0,0,0), 0.8)
                        dispatcher:setDispatchEvents(true)
                    end
                    local tempLabel = Label:create()
                    tempLabel:setFontName(LFont())
                    tempLabel:setFontSize(15)
                    if value > 0 then
                        tempLabel:setText("+"..value)
                        tempLabel:setColor(ccc3(0, 255, 0))
                    else
                        tempLabel:setText(value)
                        tempLabel:setColor(ccc3(255, 0, 0))
                    end
                    local array3 = CCArray:create()
                    array3:addObject(CCMoveBy:create(0.5, ccp(0, 10)))
                    array3:addObject(CCCallFuncN:create(moveFinish))
                    tempLabel:setAnchorPoint(ccp(1.0, 0.5))
                    tempLabel:setPosition(ccp(-70, 0))
                    tempLabel:runAction(CCSequence:create(array3))
                    node:addChild(tempLabel)
                    tempLabel:enableStroke(ccc3(0,0,0), 0.8)
                    node:setText(bigNumSwith(maxValue))
                    node:stopAllActions()
                    node:setScale(1.0)
                    node:enableStroke(ccc3(0,0,0), 0.8)
                end
            end
            local array = CCArray:create()
            array:addObject(CCDelayTime:create(0.03))
            array:addObject(CCCallFuncN:create(finish))
            print("ddddattr[(i-1)*2+1]", attr[(i-1)*2+1])
            fromAttrObj[i]:runAction(CCRepeatForever:create(CCSequence:create(array)))
        end
    end--
end