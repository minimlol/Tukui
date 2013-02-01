if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "InspectEquipSkin"
local function SkinInspectEquip()
	U.SkinFrame(InspectEquip_InfoWindow)
	U.SkinCloseButton(InspectEquip_InfoWindow_CloseButton)
end
U.RegisterSkin(name, SkinInspectEquip)