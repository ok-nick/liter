local Iterator = require(script.Parent.Parent.Iterator)

local Filter = setmetatable({}, Iterator)
Filter.__index = Filter
Filter.__call = Iterator.__call

function Filter.new(iterator, predicate)
	return setmetatable({
		iterator = iterator,
		predicate = predicate,
	}, Filter)
end

function Filter:after()
	return self.iterator:find(self.predicate)
end

return Filter
