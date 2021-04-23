return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should return the next character in the utf8 string', function()
		local iter = liter.utf8('a❤️utf8 ❤️')

		expect(iter:after()).to.equal('a')
		expect(iter:after()).to.equal('❤️')
		expect(iter:after()).to.equal('u')
		expect(iter:after()).to.equal('t')
		expect(iter:after()).to.equal('f')
		expect(iter:after()).to.equal('8')
		expect(iter:after()).to.equal(' ')
		expect(iter:after()).to.equal('❤️')
		expect(iter:after()).never.to.be.ok()
	end)
end
