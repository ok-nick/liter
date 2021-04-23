-- This adapter is a little weird and potentially breaking. Most adapters treat
-- the return value as a table or a single value, I'd rather not reduce performance
-- by treating everything as a tuple. This adapter is necessary to have the same
-- functionality as a normal iterator (e.g. ipairs, with the index, value). Unfortunately,
-- Lua doesn't have native destructuring which is why this feature is necessary.

local Iterator = require(script.Parent.Parent.Iterator)

local Unbox = setmetatable({}, Iterator)
Unbox.__index = Unbox
Unbox.__call = Iterator.__call

function Unbox.new(iterator)
	return setmetatable({
		iterator = iterator,
	}, Unbox)
end

function Unbox:after()
	local value = self.iterator:after()
	if value == nil then
		return nil
	else
		return table.unpack(value)
	end
end

return Unbox
