return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should increment the counter after each step in the iteration', function()
		local count = 0
		local iter = liter.array({ 1, 5 }):inspect(function()
			count += 1
		end)

		iter:after()
		expect(count).to.equal(1)
		iter:after()
		expect(count).to.equal(2)
		iter:after()
		expect(count).to.equal(3)
	end)
end
