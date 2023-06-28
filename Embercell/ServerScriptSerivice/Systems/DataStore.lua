-- Variables

local dataStore = game:GetService("DataStoreService"):GetDataStore("SaveData")
local weaponData = game:GetService("DataStoreService"):GetDataStore("WeaponData")

-- Scripting

game.Players.PlayerAdded:Connect(function(plr)
	task.wait()
	local plrId = "id_"..plr.UserId
	
	local save1 = plr.leaderstats.Rank
	local save2 = plr.EXP
	local save3 = plr.Yen
	local save4 = plr.Tutorial
	local save5 = plr.hasTanto
	local save6 = plr.hasBlocky
	local save7 = plr.hasLinked
	local save8 = plr.hasDanger
	
	local getSaved = dataStore:GetAsync(plrId)
	
	if getSaved then
		save1.Value = getSaved[1]
		save2.Value = getSaved[2]
		save3.Value = getSaved[3]
		save4.Value = getSaved[4]
		save5.Value = getSaved[5]
		save6.Value = getSaved[6]
		save7.Value = getSaved[7]
		save8.Value = getSaved[8]
	else
		local number = {save1.Value, save2.Value, save3.Value, save4.Value}
		dataStore:GetAsync(plrId, number)
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
	dataStore:SetAsync("id_"..plr.UserId, {plr.leaderstats.Rank.Value, plr.EXP.Value, plr.Yen.Value, plr.Tutorial.Value, plr.hasTanto.Value, plr.hasBlocky.Value, plr.hasLinked.Value, plr.hasDanger.Value})
end)