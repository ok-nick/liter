return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should map each value to itself times 2', function()
		local iter = liter.array({ 1, 2, 3 }):scan(1, function(state, value)
			state = state * value
			return state, -state
		end)

		expect(iter:after()).to.equal(-1)
		expect(iter:after()).to.equal(-2)
		expect(iter:after()).to.equal(-6)
		expect(iter:after()).to.never.be.ok()
	end)
end
