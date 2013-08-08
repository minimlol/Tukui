if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "InboxMailBagSkin"
function AS:SkinInboxMailBag(event)
	if event == "PLAYER_ENTERING_WORLD" then return end
	InboxMailbagFrame:StripTextures()
	AS:SkinEditBox(InboxMailbagFrameItemSearchBox)
	AS:SkinCheckBox(InboxMailbagFrameItemGroupStacksCheckBox)
	AS:SkinTab(MailFrameTab3)
	for i = 1, 99 do
		local name = _G["InboxMailbagFrameItem"..i]
		if not name then return end
		AS:SkinIconButton(name, true, true)
	end
	AS:UnregisterEvent(name, event)
end

AS:RegisterSkin(name, AS.SkinInboxMailBag, "MAIL_SHOW")