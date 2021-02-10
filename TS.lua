local setting = {
    tapLag=500--点击后延时
    
}

local function factor(base, feature)
    local x, y

    if feature.____Set_isAnd then
        x, y = feature:findColor_and()
    else
        x, y = feature:findColor_or()
    end

    if x ~= -1 then
        if feature.____Set_isTap then
            local ix=x+feature.____Set_shifting_x
            local iy=y+feature.____Set_shifting_y
            feature:click(ix, iy)
        end
        if feature.____Set_findColor_call ~= nil then
            feature.____Set_findColor_call(feature, x, y)
        end
    else
        if feature.____Set_unFindColor_call ~= nil then
            feature.____Set_unFindColor_call(feature)
        end

    end
    base:log(feature, x, y)
    return x, y
end


local Base = setmetatable({
    flag = false,
    -- 子类重写
    procedure = function(self)
        error("error:  procedure 方法 不可调用！")
    end,
    -- 子类重写
    log = function(feature, x, y)

    end,
    ui = function(self)
        
    end,
    run = function(self)
        self:ui()
        if self.flag then
            return
        end
        while true do
            if self.flag then
                break
            end
            local procedure_list = self:procedure()
            for _, feature in ipairs(procedure_list) do
                local rex, rey = factor(self, feature)
                local sub_feature = feature.____Set_sub_feature
                local sub_feature_length = #sub_feature
                if rex ~= -1 and sub_feature_length ~= 0 then
                    for _, subFeature in ipairs(sub_feature) do
                        factor(self, subFeature)

                    end

                end
            end
        end

    end,
    stop = function(self)
        self.flag = true
    end

}, {
    __call = function(self)
        error("不能实例化")
    end
})


ColorBase = {
    
    findMultiColorInRegionFuzzy = function()
        return findMultiColorInRegionFuzzy
    end,
    tap = function(self)
        return tap
    end

}


Color = setmetatable({
    
    __findColor = function(self, t)
        t[8] = t[8] or {orient = 2}
        return self:findMultiColorInRegionFuzzy()(t[1], t[2], t[3], t[4], t[5], t[6], t[7],t[8])
    end,
 
    click = function(self, x, y,t, ms,pic)
        t = t or self.____Set_tapLag
        ms = ms or 50
        if pic~=nil then
            self:tap()(x, y,ms,pic)
        else
            self:tap()(x, y,ms)
        end
        mSleep(t)
    end,
    findColor_and = function(self)
        local color_list = self.____color_list
        local x, y = -1, -1
        if #color_list ~= 0 then
            for index, color in ipairs(color_list) do
                local ix, iy = self:__findColor(color)
                if ix ~= -1 then
                    if index == 1 then
                        x, y = ix, iy
                    end

                else
                    x, y = -1, -1
                    break
                end
            end

        end

        return x, y

    end,
    findColor_or = function(self)
        local color_list = self.____color_list
        local x, y = -1, -1
        if #color_list ~= 0 then
            for _, color in ipairs(color_list) do
                x, y = self:__findColor(color)
                if x ~= -1 then
                    break
                end
            end

        end
        return x, y
    end

}, {

    __call = function(self, main, sub, z, x, y, x2, y2, tab)
        self.main, self.sub, self.z, self.x, self.y, self.x2, self.y2, self.tab = main, sub, z, x, y, x2, y2, tab
        return setmetatable({}, {
            __index = self
        })
    end,
    __index = ColorBase
})

-- 脚本控制类
Feature = setmetatable({
    ____Set_tapLag = setting.tapLag,
    ____Set_isTap = false,
    ____Set_findColor_call = nil,
    ____Set_unFindColor_call = nil,
    ____Set_sub_feature = {},
    ____Set_isAnd = true,
    ____Set_tag = nil,
    ____Set_shifting_x=0,--x的偏移量
    ____Set_shifting_y=0,

    -- 点击后延迟
    set_tapLag=function (self,tapLag)
        self.____Set_tapLag = tapLag
        return self
    end,
    --x的偏移量
    set_shifting_x = function(self, x)
        self.____Set_shifting_x = x
        return self
    end,
    --y的偏移量
    set_shifting_y = function(self, y)
        self.____Set_shifting_y = y
        return self
    end,
    --附加值
    set_tag = function(self, obj)
        self.____Set_tag = obj
        return self
    end,

    -- 满足全部条件
    set_isAnd = function(self, isAnd)
        self.____Set_isAnd = isAnd
        return self
    end,
    -- 是否点击
    set_isTap = function(self, isTap)
        self.____Set_isTap = isTap
        return self
    end,
    -- 找到颜色回调
    set_findColor_call = function(self, funcCall)
        self.____Set_findColor_call = funcCall

        return self
    end,
    -- 没有找到颜色回调
    set_unFindColor_call = function(self, funcCall)
        self.____Set_unFindColor_call = funcCall

        return self
    end,
    -- 界面内子特征
    set_sub_feature = function(self, ...)
        self.____Set_sub_feature = {...}
        return self
    end

}, {

    __call = function(self, ...)
        return setmetatable({____color_list={...}}, {
            __index = self
        })
    end,
    __index = Color

})


----------------------------上面是框架部分--------------------
----------------------------下面是示例部分--------------------


local 极品三国 = setmetatable({
    procedure = function(self)
        return
        {
            Feature(
                {0x975956, "12|0|0x95625d,23|0|0x85625f,36|1|0x905a54", 90, 12, 1044, 69, 1091}
                )
                :set_tag("主界面")--附加信息
                :set_tapLag(300)--点击后延时
                :set_isTap(false)--是否点击
                :set_isAnd(true)
                :set_findColor_call(
                    function(feature, x, y)
                        --找到颜色回调
                    end
                )
                :set_unFindColor_call(
                    function (feature)
                    --未找到颜色回调
                    end
                )
                :set_sub_feature(--界面内的操作
                    Feature(
                        {0x48342d, "73|0|0x48342d,41|8|0xf3ebd7", 90, 257, 497, 398, 518}
                    )
                    :set_tag("打理资产气泡框")
                    :set_tapLag(300)
                    :set_shifting_y(20)
                    :set_isTap(true)
                    :set_findColor_call(
                        function(feature, x, y)
                           --找到颜色回调
                        end
                    )
                    :set_unFindColor_call(
                    function (feature)
                    --未找到颜色回调
                    end
                )
            ),
            Feature(
                {0xfeeb60, "-2|-55|0xda9c49,-165|-56|0xca8a34,-74|62|0xd6b741,-94|202|0x62554b,-80|-135|0x645a51", 90, 313, 709, 355, 749}
                
                )
                :set_tag("经营资产界面")
                :set_sub_feature(
                Feature(
                    {0xa4531e, "19|3|0xb35a1f,98|-11|0xe39539,63|-15|0xeda642", 90, 477, 473, 492, 1175}
                    )
                    :set_tag("经营按钮")
                    :set_isTap(true)
                    :set_unFindColor_call(
                        function (feature)
                            feature:click(687,101,2000)
                        end
                    )
            )
        }
    end,
    log = function(self,feature, x, y)
        if x~=-1 then
            toast(feature.____Set_tag .. "找到：" .. "x:" .. x .. "y:" .. y)
        end
        
    end
}, {
    __call = function(self)

        return setmetatable({}, {
            __index = self
        })

    end,
    __index = Base

})



jp=极品三国()
jp:run()











