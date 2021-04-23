return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should iterate throughout each value in the array and then return nil', function()
		local iter = liter.values({ 3, 2, 1 })

		expect(iter:after()).to.equal(3)
		expect(iter:after()).to.equal(2)
		expect(iter:after()).to.equal(1)
		expect(iter:after()).never.to.be.ok()
	end)
end
