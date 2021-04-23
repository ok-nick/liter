return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should iterate from 1 to 3 inclusive and then return nil', function()
		local iter = liter.range(1, 3)

		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(2)
		expect(iter:after()).to.equal(3)
		expect(iter:after()).never.to.be.ok()
	end)
end
