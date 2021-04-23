local Iterator = require(script.Parent.Parent.Iterator)

local Hash = setmetatable({}, Iterator)
Hash.__index = Hash
Hash.__call = Iterator.__call

function Hash.new(hash)
	return setmetatable({
		hash = hash,
		lastKey = nil,
	}, Hash)
end

function Hash:after()
	local key, value = next(self.hash, self.lastKey)
	self.lastKey = key
	return value ~= nil and { key, value } or nil
end

return Hash
