local Iterator = require(script.Parent.Parent.Iterator)

local Scan = setmetatable({}, Iterator)
Scan.__index = Scan
Scan.__call = Iterator.__call

function Scan.new(iterator, initial, callback)
	return setmetatable({
		iterator = iterator,
		callback = callback,
		state = initial,
	}, Scan)
end

function Scan:after()
	local value = self.iterator:after()
	if value == nil then
		return nil
	end

	local state, new = self.callback(self.state, value)
	self.state = state
	return new
end

return Scan
