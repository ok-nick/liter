local Iterator = require(script.Parent.Parent.Iterator)

local Map = setmetatable({}, Iterator)
Map.__index = Map
Map.__call = Iterator.__call

function Map.new(iterator, callback)
	return setmetatable({
		iterator = iterator,
		callback = callback,
	}, Map)
end

function Map:after()
	local value = self.iterator:after()
	if value == nil then
		return nil
	else
		return self.callback(value)
	end
end

return Map
