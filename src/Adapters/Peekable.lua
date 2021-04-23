local Iterator = require(script.Parent.Parent.Iterator)

local Peekable = setmetatable({}, Iterator)
Peekable.__index = Peekable
Peekable.__call = Iterator.__call

function Peekable.new(iterator)
	return setmetatable({
		iterator = iterator,
		peeked = nil,
	}, Peekable)
end

function Peekable:after()
	local peeked = self.peeked
	if peeked == nil then
		return self.iterator:after()
	else
		self.peeked = nil
		return peeked
	end
end

function Peekable:peek()
	if self.peeked == nil then
		local peeked = self.iterator:after()
		self.peeked = peeked
		return peeked
	else
		return self.peeked
	end
end

return Peekable
