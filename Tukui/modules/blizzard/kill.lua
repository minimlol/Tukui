local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
-- here we kill all shit stuff on default UI that we don't need!

local Kill = CreateFrame("Frame")
Kill:RegisterEvent("ADDON_LOADED")
Kill:SetScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_AchievementUI" then
		if C.tooltip.enable then
			hooksecurefunc("AchievementFrameCategories_DisplayButton", function(button) button.showTooltipFunc = nil end)
		end
	end
	
	if addon == "Tukui_Raid" or addon == "Tukui_Raid_Healing" then
		CompactRaidFrameManager:SetScale(0.000001)
		CompactRaidFrameContainer:SetScale(0.000001)		
	end
	
	if addon ~= "Tukui" then return end
	
	StreamingIcon:Kill()
	Advanced_UseUIScale:Kill()
	Advanced_UIScaleSlider:Kill()
	PartyMemberBackground:Kill()
	TutorialFrameAlertButton:Kill()
	
	if C.auras.player or C.unitframes.playerauras then
		BuffFrame:Kill()
		TemporaryEnchantFrame:Kill()
		ConsolidatedBuffs:Kill()
		-- kill the module in default interface option
		InterfaceOptionsFrameCategoriesButton12:SetScale(0.00001)
		InterfaceOptionsFrameCategoriesButton12:SetAlpha(0)	
	end
	
	InterfaceOptionsUnitFramePanelPartyBackground:Kill()

	-- make sure boss or arena frame is always disabled when running tukui
	SetCVar("showArenaEnemyFrames", 0)
	
	if C.arena.unitframes then
		InterfaceOptionsUnitFramePanelArenaEnemyFrames:Kill()
		InterfaceOptionsUnitFramePanelArenaEnemyCastBar:Kill()
		InterfaceOptionsUnitFramePanelArenaEnemyPets:Kill()
	end
	
	if C.chat.enable then
		SetCVar("WholeChatWindowClickable", 0)
		SetCVar("ConversationMode", "inline")
		InterfaceOptionsSocialPanelWholeChatWindowClickable:Kill()
		InterfaceOptionsSocialPanelConversationMode:Kill()
	end
	
	if C.unitframes.enable then
		PlayerFrame:Kill() -- Just to be sure we are safe
		InterfaceOptionsFrameCategoriesButton9:SetScale(0.00001)
		InterfaceOptionsFrameCategoriesButton9:SetAlpha(0)	
	end
	
	if C.actionbar.enable then
		InterfaceOptionsActionBarsPanelBottomLeft:Kill()
		InterfaceOptionsActionBarsPanelBottomRight:Kill()
		InterfaceOptionsActionBarsPanelRight:Kill()
		InterfaceOptionsActionBarsPanelRightTwo:Kill()
		InterfaceOptionsActionBarsPanelAlwaysShowActionBars:Kill()
	end
	
	if C["nameplate"].enable == true and C["nameplate"].enhancethreat == true then
		InterfaceOptionsDisplayPanelAggroWarningDisplay:Kill()
	end

	-- I'm seriously tired of this Blizzard taint, little hack, we don't care about SearchLFGLeave()
	-- This taint is blaming every addon even if we are not calling SearchLFGLeave() function in our addon ...
	--[[ TAINT LOG
			10/18 21:46:01.774  An action was blocked because of taint from Tukui - SearchLFGLeave()
			10/18 21:46:01.774      Interface\FrameXML\LFRFrame.lua:395 LFRBrowseFrame_OnUpdateAlways()
			10/18 21:46:01.774      UIParent:OnUpdate()
	--]]
	local TaintFix = CreateFrame("Frame")
	TaintFix:SetScript("OnUpdate", function(self, elapsed)
		if LFRBrowseFrame.timeToClear then
			LFRBrowseFrame.timeToClear = nil 
		end 
	end)
end)