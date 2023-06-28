	-- Variables

local hitboxHandler = require(game.ServerStorage.Modules.RaycastHitboxV4)
local stunHandler = require(game.ServerStorage.Modules.StunHandler)
local Knockback = require(game.ServerStorage.Modules.Knockback)

local rp = game:GetService("ReplicatedStorage")

local remote = rp.Events.Weapon

local combo = 1
local canAttack = true


local animations = {
	'rbxassetid://11958746176',
	'rbxassetid://11964600322',
	'rbxassetid://11958746176',
	'rbxassetid://12048292196'
}

local yoru = {
	'rbxassetid://12189812738',
	'rbxassetid://12189655430',
	'rbxassetid://12189812738',
	'rbxassetid://12189769490',
}

local sfx = game.ServerStorage.SFX.Weapons
local vfx = game.ReplicatedStorage.FX.VFX

local bloodParticle = vfx.BloodParticle

local parryBlock = vfx.ParryBlock
local paryStar = vfx.ParryStar

local block = vfx.Block
local star = vfx.Star

local hitSFX = sfx.Hit
local slashSFX = sfx.Slash


local lastM1 = 0

-- Scripting

local function addYen(amount, plr)
	local yen = plr.Yen

	yen.Value += amount
end

local function soundEmit(sound, parent)
	local soundNew = sound:Clone()
	soundNew.Parent = parent
	soundNew:Play()
	
	game.Debris:AddItem(soundNew, 2)
end

local function emitParticle(particle, parent, char)

	if parent == char then
		return 
	else

		local particle2 = particle:Clone()
		particle2.Parent = parent
		particle2:Emit()

		game.Debris:AddItem(particle2, .3)
	end
end

local function emitParticle2(particle, parent, char)

	if parent == char then
		return 
	else

		local particle2 = particle:Clone()
		particle2.Parent = parent
		particle2:Emit()

		game.Debris:AddItem(particle2, .3)
	end
end

local function addRank(value, plr, hasPass, hasPass2)
	local Ranks = plr.leaderstats.Rank
	local EXP = plr.EXP
	local isPremium = plr.MembershipType == Enum.MembershipType.Premium

	if hasPass then
		value *= 2.5
	end

	if hasPass2 then
		value *= 2
	end

	if isPremium then
		value *= 1.1
	end

	plr.EXP.Value += value

end
local function Combo(plr)
	if combo >= 4 then
		combo = 1
	else
		combo += 1
	end
end

local function resetCombo(plr)
	if tick()- lastM1 > 2 then
		combo = 1
	end
end

local function parry(plr, char, h, enemyChar, enemyPlayer, anim3, stunAnim)
	local attacking = plr.Attacking
	local blocking = plr.Blocking
	local stunned = plr.Stunned
	
	h.WalkSpeed = 0
	h.JumpHeight = 0
	stunHandler.Stun(h, 1.3)
	stunned.Value = true
	anim3:Play()
	h:UnequipTools()

	emitParticle2(parryBlock, enemyChar.HumanoidRootPart, char)
	emitParticle2(paryStar, enemyChar.HumanoidRootPart, char)
	addRank(3, plr)
	addRank(20, enemyPlayer)

	task.wait(2)
	stunned.Value = false
	anim3:Stop()
	stunAnim:Destroy()
	h.WalkSpeed = 16
	h.JumpHeight = 7.2
end

remote.OnServerEvent:Connect(function(plr, dmg1, dmg2, blockDmg)
	local char = plr.Character or plr.CharacterAdded:Wait()
	local h = char:WaitForChild("Humanoid")
	
	local tool = char:FindFirstChildOfClass("Tool") or plr.Backpack:FindFirstChildOfClass("Tool")

	local attacking = plr.Attacking
	local blocking = plr.Blocking
	local stunned = plr.Stunned
	
	local gamepassService = game:GetService("MarketplaceService")
	local hasPass2 = gamepassService:UserOwnsGamePassAsync(plr.UserId, 117841617)
	local hasPass = gamepassService:UserOwnsGamePassAsync(plr.UserId, 117842409)
	
	resetCombo()

	lastM1 = tick()

	local animation = Instance.new("Animation", plr)
	animation.AnimationId = animations[combo]
	local anim = h.Animator:LoadAnimation(animation)
	
	local animation7 = Instance.new("Animation", plr)
	animation7.AnimationId = yoru[combo]
	local anim7 = h.Animator:LoadAnimation(animation7)

	if tool then
		
		local Params = RaycastParams.new()
		Params.FilterType = Enum.RaycastFilterType.Blacklist
		Params.FilterDescendantsInstances = {char}

		local newHitbox = hitboxHandler.new(tool.Handle.Blade1)

		newHitbox.OnHit:Connect(function(hit, humanoid)
			newHitbox.RaycastParams = Params

			local enemyChar = humanoid.Parent
			local enemyPlayer = game.Players:GetPlayerFromCharacter(enemyChar)
			
			local enemyBlocking = enemyPlayer.Blocking
			local enemyParry = enemyPlayer.Parry
			local enemyStunned = enemyPlayer.Stunned
			
			if humanoid ~= h then
				
				local hitAnim = Instance.new("Animation", plr)
				hitAnim.AnimationId = "rbxassetid://12181421070"
				local anim2 = humanoid.Animator:LoadAnimation(hitAnim)
				
				local stunAnim = Instance.new("Animation", plr)
				stunAnim.AnimationId = "rbxassetid://12181452970"
				local anim3 = h.Animator:LoadAnimation(stunAnim)
				
				if enemyBlocking.Value == true then
					
					-- if enemyParry.Value == true then
					--	parry(plr, char, h, enemyChar, enemyPlayer, anim3, stunAnim)
					-- end
					
					if combo == 4 then
						Knockback:knockback(humanoid.Parent, 20, char)
						humanoid:TakeDamage(dmg1)
						addYen(50, plr)
						emitParticle(bloodParticle, enemyChar.HumanoidRootPart, char)
						enemyBlocking.Value = false
						stunHandler.Stun(enemyChar.Humanoid, 1.3)
						enemyStunned.Value = true
						anim2:Play()
						task.wait(.2)
						task.wait(1.3)
						anim2:Stop()	
						hitAnim:Destroy()	
						enemyStunned.Value = false
					end
					
					if combo ~= 4 and enemyParry.Value == false then
						Knockback:knockback(humanoid.Parent, 5, char)
						humanoid:TakeDamage(blockDmg)
						emitParticle(star, enemyChar.HumanoidRootPart, char)
						emitParticle(block, enemyChar.HumanoidRootPart, char)
						anim2:Play()
						task.wait(.2)
						anim2:Stop()
						hitAnim:Destroy()
					end
				end
				
				if enemyBlocking.Value == false then
					Knockback:knockback(humanoid.Parent, 10, char)
					humanoid:TakeDamage(dmg2)
					addYen(50, plr)
					emitParticle(bloodParticle, enemyChar.HumanoidRootPart, char)
					addRank(10, plr)
					hitSFX:Play()	
					stunHandler.Stun(enemyChar.Humanoid, 0.2)
					enemyStunned.Value = true
					anim2:Play()
					task.wait(.2)
					anim2:Stop()	
					hitAnim:Destroy()
					enemyStunned.Value = false
				end
			end
		end)
		
				if tool.Name == "Ruined Blade" then
					anim7:Play()
				else
					anim:Play()
				end
		
				newHitbox:HitStart()
				soundEmit(slashSFX, char)
				attacking.Value = true
				tool.Handle.Blade1.Trail.Enabled = true
				Combo()
				task.wait(.5)	
				attacking.Value = false	
				newHitbox:HitStop()
				animation:Destroy()
				animation7:Destroy()	
				tool.Handle.Blade1.Trail.Enabled = false


	end		
end)		
