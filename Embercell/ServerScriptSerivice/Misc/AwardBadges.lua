game.Players.PlayerAdded:Connect(function(plr)
	local BadgeService = game:GetService("BadgeService")
	local GodID = 2130235467
	local MeetTheDev = 2130235457
	local ThankYou = 2130338324
	local Welcome = 2130947259
	local Tutorial = 2130947391
	
	local TutorialRemote = game.ReplicatedStorage.Events.TutorialCompleted
	
	if not BadgeService:UserHasBadgeAsync(plr.UserId, Welcome) then
		BadgeService:AwardBadge(plr.UserId, Welcome)
		print("Welcome")
	end

	local ranks = plr.leaderstats.Rank
	
	if ranks.Value == "God" then
		if not BadgeService:UserHasBadgeAsync(plr.UserId, GodID) then
			BadgeService:AwardBadge(plr.UserId, GodID)
			plr.Yen.Value += 20000
		end
	end
	
	TutorialRemote.OnServerEvent:Connect(function(plr)
		if not BadgeService:UserHasBadgeAsync(plr.UserId, Tutorial) then
			BadgeService:AwardBadge(plr.UserId, Tutorial)
			print("Tutorial")
		end
	end)
	
	while wait(2) do
		local fp = game.Players:FindFirstChild("Fpguim")
		if fp then
			if not BadgeService:UserHasBadgeAsync(plr.UserId, MeetTheDev) then
				BadgeService:AwardBadge(plr.UserId, MeetTheDev)
			end
		end
	end

end)