if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "SpineCounterSkin"
local function SkinSpineCounter(self)
	U.SkinFrame(SCOutput)
end
U.RegisterSkin(name,SkinSpineCounter)