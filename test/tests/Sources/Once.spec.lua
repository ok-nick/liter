return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should return the value once, then nil', function()
		local iter = liter.once(1)

		expect(iter:after()).to.equal(1)
		expect(iter:after()).never.to.be.ok()
		expect(iter:after()).never.to.be.ok()
	end)
end
