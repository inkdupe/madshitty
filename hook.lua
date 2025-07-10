return function(Function)
	local OldNamecall
	OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
		return Function(Self, OldNamecall, ...)
	end))
end
