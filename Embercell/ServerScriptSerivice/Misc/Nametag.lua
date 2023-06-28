-- Variables

game.Players.PlayerAdded:Connect(function(plr)
	local char = plr.Character or plr.CharacterAdded:Wait()
	local h = char:WaitForChild("Humanoid")
	
	while task.wait(.2) do
		local nametag = game.ServerStorage.NametagHolder:Clone()

		local passId = 117842409
		local marketplaceService = game:GetService("MarketplaceService")

		local ownsPass = marketplaceService:UserOwnsGamePassAsync(plr.UserId, passId)

		nametag.PlrName.Text = plr.Name

		if ownsPass then
			nametag.Parent = char.Head

		end

		if ownsPass and plr.Name == "Fpguim" then
			nametag.Nametag.Text = "Developer"
			nametag.PlrName.Text = plr.Name
			nametag.Nametag.TextColor3 = Color3.fromRGB(41, 129, 197)
			nametag.Parent = char.Head
		end
		
		if ownsPass and plr.Name == "payo_BR" then
			nametag.Nametag.Text = "Closed Tester"
			nametag.PlrName.Text = plr.Name
			nametag.Nametag.TextColor3 = Color3.fromRGB(60, 217, 49)
			nametag.Parent = char.Head
		end
	end
end)