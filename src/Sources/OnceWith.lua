local Iterator = require(script.Parent.Parent.Iterator)

local OnceWith = setmetatable({}, Iterator)
OnceWith.__index = OnceWith
OnceWith.__call = Iterator.__call

function OnceWith.new(callback)
	return setmetatable({
		callback = callback,
		flag = false,
	}, OnceWith)
end

function OnceWith:after()
	if self.flag then
		return nil
	else
		self.flag = true
		return self.callback()
	end
end

return OnceWith
