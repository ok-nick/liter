return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should return the next character in the ascii string and then nil', function()
		local iter = liter.ascii('very nice')

		expect(iter:after()).to.equal('v')
		expect(iter:after()).to.equal('e')
		expect(iter:after()).to.equal('r')
		expect(iter:after()).to.equal('y')
		expect(iter:after()).to.equal(' ')
		expect(iter:after()).to.equal('n')
		expect(iter:after()).to.equal('i')
		expect(iter:after()).to.equal('c')
		expect(iter:after()).to.equal('e')
		expect(iter:after()).never.to.be.ok()
	end)
end
