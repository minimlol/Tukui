if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "WoWProSkin"
function AS:SkinWoWPro()
	AS:SkinFrame(Titlebar)
	AS:SkinBackdropFrame(WoWPro.MainFrame)
	AS:SkinTooltip(_G["Mouseover Note Tooltip"])
end

AS:RegisterSkin(name, AS.SkinWoWPro)