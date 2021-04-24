# liter
[![CI Status](https://img.shields.io/github/workflow/status/ok-nick/liter/Build)](https://github.com/ok-nick/liter/actions?query=workflow%3ABuild)
[![Latest Release](https://img.shields.io/github/v/release/ok-nick/liter?include_prereleases)](https://github.com/ok-nick/liter/releases/latest)

A powerful Luau library for enhanced Rust-like iterators.
- **Extensibility:** Liter makes it easy to define [custom behavior](#Want-more-control-over-how-you-iterate?) while preserving functionality.
- **Productivity:** Improve your workflow as you write complex yet legible code.
- **Parallel?:** Due to liter's extensible nature, parallel iterators could be implemented for significant performance boosts.

## Installation
There are multiple ways to install liter:
### Using Studio:
Pre-built binaries are available on the [GitHub release](https://github.com/ok-nick/solved/releases) page. Simply install the `.rbxm` file and import directly into studio.
### Using Rojo:
Same rules apply for installing to studio, just add the `.rbxm` to your `.project.json`  and you should be good to go.
### Using Kayak:
In your `rotriever.toml` file under the `[dependencies]` section, add:\
`liter = 'https://github.com/ok-nick/liter.git'`

## Examples
Numerous examples exist within the [unit tests](https://github.com/ok-nick/liter/tree/main/test/tests), although I specifically suggest reviewing the [consumer](https://github.com/ok-nick/liter/blob/main/test/tests/Consumers.spec.lua) unit tests.

### Iterating over an array's values:
```lua
liter.array({ 1, 2, 3 }):foreach(function(value)
	doSomething(value)
end)

for value in liter.array({ 1, 2, 3 }) do
	doSomething(value)
end
```

### Iterating over an array's index/value:
[Unbox](#unbox) is used here to unpack the index/value from its array. This behavior is also seen while using the [Hash](#Hash) composite.
```lua
liter.array({ 1, 2, 3 }):enumerate():unbox():foreach(function(index, value)
	doSomething(index, value)
end)

for index, value in liter.array({ 1, 2, 3 }):enumerate():unbox() do
	doSomething(value)
end
```

## Performance
Rust iterators are lazily evaluated which means in order to replicate its behavior, I cannot use native iterators. Although this degrades performance, it offers some unique functionality! It allows you to pass iterators and evaluate them when its actually necessary. This means you don't have to iterate over a table, do some calculations, pass the table somewhere else, iterate and evaluate, and so on... In a situation like this, liter could outperform native iterators!

> A Lua-oriented functional approach is in the making for on-demand performant iterators.

Run the [benchmarks](https://github.com/ok-nick/liter/tree/main/bench) using [boatbomber's benchmark plugin](https://devforum.roblox.com/t/benchmarker-plugin-compare-function-speeds-with-graphs-percentiles-and-more/829912?u=iinemo).

## Documentation
All behavior is mimicked from [Rust iterators](https://doc.rust-lang.org/std/iter/trait.Iterator.html). I suggest searching their for clear and concise documentation, although there are a few gotchas and added features documented below.
### **Composites**
### [Array](#Array)
```lua
liter.array(array) -> Iterator
```
Iterates over values in an array. An array iterator will only return the value unless combined with the [Enumerate adapter](https://github.com/ok-nick/liter/blob/main/src/Adapters/Enumerate.lua).

### [Ascii](#Ascii)
```lua
liter.ascii(string) -> Iterator
```
Iterates over ascii characters in a string.\
If you're not sure whether to use [Ascii](#Ascii) or  [Utf8](#Utf8), then your most likely just going to need [Ascii](#Ascii).

### [Hash](#Hash)
```lua
liter.hash(hash) -> Iterator
```
Iterates over key/values in a HashMap/Dictionary.\
A hash iterator will return the key/value pair packed into an array. Use the [Unbox](#Unbox) consumer to unpack the array as shown in the [example](#Examples).

### [Utf8](#Utf8)
```lua
liter.utf8(string) -> Iterator
```
Iterates over unicode characters in a string.

### **Sources**
### [Empty](https://doc.rust-lang.org/std/iter/fn.empty.html)

### [FromFunc](https://doc.rust-lang.org/std/iter/fn.from_fn.html)

### [Keys](#Keys)
```lua
liter.keys(table) -> Iterator
```
Iterates over keys in a table.

### [Once](https://doc.rust-lang.org/std/iter/fn.once.html)

### [OnceWith](https://doc.rust-lang.org/std/iter/fn.once_with.html)

### [Range](#Range)
```lua
liter.range(min, max) -> Iterator
```
Iterates numerically from the min to the max value.

### [Recur](https://doc.rust-lang.org/std/iter/fn.repeat.html)
This method replicates Rust's [repeat](https://doc.rust-lang.org/std/iter/fn.repeat.html) source, although is renamed to adhere with Lua syntax.

### [RecurWith](https://doc.rust-lang.org/std/iter/fn.repeat_with.html)
This method replicates Rust's [repeat_with](https://doc.rust-lang.org/std/iter/fn.repeat_with.html) source, although is renamed to adhere with Lua syntax.

### [Successors](https://doc.rust-lang.org/std/iter/fn.successors.html)

### [Values](#Values)
```lua
liter.values(tbl) -> Iterator
```
Iterates over values in a table.

### **Adapters**
### [Chain](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.chain)
### [Cycle](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.cycle)
This adapter adopts the same syntax of a [Rust Cycle](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.cycle), although it differs in behavior. The first iteration will cache the resulting values for future iterations. This behavior is guaranteed to change as development progresses.

### [Enumerate](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.enumerate)

### [Filter](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.filter)

### [FlatMap](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.flat_map)

### [Inspect](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.inspect)

### [Intersperse](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.intersperse)

### [IntersperseWith](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.intersperse_with)

### [Map](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.map)

### [Peekable](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.peekable)

### [Scan](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.scan)

### [Skip](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.skip)

### [SkipWhile](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.skip_while)

### [StepBy](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.step_by)

### [Take](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.take)

### [TakeWhile](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.take_while)

### [Unbox](#Unbox)
```lua
Iterator:unbox()
```

Unpacks a value into a "tuple." This is particularly useful when dealing with the [Hash](#Hash) composite.

Without `Unbox`:
```lua
liter.hash({ 1, 2, 3 }):foreach(function(pair)
	doSomething(pair[1], pair[2])
end)
```
With `Unbox`:
```lua
liter.hash({ 1, 2, 3 }):unbox():foreach(function(key, value)
	doSomething(key, value)
end)
```
> **_NOTE_:** Unbox will **ONLY** work with packed array returns.

[Zip](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.zip)

### **Consumers**
### [foreach](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.for_each)

### [fold](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.fold)

### [reduce](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.reduce)

### [sum](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.sum)

### [product](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.product)

### [count](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.count)

### [last](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.last)

### [advanceBy](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.advance_by)

### [nth](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.nth)

### [partition](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.partition)

### [partitionInPlace](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.partition_in_place)

### [isPartitioned](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.is_partitioned)

### [all](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.all)

### [any](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.any)

### [find](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.find)

### [position](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.position)

### [max](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.max)

### [min](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.min)

### [eq](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.eq)

### [eqBy](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.eq_by)

### [ne](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.ne)

## FAQ
### Want more control over how you iterate?
Liter makes this easy by providing an `Iterator` table which is intended to be set as your iterator's metatable. This process will *extend* the functionality of built-in iterators.

Example of the [built-in array iterator](https://github.com/ok-nick/liter/blob/main/src/Composites/Array.lua):
```lua
local Array = setmetatable({}, liter.Iterator)
Array.__index = Array
Array.__call = liter.Iterator.__call

function Array.new(array)
	return setmetatable({
		array = array,
		index = 1,
	}, Array)
end

function Array:after()
	local index = self.index
	self.index += 1
	return self.array[index]
end
```
Assigning `__call` is necessary to preserve the for loop syntax as shown in the [example](#Iterating-over-an-array's-values:).\
Creating custom [adapters](https://github.com/ok-nick/liter/tree/main/src/Adapters) is exactly the same, as seen by the [Skip adapter](https://github.com/ok-nick/liter/blob/main/src/Adapters/Skip.lua). It is important to recognize that you could still call internal *consumers* from `self`.

### Any more questions?
The best way to get in contact with me is [through discord](https://discord.gg/w9Bc6xH7uC).

## License
Liter is [MIT licensed](https://github.com/ok-nick/liter/blob/main/LICENSE.md).
