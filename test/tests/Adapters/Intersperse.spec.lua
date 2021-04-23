return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should switch between the value in the array and 5', function()
		local iter = liter.array({ 1, 3 }):intersperse(5)

		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(5)
		expect(iter:after()).to.equal(3)
		expect(iter:after()).to.never.be.ok()
	end)
end
