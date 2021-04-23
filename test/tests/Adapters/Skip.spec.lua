return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should skip the first two indices in the iteration', function()
		local iter = liter.array({ 1, 2, 3 }):skip(2)

		expect(iter:after()).to.equal(3)
		expect(iter:after()).to.never.be.ok()
	end)
end
