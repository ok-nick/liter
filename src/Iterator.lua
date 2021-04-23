local Iterator = {}
Iterator.__index = Iterator

function Iterator:__call()
	return self:after()
end

function Iterator:foreach(callback)
	for value in self.after, self do
		callback(value)
	end
end

function Iterator:fold(initial, accumulator)
	local accumulation = initial
	for value in self.after, self do
		accumulation = accumulator(accumulation, value)
	end

	return accumulation
end

function Iterator:reduce(reducer)
	return self:fold(self:after(), reducer)
end

function Iterator:sum()
	return self:reduce(function(a, b)
		return a + b
	end)
end

function Iterator:product()
	return self:reduce(function(a, b)
		return a * b
	end)
end

function Iterator:count()
	local count = 0
	for _ in self.after, self do
		count += 1
	end
	return count
end

function Iterator:collect(size)
	local result = table.create(size or 0)
	self:foreach(function(value)
		table.insert(result, value)
	end)
	return result
end

function Iterator:last()
	return self:fold(nil, function(_, value)
		return value
	end)
end

function Iterator:advanceBy(amount)
	for _ = 1, amount do
		if self:after() == nil then
			return false
		end
	end

	return true
end

function Iterator:nth(amount)
	return self:advanceBy(amount) ~= nil and self:after() or nil
end

function Iterator:partition(predicate)
	local left = {}
	local right = {}
	for value in self.after, self do
		if predicate(value) then
			table.insert(right, value)
		else
			table.insert(left, value)
		end
	end

	return left, right
end

function Iterator:partitionInPlace(predicate)
	-- TODO: More performant using a sorting algorithm similar to Rust's,
	-- https://doc.rust-lang.org/src/core/iter/traits/iterator.rs.html#1849

	local left, right = self:partition(predicate)
	table.move(right, 1, #right, #left + 1, left)
	return left
end

function Iterator:isPartitioned(predicate)
	return self:all(predicate) or not self:any(predicate)
end

function Iterator:all(predicate)
	for value in self.after, self do
		if not predicate(value) then
			return false
		end
	end

	return true
end

function Iterator:any(predicate)
	for value in self.after, self do
		if predicate(value) then
			return true
		end
	end

	return false
end

function Iterator:find(predicate)
	for value in self.after, self do
		if predicate(value) then
			return value
		end
	end

	return nil
end

function Iterator:position(predicate)
	local index = 1
	for value in self.after, self do
		if predicate(value) then
			return index
		end

		index += 1
	end

	return nil
end

function Iterator:max()
	return self:reduce(function(a, b)
		return a > b and a or b
	end)
end

function Iterator:min()
	return self:reduce(function(a, b)
		return a < b and a or b
	end)
end

function Iterator:eq(iterator)
	return self:eqBy(iterator, function(a, b)
		-- Should I do deep checks for nested tables?
		return a == b
	end)
end

function Iterator:eqBy(iterator, predicate)
	while true do
		local a = self:after()
		if a == nil then
			return iterator:after() == nil
		end

		local b = iterator:after()
		if b == nil or not predicate(a, b) then
			return false
		end
	end
end

function Iterator:ne(iterator)
	return not self:eq(iterator)
end

return Iterator
