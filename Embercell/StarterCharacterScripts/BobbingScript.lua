local runService = game:GetService("RunService")

local character = script.Parent

local humanoid = character:WaitForChild("Humanoid")

function updateBobbleEffect()
	local currentTime = tick()
	

	
	if humanoid.MoveDirection.Magnitude > 0 then
		
		if humanoid.WalkSpeed >= 23 then
		
		local bobbleX = math.cos(currentTime * 8) * .25
		local bobbleY = math.abs(math.sin(currentTime * 8)) * .25
		local bobble = Vector3.new(bobbleX, bobbleY, 0)

		humanoid.CameraOffset = humanoid.CameraOffset:lerp(bobble, .25)
			
		elseif humanoid.WalkSpeed <= 22 then
			
			local bobbleX = math.cos(currentTime * 5) * .25
			local bobbleY = math.abs(math.sin(currentTime * 5)) * .25
			local bobble = Vector3.new(bobbleX, bobbleY, 0)

			humanoid.CameraOffset = humanoid.CameraOffset:lerp(bobble, .25)
		
		end
			
	else
		humanoid.CameraOffset = humanoid.CameraOffset * .75



	end
end
runService.RenderStepped:Connect(updateBobbleEffect)
