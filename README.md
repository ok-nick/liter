# liter
[![CI Status](https://img.shields.io/github/workflow/status/ok-nick/liter/Build)](https://github.com/ok-nick/liter/actions?query=workflow%3ABuild)
[![Latest Release](https://img.shields.io/github/release/ok-nick/liter)](https://github.com/ok-nick/liter/releases/latest)

A powerful Luau library for enhanced Rust-like iterators.
- **Extensibility:** Liter makes it easy to define custom behavior while preserving functionality by providing a metatable.
- **Productivity:** Improve your workflow as you write complex yet legible code.
- **Parallel?:** Due to liter's extensible nature, parallel iterators could be implemented for significant performance boosts.

## Installation
There are multiple ways to install liter:
### Using Studio:
Pre-built binaries are available from the [GitHub release](https://github.com/ok-nick/solved/releases) page. Simply install the `.rbxm` file and import directly into studio.
### Using Rojo:
Same rules apply for installing to studio, just add the `.rbxm` to your `.project.json`  and you should be good to go.
### Using Kayak:
In your `rotriever.toml` file under the `[dependencies]` section, add\
`liter = 'https://github.com/ok-nick/liter.git'`.

## Examples
Numerous examples exist within the [unit tests](https://github.com/ok-nick/liter/tree/main/test/tests), although I specifically suggest reviewing the [consumer](https://github.com/ok-nick/liter/blob/main/test/tests/Consumers.spec.lua) unit tests.

### Iterating over an array's values:
```lua
liter.array({ 1, 2, 3 }):foreach(function(value)
	doSomething(value)
end)
```

### Iterating over an array's index/value:
[:unbox()](README.md#unbox) is used here to unpack the index/value from its array. This behavior is also seen while using the [Hash](README.md#Hash) composite.
```lua
liter.array({ 1, 2, 3 }):enumerate():unbox():foreach(function(index, value)
	doSomething(index, value)
end)
```

### Using Lua's "for" syntax:
```lua
for value in liter.array({ 1, 2, 3 }) do
	doSomething(value)
end
```

## Documentation
All behavior is mimicked exactly like [Rust iterators](https://doc.rust-lang.org/std/iter/trait.Iterator.html). I suggest searching their for clear and concise documentation, although there are a few gotchas documented below.

### Array
Iterates over values in an array.
```lua
liter.array(array: {any}) -> Iterator
```
An array iterator will only return the value unless combined with the [Enumerate adapter](https://github.com/ok-nick/liter/blob/main/src/Adapters/Enumerate.lua).

### Hash
Iterates over key/values in a HashMap/Dictionary.
```lua
liter.hash(hash: {[key: any]: any}) -> Iterator
```
A hash iterator will return the key/value pair packed into an array. Use the [unbox](README.md#unbox) consumer to unpack the array as show in the [example](README.md#Examples).

### Ascii
Iterates over ascii characters (most common usage) in a string.
```lua
liter.ascii(str: string) -> Iterator
```

### Utf8
Iterates over unicode characters in a string.
```lua
liter.utf8(str: string) -> Iterator
```

### Keys
Iterates over keys in a table.
```lua
liter.keys(tbl: {[key: any]: any}) -> Iterator
```

### Values
Iterates over values in a table.
```lua
liter.values(tbl: {[key: any]: any}) -> Iterator
```

### Range
Iterates numerically through the min and max values.
```lua
liter.range(min: number, max: number) -> Iterator
```

### Recur/RecurWith
These methods replicate Rust's [repeat](https://doc.rust-lang.org/std/iter/fn.repeat.html) and [repeat_with](https://doc.rust-lang.org/std/iter/fn.repeat_with.html) sources although are renamed to adhere with Lua syntax.

### :unbox()
Unpacks a value into a "tuple." This is particularly useful when dealing with the [Hash](README.md#Hash) composite.

Without unbox:
```lua
liter.hash({ 1, 2, 3 }):foreach(function(pair)
	doSomething(pair[1], pair[2])
end)
```
With unbox:
```lua
liter.hash({ 1, 2, 3 }):unbox():foreach(function(key, value)
	doSomething(key, value)
end)
```
> **_NOTE_:** `:unbox()` will **ONLY** work with packed array returns.

### Cycle
This adapter adopts the same syntax of a [Rust Cycle](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.cycle), although it differs in behavior. The first iteration will cache the resulting values for future iterations. This behavior is guaranteed to change as development progresses.

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
Creating custom [adapters](https://github.com/ok-nick/liter/tree/main/src/Adapters) is exactly the same, as seen from the [skip adapter](https://github.com/ok-nick/liter/blob/main/src/Adapters/Skip.lua). It is important to recognize that you could still call internal *consumers* from `self`.

### Any more questions?
The best way to get in contact with me is [through discord](https://discord.gg/w9Bc6xH7uC).

## License
Liter is available under the terms of the Mozilla Public License, Version 2.0. See [LICENSE](LICENSE) for details.
