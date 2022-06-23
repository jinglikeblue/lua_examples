--- 狗类
---@class Dog:Animal 狗
---@field name string 名称

---@type Dog
Dog = {}

--regeon 静态变量

Dog_Statics = {
    className = "Dog"
}
Dog.__statics = Dog_Statics

--endregion

---创建对象
---@param name string | nil 名称
---@return Dog
function Dog:new(name, age)
    ---@type Dog
    local object = Animal:new(age)        
    object.name = name or "野狗" 

    local base = setmetatable(Dog, {__index = Animal})
    return setmetatable(object, {__index = base})
end

function Dog:Say()
    print(string.format("[dog] name: %s, age: %d", self.name, self.info.age))
end

---方法重写
function Dog:Jump()
    print("I don't wnat jump")
end