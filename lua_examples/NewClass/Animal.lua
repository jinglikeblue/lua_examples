---定义类
local class = {}

---私有静态变量
local className = "PrivateAnimal"

---公共静态变量
class.className = "Animal"

---私有静态方法
local function SayName()
    print(className)
end

---公共静态方法
function class.StaticSayName()
    SayName()
    print(class.className)
end

---静态方法
function class.new(idx)
    
    --- 私有变量
    local idx = idx

    --- 私有方法
    local GetIdx = function()
        return idx
    end

    ---实例化对象
    local obj = {}    
    obj.__static = class
    ---公共变量
    obj.id = "animal_"..idx
    ---公共方法
    function obj:SayName()
        print(string.format("Obj.SayName: (idx:%s) %s",GetIdx(), obj.id))
    end    

    obj.GetIdx = GetIdx
    return obj;
end

return class