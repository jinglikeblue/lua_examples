---@class World 世界
---@field name string 世界名称
---@field info WorldInfo 世界信息
---@field __statics Statics 静态数据

---@class WorldInfo 世界信息
---@field type string 类型
---@field height number 海拔

---@class Statics 静态变量
---@field intro string 介绍

---@type World
World = {}

--regeon 静态变量

---@type Statics
World_Statics = {
    intro = "this is a object of World"
}
World.__statics = World_Statics

--endregion

---@return World
function World:new(name)
    ---@type World
    local o = {}          
    o.name = name or ""
    o.info = {}
    -- o.info.height = 0
    -- o.info.type = ""      
    return setmetatable(o, {__index = self})
end

---打印数据
function World:ToString()
    print(self.__statics.intro)
    local str = string.format("[World] name: %s  type: %s   height: %d", self.name, self.info.type, self.info.height)
    print(str)
end