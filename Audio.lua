-- ios 背景音乐采用AIFC格式，音效采用CAFF格式
-- Android 背景音乐采用MP3格式，音效采用OGG或WAV格式

--在播放之前要进行预处理，如果不预处理，会很“卡”
--预处理放在任何场景层，进入这个层都比较“卡”，最好放到main()函数中
AuidoEngine.preloadMusic("sound/Synth.mp3")--预加载音乐
AuidoEngine.preloadEffect("sound/Blip.wav")--预加载音效

AuidoEngine.unloadEffect("sound/Blip.wav")--清除音效缓存，没有清理背景音乐缓存函数

AuidoEngine.playMusic("sound/Jazz.mp3",true)
AudioEngine.playEffect("sound/Blip.wav")
AuidoEngine.stopMusic


