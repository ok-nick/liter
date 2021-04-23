local Iterator = require(script.Parent.Parent.Iterator)

local SkipWhile = setmetatable({}, Iterator)
SkipWhile.__index = SkipWhile
SkipWhile.__call = Iterator.__call

function SkipWhile.new(iterator, predicate)
	return setmetatable({
		iterator = iterator,
		predicate = predicate,
		flag = false,
	}, SkipWhile)
end

function SkipWhile:after()
	return self.iterator:find(function(value)
		if self.flag or not self.predicate(value) then
			self.flag = true
			return true
		else
			return false
		end
	end)
end

return SkipWhile
