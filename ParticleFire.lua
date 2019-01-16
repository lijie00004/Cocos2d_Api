--内置粒子系统
	--创建火焰粒子系统对象
	local particleSystem = cc.ParticleFire:create()
							--ParticleExplosion	爆炸粒子效果，半径模式
							--ParticleGalaxy	星系粒子效果，半径模式
							--ParticleSprital	旋涡粒子效果，半径模式

							--ParticleFire		爆炸粒子效果 重力模式
							--ParticleFireworks	烟花粒子效果 重力模式
							--ParticleFlower    花粒子效果   重力模式
							--ParticleMeteor	流星粒子效果 重力模式
							--ParticleSnow		雪粒子效果   重力模式
							--ParticleSmoke		烟粒子效果   重力模式
							--ParticleSun		太阳粒子效果 重力模式
							--ParticleRain		雨粒子效果   重力模式

	--设置粒子的重力
	particleSystem:setGravity(cc.p(45, 300))
	--设置径向加速度
	particleSystem:setRadialAccel(58)
	--设置粒子初始化大小
	particleSystem:setStartSize(84)
	--设置粒子初始化大小偏差
	particleSystem:setStartSizeVar(73)
	--设置粒子最后大小偏差
	particleSystem:setEndSize(123)
	--设置粒子最后大小偏差
	particleSystem:setEndSizeVar(17)
	--设置粒子切向加速度
	particleSystem:setTangentialAccel(70)
	--设置粒子切向加速度偏差
	particleSystem:setTangentialAccelVar(47)
	--设置粒子生命期
	particleSystem:setLife(0.79)
	--设置粒子生命期偏差
	particleSystem:setLifeVar(0.45)

	particleSystem:setPosition(cc.Director:getInstance():convertToGL(cc.p(270, 380)))
	layer:addChild(particleSystem)

--自定义粒子系统方法一：代码创建
	--指定初始粒子数（200）
	local particleSystem = cc.ParticleSystemQuad:createWithTotalParticles(200)--粒子初始化的个数

    --设置雪花粒子纹理图片
    particleSystem:setTexture(cc.Director:getInstance():getTextureCache():addImage("snow.png"))
    --设置发射粒子的持续时间-1表示永远持续
    particleSystem:setDuration(-1)
    --设置粒子的重力方向
    particleSystem:setGravity(cc.p(0,-240))

    --设置角度以及偏差
    particleSystem:setAngle(90)
    particleSystem:setAngleVar(360)

    --设置径向加速度以及偏差
    particleSystem:setRadialAccel(50)
    particleSystem:setRadialAccelVar(0)

    --设置粒子的切向加速度以及偏差
    particleSystem:setTangentialAccel(30)
    particleSystem:setTangentialAccelVar(0)

    -- 设置粒子初始化位置偏差
    particleSystem:setPosVar(cc.p(400,0))

    --设置粒子生命期以及偏差
    particleSystem:setLife(4)
    particleSystem:setLifeVar(2)

    --设置粒子开始时候旋转角度以及偏差
    particleSystem:setStartSpin(30)
    particleSystem:setStartSpinVar(60)

    --设置结束时候的旋转角度以及偏差
    particleSystem:setEndSpin(60)
    particleSystem:setEndSpinVar(60)

    --设置开始时候的颜色以及偏差
    particleSystem:setStartColor(cc.c4b(1,1,1,1))
    --设置结束时候的颜色以及偏差
    particleSystem:setEndColor(cc.c4b(1,1,1,1))

    --设置开始时候粒子大小以及偏差
    particleSystem:setStartSize(30)
    particleSystem:setStartSizeVar(0)

    --设置粒子结束时候大小以及偏差
    particleSystem:setEndSize(20.0)
    particleSystem:setEndSizeVar(0)

    --设置每秒钟产生粒子的数量
    particleSystem:setEmissionRate(100)

    particleSystem:setPosition(cc.p(size.width/2, size.height + 50))
    layer:addChild(particleSystem)

--自定义粒子系统方法二：plist文件创建
	--用Particle Designer等粒子设计工具进行设计
	--需要将plist文件和纹理图片放到Resources目录下
	local particleSystem = cc.ParticleSystemQuad:create("snow.plist")
    particleSystem:setPosition(cc.p(size.width/2, size.height + 50))
    layer:addChild(particleSystem)