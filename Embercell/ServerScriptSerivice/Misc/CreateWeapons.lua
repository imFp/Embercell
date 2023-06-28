-- Variables

game.Players.PlayerAdded:Connect(function(plr)
	
	local hasTanto = plr:FindFirstChild("hasTanto")
	local hasBlocky = plr:FindFirstChild("hasBlocky")
	local hasLinked = plr:FindFirstChild("hasLinked")
	local hasDanger = plr:FindFirstChild("hasDanger")
	
	if not hasTanto then
		hasTanto = Instance.new("BoolValue", plr)
		hasTanto.Name = "hasTanto"
		hasTanto.Value = false
		
	end
	
	if not hasBlocky then
		hasBlocky = Instance.new("BoolValue", plr)
		hasBlocky.Name = "hasBlocky"
		hasBlocky.Value = false

	end
	
	if not hasLinked then
		hasLinked = Instance.new("BoolValue", plr)
		hasLinked.Name = "hasLinked"
		hasLinked.Value = false

	end
	
	if not hasDanger then
		hasDanger = Instance.new("BoolValue", plr)
		hasDanger.Name = "hasDanger"
		hasDanger.Value = false

	end

end)