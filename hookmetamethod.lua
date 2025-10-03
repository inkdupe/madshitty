return function(Signal)
    local OldNamecall
    OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
        local Method = getnamecallmethod()

        if Method == "FireServer" or Method == "InvokeServer" then
            local Results = {Signal(Self, ...)}
            if #Results == 0 then
                return
            else
                return OldNamecall(table.unpack(Results))
            end
        end

        return OldNamecall(Self, ...)
    end))
end
