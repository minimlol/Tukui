if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "ALDamageMeterSkin"
function AS:SkinALDamageMeter()
	AS:SkinFrame(alDamageMeterFrame.bg)
end

AS:RegisterSkin(name, AS.SkinALDamageMeter)