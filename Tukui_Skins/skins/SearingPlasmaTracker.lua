if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "SearingPlasmaTrackerSkin"
local function SkinSearingPlasmaTracker(self)
	U.SkinFrame(SearingPlasmaTrackerFrame)
end

U.RegisterSkin(name,SkinSearingPlasmaTracker)