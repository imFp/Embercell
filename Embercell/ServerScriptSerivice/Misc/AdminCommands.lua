local commands = {}

local admins = {
	"Fpguim";
}

local prefix = "/"

local function findPlr(name)
	for i, plr in pairs(game.Players:GetPlayers()) do
		if string.lower(plr.Name) == name then
			return plr
		end
	end
	
	return nil
	
end

local function isAdmin(plr)
	for _, v in pairs(admins) do
		if v == plr.Name then
			return true
		end
	end
	
	return false
end

commands.tp = function(sender, args)
	for i , plrName in pairs(args) do
		
	end
	
	local plrToTeleportName = args[1]
	local plrToTeleportToName = args[2]
	
	if plrToTeleportName and plrToTeleportToName then
		local plrToTP = findPlr(plrToTeleportName)
		local plrToTPTO = findPlr(plrToTeleportToName)
		
		if plrToTP and plrToTPTO then
			plrToTP.Character.HumanoidRootPart.CFrame = plrToTPTO.Character.HumanoidRootPart.CFrame
		end
	end
end

commands.givemoney = function(sender, args)
	
	local plrToGiveYenTo = args[1]
	local amountToGive = args[2]
	
	if plrToGiveYenTo and amountToGive then
		local plr = findPlr(plrToGiveYenTo)
		
		if plr then
			plr.Yen.Value += tonumber(amountToGive)
		end
	end
end

commands.damage = function(sender, args)

	local plrToDamage = args[1]
	local damage = args[2]

	if plrToDamage and damage then
		local plr = findPlr(plrToDamage)

		if plr then
			plr.Character.Humanoid:TakeDamage(tonumber(damage))
		end
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg, recipient)
		if isAdmin(plr) then
			msg = string.lower(msg) 
			
			local splitString = msg:split(" ")
			
			local slashCommand = splitString[1]
			local cmd = slashCommand:split(prefix)
			
			local cmdName = cmd[2]
			
			if commands[cmdName] then
			
				local args = {}
				
				for i = 2, #splitString, 1 do
					table.insert(args, splitString[i])
				end
				
				commands[cmdName](plr, args)
			end
		end
	end)
end)