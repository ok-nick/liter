local Iterator = require(script.Parent.Parent.Iterator)

local Enumerate = setmetatable({}, Iterator)
Enumerate.__index = Enumerate
Enumerate.__call = Iterator.__call

function Enumerate.new(iterator)
	return setmetatable({
		iterator = iterator,
		index = 1,
	}, Enumerate)
end

function Enumerate:after()
	local value = self.iterator:after()
	if value == nil then
		return nil
	end

	local index = self.index
	self.index += 1
	return { index, value }
end

return Enumerate
