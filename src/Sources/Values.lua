local Iterator = require(script.Parent.Parent.Iterator)

local Values = setmetatable({}, Iterator)
Values.__index = Values
Values.__call = Iterator.__call

function Values.new(hash)
	return setmetatable({
		hash = hash,
		lastKey = nil,
	}, Values)
end

function Values:after()
	local key, value = next(self.hash, self.lastKey)
	self.lastKey = key
	return value
end

return Values
