if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "TomTomSkin"
local function SkinTomTom()
	if TomTomBlock then U.SkinFrame(TomTomBlock) end
end
U.RegisterSkin(name, SkinTomTom)