if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "AffDotsSkin"
function AS:SkinAffDots()
	AS:SkinBackdropFrame(AffDotsTarget)
end

AS:RegisterSkin(name, AS.SkinAffDots)