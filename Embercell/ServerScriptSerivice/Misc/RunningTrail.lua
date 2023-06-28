local storage = game:GetService("ServerStorage")
local trails = storage.Trails
local trailed = false

game.Players.PlayerAdded:Connect(function(plr)
	wait(4)
	
	local char = plr.Character or plr.CharacterAdded:Wait()
	local h = char:WaitForChild("Humanoid")
	
	local la = trails["Left Arm"]:Clone()
	local la2 = trails["Left Arm"]:GetChildren()
	la.Parent = char["Left Arm"]
	
	local ll = trails["Left Leg"]:Clone()
	local ll2 = trails["Left Leg"]:GetChildren()
	ll.Parent = char["Left Leg"]
	
	local ra = trails["Right Arm"]:Clone()
	local ra2 = trails["Right Arm"]:GetChildren()
	ra.Parent = char["Right Arm"]
	
	local rl = trails["Right Leg"]:Clone()
	local rl2 = trails["Right Leg"]:GetChildren()
	rl.Parent = char["Right Leg"]

	if h.WalkSpeed >= 25 then
		if trailed == false then
			la.LA.Enabled = true
			ll.LL.Enabled = true
			
			ra.RA.Enabled = true
			rl.RL.Enabled = true
			trailed = true
		end
		
	elseif h.WalkSpeed < 25 then
		if trailed == false then
			la.LA.Enabled = false
			ll.LL.Enabled = false

			ra.RA.Enabled = false
			rl.RL.Enabled = false
			trailed = false
		end

	end
end)