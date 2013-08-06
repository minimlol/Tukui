if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "SpySkin"
function AS:SkinSpy()
	AS:SkinFrame(Spy_MainWindow)
	AS:SkinFrame(Spy_AlertWindow)
	AS:SkinCloseButton(Spy_MainWindow.CloseButton)
	AS:Desaturate(Spy_MainWindow.ClearButton)
	AS:Desaturate(Spy_MainWindow.LeftButton)
	AS:Desaturate(Spy_MainWindow.RightButton)
	Spy_AlertWindow:Point("TOP", UIParent, "TOP", 0, -130)
end

AS:RegisterSkin(name, AS.SkinSpy)