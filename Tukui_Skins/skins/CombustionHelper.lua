if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local c = U.c
local name = "CombustionHelperSkin"
local function SkinCombustionHelper(self)
		U.SkinBackdropFrame(CombustionFrame, true)
		CombustionFrame:HookScript("OnUpdate", function(self) self:StripTextures() end)
		CombuMBTrackerBorderFrame:Kill()
		CombuMBTrackerFrame:HookScript("OnUpdate", function(self) U.SkinFrame(self) self:SetPoint("BOTTOM", CombustionFrame, "TOP", 0, 4) end)
end

U.RegisterSkin(name,SkinCombustionHelper)