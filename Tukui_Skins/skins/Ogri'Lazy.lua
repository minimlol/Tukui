if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "OgriLazySkin"
local function SkinOgriLazy(self)
	U.SkinFrame(Relic_View)
	U.SkinCloseButton(Relic_ViewCloseButton)
end

U.RegisterSkin(name,SkinOgriLazy)
