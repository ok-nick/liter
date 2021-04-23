local liter = require(game:GetService('ReplicatedStorage').liter)

return {
	ParameterGenerator = function()
		return table.create(1_000, 'foo')
	end,

	Functions = {
		Native = function(_, array)
			for _ in ipairs(array) do
			end
		end,

		Liter = function(_, array)
			for _ in liter.array(array) do
			end
		end,
	},
}
