local Iterator = require(script.Parent.Parent.Iterator)

local Unicode = setmetatable({}, Iterator)
Unicode.__index = Unicode
Unicode.__call = Iterator.__call

function Unicode.new(str)
	return setmetatable({
		str = str,
		iterator = utf8.graphemes(str),
	}, Unicode)
end

function Unicode:after()
	local first, last = self.iterator(self.str)
	return first ~= nil and self.str:sub(first, last) or nil
end

function Unicode:asStr()
	return self.str
end

return Unicode
