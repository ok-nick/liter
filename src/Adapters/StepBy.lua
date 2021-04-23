local Iterator = require(script.Parent.Parent.Iterator)

local StepBy = setmetatable({}, Iterator)
StepBy.__index = StepBy
StepBy.__call = Iterator.__call

function StepBy.new(iterator, step)
	return setmetatable({
		iterator = iterator,
		step = step - 1,
		first = true,
	}, StepBy)
end

function StepBy:after()
	if self.first then
		self.first = false
		return self.iterator:after()
	else
		return self.iterator:nth(self.step)
	end
end

return StepBy
