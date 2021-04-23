local Iterator = require(script.Parent.Parent.Iterator)

local Cycle = setmetatable({}, Iterator)
Cycle.__index = Cycle
Cycle.__call = Iterator.__call

function Cycle.new(iterator)
	return setmetatable({
		iterator = iterator,
		results = {}, -- TODO: Preallocate the length of the iterator.
		flag = false,
		count = 0,
		index = 0,
	}, Cycle)
end

-- TODO: Cycle's behavior is subject to change. Instead of caching the result,
-- it should create a completely new iterator. Behavior in adapters could
-- change after the first time it's called.
function Cycle:after()
	if self.flag then
		self.index += 1

		if self.index > self.count then
			self.index = 1
		end

		return self.results[self.index]
	else
		local value = self.iterator:after()
		if value == nil then
			self.flag = true
			return self:after()
		else
			self.count += 1
			self.results[self.count] = value
			return value
		end
	end
end

return Cycle
