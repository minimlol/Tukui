if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = 'xMerchantSkin'
function AS:SkinxMerchant()
	AS:SkinCheckBox(NuuhMerchantFrameTooltipSearching)
	AS:SkinFrameD(NuuhMerchantFrameSearch)
	AS:SkinScrollBar(NuuhMerchantScrollFrameScrollBar)
end

AS:RegisterSkin(name, AS.SkinxMerchant)