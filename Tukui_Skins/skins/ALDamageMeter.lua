if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "ALDamageMeterSkin"
local function SkinALDamageMeter()
	U.SkinFrame(alDamageMeterFrame.bg)
end
U.RegisterSkin(name, SkinALDamageMeter)