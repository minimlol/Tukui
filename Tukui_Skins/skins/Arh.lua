if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local c = U.c

local name = 'ArhSkin'
local function SkinArh(self,event)
	U.SkinFrame(Arh_MainFrame)
	U.SkinTooltip(Arh_Tooltip, true)
end

U.RegisterSkin(name,SkinArh)