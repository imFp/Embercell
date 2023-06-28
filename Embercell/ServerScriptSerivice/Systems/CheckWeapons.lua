-- Variables

local rp = game:GetService("ReplicatedStorage")
local events = rp.Events

local tanto = events.WeaponsList.Tanto
local blocky = events.WeaponsList.Blocky
local linked = events.WeaponsList.Linked
local danger = events.WeaponsList.Danger

-- Scripting

tanto.OnServerEvent:Connect(function(plr)
	
		local yen = plr.Yen
	
	if yen.Value >= 7500 then
		
		yen.Value -= 7500
		
		local hasTanto = plr:FindFirstChild("hasTanto")
		hasTanto.Value = true
		

	end	
end)

blocky.OnServerEvent:Connect(function(plr)

	local yen = plr.Yen

	if yen.Value >= 15000 then

		yen.Value -= 15000

		local hasBlocky = plr:FindFirstChild("hasBlocky")
		hasBlocky.Value = true


	end	
end)

linked.OnServerEvent:Connect(function(plr)

	local yen = plr.Yen

	if yen.Value >= 5000 then

		yen.Value -= 5000

		local hasLinked = plr:FindFirstChild("hasLinked")
		hasLinked.Value = true


	end	
end)

danger.OnServerEvent:Connect(function(plr)

	local yen = plr.Yen

	if yen.Value >= 10000 then

		yen.Value -= 10000

		local hasDanger = plr:FindFirstChild("hasDanger")
		hasDanger.Value = true


	end	
end)

