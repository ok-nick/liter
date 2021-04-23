local Iterator = require(script.Parent.Parent.Iterator)

local Ascii = setmetatable({}, Iterator)
Ascii.__index = Ascii
Ascii.__call = Iterator.__call

function Ascii.new(str)
	return setmetatable({
		index = 1,
		str = str,
	}, Ascii)
end

function Ascii:after()
	local index = self.index
	self.index += 1
	local char = self.str:sub(index, index)
	return char ~= '' and char or nil
end

function Ascii:asStr()
	return self.str
end

return Ascii
