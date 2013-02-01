if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "AnalystSkin"
local function SkinAnalyst()
	U.SkinFrame(EconomyFrame)
	EconomyFrame:SetHeight(450)
	EconomyFrame:SetWidth(364)
	EconomyFrameTitleFrame:ClearAllPoints()
	EconomyFrameTitleFrame:SetPoint("TOP", EconomyFrame, "TOP", 0, -5)
	U.SkinCloseButton(EconomyFrameCloseButton)
	U.SkinFrame(EconomyFrameTopStats)
	U.SkinFrame(EconomyFrameLeftStats)
	U.SkinFrame(EconomyFrameRightStats)
	U.SkinDropDownBox(EconomyFramePeriodDropDown)
	U.SkinDropDownBox(EconomyFrameLeftStatsReportDropDown)
	U.SkinDropDownBox(EconomyFrameRightStatsReportDropDown)
	U.SkinCheckBox(EconomyFrameAllCharacters)
end
U.RegisterSkin(name, SkinAnalyst)