game.Players.PlayerAdded:Connect(function(Player)
	local leaderstats = Instance.new('Folder', Player)
	leaderstats.Name = "leaderstats"
	
	local Ranks = Instance.new("StringValue", leaderstats)
	Ranks.Name = "Rank"
	Ranks.Value = "Newbie"
	
	local EXP = Instance.new("IntValue", Player)
	EXP.Name = "EXP"
	EXP.Value = 1	
	
	local Yen = Instance.new("IntValue", Player)
	Yen.Name = "Yen"
	Yen.Value = 100
	
	local tut = Player:FindFirstChild("Tutorial")
	
	if tut then
		return
	else
		
		local Tutorial = Instance.new("BoolValue", Player)
		Tutorial.Name = "Tutorial"
		Tutorial.Value = false
	end
	
end)

game.Players.PlayerAdded:Connect(function(plr)
	local stunned = Instance.new("BoolValue", plr)
	stunned.Name = "Stunned"
	stunned.Value = false

	local blocking = Instance.new("BoolValue", plr)
	blocking.Name = "Blocking"
	blocking.Value = false

	local attacking = Instance.new("BoolValue", plr)
	attacking.Name = "Attacking"
	attacking.Value = false

	local parry = Instance.new("BoolValue", plr)
	parry.Name = "Parry"
	parry.Value = false

	local dash = Instance.new("BoolValue", plr)
	dash.Name = "Dashing"
	dash.Value = false

end)

