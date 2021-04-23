return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should only return values matching the predicate', function()
		local iter = liter.array({ 1, 5, 10, 20, 5, 2 }):filter(function(value)
			return value > 5
		end)

		expect(iter:after()).to.equal(10)
		expect(iter:after()).to.equal(20)
		expect(iter:after()).to.never.be.ok()
	end)
end
