return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should zip two iterators into one', function()
		local iter = liter.array({ 1, 2, 3 }):zip(liter.array({ 4, 5, 6 }))

		local a = iter:after()
		expect(a[1]).to.equal(1)
		expect(a[2]).to.equal(4)

		local b = iter:after()
		expect(b[1]).to.equal(2)
		expect(b[2]).to.equal(5)

		local c = iter:after()
		expect(c[1]).to.equal(3)
		expect(c[2]).to.equal(6)

		expect(iter:after()).to.never.be.ok()
	end)
end
