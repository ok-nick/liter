local Iterator = require(script.Parent.Parent.Iterator)

local Empty = setmetatable({}, Iterator)
Empty.__index = Empty
Empty.__call = Iterator.__call

function Empty.new()
	return setmetatable({}, Empty)
end

function Empty:after()
	return nil
end

return Empty
