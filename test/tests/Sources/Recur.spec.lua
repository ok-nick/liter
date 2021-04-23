return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should return the same value', function()
		local iter = liter.recur(1)

		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(1)
	end)
end
