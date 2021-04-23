local Iterator = require(script.Parent.Parent.Iterator)

local Array = setmetatable({}, Iterator)
Array.__index = Array
Array.__call = Iterator.__call

function Array.new(array)
	return setmetatable({
		array = array,
		index = 1,
	}, Array)
end

function Array:after()
	local index = self.index
	self.index += 1
	return self.array[index]
end

return Array
