local liter = require(game:GetService('ReplicatedStorage').liter)

return {
	ParameterGenerator = function()
		return 'abcdefabcdefabcdef'
	end,

	Functions = {
		Utf8 = function(_, str)
			for _ in liter.utf8(str) do
			end
		end,

		Ascii = function(_, str)
			for _ in liter.ascii(str) do
			end
		end,
	},
}
