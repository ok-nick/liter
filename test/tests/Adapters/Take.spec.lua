return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should only iterate throughout the first 2 elements', function()
		local iter = liter.array({ 1, 2, 3 }):take(2)

		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(2)
		expect(iter:after()).to.never.be.ok()
	end)
end
