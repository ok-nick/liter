local Iterator = require(script.Parent.Parent.Iterator)

local Take = setmetatable({}, Iterator)
Take.__index = Take
Take.__call = Iterator.__call

function Take.new(iterator, count)
	return setmetatable({
		iterator = iterator,
		count = count,
	}, Take)
end

function Take:after()
	local index = self.count
	if index == 0 then
		return nil
	end

	self.count -= 1
	return self.iterator:after()
end

return Take
