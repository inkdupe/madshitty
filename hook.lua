return function(Function)
	local OldNamecall
	OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
		Function(Self, OldNamecall, ...)
		return
	end))
end
