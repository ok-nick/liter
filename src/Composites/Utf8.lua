local Iterator = require(script.Parent.Parent.Iterator)

local Utf8 = setmetatable({}, Iterator)
Utf8.__index = Utf8
Utf8.__call = Iterator.__call

function Utf8.new(str)
	return setmetatable({
		str = str,
		iterator = utf8.graphemes(str),
	}, Utf8)
end

function Utf8:after()
	local first, last = self.iterator(self.str)
	return first ~= nil and self.str:sub(first, last) or nil
end

function Utf8:asStr()
	return self.str
end

return Utf8
