return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should endlessly cycle through the array', function()
		local iter = liter.array({ 5, 4, 3 }):cycle()

		expect(iter:after()).to.equal(5)
		expect(iter:after()).to.equal(4)
		expect(iter:after()).to.equal(3)
		expect(iter:after()).to.equal(5)
		expect(iter:after()).to.equal(4)
		expect(iter:after()).to.equal(3)
		expect(iter:after()).to.equal(5)
		expect(iter:after()).to.equal(4)
		expect(iter:after()).to.equal(3)
	end)
end
