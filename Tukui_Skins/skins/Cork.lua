if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "CorkSkin"
local function SkinCork()
	U.SkinBackdropFrame(Corkboard, true)
	Corkboard:HookScript("OnUpdate", function(self) self:StripTextures() end)
end
U.RegisterSkin(name, SkinCork)