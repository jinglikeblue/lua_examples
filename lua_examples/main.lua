
local cls = require("NewClass.Animal")
local birdCls = require("NewClass.Bird")

function GetClass(className)
    return require(className)
end

function CreateObject(className, ...)
    local cls = GetClass(className)
    return cls.new(...)
end

--调用静态方法
cls.StaticSayName()

--调用静态变量
print(cls.className)

---实例化对象
local a = cls.new(1)
a.SayName()

---实例化对象
local b = birdCls.new(2)
b:SayName()



