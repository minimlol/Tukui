if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "WoWProSkin"

local function SkinWoWPro(self)
	U.SkinFrame(Titlebar)
	U.SkinBackdropFrame(WoWPro.MainFrame)
	U.SkinTooltip(_G["Mouseover Note Tooltip"])
end

U.RegisterSkin(name,SkinWoWPro)