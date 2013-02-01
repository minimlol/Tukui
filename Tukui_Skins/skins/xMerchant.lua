if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = 'xMerchantSkin'
local function SkinxMerchant(self)

	U.SkinCheckBox(NuuhMerchantFrameTooltipSearching)
	U.SkinFrameD(NuuhMerchantFrameSearch)
	U.SkinScrollBar(NuuhMerchantScrollFrameScrollBar)

end

U.RegisterSkin(name, SkinxMerchant)