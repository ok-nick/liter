return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should flatten the nested arrays into a single array iterator', function()
		local iter = liter.array({ { 5, 10 }, { 3, 2 } }):flatMap(function(value)
			return liter.array(value)
		end)

		expect(iter:after()).to.equal(5)
		expect(iter:after()).to.equal(10)
		expect(iter:after()).to.equal(3)
		expect(iter:after()).to.equal(2)

		expect(iter:after()).to.never.be.ok()
	end)
end
