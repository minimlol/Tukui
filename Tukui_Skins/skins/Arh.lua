if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = 'ArhSkin'
function AS:SkinArh()
	AS:SkinFrame(Arh_MainFrame)
	AS:SkinTooltip(Arh_Tooltip, true)
end

AS:RegisterSkin(name, AS.SkinArh)