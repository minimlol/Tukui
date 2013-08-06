if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local A, C, L, G = unpack(Tukui or AsphyxiaUI or DuffedUI)
local AddOnName, Engine = ...
local AddOn = {}
AddOn.FrameLocks = {}

Engine[1] = AddOn
UISkins = Engine

if Tukui and tonumber(GetAddOnMetadata('Tukui', 'Version')) >= 16.00 then
	AddOn.L = L
	AddOn.Version = GetAddOnMetadata(AddOnName, "Version")
	AddOn.Title = select(2, GetAddOnInfo(AddOnName))
	AddOn.Blank = C["Media"].Blank
	AddOn.NormTex = C["Media"].Normal
	AddOn.Font = C["Media"].Font
	AddOn.UFFont = C["Media"].AltFont
	AddOn.PixelFont = C["Media"].PixelFont
	AddOn.ActionBarFont = C["Media"].ActionBarFont
	AddOn.UIScale = C["General"].UIScale
	AddOn.MyClass = select(2, UnitClass("player"))
	AddOn.MyName = UnitName("player")
	AddOn.MyRealm = GetCVar("realmName")
	AddOn.Noop = function() return end
	AddOn.DataTextFontSize = C["DataText"] and C["DataText"].FontSize or 12
	AddOn.BackdropColor = C["Media"].BackdropColor
	AddOn.BorderColor = C["Media"].BorderColor
	AddOn.Mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/AddOn.UIScale
	AddOn.DataTexts = A["DataTexts"]

	AddOn.InfoLeft = A.Panels.DataTextLeft
	AddOn.InfoRight = A.Panels.DataTextRight
	AddOn.ChatBackgroundRight = A.Panels.RightChatBackground
	AddOn.ChatBackgroundLeft = A.Panels.LeftChatBackground
	AddOn.TabsRightBackground = A.Panels.RightChatTabsBackground
	AddOn.TabsLeftBackground = A.Panels.LeftChatTabsBackground
	AddOn.Minimap = A.Minimap
	AddOn.TooltipEnable = C["Tooltips"]["Enable"]
	AddOn.ActionBar1 = A.ActionBar1
	AddOn.ActionBar2 = A.ActionBar2
	AddOn.ActionBar3 = A.ActionBar3
	AddOn.ActionBar4 = A.ActionBar4
else
	AddOn.L = L
	AddOn.Version = GetAddOnMetadata(AddOnName, "Version")
	AddOn.Title = select(2, GetAddOnInfo(AddOnName))
	AddOn.Blank = C["media"].blank
	AddOn.NormTex = C["media"].normTex
	AddOn.Font = C["media"].font
	AddOn.UFFont = C["media"].uffont
	AddOn.PixelFont = C["media"].pixelfont
	AddOn.ActionBarFont = C["media"].font
	AddOn.UIScale = C["general"].uiscale
	AddOn.MyClass = select(2, UnitClass("player"))
	AddOn.MyName = UnitName("player")
	AddOn.MyRealm = GetCVar("realmName")
	AddOn.Noop = function() return end
	AddOn.DataTextFontSize = C["datatext"].fontsize
	AddOn.BackdropColor = C["media"].backdropcolor
	AddOn.BorderColor = C["media"].bordercolor
	AddOn.Mult = 768/string.match(GetCVar("gxResolution"), "%d+x(%d+)")/AddOn.UIScale
	AddOn.DataTexts = A["DataTexts"]

	AddOn.InfoLeft = G.Panels.DataTextLeft
	AddOn.InfoRight = G.Panels.DataTextRight
	AddOn.ChatBackgroundRight = G.Panels.RightChatBackground
	AddOn.ChatBackgroundLeft = G.Panels.LeftChatBackground
	AddOn.TabsRightBackground = G.Panels.RightChatTabsBackground
	AddOn.TabsLeftBackground = G.Panels.LeftChatTabsBackground
	AddOn.Minimap = G.Maps.Minimap
	AddOn.TooltipEnable = C["tooltip"]["enable"]
	AddOn.ActionBar1 = G.ActionBars.Bar1
	AddOn.ActionBar2 = G.ActionBars.Bar2
	AddOn.ActionBar3 = G.ActionBars.Bar3
	AddOn.ActionBar4 = G.ActionBars.Bar4
end