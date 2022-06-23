---@class EventDispatcher 事件广播器
---@field eventMap table<string, table> <事件ID, 事件表>

---@class EventItem
---@field event string 事件ID
---@field callback fun(e:EventData) 事件的捕获函数
---@field sourceData any 监听事件时可带入的数据，事件触发时会传递给捕获函数

---@class EventData
---@field event string 事件ID
---@field data any | nil 事件广播的数据
---@field sourceData any | nil  事件监听时传递的数据

---@type EventDispatcher
EventDispatcher = {}

---@return EventDispatcher
function EventDispatcher:new()

    ---@type EventDispatcher
    local o = {}
    o.eventMap = {}
    return setmetatable(o, {
        __index = EventDispatcher
    })
end

--- 监听事件
---@param event string 事件
---@param callback fun(e:EventData) 事件回调 
---@param target any 监听事件的对象
function EventDispatcher:AddEventListener(_self, event, callback, sourceData)

    if self.eventMap[event] == nil then
        self.eventMap[event] = {}
    end

    ---@type EventItem
    local item = {
        _self = _self,
        event = event,
        callback = callback,
        sourceData = sourceData
    }

    table.insert(self.eventMap[event], item)
end

--- 移除事件
---@param event string 事件
---@param callback fun(e:EventData) 事件回调 
function EventDispatcher:RemoveEventListener(_self, event, callback)
    if self.eventMap[event] == nil then
        return
    end

    ---@type EventItem[]
    local itemArray = self.eventMap[event]

    for i = #itemArray, 1, -1 do
        if itemArray[i]._self == _self and itemArray[i].callback == callback then
            table.remove(itemArray, i)
        end
    end
end

--- 广播事件
---@param event string 事件
---@param callback fun(event:string, eventData:any, sourceData:any) 事件回调 
function EventDispatcher:DispatchEvent(event, eventData)
    if self.eventMap[event] == nil then
        return
    end

    ---@type EventItem[]
    local itemArray = self.eventMap[event]

    for i, v in ipairs(itemArray) do

        ---@type EventData
        local eventData = {
            event = event,
            data = eventData,
            sourceData = v.sourceData
        }

        if v._self ~= nil then
            v.callback(v._self, eventData)    
        else
            v.callback(eventData)
        end        
    end
end

function EventDispatcher:RemoveAllEventListeners()
    self.eventMap = {}
end

