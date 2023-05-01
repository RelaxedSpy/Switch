-- The main function that implements the switch statement.
-- @param switchValue The value to be checked against the cases.
-- @param cases A table that contains the cases to be executed.
-- @param parameters A table that contains the parameters to be passed to the case functions.
local function switch(switchValue, cases, parameters)
    -- Check that the switch value, cases table and parameters table are not nil.
    assert(switchValue ~= nil, "Switch value cannot be nil.")
    assert(type(cases) == "table", "Cases table must be a table.")
    assert(type(parameters) == "table", "Parameters table must be a table.")
    
    -- Define a metatable for the cases table that enables the cases to be called as functions.
    local casesMetatable = setmetatable({
        __call = function(_, ...)
            local caseFunc = cases[...]
            assert(caseFunc ~= nil, "Invalid case: " .. tostring(...))
            return caseFunc(unpack(parameters))
        end,
        __index = function(_, key)
            error("Invalid case: " .. tostring(key))
        end
    }, cases)
    
    -- Determine the type of the switch value.
    local switchType = type(switchValue)
    
    -- Check the switch value against each type and execute the corresponding case or error.
    if switchType == "string" or switchType == "number" then
        local caseFunc = cases[switchValue]
        if caseFunc then
            return caseFunc(unpack(parameters))
        elseif cases.Default then
            assert(type(cases.Default) == "function", "Default case must be a function.")
            return cases.Default(unpack(parameters))
        else
            error("No default case specified.")
        end
    elseif switchType == "boolean" then
        error("Switch value cannot be a boolean.")
    elseif switchType == "function" then
        error("Switch value cannot be a function.")
    elseif switchType == "userdata" or switchType == "thread" then
        error("Switch value cannot be a userdata or thread.")
    elseif switchType == "table" then
        error("Switch value cannot be a table.")
    else
        error("Invalid switch value: " .. tostring(switchValue))
    end
end

-- Export the switch function for use in other modules.
return switch
