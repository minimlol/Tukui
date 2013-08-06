if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "ReforgeradeSkin"
function AS:SkinReforgerade()
	AS:SkinFrame(ReforgeradeInputFrame.frame)
	AS:SkinButton(ReforgeCompareButton)
	AS:SkinButton(ReforgeItButton)
	AS:SkinCloseButton(ReforgeradeCloseButton)
	AS:SkinScrollBar(ExportScrollScrollBar)
	ExportScroll:CreateBackdrop()
	ExportScrollScrollBar:SetPoint("TOPLEFT", ExportScroll, "TOPRIGHT", 4, -15)
	AS:SkinTooltip(ReforgeradeTooltip)
end

AS:RegisterSkin(name, AS.SkinReforgerade)