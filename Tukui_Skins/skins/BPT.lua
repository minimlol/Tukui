if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "BPTSkin"
function AS:SkinBPT()
	if AS.MyClass ~= "DRUID" then return end
	BalancePowerTracker_Options.global.enabled = true
	BalancePowerTracker.CheckAll()
	AS:SkinFrame(BalancePowerTracker_Eclipse_Bar_Frame, false, true)
	AS:SkinFrame(BalancePowerTracker_SolarEclipseIcon, false, true)
	AS:SkinFrame(BalancePowerTracker_LunarEclipseIcon, false, true)
	hooksecurefunc(BalancePowerTracker.modules.eclipse_bar, "ReDraw", function() BalancePowerTracker_Eclipse_Bar_Frame:SetTemplate("Transparent") end)
end

AS:RegisterSkin(name, AS.SkinBPT)