-- Variables

local weapon = game.ServerStorage.Weapons

local dagger = game.ReplicatedStorage.Events.Weapons.DaggerEquip
local katana = game.ReplicatedStorage.Events.Weapons.KatanaEquip
local yoru = game.ReplicatedStorage.Events.Weapons.RuinedBladeEquip

local blocky = game.ReplicatedStorage.Events.Weapons.BlockyEquip
local linked = game.ReplicatedStorage.Events.Weapons.LinkedEquip
local darkheart = game.ReplicatedStorage.Events.Weapons.DarkheartEquip
local Time = game.ReplicatedStorage.Events.Weapons.TimeDagger
local danger = game.ReplicatedStorage.Events.Weapons.DangerEquip
local goldenK = game.ReplicatedStorage.Events.Weapons.GoldenKatanaEquip
local goldenT = game.ReplicatedStorage.Events.Weapons.GoldenTantoEquip

local remote2 = game.ReplicatedStorage.Events.DisableUI

dagger.OnServerEvent:Connect(function(plr)
	
	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon.Tanto:Clone()
	new.Parent = plr.Backpack
	
	remote2:FireClient(plr)
	
end)

katana.OnServerEvent:Connect(function(plr)

	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon.Katana:Clone()
	new.Parent = plr.Backpack
	
	remote2:FireClient(plr)

end)

yoru.OnServerEvent:Connect(function(plr)

	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon["Ruined Blade"]:Clone()
	new.Parent = plr.Backpack
	
	remote2:FireClient(plr)

end)

blocky.OnServerEvent:Connect(function(plr)

	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon["Blocky Sword"]:Clone()
	new.Parent = plr.Backpack

	remote2:FireClient(plr)

end)

darkheart.OnServerEvent:Connect(function(plr)

	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon.Darkheart:Clone()
	new.Parent = plr.Backpack

	remote2:FireClient(plr)

end)


linked.OnServerEvent:Connect(function(plr)

	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon["Linked Katana"]:Clone()
	new.Parent = plr.Backpack

	remote2:FireClient(plr)

end)

danger.OnServerEvent:Connect(function(plr)

	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon.Dagger:Clone()
	new.Parent = plr.Backpack

	remote2:FireClient(plr)

end)

Time.OnServerEvent:Connect(function(plr)

	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon["Time Dagger"]:Clone()
	new.Parent = plr.Backpack

	remote2:FireClient(plr)

end)

goldenK.OnServerEvent:Connect(function(plr)

	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon["Golden Katana"]:Clone()
	new.Parent = plr.Backpack

	remote2:FireClient(plr)

end)

goldenT.OnServerEvent:Connect(function(plr)

	local tools = plr.Backpack:FindFirstChildOfClass("Tool")
	if tools then
		tools:Destroy()
	end

	local new = weapon["Golden Tanto"]:Clone()
	new.Parent = plr.Backpack

	remote2:FireClient(plr)

end)
