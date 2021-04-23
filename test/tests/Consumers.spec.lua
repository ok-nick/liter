return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should call the function for each value', function()
		local array = { 4, 2, 5 }

		local index = 0
		liter.array(array):foreach(function(value)
			index += 1
			expect(value).to.equal(array[index])
		end)
	end)

	it('should accumulate to the sum of all values', function()
		expect(liter.array({ 4, 3, 5 }):fold(10, function(a, b)
			return a + b
		end)).to.equal(22)
	end)

	it('should implicitly define the initial value as the first value', function()
		expect(liter.array({ 1, 2, 5 }):reduce(function(a, b)
			return a + b
		end)).to.equal(8)
	end)

	it('should return the sum of all values', function()
		expect(liter.array({ 3, 3, 3, 3, 4 }):sum()).to.equal(16)
	end)

	it('should return the product of all values', function()
		expect(liter.array({ 5, 5, 5 }):product()).to.equal(125)
	end)

	it('should return the number of elements in the array', function()
		expect(liter.array({ 1, 2, 5, 2 }):count()).to.equal(4)
	end)

	it('should return each value in a new array', function()
		local collect = liter.array({ 5, 3, 2, 6 }):collect()
		expect(collect[1]).to.equal(5)
		expect(collect[2]).to.equal(3)
		expect(collect[3]).to.equal(2)
		expect(collect[4]).to.equal(6)
	end)

	it('should return the last value in the array', function()
		expect(liter.array({ 22, 230, 1, 6, 2, 5, 26, 23 }):last()).to.equal(23)
	end)

	it('should advance the iter by 3 steps', function()
		local iter = liter.array({ 3, 4, 2, 5, 6 })
		expect(iter:advanceBy(3)).to.be.ok()
		expect(iter:after()).to.equal(5)
		expect(iter:after()).to.equal(6)
		expect(iter:after()).never.to.be.ok()
	end)

	it('should advance too far and return false, then return nil for the next step', function()
		local iter = liter.array({ 2, 4, 5, 2 })
		expect(iter:advanceBy(20)).to.equal(false)
		expect(iter:after()).never.to.be.ok()
	end)

	it('should return true for each successful advancement', function()
		local iter = liter.array({ 1, 4, 6, 2, 3, 4, 6, 7 })
		expect(iter:advanceBy(2)).to.be.ok()
		expect(iter:advanceBy(2)).to.be.ok()
		expect(iter:advanceBy(3)).to.be.ok()
		expect(iter:advanceBy(10)).to.equal(false)
		expect(iter:after()).never.to.be.ok()
	end)

	it('should partition the array into two halves based on the predicate', function()
		local left, right = liter.array({ 5, 6, 12, 20 }):partition(function(value)
			return value > 10
		end)

		expect(#left).to.equal(2)
		expect(#right).to.equal(2)

		expect(table.find(left, 5)).to.be.ok()
		table.remove(left, table.find(left, 5))
		expect(table.find(left, 5)).never.to.be.ok()
		expect(table.find(left, 6)).to.be.ok()
		expect(table.find(right, 12)).to.be.ok()
		expect(table.find(right, 20)).to.be.ok()
	end)

	it('should partition the array based on the predicate and put it into one array', function()
		local partition = liter.array({ 5, 10, 20, 4, 2 }):partitionInPlace(function(value)
			return value > 5
		end)

		expect(#partition).to.equal(5)

		local a = 0
		for i = 1, 3 do
			if partition[i] == 2 or partition[i] == 4 or partition[i] == 5 then
				a += 1
			end
		end

		expect(a).to.equal(3)

		local b = 0
		for i = 4, 5 do
			if partition[i] == 20 or partition[i] == 10 then
				b += 1
			end
		end

		expect(b).to.equal(2)
	end)

	it('should return true since it is already partitioned', function()
		expect(liter.array({ 1, 1, 1, 1, 3, 3, 3, 3 }):isPartitioned(function(value)
			return value < 2
		end)).to.equal(true)
	end)

	it('should return true since all values match the predicate', function()
		expect(liter.array({ 5, 2 }):all(function()
			return true
		end)).to.equal(true)
	end)

	it('should return false since not all values match the predicate', function()
		expect(liter.array({ 5, 1, 2, 4, 10, 10, 12 }):all(function(value)
			return value == 10
		end)).to.equal(false)
	end)

	it('should return true since one of the values match the predicate', function()
		expect(liter.array({ 10, 2, 3, 1023, 24, 342, 21 }):any(function(value)
			return value == 342
		end)).to.equal(true)
	end)

	it("should return false since not one of the values don't match the predicate", function()
		expect(liter.array({ 3, 31, 4, 6, 3, 2, 1, 2 }):any(function(value)
			return value == -100
		end)).to.equal(false)
	end)

	it('should find the first value that matches the predicate', function()
		expect(liter.array({ 3, 2, 3, 4, 342, 322, 342, 3552, 235 }):find(function(value)
			return value == 342
		end)).to.equal(342)
	end)

	it('should return the index of the value that matches the predicate', function()
		expect(liter.array({ 23, 23, 43, 2, 4, 5, 2, 5, 342, 24, 342 }):position(function(value)
			return value == 342
		end)).to.equal(9)
	end)

	it('should return the greatest value in the array', function()
		expect(liter.array({ 2, 3, 3, 22, 21, 22, 20, 1 }):max()).to.equal(22)
	end)

	it('should return the least value in the array', function()
		expect(liter.array({ 12, 23, 1, 2, 7, 0, 0, 1, 0, 24 }):min()).to.equal(0)
	end)

	it('should return true since both iterators contain equal values in order', function()
		expect(liter.array({ 5, 3, 2 }):eq(liter.array({ 5, 3, 2 }))).to.equal(true)
	end)

	it("should return false since both iterators don't contain equal values in order", function()
		expect(liter.array({ 2, 3, 4 }):eq(liter.array({ 4, 3, 2 }))).to.equal(false)
	end)

	it('should return true since both iterators contain equal values in any order', function()
		local a = { 3, 4, 5, 6 }
		local b = { 6, 4, 5, 3 }
		expect(liter.array(a):eqBy(liter.array(b), function(x, y)
			return table.find(a, x) and table.find(b, y) and true or false
		end)).to.equal(true)
	end)

	it('should return false since both iterators contain equal values', function()
		expect(liter.array({ 5, 3, 2 }):ne(liter.array({ 5, 3, 2 }))).to.equal(false)
	end)

	it("should return true since both iterators don't contain equal values", function()
		expect(liter.array({ 5, 2, 1 }):ne(liter.array({ 1 }))).to.equal(true)
	end)
end
