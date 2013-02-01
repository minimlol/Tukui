if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "SymbiosisTipSkin"
local function SkinSymbiosisTip()
	U.SkinTooltip(SymbiosisTip)
end
U.RegisterSkin(name, SkinSymbiosisTip)