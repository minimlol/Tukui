if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local c = U.c
local name = "BigBrotherSkin"
local function SkinBigBrother(self)
	BigBrother:ToggleBuffWindow()
	U.SkinFrame(BigBrother_BuffWindow)
	U.SkinCloseButton(BigBrother_BuffWindow.CloseButton)
	U.SkinButton(BigBrother_BuffWindow.LeftButton)
	BigBrother_BuffWindow.LeftButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
	BigBrother_BuffWindow.LeftButton.text:SetText("<")
	BigBrother_BuffWindow.LeftButton.text:SetPoint("CENTER", 1, 1 )
	U.SkinButton(BigBrother_BuffWindow.RightButton)
	BigBrother_BuffWindow.RightButton:FontString("text", c["media"].pixelfont, c["datatext"].fontsize, "MONOCHROMEOUTLINE")
	BigBrother_BuffWindow.RightButton.text:SetText(">")
	BigBrother_BuffWindow.RightButton.text:SetPoint("CENTER", 1, 1 )
	BigBrother:ToggleBuffWindow()
end

U.RegisterSkin(name,SkinBigBrother)