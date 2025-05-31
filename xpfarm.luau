local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character

local Message = Instance.new("Message", workspace)
Message.Text = "you need handcuffs equipped (police team)\nthe script disables the main gui for less lag\nreset or rejoin to stop the script"

Character.AncestryChanged:Connect(function() Character = nil end)

LocalPlayer.PlayerGui.MainGUI.Enabled = false

while task.wait() and Character do
  for _ = 1, 10 do
    game:GetService("ReplicatedStorage").Event:FireServer("Eject", LocalPlayer)
  end
end
