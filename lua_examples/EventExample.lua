require("Events/EventDispatcher")

---@param e EventData
function OnHelloEd1(e)        
    print("---------------------- ed1 ----------------------")
    print("self: "..tostring(self))
    print(string.format("event: %s, eventData: %s, sourceData: %s", e.event, e.data, e.sourceData))
end

---@param e EventData
function OnHelloEd2(e)
    print("---------------------- ed2 ----------------------")
    print("self: "..tostring(self))
    print(string.format("event: %s, eventData: %s, sourceData: %s", e.event, e.data, e.sourceData))
end


local obj = {
    name =  "obj"
}

---@param e EventData
function obj:OnObj1(e)          
    print("---------------------- OnObj1 ----------------------")    
    print("obj: "..tostring(obj))
    print("self: "..tostring(self))
    print("self.name: "..tostring(self.name))
    print(string.format("event: %s, eventData: %s, sourceData: %s", e.event, e.data, e.sourceData))
end

-- obj:OnObj1()
local ed1 = EventDispatcher:new()
local ed2 = EventDispatcher:new()

ed1:AddEventListener(self, "hello", OnHelloEd1, "world")
ed1:AddEventListener(obj, "hello", obj.OnObj1, "world1")
ed1:AddEventListener(obj, "hello", obj.OnObj1, "asdfasdfassdfasdf")

-- print(self)
ed2:AddEventListener(self, "hello", OnHelloEd2, "world")
-- ed2:RemoveEventListener(self, "hello", OnHelloEd2)







ed1:DispatchEvent("hello", "to ed1")
ed2:DispatchEvent("hello", "to ed2")




