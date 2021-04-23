local Iterator = require(script.Parent.Parent.Iterator)

local FromFunc = setmetatable({}, Iterator)
FromFunc.__index = FromFunc
FromFunc.__call = Iterator.__call

function FromFunc.new(after)
	return setmetatable({
		after = after,
	}, FromFunc)
end

return FromFunc
