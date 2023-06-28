-- Variables

local remote = game.ReplicatedStorage.Events.Dash

-- Scripting

remote.OnServerEvent:Connect(function(plr)
	remote:FireAllClients(plr)
end)
