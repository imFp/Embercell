-- Variables

local hitboxHandler = require(game.ServerStorage.Modules.RaycastHitboxV4)
local stunHandler = require(game.ServerStorage.Modules.StunHandler)

local rp = game:GetService("ReplicatedStorage")

local remote = rp.Events.Block
local remote2 = rp.Events.Block2

local blockingRemote = rp.Events.BlockingIsTrue

local canBlock = true

-- Scripting

local function Parriable(plr)
	local parry = plr.Parry
	
	parry.Value = true
	task.wait(.4)
	parry.Value = false
	
end

remote.OnServerEvent:Connect(function(plr)
	
	local char = plr.Character
	local h = char:WaitForChild("Humanoid")
	local tool = script.Parent
	
	local canRun = char:GetAttribute("CanRun")

	local attacking = plr.Attacking
	local blocking = plr.Blocking
	local stunned = plr.Stunned
	local parry = plr.Parry
	local dashing = plr.Dashing
	
	blocking.Value = true
			
			if h.WalkSpeed >= 17 then return end
			
			canBlock = false
			blockingRemote:FireClient(plr, canBlock)
			Parriable(plr)
end)

remote2.OnServerEvent:Connect(function(plr)
	local char = plr.Character
	local h = char:WaitForChild("Humanoid")
	local tool = script.Parent

	local canRun = char:GetAttribute("CanRun")

	local attacking = plr.Attacking
	local blocking = plr.Blocking
	local stunned = plr.Stunned
	local parry = plr.Parry
	local dashing = plr.Dashing
	
	blocking.Value = false

	canBlock = true
	blockingRemote:FireClient(plr, canBlock)
end)