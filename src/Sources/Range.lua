local Iterator = require(script.Parent.Parent.Iterator)

local Range = setmetatable({}, Iterator)
Range.__index = Range
Range.__call = Iterator.__call

function Range.new(min, max)
	return setmetatable({
		max = max,
		index = min,
	}, Range)
end

function Range:after()
	local index = self.index
	if index > self.max then
		return nil
	end

	self.index += 1
	return index
end

return Range
