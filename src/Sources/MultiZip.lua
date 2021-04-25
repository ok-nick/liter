local Iterator = require(script.Parent.Parent.Iterator)

local MultiZip = setmetatable({}, Iterator)
MultiZip.__index = MultiZip
MultiZip.__call = Iterator.__call

function MultiZip.new(...)
	local iterators = table.pack(...)
	return setmetatable({
		iterators = iterators,
	}, MultiZip)
end

function MultiZip:after()
	local iterators = self.iterators
	local values = table.create(iterators.n)
	for index, iterator in ipairs(iterators) do
		local value = iterator:after()
		if value == nil then
			return nil
		end

		values[index] = value
	end

	return values
end

return MultiZip
