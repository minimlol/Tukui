if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "MiscFixes"
local function MiscFixes(self, event)

	if IsAddOnLoaded("PetJournalEnhanced") and IsAddOnLoaded("Blizzard_PetJournal") then PetJournal:HookScript("OnShow", function() PJEUniquePetCount:StripTextures() end) end
	
	if IsAddOnLoaded("acb_CastBar") then
		U.SkinBackdropFrame(AzCastBarPluginPlayer)
		U.SkinBackdropFrame(AzCastBarPluginTarget)
		U.SkinBackdropFrame(AzCastBarPluginFocus)
		U.SkinBackdropFrame(AzCastBarPluginMirror)
		U.SkinBackdropFrame(AzCastBarPluginPet)
	end

	if IsAddOnLoaded("DoubleWideTradeSkills") then
		TradeSkillListScrollFrame:StripTextures()
		U.SkinFrame(TradeSkillFrame)
		U.SkinStatusBar(TradeSkillRankFrame)
	end
	
	--TrainAll
	if IsAddOnLoaded("Blizzard_TrainerUI") then
		ClassTrainerFrame:HookScript("OnShow", function()
			if ClassTrainerTrainAllButton then
				U.SkinFrame(ClassTrainerTrainAllButton,"Default")
				U.SkinFrame(ClassTrainerTrainButton,"Default")
			end
		end)
	end
end

U.RegisterSkin(name,MiscFixes, "ADDON_LOADED")