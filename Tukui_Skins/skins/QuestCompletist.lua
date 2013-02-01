if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "QuestCompletistSkin"
local function SkinQuestCompletist(self)
	local tooltips = {
		"qcMapTooltip",
		"qcQuestInformationTooltip",
		"qcToastTooltip",
		"qcQuestReputationTooltip",
		"qcNewDataAlertTooltip",
		"qcMutuallyExclusiveAlertTooltip",
	}

	for _, object in pairs(tooltips) do
		if _G[object] then
			_G[object]:SetFrameStrata("DIALOG")
			U.SkinTooltip(_G[object])
		end
	end

	U.SkinFrame(qcQuestCompletistUI)
	qcQuestCompletistUI:Size(360,450)
	U.SkinEditBox(qcSearchBox)
	U.SkinButton(qcOptionsButton)
	U.SkinButton(qcCategoryDropdownButton)
	U.SkinCloseButton(qcXButton)
	U.SkinSlideBar(qcMenuSlider, 16)
	qcMenuSlider:Point("TOPLEFT", qcQuestCompletistUI, "TOPLEFT", 303, -90)
	qcMenuSlider:Height(256)
end

U.RegisterSkin(name,SkinQuestCompletist)