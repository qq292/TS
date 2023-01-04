






卡卡保皇 = setmetatable({
    bb=function (pos)
        if #pos>1 then
            local spos,npos = pos[1],nil
            for _, p in pairs(pos) do
                local mispx =math.abs(p.x-spos.x)
                local mispy =math.abs(p.y-spos.y)
                if mispx>20 or  mispy>20 then
                    npos = p
                    break
                end
            end
            if npos~=nil then
                local touch = touch(11)
                touch:on(spos.x,spos.y):move(npos.x,npos.y):off()
            end
            
            
        end
    end,
    procedure = function(self) --脚本逻辑,重写procedure方法,返回一个table
        local ss=80
        return
        {
            Feature(
                {0xfdbe1b, "16|0|0xffffff,34|2|0xffffff,46|-2|0xf9b522,77|95|0xc73832", 90, 420, 1145, 444, 1185}
                
            )
            :set_tag("主界面")
            :set_sub_feature(
                Feature(
                    {0xfdcb34, "-2|-13|0x845412,2|-13|0x80510d,-3|13|0x81520e,3|13|0x7d4c07,-7|1|0x8e5e1c,-7|-7|0x8b5d21,-7|8|0x8c5e20,3|-2|0xf9cb2f,-3|-2|0xfbcc38", 90, 364, 1209, 376, 1222}
                
                )
                :set_tag("打造按钮")
                :set_unFindColor_call(
                    function (feature)
                        feature:click(370,1204)
                    end
                )
                ,
                Feature(
                    {0xf59026, "0|32|0xf49227,75|2|0xf69429", 90, 36, 1065, 47, 1078}
                )
                :set_tag("加农炮界面")
                :set_sub_feature(
                    Feature(
                        {0x7feb23, "-8|-13|0x7ae50d,10|-13|0x79e619,-6|-29|0x7ce612,7|-30|0x82e916,-28|-39|0xf6981c,27|27|0xf49217", ss, 45, 975, 666, 1020},
                        {0x7feb23, "-8|-13|0x7ae50d,10|-13|0x79e619,-6|-29|0x7ce612,7|-30|0x82e916,-28|-39|0xf6981c,27|27|0xf49217", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-1级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xffee0f, "-9|-14|0xfef102,10|-14|0xfcf004,7|-33|0xfef305,-12|-33|0x7f420c,-27|-40|0xf6961b,25|25|0xf5991e", ss, 45, 975, 666, 1020},
                        {0xffee0f, "-9|-14|0xfef102,10|-14|0xfcf004,7|-33|0xfef305,-12|-33|0x7f420c,-27|-40|0xf6961b,25|25|0xf5991e", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-2级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0x47d0f4, "26|-5|0x4edafd,2|-27|0x9e2012,21|-27|0xa12317,10|-39|0xa73417,-16|-40|0xf39318,38|26|0xf59117", ss, 45, 975, 666, 1020},
                        {0x47d0f4, "26|-5|0x4edafd,2|-27|0x9e2012,21|-27|0xa12317,10|-39|0xa73417,-16|-40|0xf39318,38|26|0xf59117", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-3级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xf05156, "-24|10|0x6a0d00,23|8|0x681100,-20|-36|0x5b1509,20|-34|0x782700,-3|-37|0x56130b,-22|-42|0xf8961b,20|23|0xf19624", ss, 45, 975, 666, 1020},
                        {0xf05156, "-24|10|0x6a0d00,23|8|0x681100,-20|-36|0x5b1509,20|-34|0x782700,-3|-37|0x56130b,-22|-42|0xf8961b,20|23|0xf19624", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-4级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xdf4ec7, "-19|-6|0xbfbdae,-25|-8|0x5e1300,16|-4|0xbcc5aa,23|-7|0x601802,-17|5|0xdd4cc3,17|4|0xf560e0,-22|24|0xf7971e", ss, 45, 975, 666, 1020},
                        {0xdf4ec7, "-19|-6|0xbfbdae,-25|-8|0x5e1300,16|-4|0xbcc5aa,23|-7|0x601802,-17|5|0xdd4cc3,17|4|0xf560e0,-22|24|0xf7971e", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-5级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xfe9e0b, "-17|-13|0xab9085,18|-12|0x9d8a7c,26|-13|0x601200,-24|-15|0x5a160d,-19|1|0xa69078,14|4|0xa88f79,24|15|0x70625f", ss, 45, 975, 666, 1020},
                        {0xfe9e0b, "-17|-13|0xab9085,18|-12|0x9d8a7c,26|-13|0x601200,-24|-15|0x5a160d,-19|1|0xa69078,14|4|0xa88f79,24|15|0x70625f", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-6级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0x832cae, "0|7|0x923eba,-8|3|0x913dc7,8|2|0x8c30bf,0|-10|0x771fa9,12|-30|0x2c0c55,-13|-30|0x351560,-23|26|0xfa696c,23|26|0xfc6b6e", ss, 45, 975, 666, 1020},
                        {0x832cae, "0|7|0x923eba,-8|3|0x913dc7,8|2|0x8c30bf,0|-10|0x771fa9,12|-30|0x2c0c55,-13|-30|0x351560,-23|26|0xfa696c,23|26|0xfc6b6e", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-7级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xf4700b, "0|7|0xf2730c,-8|3|0xf07108,9|3|0xf77610,0|-10|0xff8f22,-24|26|0x9c7856,23|27|0xa2765b,-30|0|0x621304,30|2|0x641300", ss, 45, 975, 666, 1020},
                        {0xf4700b, "0|7|0xf2730c,-8|3|0xf07108,9|3|0xf77610,0|-10|0xff8f22,-24|26|0x9c7856,23|27|0xa2765b,-30|0|0x621304,30|2|0x641300", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-8级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xeb534e, "-1|5|0xe54c47,-9|3|0xe2554e,8|3|0xcf3831,31|-24|0xcd3a32,-32|-25|0xcc382e,-33|-4|0x5b1307,33|-5|0x601200,-25|27|0x9b7956,23|27|0xa87655", ss, 45, 975, 666, 1020},
                        {0xeb534e, "-1|5|0xe54c47,-9|3|0xe2554e,8|3|0xcf3831,31|-24|0xcd3a32,-32|-25|0xcc382e,-33|-4|0x5b1307,33|-5|0x601200,-25|27|0x9b7956,23|27|0xa87655", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-9级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0x693fa3, "-8|5|0x6636a3,9|8|0x66399e,-7|13|0xbd4700,6|13|0xb64719,-20|-10|0x6782db,18|-11|0x6580db,22|26|0x86aaff,1|-20|0xada895", ss, 45, 975, 666, 1020},
                        {0x693fa3, "-8|5|0x6636a3,9|8|0x66399e,-7|13|0xbd4700,6|13|0xb64719,-20|-10|0x6782db,18|-11|0x6580db,22|26|0x86aaff,1|-20|0xada895", ss, 48, 872, 666, 897}
                    )
                    :set_tag("加农炮-10级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xa50000, "16|-7|0xa20000,35|-8|0xa70200", 90, 152, 1080, 160, 1087}
                        
                    )
                    :set_tag("魔法炮数量满了")
                    :set_isAnd(Feature.AND)
                    :set_isTap(true)
                )
                ,
                Feature(
                    {0xf39028, "-2|26|0xf59328,66|0|0xf69127", 90, 134, 1063, 144, 1074}
                )
                :set_tag("魔法炮界面")
                :set_sub_feature(
                    Feature(
                        {0xed6fc1, "0|-6|0xeb70c1,0|-14|0xfdb81c,-40|-19|0xfef52c,-46|-7|0x661073,-46|14|0x650d73,-48|-40|0xc383fb", ss, 45, 975, 666, 1020},
                        {0xed6fc1, "0|-6|0xeb70c1,0|-14|0xfdb81c,-40|-19|0xfef52c,-46|-7|0x661073,-46|14|0x650d73,-48|-40|0xc383fb", ss, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-1级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xa679fa, "3|0|0x5e1073,3|-6|0x5f1174,0|-19|0xffe84c,-49|-19|0xfff039,-31|30|0x5a14f0,-52|-37|0xc383fb", ss, 45, 975, 666, 1020},
                        {0xa679fa, "3|0|0x5e1073,3|-6|0x5f1174,0|-19|0xffe84c,-49|-19|0xfff039,-31|30|0x5a14f0,-52|-37|0xc383fb", ss, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-2级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xe75d98, "4|0|0xdc5689,9|2|0xfff105,6|-41|0x78030b,-23|-37|0xc383fd,27|32|0xc287f5", 75, 45, 975, 666, 1020},
                        {0xe75d98, "4|0|0xdc5689,9|2|0xfff105,6|-41|0x78030b,-23|-37|0xc383fd,27|32|0xc287f5", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-3级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0x41d3c0, "-2|0|0x4bd6bf,-4|27|0x3a22d8,2|29|0x491adc,15|-16|0x2950b9,-7|-18|0x234ab3,-12|-4|0x2459cd", 75, 45, 975, 666, 1020},
                        {0x41d3c0, "-2|0|0x4bd6bf,-4|27|0x3a22d8,2|29|0x491adc,15|-16|0x2950b9,-7|-18|0x234ab3,-12|-4|0x2459cd", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-4级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xf66c6a, "3|0|0x6c090e,0|-18|0xffe843,-50|-18|0xfff238,-25|30|0x5311ef,-28|30|0x5614f2,-30|30|0x5512f5,-32|41|0x61100c,-55|33|0x650c0e", 75, 45, 975, 666, 1020},
                        {0xf66c6a, "3|0|0x6c090e,0|-18|0xffe843,-50|-18|0xfff238,-25|30|0x5311ef,-28|30|0x5614f2,-30|30|0x5512f5,-32|41|0x61100c,-55|33|0x650c0e", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-5级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),Feature(
                        {0xf16101, "-3|0|0xfc6d0d,14|-12|0xfeb81a,-12|-10|0xf8bc10,-14|1|0xfcd108,-15|23|0xffd20a,6|38|0xffeb21,1|28|0x530fee,1|22|0x560ef5", 75, 45, 975, 666, 1020},
                        {0xf16101, "-3|0|0xfc6d0d,14|-12|0xfeb81a,-12|-10|0xf8bc10,-14|1|0xfcd108,-15|23|0xffd20a,6|38|0xffeb21,1|28|0x530fee,1|22|0x560ef5", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-6级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xb3e20a, "-9|1|0x216117,-13|-4|0x114f04,-22|-14|0x164a0a,-6|11|0x115001,-8|19|0x1a4609,3|21|0x500bef,0|32|0x4a1ade", 75, 45, 975, 666, 1020},
                        {0xb3e20a, "-9|1|0x216117,-13|-4|0x114f04,-22|-14|0x164a0a,-6|11|0x115001,-8|19|0x1a4609,3|21|0x500bef,0|32|0x4a1ade", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-7级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xd96c11, "-9|-3|0x803a20,-15|-9|0x793b2e,-21|-19|0x783c3c,4|-27|0xfdf001,-13|14|0x833521,31|14|0x823a24,21|-7|0xfffdf3", 75, 45, 975, 666, 1020},
                        {0xd96c11, "-9|-3|0x803a20,-15|-9|0x793b2e,-21|-19|0x783c3c,4|-27|0xfdf001,-13|14|0x833521,31|14|0x823a24,21|-7|0xfffdf3", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-8级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xfff546, "-33|-18|0x591009,34|-18|0x5b0d0d,0|-19|0x54abe1,35|-32|0xbaebf9,0|46|0x5c160e,2|-12|0xc7b48c", 75, 45, 975, 666, 1020},
                        {0xfff546, "-33|-18|0x591009,34|-18|0x5b0d0d,0|-19|0x54abe1,35|-32|0xbaebf9,0|46|0x5c160e,2|-12|0xc7b48c", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-9级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xf267f4, "-16|-6|0xc43edd,42|-7|0xc53ed8,-16|10|0x590f5a,40|14|0x621366,18|15|0x5810f8,17|23|0x5110f0,-1|-23|0xf9dd18,25|-22|0xfff338", 75, 45, 975, 666, 1020},
                        {0xf267f4, "-16|-6|0xc43edd,42|-7|0xc53ed8,-16|10|0x590f5a,40|14|0x621366,18|15|0x5810f8,17|23|0x5110f0,-1|-23|0xf9dd18,25|-22|0xfff338", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-10级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0x9dfb11, "-13|-5|0x6bbd13,44|-6|0x71c518,49|6|0x134a11,-17|12|0x0f510a,2|-25|0xffeb2c,26|-23|0xfff041,2|-11|0x9cf914,19|-10|0x9dff16", 75, 45, 975, 666, 1020},
                        {0x9dfb11, "-13|-5|0x6bbd13,44|-6|0x71c518,49|6|0x134a11,-17|12|0x0f510a,2|-25|0xffeb2c,26|-23|0xfff041,2|-11|0x9cf914,19|-10|0x9dff16", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-11级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xffd40f, "-14|-6|0xf99b15,41|-6|0xfc9d0f,-24|20|0x691e19,49|20|0x5b1209,9|8|0xffd10d,1|-10|0xf3e3d6,20|-9|0xf1e1d4,0|-24|0xfff13a", 75, 45, 975, 666, 1020},
                        {0xffd40f, "-14|-6|0xf99b15,41|-6|0xfc9d0f,-24|20|0x691e19,49|20|0x5b1209,9|8|0xffd10d,1|-10|0xf3e3d6,20|-9|0xf1e1d4,0|-24|0xfff13a", 75, 48, 872, 666, 897}
                    )
                    :set_tag("魔法炮-12级")
                    :set_isAnd(Feature.ALL)
                    :set_findColor_call(
                        function (feature,x,y,pos)
                            self.bb(pos)
                        end
                    ),
                    Feature(
                        {0xab2025, "6|0|0xa82024", 90, 54, 1074, 67, 1081}
                        
                    )
                    :set_tag("加农炮数量满了")
                    :set_isAnd(Feature.AND)
                    :set_isTap(true)
                    
                )
            )
        }
    end,
    log = function(self,feature, x, y) --日志：重写log方法，自定义日志。
        if x~=-1 then
            nLog(feature.____Set_tag .. "   x:" .. x .. "  y:" .. y)
        end
    end
}, BaseMeta)


--实例化并启动脚本
--卡卡 = 卡卡保皇()
--卡卡:start()









