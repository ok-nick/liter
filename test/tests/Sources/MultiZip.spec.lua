return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should iterate over multiple iterators at once', function()
		local a = liter.array({ 1, 2 })
		local b = liter.array({ 3, 2, 4 })
		local c = liter.array({ 1, 3 })
		local iter = liter.multiZip(a, b, c)

		local result1 = iter:after()
		expect(result1[1]).to.equal(1)
		expect(result1[2]).to.equal(3)
		expect(result1[3]).to.equal(1)

		local result2 = iter:after()
		expect(result2[1]).to.equal(2)
		expect(result2[2]).to.equal(2)
		expect(result2[3]).to.equal(3)

		local result3 = iter:after()
		expect(result3).never.to.be.ok()
	end)
end
