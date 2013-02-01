if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "AraBrokerTradeskillsSkin"
local function SkinAraTradeskills(self)
	AraSkills:HookScript("OnUpdate", function(self) U.SkinFrame(self) end)
end

U.RegisterSkin(name,SkinAraTradeskills)