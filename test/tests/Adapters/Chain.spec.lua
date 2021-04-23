return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should chain two iterators into one', function()
		local iter = liter.array({ 1, 5 }):chain(liter.array({ 2, 8 }))

		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(5)
		expect(iter:after()).to.equal(2)
		expect(iter:after()).to.equal(8)
		expect(iter:after()).to.never.be.ok()
	end)
end
