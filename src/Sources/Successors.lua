local Iterator = require(script.Parent.Parent.Iterator)

local Successors = setmetatable({}, Iterator)
Successors.__index = Successors
Successors.__call = Iterator.__call

function Successors.new(initial, callback)
	return setmetatable({
		lastValue = initial,
		callback = callback,
	}, Successors)
end

function Successors:after()
	local value = self.lastValue
	if value == nil then
		return nil
	end

	self.lastValue = self.callback(value)
	return value
end

return Successors
