if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "AffDotsSkin"
local function SkinAffDots()
	U.SkinBackdropFrame(AffDotsTarget)
end
U.RegisterSkin(name, SkinAffDots)