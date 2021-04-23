return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should skip two indices per step in the iteration', function()
		local iter = liter.array({ 0, 1, 2, 3, 4, 5 }):stepBy(2)

		expect(iter:after()).to.equal(0)
		expect(iter:after()).to.equal(2)
		expect(iter:after()).to.equal(4)
		expect(iter:after()).to.never.be.ok()
	end)
end
