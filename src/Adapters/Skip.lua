local Iterator = require(script.Parent.Parent.Iterator)

local Skip = setmetatable({}, Iterator)
Skip.__index = Skip
Skip.__call = Iterator.__call

function Skip.new(iterator, amount)
	return setmetatable({
		iterator = iterator,
		amount = amount,
	}, Skip)
end

function Skip:after()
	return self.iterator:nth(self.amount)
end

return Skip
