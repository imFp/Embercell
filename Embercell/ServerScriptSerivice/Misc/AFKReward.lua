-- Variables

local remote = game.ReplicatedStorage.Events.AFKReward

-- Scripting

local function addYen(plr, amount)
	local gamepassService = game:GetService("MarketplaceService")
	local gamepassID1 = 117842409
	local hasPass2 = gamepassService:UserOwnsGamePassAsync(plr.UserId, gamepassID1)

	local gamepassID = 117841617	
	local hasPass = gamepassService:UserOwnsGamePassAsync(plr.UserId, gamepassID)

	local isPremium = Enum.MembershipType.Premium

	if hasPass2 then
		amount *= 2.5
	end

	if hasPass then
		amount *= 2
	end

	if isPremium then
		amount *= 1.2
	end
	
	plr.Yen.Value += amount
end

local function addExp(plr, amount)
	local gamepassService = game:GetService("MarketplaceService")
	local gamepassID1 = 117842409
	local hasPass2 = gamepassService:UserOwnsGamePassAsync(plr.UserId, gamepassID1)

	local gamepassID = 117841617	
	local hasPass = gamepassService:UserOwnsGamePassAsync(plr.UserId, gamepassID)

	local isPremium = Enum.MembershipType.Premium

	if hasPass2 then
		amount *= 2.5
	end

	if hasPass then
		amount *= 2
	end

	if isPremium then
		amount *= 1.2
	end

	plr.EXP.Value += amount
end

remote.OnServerEvent:Connect(function(plr)
	local exp = plr.EXP
	local yen = plr.Yen
	
	addExp(plr, 10)
	addYen(plr, 50)
end)