local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if C["chat"].enable ~= true then return end

local gsub = gsub
local FindURL = function(self, event, msg, ...)
	local newMsg, found = gsub(msg, "http://[%a%-%d]*%.?[%a%-%d]+%.%a%a%a?/%S+", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "http://[%a%-%d]*%.?[%a%-%d]+%.[%a%-%d]+%.%a%a%a?/%S+", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "http://[%a%-%d]*%.?[%a%-%d]+%.%a%a%a?/", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "http://[%a%-%d]*%.?[%a%-%d]+%.[%a%-%d]+%.%a%a%a?/", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "http://[%a%-%d]*%.?[%a%-%d]+%.%a%a%a?$", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "http://[%a%-%d]*%.?[%a%-%d]+%.[%a%-%d]+%.%a%a%a?$", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "(http://[%a%-%d]*%.?[%a%-%d]+%.%a%a%a?) ", "|cff16FF5D|Hurl:%1|h[%1]|h|r ")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "(http://[%a%-%d]*%.?[%a%-%d]+%.[%a%-%d]+%.%a%a%a?) ", "|cff16FF5D|Hurl:%1|h[%1]|h|r ")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "[%a%-%d]*%.?[%a%-%d]+%.%a%a%a?/%S+", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "[%a%-%d]*%.?[%a%-%d]+%.%a%a%a?/", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "[%a%-%d]*%.?[%a%-%d]+%.%a%a%a?$", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "([%a%-%d]*%.?[%a%-%d]+%.%a%a%a?) ", "|cff16FF5D|Hurl:%1|h[%1]|h|r ")
	if found > 0 then return false, newMsg, ... end

	newMsg, found = gsub(msg, "%d+%.%d+%.%d+%.%d+:?%d*/?%S*", "|cff16FF5D|Hurl:%1|h[%1]|h|r")
	if found > 0 then return false, newMsg, ... end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", FindURL)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_CONVERSATION", FindURL)

local currentLink = nil
local ChatFrame_OnHyperlinkShow_Original = ChatFrame_OnHyperlinkShow
ChatFrame_OnHyperlinkShow = function(self, link, ...)
	if (link):sub(1, 3) == "url" then
		currentLink = (link):sub(5)
		StaticPopup_Show("TukuiChatCopyUrlPopup")
		return
	end
	ChatFrame_OnHyperlinkShow_Original(self, link, ...)
end

StaticPopupDialogs["TukuiChatCopyUrlPopup"] = {
	text = "URL",
	button1 = CLOSE,
	hasEditBox = 1,
	editBoxWidth = 350,
	OnShow = function(frame)
		frame.editBox:SetText(currentLink)
		frame.editBox:SetFocus()
		frame.editBox:HighlightText(0)
		currentLink = nil
	end,
	EditBoxOnEscapePressed = function(frame) frame:GetParent():Hide() end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
	preferredIndex = 3,
}