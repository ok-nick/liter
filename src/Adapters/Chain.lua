local Iterator = require(script.Parent.Parent.Iterator)

local Chain = setmetatable({}, Iterator)
Chain.__index = Chain
Chain.__call = Iterator.__call

function Chain.new(a, b)
	return setmetatable({
		a = a,
		b = b,
	}, Chain)
end

function Chain:after()
	local value = self.a:after()
	if value == nil then
		return self.b:after()
	else
		return value
	end
end

return Chain
