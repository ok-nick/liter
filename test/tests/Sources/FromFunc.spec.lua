return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should create an iterator from the provided function', function()
		local count = 0
		local iter = liter.fromFunc(function()
			count += 1
			return count
		end)

		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(2)
		expect(iter:after()).to.equal(3)
	end)
end
