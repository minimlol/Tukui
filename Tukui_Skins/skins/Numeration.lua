if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "NumerationSkin"
function AS:SkinNumeration()
	AS:SkinFrame(NumerationFrame)
end

AS:RegisterSkin(name, AS.SkinNumeration)