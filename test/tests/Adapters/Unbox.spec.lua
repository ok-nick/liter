return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should unpack the array around the returned value', function()
		local iter = liter.array({ { 1, 2 }, { 3, 4 } }):unbox()

		local a, b = iter:after()
		expect(a).to.equal(1)
		expect(b).to.equal(2)

		local c, d = iter:after()
		expect(c).to.equal(3)
		expect(d).to.equal(4)

		expect(iter:after()).to.never.be.ok()
	end)
end
