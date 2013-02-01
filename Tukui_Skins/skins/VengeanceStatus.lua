if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "VengeanceStatusSkin"
local function SkinVengeanceStatus()
	U.SkinStatusBar(VengeanceStatus_StatusBar)
end
U.RegisterSkin(name, SkinVengeanceStatus)