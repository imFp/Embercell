-- Variables

local zoneModule = require(game.ReplicatedStorage.Zone)
local safeZone = zoneModule.new(workspace.SpawnZone)

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local h = char:WaitForChild("Humanoid")

local inZone = false

-- Scripting

if char then
	
	safeZone.localPlayerEntered:Connect(function()
		inZone = true
		
		if inZone == true then
			while inZone == true do
				wait()
				game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
			end
		end
	end)
	
	safeZone.localPlayerExited:Connect(function()
		inZone = false

		if inZone == false then
			while inZone == false do
				wait()
				game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
			end
		end
	end)
end
