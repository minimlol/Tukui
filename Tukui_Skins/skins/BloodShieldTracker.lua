if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "BloodShieldTrackerSkin"
function AS:SkinBloodShieldTracker()
	if not IsAddOnLoaded("Tukui") then
		AS:SkinStatusBar(BloodShieldTracker_EstimateBar)
		AS:SkinStatusBar(BloodShieldTracker_HealthBar)
		AS:SkinStatusBar(BloodShieldTracker_ShieldBar)
		AS:SkinStatusBar(BloodShieldTracker_EstimateBar)
		AS:SkinStatusBar(BloodShieldTracker_BloodChargeBar)
		AS:SkinStatusBar(BloodShieldTracker_TotalAbsorbsBar)
		AS:SkinStatusBar(BloodShieldTracker_PWSBar)
		AS:SkinStatusBar(BloodShieldTracker_IllumBar)
		AS:SkinStatusBar(BloodShieldTracker_AMSBar)
		AS:SkinStatusBar(BloodShieldTracker_PurgatoryBar)
	end
end

AS:RegisterSkin(name, AS.SkinBloodShieldTracker)