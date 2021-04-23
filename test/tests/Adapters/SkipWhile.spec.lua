return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should skip the value if the number is negative', function()
		local iter = liter.array({ -1, 0, 1 }):skipWhile(function(value)
			return value < 0
		end)

		expect(iter:after()).to.equal(0)
		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.never.be.ok()
	end)
end
