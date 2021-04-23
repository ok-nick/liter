return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should return the successor and then nil', function()
		local iter = liter.successors(1, function(number)
			local new = number * 10
			return new <= 10_000 and new or nil
		end)

		expect(iter:after()).to.equal(1)
		expect(iter:after()).to.equal(10)
		expect(iter:after()).to.equal(100)
		expect(iter:after()).to.equal(1_000)
		expect(iter:after()).to.equal(10_000)
		expect(iter:after()).never.to.be.ok()
	end)
end
