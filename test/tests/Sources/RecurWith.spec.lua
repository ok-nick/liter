return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should return the same value returned by the function', function()
		local iter = liter.recurWith(function()
			return 1
		end)

		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(1)
	end)
end
