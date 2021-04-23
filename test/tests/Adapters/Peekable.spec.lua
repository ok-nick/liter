return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should peek to the next value in the iteration without consuming', function()
		local iter = liter.array({ 1, 5, 6, 2 }):peekable()

		expect(iter:peek()).to.equal(1)
		expect(iter:peek()).to.equal(1)
		expect(iter:after()).to.equal(1)
		expect(iter:peek()).to.equal(5)
		expect(iter:peek()).to.equal(5)
		expect(iter:after()).to.equal(5)
		expect(iter:after()).to.equal(6)
		expect(iter:after()).to.equal(2)
		expect(iter:after()).to.never.be.ok()
	end)
end
