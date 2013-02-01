if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "AuctionLiteSkin"
local s = U.s
local c = U.c
local function SkinAuctionLite(self,event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	U.SkinTab(AuctionFrameTab4)
	U.SkinTab(AuctionFrameTab5)
	U.SkinEditBox(BuyName)
	U.SkinEditBox(BuyQuantity)
	U.SkinButton(BuySearchButton)
	U.SkinButton(BuyBidButton)
	U.SkinButton(BuyBuyoutButton)
	U.SkinButton(BuyCancelSearchButton)
	U.SkinButton(BuyCancelAuctionButton)
	U.SkinButton(BuyScanButton)
	U.SkinNextPrevButton(BuyAdvancedButton)
	U.SkinNextPrevButton(SellRememberButton)
	U.SkinEditBox(SellStacks)
	U.SkinEditBox(SellSize)
	U.SkinEditBox(SellBidPriceGold)
	U.SkinEditBox(SellBidPriceSilver)
	U.SkinEditBox(SellBidPriceCopper)
	U.SkinEditBox(SellBuyoutPriceGold)
	U.SkinEditBox(SellBuyoutPriceSilver)
	U.SkinEditBox(SellBuyoutPriceCopper)
	U.SkinButton(SellCreateAuctionButton)
end
U.RegisterSkin(name,SkinAuctionLite,"AUCTION_HOUSE_SHOW")