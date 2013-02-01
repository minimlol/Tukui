if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "ReforgeradeSkin"

local function SkinReforgerade(self)
	U.SkinFrame(ReforgeradeInputFrame.frame)
	U.SkinButton(ReforgeCompareButton)
	U.SkinButton(ReforgeItButton)
	U.SkinCloseButton(ReforgeradeCloseButton)
	U.SkinScrollBar(ExportScrollScrollBar)
	ExportScroll:CreateBackdrop()
	ExportScrollScrollBar:SetPoint("TOPLEFT", ExportScroll, "TOPRIGHT", 4, -15)
	U.SkinTooltip(ReforgeradeTooltip)
end

U.RegisterSkin(name,SkinReforgerade)