--- 大鸟类
---@class BigBird:Bird 大鸟
---@field name string 名称
---@field flySpeed number 飞行速度

---@type BigBird
BigBird = {}

--regeon 静态变量

---@class BigBird_Statics 动物静态变量
---@field className string 类名
BigBird_Statics = {
    className = "BigBird"
}

BigBird.__statics = BigBird_Statics
--endregion

---创建对象
---@param name string | nil 名称
---@return BigBird
function BigBird:new(name, age)
    ---@type BigBird
    local object = Bird:new(name, age)            
    object.flySpeed = 0
    
    local base = setmetatable(BigBird, {__index = Bird})
    return setmetatable(object, {__index = base})
end

---重写方法
function BigBird:Say()
    print(string.format("[big bird] name: %s, age: %d", self.name, self.info.age))
end

function BigBird:Fly()
    if self.flySpeed == 0 then
        print("i can't fly!")
    end

    local str = string.format("flySpeed: %d", self.flySpeed)
    print(str)
end