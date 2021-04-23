local Iterator = require(script.Parent.Parent.Iterator)

local RecurWith = setmetatable({}, Iterator)
RecurWith.__index = RecurWith
RecurWith.__call = Iterator.__call

function RecurWith.new(callback)
	return setmetatable({
		callback = callback,
	}, RecurWith)
end

function RecurWith:after()
	return self.callback()
end

return RecurWith
