if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = 'tComboSkin'
local function SkintCombo(self, event)
		if tComboPoints then
			U.SkinFrame(tComboPoints)
		end
		if tComboEnergyBar then
			U.SkinFrame(tComboEnergyBar)
		end
end

U.RegisterSkin(name,SkintCombo,"ADDON_LOADED","PLAYER_REGEN_ENABLED","PLAYER_REGEN_DISABLED")