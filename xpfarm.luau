game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")

local LocalPlayer = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")

local Character = LocalPlayer.Character

local startRank = LocalPlayer.leaderstats.Rank.Value

local Message = Instance.new("Message", workspace)

Character.AncestryChanged:Connect(function() Character = nil end)

LocalPlayer.PlayerGui.MainGUI:Destroy()

UIS.MouseBehavior = Enum.MouseBehavior.Default

while task.wait() and Character do
    local status = "active"
    UIS.MouseIconEnabled = true
	if LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
        LocalPlayer.Backpack.Handcuffs.Parent = Character
        UIS.MouseBehavior = Enum.MouseBehavior.Default
    end

    if not Character:FindFirstChild("Handcuffs") then
        status = "inactive (no handcuffs found)"
    end

    Message.Text = "mad shitty xp farm\n\nthe script deletes the main gui for less lag\n\nrejoin to stop the script\n\ncurrent status:\n" .. status .. "\n\nstarted at rank [" .. startRank .. "]\ncurrent rank [" .. LocalPlayer.leaderstats.Rank.Value .. "]"

    task.spawn(function()
        for _ = 1, getgenv().XPspeed or 2000 do
            game:GetService("ReplicatedStorage").Event:FireServer("Eject", LocalPlayer)
        end
    end)
end
