local Iterator = require(script.Parent.Parent.Iterator)

local FlatMap = setmetatable({}, Iterator)
FlatMap.__index = FlatMap
FlatMap.__call = Iterator.__call

function FlatMap.new(iterator, intoIterator)
	return setmetatable({
		iterator = iterator:map(intoIterator),
		nextIterator = nil,
	}, FlatMap)
end

function FlatMap:after()
	if self.nextIterator then
		local value = self.nextIterator:after()
		if value ~= nil then
			return value
		end
	end

	local inner = self.iterator:after()
	if inner == nil then
		return nil
	else
		self.nextIterator = inner
		return self:after()
	end
end

return FlatMap
