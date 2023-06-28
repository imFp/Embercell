-- Variables

local remote = game.ReplicatedStorage.Events.DisableUI

-- Scripting

remote.OnClientEvent:Connect(function(plr)
	game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
end)
