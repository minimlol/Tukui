if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "EavesDropSkin"
local function SkinEavesDrop()
	U.SkinFrame(EavesDropFrame)
	U.SkinFrame(EavesDropHistoryFrame)
	U.SkinTab(EavesDropTab)
	EavesDropTab.backdrop:Point("TOPLEFT", 0, -5)
	EavesDropTab.backdrop:Point("BOTTOMRIGHT", 0, 2)
	EavesDropTabText:ClearAllPoints()
	EavesDropTabText:SetPoint("CENTER", EavesDropTab, "CENTER", 0, -2)
	U.SkinButton(EavesDropHistoryFrameReset)
	U.SkinCloseButton(EavesDropHistoryFrameClose)
end
U.RegisterSkin(name, SkinEavesDrop)