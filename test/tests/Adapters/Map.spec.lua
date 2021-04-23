return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should map each value to itself times 2', function()
		local iter = liter.array({ 1, 5, 6, 2 }):map(function(value)
			return value * 2
		end)

		expect(iter:after()).to.equal(2)
		expect(iter:after()).to.equal(10)
		expect(iter:after()).to.equal(12)
		expect(iter:after()).to.equal(4)
		expect(iter:after()).to.never.be.ok()
	end)
end
