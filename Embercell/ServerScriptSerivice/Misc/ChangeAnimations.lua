game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		wait(3)
		char.Humanoid.WalkSpeed = 16
		char.Animate.walk.WalkAnim.AnimationId = "rbxassetid://11937880397"
		char.Animate.run.RunAnim.AnimationId = "rbxassetid://11937880397"
	end)
end)