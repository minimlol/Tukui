if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "BloodShieldTrackerSkin"
local function SkinBloodShieldTracker()
	if not IsAddOnLoaded("Tukui") then
		U.SkinStatusBar(BloodShieldTracker_EstimateBar)
		U.SkinStatusBar(BloodShieldTracker_HealthBar)
		U.SkinStatusBar(BloodShieldTracker_ShieldBar)
		U.SkinStatusBar(BloodShieldTracker_EstimateBar)
		U.SkinStatusBar(BloodShieldTracker_BloodChargeBar)
		U.SkinStatusBar(BloodShieldTracker_TotalAbsorbsBar)
		U.SkinStatusBar(BloodShieldTracker_PWSBar)
		U.SkinStatusBar(BloodShieldTracker_IllumBar)
		U.SkinStatusBar(BloodShieldTracker_AMSBar)
		U.SkinStatusBar(BloodShieldTracker_PurgatoryBar)
	end
end
U.RegisterSkin(name, SkinBloodShieldTracker)
	