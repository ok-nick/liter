return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should iterate through each value in the array and then return nil', function()
		local iter = liter.array({ 5, 3, 1, 2, 4 })

		expect(iter:after()).to.equal(5)
		expect(iter:after()).to.equal(3)
		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(2)
		expect(iter:after()).to.equal(4)
		expect(iter:after()).never.to.be.ok()
	end)
end
