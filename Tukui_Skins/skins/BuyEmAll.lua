if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "BuyEmAllSkin"
function AS:SkinBuyEmAll()
	AS:SkinFrame(BuyEmAllFrame)
	AS:SkinButton(BuyEmAllStackButton)
	AS:SkinButton(BuyEmAllMaxButton)
	AS:SkinButton(BuyEmAllCancelButton)
	AS:SkinButton(BuyEmAllOkayButton)
end

AS:RegisterSkin(name, AS.SkinBuyEmAll)