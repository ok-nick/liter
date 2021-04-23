local Iterator = require(script.Parent.Parent.Iterator)

local TakeWhile = setmetatable({}, Iterator)
TakeWhile.__index = TakeWhile
TakeWhile.__call = Iterator.__call

function TakeWhile.new(iterator, predicate)
	return setmetatable({
		iterator = iterator,
		flag = false,
		predicate = predicate,
	}, TakeWhile)
end

function TakeWhile:after()
	if self.flag then
		return nil
	else
		local value = self.iterator:after()
		if self.predicate(value) then
			return value
		else
			self.flag = true
			return nil
		end
	end
end

return TakeWhile
