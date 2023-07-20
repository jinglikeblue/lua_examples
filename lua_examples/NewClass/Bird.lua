local baseCls = require("NewClass.Animal")
---定义类
local class = {}

---私有静态变量
local className = "Bird"

---静态方法
function class.new(idx)   

    ---实例化对象
    local obj = baseCls.new(idx)
    obj.__static = setmetatable({}, class) 
    ---公共方法
    function obj:SayName()
        print(string.format("[%s]Obj.SayName: (idx:%s) %s",className, obj.GetIdx(), obj.id))
    end
    
    return obj;
end

return class