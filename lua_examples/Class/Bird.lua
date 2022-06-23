--- 鸟类
---@class Bird:Animal 鸟
---@field name string 名称

---@type Bird
Bird = {}

--regeon 静态变量

Bird_Statics = {
    className = "Bird"
}
Bird.__statics = Bird_Statics

--endregion

---创建对象
---@param name string | nil 名称
---@return Bird
function Bird:new(name, age)
    ---@type Bird
    local object = Animal:new(age)        
    object.name = name or "野狗" 

    local base = setmetatable(Bird, {__index = Animal})
    return setmetatable(object, {__index = base})
end

function Bird:Say()
    print(string.format("[bird] name: %s, age: %d", self.name, self.info.age))
end