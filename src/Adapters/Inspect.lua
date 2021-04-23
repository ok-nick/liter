local Iterator = require(script.Parent.Parent.Iterator)

local Inspect = setmetatable({}, Iterator)
Inspect.__index = Inspect
Inspect.__call = Iterator.__call

function Inspect.new(iterator, callback)
	return setmetatable({
		iterator = iterator,
		callback = callback,
	}, Inspect)
end

function Inspect:after()
	local value = self.iterator:after()
	self.callback(value)
	return value
end

return Inspect
