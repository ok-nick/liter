return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should return the value if it matches the predicate', function()
		local iter = liter.array({ -1, 0, 1 }):takeWhile(function(value)
			return value < 0
		end)

		expect(iter:after()).to.equal(-1)
		expect(iter:after()).to.never.be.ok()
	end)
end
