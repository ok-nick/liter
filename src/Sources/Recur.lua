local Iterator = require(script.Parent.Parent.Iterator)

local Recur = setmetatable({}, Iterator)
Recur.__index = Recur
Recur.__call = Iterator.__call

function Recur.new(value)
	return setmetatable({
		value = value,
	}, Recur)
end

function Recur:after()
	return self.value
end

return Recur
