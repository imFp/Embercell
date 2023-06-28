local Knockback = {}

function Knockback:knockback(enemyChar, amount, char)
	local Force = 80000

	local TotalForce = Force

	local KnockBack = Instance.new("BodyVelocity")
	KnockBack.Parent = enemyChar:FindFirstChild("HumanoidRootPart")--part is the target of the knockback/ the opponent

	KnockBack.MaxForce = Vector3.new(TotalForce,TotalForce,TotalForce)
	KnockBack.Velocity = char:FindFirstChild("HumanoidRootPart").CFrame.LookVector * amount -- based on the direction YOUR character is facing.

	game.Debris:AddItem(KnockBack, .25)
end


return Knockback
