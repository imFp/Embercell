-- Variables

local char = script.Parent
local h = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

-- Scripting

h.Died:Connect(function()
	task.wait(1)
	if char then
		if hrp then
			task.wait(1)
			hrp.CFrame = workspace.Map.Spawn.CFrame
		end
	end
end)