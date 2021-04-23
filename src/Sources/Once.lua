local Iterator = require(script.Parent.Parent.Iterator)

local Once = setmetatable({}, Iterator)
Once.__index = Once
Once.__call = Iterator.__call

function Once.new(value)
	return setmetatable({
		value = value,
		flag = false,
	}, Once)
end

function Once:after()
	if self.flag then
		return nil
	else
		self.flag = true
		return self.value
	end
end

return Once
