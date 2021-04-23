return function()
	local liter = require(game:GetService('ReplicatedStorage').liter)

	it('should iterate through each key/value pair in the hash and then return nil', function()
		local hash = { a = true, b = false, c = 1 }
		local iter = liter.hash(hash)

		local a = iter:after()
		local ak, av = next(hash)
		expect(a[1]).to.equal(ak)
		expect(a[2]).to.equal(av)

		local b = iter:after()
		local bk, bv = next(hash, ak)
		expect(b[1]).to.equal(bk)
		expect(b[2]).to.equal(bv)

		local c = iter:after()
		local ck, cv = next(hash, bk)
		expect(c[1]).to.equal(ck)
		expect(c[2]).to.equal(cv)

		expect(iter:after()).never.to.be.ok()
	end)
end
