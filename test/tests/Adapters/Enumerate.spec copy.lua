return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should enumerate through the array returning an index-value pair', function()
		local iter = liter.array({ 1, 5 }):enumerate()

		local a = iter:after()
		expect(a[1]).to.equal(1)
		expect(a[2]).to.equal(1)

		local b = iter:after()
		expect(b[1]).to.equal(2)
		expect(b[2]).to.equal(5)

		expect(iter:after()).to.never.be.ok()
	end)
end
