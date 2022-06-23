--- 动物类
---@class Info 信息
---@field age number 年龄

---@class Animal 动物
---@field info Info 信息
---@field alive boolean 是否活着

---@type Animal
Animal = {}

--regeon 静态变量

---@class Animal_Statics 动物静态变量
---@field className string 类名
Animal_Statics = {
    className = "Animal"
}

Animal.__statics = Animal_Statics
--endregion



---创建对象
---@param age number | nil 年龄 
---@return Animal
function Animal:new(age)
    ---@type Animal
    local object = {}
    object.alive = true
    object.info = {
        age = age or 1
    }
        
    return setmetatable(object, {__index = self})       
end

---说年龄
function Animal:SayAge()    
    print("age: "..self.info.age)
end

---跳跃
function Animal:Jump()
    print("jump")
end

function Animal:ClassName()    
    print("self.__statics.className: "..self.__statics.className)    
end