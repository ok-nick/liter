local Iterator = require(script.Parent.Parent.Iterator)

local Zip = setmetatable({}, Iterator)
Zip.__index = Zip
Zip.__call = Iterator.__call

function Zip.new(a, b)
	return setmetatable({
		a = a,
		b = b,
	}, Zip)
end

function Zip:after()
	local a = self.a:after()
	if a == nil then
		return nil
	end

	local b = self.b:after()
	if b == nil then
		return nil
	end

	return { a, b }
end

return Zip
