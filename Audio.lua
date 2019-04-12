--old version
SimpleAudioEngine:sharedEngine():playEffect("music/guanbi.mp3")
SimpleAudioEngine:sharedEngine():setBackgroundMusicVolume(0.3)
SimpleAudioEngine:sharedEngine():setEffectsVolume(1)

--new version
--在播放之前要进行预处理，如果不预处理，会很“卡”
--预处理放在任何场景层，进入这个层都比较“卡”，最好放到main()函数中
AuidoEngine.preloadMusic("sound/Synth.mp3")--预加载音乐
AuidoEngine.playMusic("sound/Jazz.mp3",true)--true循环播放，默认false
AuidoEngine.stopMusic()--停止播放
AuidoEngine.pauseMusic()--暂停播放
AuidoEngine.resumeMusic()--继续播放
AuidoEngine.isMusicPlaying()--判断音乐是否播放

AuidoEngine.preloadEffect("sound/Blip.wav")--预加载音效
AuidoEngine.unloadEffect("sound/Blip.wav")--清除音效缓存，没有清理背景音乐缓存函数
AudioEngine.playEffect("sound/Blip.wav")
