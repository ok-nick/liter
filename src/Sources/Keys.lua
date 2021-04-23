local Iterator = require(script.Parent.Parent.Iterator)

local Keys = setmetatable({}, Iterator)
Keys.__index = Keys
Keys.__call = Iterator.__call

function Keys.new(hash)
	return setmetatable({
		hash = hash,
		lastKey = nil,
	}, Keys)
end

function Keys:after()
	local key = next(self.hash, self.lastKey)
	self.lastKey = key
	return key
end

return Keys
