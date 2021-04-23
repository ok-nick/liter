local Iterator = require(script.Parent.Parent.Iterator)

local IntersperseWith = setmetatable({}, Iterator)
IntersperseWith.__index = IntersperseWith
IntersperseWith.__call = Iterator.__call

function IntersperseWith.new(iterator, separator)
	return setmetatable({
		iterator = Iterator.peekable(iterator),
		separator = separator,
		separate = false,
	}, IntersperseWith)
end

function IntersperseWith:after()
	if self.separate and self.iterator:peek() ~= nil then
		self.separate = false
		return self.separator()
	else
		self.separate = true
		return self.iterator:after()
	end
end

return IntersperseWith
