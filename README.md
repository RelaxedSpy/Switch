# Switch
This is a Lua implementation of a switch statement, which is a control flow statement found in many programming languages.

## Description

This is a Lua implementation of a switch statement, which allows for conditional execution of code based on the value of a variable. It is similar to an if-else chain, but is generally considered more readable and easier to maintain for larger numbers of cases.

This implementation uses a table of case functions, which are called based on the value of the switch variable. The table can also include a default case function, which is called if none of the other cases match.

## Usage

To use the switch statement, simply require the module and call the `switch` function with the switch value, a table of cases, and a table of parameters to be passed to the case functions:

```lua
local switch = require("switch")

local x = 5

switch(x, {
    [1] = function()
        print("x is 1")
    end,
    [2] = function()
        print("x is 2")
    end,
    [3] = function()
        print("x is 3")
    end,
    Default = function()
        print("x is not 1, 2, or 3")
    end
})
```

The switch value can be a string or a number. If it is a string, the case functions should be indexed using string keys. If it is a number, the case functions should be indexed using numeric keys.

The parameters table is optional, but can be used to pass arguments to the case functions.

## Error Handling

If `switchValue` is `nil`, the function will error with the message "Switch value cannot be nil." If `cases` or `parameters` are not tables, the function will error with the messages "Cases table must be a table." and "Parameters table must be a table.", respectively.

If `switchValue` is of an invalid type (i.e. boolean, function, userdata, thread, or table), the function will error with a corresponding message.

If a case function is not specified for the value of `switchValue` and no `Default` case is provided, the function will error with the message "No default case specified."

If a case function is specified but is not a function, the function will error with the message "Invalid case: [key]" where `[key]` is the key corresponding to the case function.

If an invalid key is provided as a case, the function will error with the message "Invalid case: [key]" where `[key]` is the invalid key.


## License

This implementation of the switch statement is released under the MIT License.
