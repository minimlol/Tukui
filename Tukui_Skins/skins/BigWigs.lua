if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "BigWigsSkin"
function AS:SkinBigWigs(event, addon)
	if event == "PLAYER_ENTERING_WORLD" then return end
	local buttonsize = 19
	local freebg = {}

	local createbg = function()
		local bg = CreateFrame("Frame")
		bg:SetTemplate("Transparent")
		return bg
	end

	local function freestyle(bar)
		local bg = bar:Get("bigwigs:Tukui:bg")
		if bg then
			bg:ClearAllPoints()
			bg:SetParent(UIParent)
			bg:Hide()
			freebg[#freebg + 1] = bg
		end
		local ibg = bar:Get("bigwigs:Tukui:ibg")
		if ibg then
			ibg:ClearAllPoints()
			ibg:SetParent(UIParent)
			ibg:Hide()
			freebg[#freebg + 1] = ibg
		end
		bar.candyBarBar.SetPoint = bar.candyBarBar.OldSetPoint
		bar.candyBarIconFrame.SetWidth = bar.candyBarIconFrame.OldSetWidth
		bar.SetScale = bar.OldSetScale
		bar.candyBarIconFrame:ClearAllPoints()
		bar.candyBarIconFrame:SetPoint("TOPLEFT")
		bar.candyBarIconFrame:SetPoint("BOTTOMLEFT")
		bar.candyBarIconFrame:SetTexCoord(0.07, 0.93, 0.07, 0.93)
		bar.candyBarBar:ClearAllPoints()
		bar.candyBarBar:SetPoint("TOPRIGHT")
		bar.candyBarBar:SetPoint("BOTTOMRIGHT")
		bar.candyBarBackground:SetAllPoints()
		bar.candyBarDuration:ClearAllPoints()
		bar.candyBarDuration:SetPoint("RIGHT", bar.candyBarBar, "RIGHT", -2, 0)
		bar.candyBarLabel:ClearAllPoints()
		bar.candyBarLabel:SetPoint("LEFT", bar.candyBarBar, "LEFT", 2, 0)
		bar.candyBarLabel:SetPoint("RIGHT", bar.candyBarBar, "RIGHT", -2, 0)
	end

	local applystyle = function(bar)
		bar:SetHeight(buttonsize)
		local bg = nil
		if #freebg > 0 then
			bg = table.remove(freebg)
		else
			bg = createbg()
		end
		bg:SetParent(bar)
		bg:ClearAllPoints()
		bg:Point("TOPLEFT", bar, "TOPLEFT", -2, 2)
		bg:Point("BOTTOMRIGHT", bar, "BOTTOMRIGHT", 2, -2)
		bg:SetFrameStrata("BACKGROUND")
		bg:Show()
		bar:Set("bigwigs:Tukui:bg", bg)
		local ibg = nil
		if bar.candyBarIconFrame:GetTexture() then
			if #freebg > 0 then
				ibg = table.remove(freebg)
			else
				ibg = createbg()
			end
			ibg:SetParent(bar)
			ibg:ClearAllPoints()
			ibg:Point("TOPLEFT", bar.candyBarIconFrame, "TOPLEFT", -2, 2)
			ibg:Point("BOTTOMRIGHT", bar.candyBarIconFrame, "BOTTOMRIGHT", 2, -2)
			ibg:SetFrameStrata("BACKGROUND")
			ibg:Show()
			bar:Set("bigwigs:Tukui:ibg", ibg)
		end
		bar.candyBarLabel:SetFont(AS.Font, 12, "OUTLINE")
		bar.candyBarLabel:SetShadowColor(0, 0, 0, 0)
		bar.candyBarLabel:SetJustifyH("LEFT")
		bar.candyBarLabel:ClearAllPoints()
		bar.candyBarLabel:Point("LEFT", bar, "LEFT", 4, 0)
		bar.candyBarDuration:SetFont(AS.Font, 12, "OUTLINE")
		bar.candyBarDuration:SetShadowColor(0, 0, 0, 0)
		bar.candyBarDuration:SetJustifyH("RIGHT")
		bar.candyBarDuration:ClearAllPoints()
		bar.candyBarDuration:Point("RIGHT", bar, "RIGHT", -4, 0)
		bar.candyBarBar:ClearAllPoints()
		bar.candyBarBar:SetAllPoints(bar)
		bar.candyBarBar.OldSetPoint = bar.candyBarBar.SetPoint
		bar.candyBarBar.SetPoint = AS.Noop
		bar.candyBarBar:SetStatusBarTexture(AS.NormTex)
		bar.candyBarBackground:SetTexture(unpack(AS.BackdropColor))
		bar.candyBarIconFrame:ClearAllPoints()
		bar.candyBarIconFrame:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -7, 0)
		bar.candyBarIconFrame:SetSize(buttonsize, buttonsize)
		bar.candyBarIconFrame.OldSetWidth = bar.candyBarIconFrame.SetWidth
		bar.candyBarIconFrame.SetWidth = AS.Noop
		bar.candyBarIconFrame:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	end

	local function RegisterStyle()
		local bars = BigWigs:GetPlugin("Bars", true)
		local prox = BigWigs:GetPlugin("Proximity", true)
		if bars then
			bars:RegisterBarStyle("Tukui", {
				apiVersion = 1,
				version = 1,
				GetSpacing = function(bar) return 7 end,
				ApplyStyle = applystyle,
				BarStopped = freestyle,
				GetStyleName = function() return "Tukui" end,
			})
		end
		if prox and BigWigs.pluginCore.modules.Bars.db.profile.barStyle == "Tukui" then
			hooksecurefunc(BigWigs.pluginCore.modules.Proximity, "RestyleWindow", function()
				BigWigsProximityAnchor:SetTemplate("Transparent")
			end)
		end
	end

	if addon == "BigWigs_Plugins" then
		RegisterStyle()
		local profile = BigWigs3DB["profileKeys"][AS.MyName.." - "..AS.MyRealm]
		local path = BigWigs3DB["namespaces"]["BigWigs_Plugins_Bars"]["profiles"][profile]
		path.texture = AS.NormTex
		path.barStyle = "Tukui"
		path.font = AS.Font
		path = BigWigs3DB["namespaces"]["BigWigs_Plugins_Proximity"]["profiles"][profile]
		path.font = AS.Font
		self:UnregisterEvent("ADDON_LOADED")
	end
end

AS:RegisterSkin(name, AS.SkinBigWigs, "ADDON_LOADED")