-- This is really weird, but unfortunately with how Lua imports work, it is
-- necessary to avoid circular dependencies. Maybe there is a better design?
local Iterator = require(script.Iterator)
setmetatable(Iterator, require(script.Impl))

local Sources = script.Sources
local Composites = script.Composites

return {
	Iterator = Iterator, -- Used for creating custom iterators.

	successors = require(Sources.Successors).new,
	recurWith = require(Sources.RecurWith).new,
	fromFunc = require(Sources.FromFunc).new,
	onceWith = require(Sources.OnceWith).new,
	array = require(Composites.Array).new,
	ascii = require(Composites.Ascii).new,
	values = require(Sources.Values).new,
	utf8 = require(Composites.Utf8).new,
	hash = require(Composites.Hash).new,
	empty = require(Sources.Empty).new,
	range = require(Sources.Range).new,
	recur = require(Sources.Recur).new,
	keys = require(Sources.Keys).new,
	once = require(Sources.Once).new,
}
