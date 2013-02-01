if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "NumerationSkin"
local function SkinNumeration()
	U.SkinFrame(NumerationFrame)
end
U.RegisterSkin(name, SkinNumeration)