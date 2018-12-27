--数组
	--解码
		local jsonStr = '[{"ID":"1","CDate":"2012-12-23","Content":"发布iOSBook0"},{"ID":"2","CDate":"2012-12-24","Content":"发布iOSBook1"}]'
		local jsonObj = json.decode(jsonStr)
		for k,v in pairs(jsonObj) do
		    cclog("ID:%s",v["ID"])
		    cclog("CDate:%s",v["CDate"])
		    cclog("Content:%s",v["Content"])
		end
	--加密
		local jsonArray = {ID="1",CDate="2012-12-23",Content="发布iOSBook0"},
		                    {ID="2",CDate="2012-12-24",Content="发布iOSBook1"}
		cclog("jsonArray : %s",json.encode(jsonArray))
--对象
	--解码
		local jsonStr = '{"ID":"1","CDate":"2012-12-23","Content":"发布iOSBook0"}'
		local jsonObj = json.decode(jsonStr)
		cclog("ID:%s",jsonObj["ID"])
		cclog("CDate:%s",jsonObj["CDate"])
		cclog("Content:%s",jsonObj["Content"])
	--加密
		local jsonOb = {ID="1",CDate="2012-12-23",Content="发布iOSBook0"}
		cclog("jsonOb : %s",json.encode(jsonOb))