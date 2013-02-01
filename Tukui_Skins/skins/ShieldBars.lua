if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "ShieldBarsSkin"
local function SkinShieldBars()
	hooksecurefunc(ShieldBars, "DisplayShields", function() for i = 1, 20 do if _G["ShieldBarsStatusBar"..i.."Frame"] then U.SkinFrame(_G["ShieldBarsStatusBar"..i.."Frame"], false, true) end end end)
end
U.RegisterSkin(name, SkinShieldBars)	