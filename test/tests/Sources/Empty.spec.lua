return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should return nil for each step', function()
		local iter = liter.empty()

		expect(iter:after()).never.to.be.ok()
		expect(iter:after()).never.to.be.ok()
		expect(iter:after()).never.to.be.ok()
	end)
end
