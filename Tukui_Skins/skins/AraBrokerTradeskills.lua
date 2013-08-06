if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "AraBrokerTradeskillsSkin"
function AS:SkinAraTradeskills()
	AraSkills:HookScript("OnUpdate", function(f) AS:SkinFrame(f) end)
end

AS:RegisterSkin(name, AS.SkinAraTradeskills)