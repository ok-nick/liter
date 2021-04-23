local liter = require(game:GetService('ReplicatedStorage').liter)

return {
	ParameterGenerator = function()
		local hash = {}
		for i = 1, 1_000 do
			hash[tostring(i)] = 'foo'
		end
		return hash
	end,

	Functions = {
		Native = function(_, hash)
			for _ in pairs(hash) do
			end
		end,

		Liter = function(_, hash)
			for _ in liter.hash(hash) do
			end
		end,
	},
}
