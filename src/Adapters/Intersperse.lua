local Iterator = require(script.Parent.Parent.Iterator)

local Intersperse = setmetatable({}, Iterator)
Intersperse.__index = Intersperse
Intersperse.__call = Iterator.__call

function Intersperse.new(iterator, separator)
	return setmetatable({
		iterator = Iterator.peekable(iterator),
		separator = separator,
		separate = false,
	}, Intersperse)
end

function Intersperse:after()
	if self.separate and self.iterator:peek() ~= nil then
		self.separate = false
		return self.separator
	else
		self.separate = true
		return self.iterator:after()
	end
end

return Intersperse
