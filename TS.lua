setting = {
    tapLag = 500--点击后延时

}

local Factor = {
    x = -1,
    y = -1,
    position = {},
    factor = function(self, base, feature)
        self:__isAnd(base, feature)--找色

        self:__isTap(feature)--是否点击
        self:__isAgain(feature)--全部找到再执行下一个

        self:__findColor_call(feature)--找到颜色回调

        self:__nuFindColor_call(feature)--未找到颜色回调

        return self
    end,

    --全部找到再执行下一个
    __isAgain = function(self, feature)
        if feature.____Set_isAgain and self.x ~= -1 then
            self:__isAnd(feature)
            self:__isTap(feature)--是否点击
            self:__isAgain(feature)
        else
            return
        end
    end,
    --未找到颜色回调
    __nuFindColor_call = function(self, feature)
        if self.x == -1 and feature.____Set_unFindColor_call ~= nil then
            feature.____Set_unFindColor_call(feature)
        end
    end
,
    --找到颜色回调
    __findColor_call = function(self, feature)
        if self.x ~= -1 and feature.____Set_findColor_call ~= nil then
            feature.____Set_findColor_call(feature, self.x, self.y, self.position)
        end
    end
,
    --是否点击
    __isTap = function(self, feature)
        if self.x ~= -1 and feature.____Set_isTap then
            feature:click(self.x + feature.____Set_shifting_x, self.y + feature.____Set_shifting_y)
        end
    end,

    --找色
    __isAnd = function(self, base, feature)
        if feature.____Set_isAnd == Feature.ALL then
            self.position = feature:findColor_all()
            if #self.position ~= 0 then
                self.x, self.y = self.position[1].x, self.position[1].y
            end
        elseif feature.____Set_isAnd == Feature.AND then
            self.x, self.y = feature:findColor_and()
        elseif feature.____Set_isAnd == Feature.OR then
            self.x, self.y = feature:findColor_or()
        end
        base:log(feature, self.x, self.y)
    end
}

local Base = {
    flag = false,
    procedure_list = nil,
    procedure = function(self)
        error("error:  没有找到 procedure()")
    end,
    log = function(feature, x, y)

    end,
    ui = function(self)

    end,
    __run = function(self, procedure_list)

        for _, feature in ipairs(procedure_list) do
            if self.flag then
                return
            end
            if type(feature) == "function" then
                feature()
            else
                local factor = Factor:factor(self, feature)
                local sub_feature = feature.____Set_sub_feature
                if factor.x ~= -1 then

                    if #sub_feature ~= 0 then
                        self:__run(sub_feature)
                    end
                    if feature.____Set_findBreak then
                        break
                    end


                end
            end

        end
        self:__run(self.procedure_list)
    end,
    start = function(self)
        if not self.flag then
            if self.procedure_list == nil then
                self.procedure_list = self:procedure()
            end
            self:__run(self.procedure_list)
        end
    end,
    stop = function(self)
        self.flag = true
    end

}

Color = {
    __findColor = function(self, t, isAll)
        if #t == 0 then
            if isAll then
                return {}
            else
                return -1, -1
            end
        end
        isAll = isAll or false
        t[8] = t[8] or { orient = 2 }
        if isAll then
            return findMultiColorInRegionFuzzyExt(t[1], t[2], t[3], t[4], t[5], t[6], t[7])
        else
            return findMultiColorInRegionFuzzy(t[1], t[2], t[3], t[4], t[5], t[6], t[7], t[8])
        end

    end,

    click = function(self, x, y, t, r, pic)
        t = t or self.____Set_tapLag or 500
        r = r or self.____Set_tapRandomRange or 5
        if pic ~= nil then
            randomTap(x, y, r, pic)
        else
            randomTap(x, y, r)
        end
        mSleep(t)
    end,
    findColor_all = function(self)
        local color_list = self.____color_list
        local position = {}
        if #color_list ~= 0 then
            for _, color in pairs(color_list) do

                local ipos = self:__findColor(color, true)
                if #ipos ~= 0 then
                    for _, pos in pairs(ipos) do
                        table.insert(position, pos)
                    end

                end
            end
        end
        return position
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

}

-- 脚本控制类
Feature = setmetatable({
    _TYPE_ = "Feature",
    ALL = 0,
    AND = 1,
    OR = 3,
    ____Set_tapLag = Setting.tapLag,
    ____Set_isTap = false,
    ____Set_findColor_call = nil,
    ____Set_unFindColor_call = nil,
    ____Set_sub_feature = {},
    ____Set_isAnd = 1,
    ____Set_tag = nil,
    ____Set_shifting_x = 0,
    ____Set_shifting_y = 0,
    ____Set_isAgain = false,
    ____Set_tapRandomRange = 5,
    ____Set_findBreak = false,


    --找到后跳出流程
    set_findBreak = function(self, findBreak)
        self.____Set_findBreak = findBreak
        return self
    end,


    --点击随机范围
    set_tapRandomRange = function(self, randomRange)
        self.____Set_tapRandomRange = randomRange
        return self
    end,

    --全部点完再执行下一个
    set_isAgain = function(self, isAgain)
        self.____Set_isAgain = isAgain
        return self
    end,
    -- 点击后延迟
    set_tapLag = function(self, tapLag)
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
        self.____Set_sub_feature = { ... }
        return self
    end

}, {

    __call = function(self, ...)
        return setmetatable({ ____color_list = { ... } }, {
            __index = self
        })
    end,
    __index = Color

})

BaseMeta = {
    __call = function(self, ...)
        return self
    end,
    __index = Base
}





