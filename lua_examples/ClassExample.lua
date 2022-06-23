require("Class/Dog")
require("Class/Bird")
require("Class/Animal")
require("Class/BigBird")
require("Class/World")


print("------------------------------------------------")
local w1 = World:new()
local w2 = World:new()

--@如果这里改变了静态数据，则所有对象拿到的数据都是改变后的
-- w1.__statics.intro = "fuck you"

w1.name = "Water World"
w1.info.height = -1000
w1.info.type = "Cold"

w2.name = "Fire World"
w2.info.height = 1000
w2.info.type = "Hot"

w1:ToString()
w2:ToString()

print("------------------------------------------------")

---继承关系
--- BigBird < Bird < Animal
--- Dog < Animal


local animal = Animal:new()

print(Animal_Statics.className)
print(animal.alive)
print(animal.info.age)

print("------------------------------------------------")

local bigBird1 = BigBird:new("YING", 14)
bigBird1.flySpeed = 99

bigBird1:ClassName()
bigBird1:SayAge()
bigBird1:Say()
bigBird1:Jump()
bigBird1:Fly()

print("------------------------------------------------")

local dog1 = Dog:new("WANG CAI", 5)
local dog2 = Dog:new("QIANG ZAI", 7)
dog2.name = "QIANG ZAI"
dog2.info.age = 7
local bird1 = Bird:new("BU GU", 1)

dog1:ClassName()
dog1:SayAge()
dog1:Say()
dog1:Jump()

print("------------------------------------------------")
dog2:ClassName()
dog2:SayAge()
dog2:Say()
dog2:Jump()

print("------------------------------------------------")
bird1:ClassName()
bird1:SayAge()
bird1:Say()
bird1:Jump()

print("------------------------------------------------")
