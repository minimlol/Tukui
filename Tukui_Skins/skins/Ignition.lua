if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "IgnitionSkin"
local function SkinIgnition(self)
        ignTimeBar:StripTextures(true)
 
        U.SkinBackdropFrame(uiIgnitionFrame, true)
end
U.RegisterSkin(name,SkinIgnition)
