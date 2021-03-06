if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = 'BagnonSkin'
function AS:SkinBagnon(event, addon)
	if event == "PLAYER_ENTERING_WORLD" then
		ToggleBackpack()
		AS:SkinFrame(BagnonFrameinventory)
		AS:SkinCloseButton(BagnonFrameinventoryCloseButton)
		ToggleBackpack()
	elseif event == "BANKFRAME_OPENED" then
		AS:SkinFrame(BagnonFramebank)
		AS:SkinCloseButton(BagnonFramebankCloseButton)
		AS:UnregisterEvent(name, event)
	elseif event == "GUILDBANKFRAME_OPENED" and addon == "Bagnon_GuildBank" then
		AS:SkinFrame(BagnonFrameguildbank)
		AS:SkinCloseButton(BagnonFrameguildbankCloseButton)
		AS:UnregisterEvent(name, event)
	elseif event == "VOID_STORAGE_OPEN" and addon == "Bagnon_VoidStorage" then
		AS:SkinFrame(BagnonFramevoidstorage)
		AS:SkinCloseButton(BagnonFramevoidstorageCloseButton)
		AS:UnregisterEvent(name, event)
	end
end

AS:RegisterSkin(name, AS.SkinBagnon, "ADDON_LOADED", "BANKFRAME_OPENED", "GUILDBANKFRAME_OPENED", "VOID_STORAGE_OPEN")