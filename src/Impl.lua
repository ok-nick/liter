local Adapters = script.Parent.Adapters

local Impl = {
	intersperseWith = require(Adapters.IntersperseWith).new,
	intersperse = require(Adapters.Intersperse).new,
	skipWhile = require(Adapters.SkipWhile).new,
	enumerate = require(Adapters.Enumerate).new,
	takeWhile = require(Adapters.TakeWhile).new,
	peekable = require(Adapters.Peekable).new,
	flatMap = require(Adapters.FlatMap).new,
	inspect = require(Adapters.Inspect).new,
	stepBy = require(Adapters.StepBy).new,
	filter = require(Adapters.Filter).new,
	unbox = require(Adapters.Unbox).new,
	cycle = require(Adapters.Cycle).new,
	chain = require(Adapters.Chain).new,
	take = require(Adapters.Take).new,
	scan = require(Adapters.Scan).new,
	skip = require(Adapters.Skip).new,
	map = require(Adapters.Map).new,
	zip = require(Adapters.Zip).new,
}
Impl.__index = Impl

return Impl
