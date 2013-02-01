if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "EnergyWatchSkin"
local function SkinEnergyWatch(self)
	local s = U.s
	local c = U.c
	EnergyWatchBar:StripTextures(True)
	U.SkinStatusBar(EnergyWatchStatusBar)
end

U.RegisterSkin(name,SkinEnergyWatch)

