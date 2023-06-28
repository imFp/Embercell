-- Variables

local ms = game:GetService("MarketplaceService")
local dt = game:GetService("DataStoreService")

local pp = dt:GetDataStore("PreviousPurchase")

local devProducts = {

	yen5000 = {
		name = "5,000 Yen",
		id = 1354307877,
		price = 50
	},

	yen10000 = {
		name = "10,000 Yen",
		id = 1354308230,
		price = 100
	},

	yen20000 = {
		name = "20,000 Yen",
		id = 1354308396,
		price = 200
	},

	yen50000 = {
		name = "50,000 Yen",
		id = 1354308601,
		price = 500
	},

	yen100000 = {
		name = "100,000 Yen",
		id = 1354308813,
		price = 1000
	},

	yen500000 = {
		name = "500,000 Yen",
		id = 1354309024,
		price = 5000
	},
}

-- Scripting

ms.ProcessReceipt = function(receipt)
	
	local id = receipt.PlayerId.."-"..receipt.PurchaseId
	
	local success = nil
	
	pcall(function()
		success = pp:GetAsync(id)
	end)
	
	if success then
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	
	local plr = game.Players:GetPlayerByUserId(receipt.PlayerId)
	
	if not plr then
		return Enum.ProductPurchaseDecision.NotProcessedYet
	else
		
		if receipt.ProductId == devProducts.yen5000.id then
			plr.Yen.Value += 5000
		end
		
		if receipt.ProductId == devProducts.yen10000.id then
			plr.Yen.Value += 10000
		end
		
		if receipt.ProductId == devProducts.yen20000.id then
			plr.Yen.Value += 20000
		end
		
		if receipt.ProductId == devProducts.yen50000.id then
			plr.Yen.Value += 50000
		end
		
		if receipt.ProductId == devProducts.yen100000.id then
			plr.Yen.Value += 100000
		end
		
		if receipt.ProductId == devProducts.yen500000.id then
			plr.Yen.Value += 500000
		end
		
		pcall(function()
			pp:SetAsync(id, true)
		end)
		return Enum.ProductPurchaseDecision.purc

	end
	
end