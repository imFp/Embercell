while true do
	wait()
	
	c = game.Workspace:GetChildren()
	
	for i = 1, #c do
		cc = c[i]:GetChildren()
		
		for ii = 1, #cc do
			if cc[ii].ClassName == "CharacterMesh" then
				cc[ii]:Remove()
			end
		end
	end
end

game.Players.PlayerAdded:Connect(function(player)
	local camera = workspace.CurrentCamera

	local char = player.CharacterAdded:wait()
	char:WaitForChild("Head") -- Qualquer Parte do Corpo

	camera.CameraSubject = player.Character.Head
	camera.CameraType = Enum.CameraType.Attach
	camera.FieldOfView = 70

	game:GetService('RunService').Stepped:Connect(function()
		camera.CFrame = CFrame.new(player.Character.Head.Position) * CFrame.new(0, 0, 10) -- Camera Position
	end)
end)