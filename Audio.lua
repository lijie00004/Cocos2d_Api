-- ios 背景音乐采用AIFC格式，音效采用CAFF格式
-- Android 背景音乐采用MP3格式，音效采用OGG或WAV格式

AuidoEngine.preloadMusic("sound/Synth.mp3")--预加载音乐
AuidoEngine.preloadEffect("sound/Blip.wav")--预加载音效

AuidoEngine.unloadEffect("sound/Blip.wav")--清除音效缓存，没有清理背景音乐缓存函数



