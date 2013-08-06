if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "ArchySkin"
function AS:SkinArchy()
	local function SkinArchyArtifactFrame()
		AS:SkinFrame(ArchyArtifactFrame)

		if ArchyArtifactFrameSkillBar then
			ArchyArtifactFrameSkillBar.text:SetTextColor(1, 1, 1)
		end

		for i, child in pairs(ArchyArtifactFrame.children) do
			local containerFrame = _G['ArchyArtifactChildFrame'..i]
			local crest = _G['ArchyArtifactChildFrame'..i..'Crest']
			local icon = _G['ArchyArtifactChildFrame'..i..'Icon']
			local fragmentBar = _G['ArchyArtifactChildFrame'..i..'FragmentBar']
			local solveButton = _G['ArchyArtifactChildFrame'..i..'SolveButton']

			if icon then
				AS:SkinFrame(icon, false, true)
				icon:SetSize(solveButton:GetHeight(),solveButton:GetHeight())
				icon.texture:SetTexCoord(.08, .92, .08, .92)
				icon.texture:SetInside()
			end

			if solveButton then
				AS:SkinFrame(solveButton, false, true)
				solveButton:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
				solveButton:GetNormalTexture():SetInside()	
				solveButton:GetDisabledTexture():SetTexCoord(.08, .92, .08, .92)
				solveButton:GetDisabledTexture():SetInside()		
				solveButton:StyleButton()
			end

			if fragmentBar then
				AS:SkinStatusBar(fragmentBar)
				fragmentBar:SetPoint("TOPLEFT", icon, "TOPRIGHT", 7, -2)
			end
		end
	end

	hooksecurefunc(Archy, 'RefreshRacesDisplay', SkinArchyArtifactFrame)
	hooksecurefunc(Archy, "UpdateRacesFrame", SkinArchyArtifactFrame)

	Archy:UpdateRacesFrame()
	Archy:RefreshRacesDisplay()

	local function SkinArchyDigSiteFrame()
		AS:SkinFrame(ArchyDigSiteFrame)
	end

	hooksecurefunc(Archy, "UpdateDigSiteFrame", SkinArchyDigSiteFrame)

	if ArchyArtifactFrameSkillBar then
		AS:SkinStatusBar(ArchyArtifactFrameSkillBar)	
	end

	AS:SkinButton(ArchyDistanceIndicatorFrameSurveyButton)
	ArchyDistanceIndicatorFrameSurveyButtonIcon:SetDrawLayer("OVERLAY")
	AS:SkinButton(ArchyDistanceIndicatorFrameCrateButton)
 	ArchyDistanceIndicatorFrameCrateButtonIcon:SetDrawLayer("OVERLAY")
 	if ArchyDistanceIndicatorFrameLorItemButton then
		AS:SkinButton(ArchyDistanceIndicatorFrameLorItemButton)
		ArchyDistanceIndicatorFrameLorItemButtonIcon:SetDrawLayer("OVERLAY")
	end
end

AS:RegisterSkin(name, AS.SkinArchy)