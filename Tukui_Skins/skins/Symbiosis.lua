if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "SymbiosisTipSkin"
function AS:SkinSymbiosisTip()
	AS:SkinTooltip(SymbiosisTip)
end

AS:RegisterSkin(name, AS.SkinSymbiosisTip)