if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "ShieldBarsSkin"
function AS:SkinShieldBars()
	hooksecurefunc(ShieldBars, "DisplayShields", function()
		local i = 1
		while _G["ShieldBarsStatusBar"..i.."Frame"] do
			AS:SkinFrame(_G["ShieldBarsStatusBar"..i.."Frame"], false, true)
			i = i + 1
		end
	end)
end

AS:RegisterSkin(name, AS.SkinShieldBars)	