if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "RecountSkin"
function AS:SkinRecount()
	local Recount = _G.Recount	
	local function SkinFrame(frame)
		frame.bgMain = CreateFrame("Frame", nil, frame)
		AS:SkinFrame(frame.bgMain,"Default")
		frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
		frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
		frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -7)
		frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
		frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -9)
		frame:SetBackdrop(nil)
		frame.TitleBackground = CreateFrame("Frame", nil, frame.bgMain)
		frame.TitleBackground:SetPoint("TOP", 0)
		frame.TitleBackground:SetPoint("LEFT", 0)
		frame.TitleBackground:SetPoint("RIGHT", 0)
		frame.TitleBackground:SetHeight(24)
		AS:SkinFrame(frame.TitleBackground, "Default")
		frame.Title:SetParent(frame.TitleBackground)
		frame.Title:ClearAllPoints()
		frame.Title:SetPoint("LEFT", 4, 0)
		frame.CloseButton:SetNormalTexture("")
		frame.CloseButton:SetPushedTexture("")
		frame.CloseButton:SetHighlightTexture("")
		frame.CloseButton:SetSize(16, 16)
		frame.CloseButton.t = frame.CloseButton:CreateFontString(nil, "OVERLAY")
		frame.CloseButton.t:SetFont(AS.PixelFont, AS.DataTextFontSize, "OUTLINE")
		frame.CloseButton.t:SetPoint("CENTER", 1, 1)
		frame.CloseButton.t:SetText("X")
	end

	local function SkinMainFrame(frame)
		frame.bgMain = CreateFrame("Frame", nil, frame)
		AS:SkinFrame(frame.bgMain,"Default")
		frame.bgMain:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
		frame.bgMain:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
		frame.bgMain:SetPoint("TOP", frame, "TOP", 0, -7)
		frame.bgMain:SetFrameLevel(frame:GetFrameLevel())
		if not AS:CheckOption("RecountBackdrop") then frame.bgMain:Hide() end
		frame.CloseButton:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -9)
		frame:SetBackdrop(nil)
		frame.TitleBackground = CreateFrame("Frame", nil, frame)
		frame.TitleBackground:SetPoint("TOP", frame, "TOP", 0, -7)
		frame.TitleBackground:SetPoint("LEFT", 0)
		frame.TitleBackground:SetPoint("RIGHT", 0)
		frame.TitleBackground:SetHeight(24)
		AS:SkinFrame(frame.TitleBackground,"Default")
		frame.Title:SetParent(frame.TitleBackground)
		frame.Title:ClearAllPoints()
		frame.Title:SetPoint("LEFT", 4, 0)
		frame.CloseButton:SetNormalTexture("")
		frame.CloseButton:SetPushedTexture("")
		frame.CloseButton:SetHighlightTexture("")
		frame.CloseButton:SetSize(16, 16)
		frame.CloseButton.t = frame.CloseButton:CreateFontString(nil, "OVERLAY")
		frame.CloseButton.t:SetFont(AS.PixelFont, AS.DataTextFontSize, "OUTLINE")
		frame.CloseButton.t:SetPoint("CENTER", 1, 1)
		frame.CloseButton.t:SetText("X")
	end

	Recount.UpdateBarTextures = function(self)
		for k, v in pairs(Recount.MainWindow.Rows) do
			v.StatusBar:SetStatusBarTexture(AS.NormTex)
			v.StatusBar:GetStatusBarTexture():SetHorizTile(false)
			v.StatusBar:GetStatusBarTexture():SetVertTile(false)
			v.LeftText:SetPoint("LEFT", 4, 0)
			v.RightText:SetPoint("RIGHT", -4, 0)
		end
	end
	Recount.SetBarTextures = Recount.UpdateBarTextures

	Recount.SetupBar_ = Recount.SetupBar
	Recount.SetupBar = function(self, bar)
		self:SetupBar_(bar)
		bar.StatusBar:SetStatusBarTexture(AS.NormTex)
	end

	Recount.CreateFrame_ = Recount.CreateFrame
	Recount.CreateFrame = function(self, Name, Title, Height, Width, ShowFunc, HideFunc)
		local frame = self:CreateFrame_(Name, Title, Height, Width, ShowFunc, HideFunc)
		SkinFrame(frame)
		return frame
	end

	if Recount.MainWindow then SkinMainFrame(Recount.MainWindow) Recount.MainWindow:SetFrameStrata("MEDIUM") end
	if Recount.ConfigWindow then SkinFrame(Recount.ConfigWindow) end
	if Recount.GraphWindow then SkinFrame(Recount.GraphWindow) end
	if Recount.DetailWindow then SkinFrame(Recount.DetailWindow) end
	if Recount.ResetFrame then SkinFrame(Recount.ResetFrame) end
	if _G["Recount_Realtime_!RAID_DAMAGE"] then SkinFrame(_G["Recount_Realtime_!RAID_DAMAGE"].Window) end
	if _G["Recount_Realtime_!RAID_HEALING"] then SkinFrame(_G["Recount_Realtime_!RAID_HEALING"].Window) end
	if _G["Recount_Realtime_!RAID_HEALINGTAKEN"] then SkinFrame(_G["Recount_Realtime_!RAID_HEALINGTAKEN"].Window) end
	if _G["Recount_Realtime_!RAID_DAMAGETAKEN"] then SkinFrame(_G["Recount_Realtime_!RAID_DAMAGETAKEN"].Window) end
	if _G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"] then SkinFrame(_G["Recount_Realtime_Bandwidth Available_AVAILABLE_BANDWIDTH"].Window) end
	if _G["Recount_Realtime_FPS_FPS"] then SkinFrame(_G["Recount_Realtime_FPS_FPS"].Window) end
	if _G["Recount_Realtime_Latency_LAG"] then SkinFrame(_G["Recount_Realtime_Latency_LAG"].Window) end
	if _G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"] then SkinFrame(_G["Recount_Realtime_Downstream Traffic_DOWN_TRAFFIC"].Window) end
	if _G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"] then SkinFrame(_G["Recount_Realtime_Upstream Traffic_UP_TRAFFIC"].Window) end

	Recount:UpdateBarTextures()

	AS:SkinScrollBar(Recount_MainWindow_ScrollBarScrollBar)
	hooksecurefunc(Recount,"RefreshMainWindow",function(self,datarefresh)
	 	if not Recount.db.profile.MainWindow.ShowScrollbar then
			Recount_MainWindow_ScrollBarScrollBar:Hide()
		else
			Recount_MainWindow_ScrollBarScrollBar:Show()
		end
	end)

	Recount.MainWindow.FileButton:HookScript("OnClick", function(self) if LibDropdownFrame0 then LibDropdownFrame0:SetTemplate() end end)

	Recount.MainWindow.CloseButton:ClearAllPoints()
	Recount.MainWindow.CloseButton:Point("TOPRIGHT", Recount.MainWindow.TitleBackground, "TOPRIGHT", -3, -3)
	AS:SkinFrame(Recount.MainWindow.CloseButton)

	AS:SkinFrame(Recount.MainWindow.RightButton)
	Recount.MainWindow.RightButton:SetNormalTexture("")
	Recount.MainWindow.RightButton:SetPushedTexture("")	
	Recount.MainWindow.RightButton:SetHighlightTexture("")
	Recount.MainWindow.RightButton:SetSize(16, 16)
	Recount.MainWindow.RightButton:FontString("text", AS.PixelFont, AS.DataTextFontSize) --"MONOCHROMEOUTLINE"
	Recount.MainWindow.RightButton.text:SetText(">")
	Recount.MainWindow.RightButton.text:SetPoint("CENTER", 1, 1 )
	Recount.MainWindow.RightButton:ClearAllPoints()
	Recount.MainWindow.RightButton:SetPoint("RIGHT", Recount.MainWindow.CloseButton, "LEFT", -2, 0 )

	AS:SkinFrame(Recount.MainWindow.LeftButton)
	Recount.MainWindow.LeftButton:SetNormalTexture("")
	Recount.MainWindow.LeftButton:SetPushedTexture("")	
	Recount.MainWindow.LeftButton:SetHighlightTexture("")
	Recount.MainWindow.LeftButton:SetSize(16, 16)
	Recount.MainWindow.LeftButton:FontString("text", AS.PixelFont, AS.DataTextFontSize) --"MONOCHROMEOUTLINE"
	Recount.MainWindow.LeftButton.text:SetText("<")
	Recount.MainWindow.LeftButton.text:SetPoint("CENTER", 1, 1 )
	Recount.MainWindow.LeftButton:SetPoint("RIGHT", Recount.MainWindow.RightButton, "LEFT", -2, 0)

	AS:SkinFrame(Recount.MainWindow.ResetButton)
	Recount.MainWindow.ResetButton:SetNormalTexture("")
	Recount.MainWindow.ResetButton:SetPushedTexture("")	
	Recount.MainWindow.ResetButton:SetHighlightTexture("")
	Recount.MainWindow.ResetButton:FontString("text", AS.PixelFont, AS.DataTextFontSize) --"MONOCHROMEOUTLINE"
	Recount.MainWindow.ResetButton.text:SetText("R")
	Recount.MainWindow.ResetButton.text:SetPoint("CENTER", 1, 1 )
	Recount.MainWindow.ResetButton:SetPoint("RIGHT", Recount.MainWindow.LeftButton, "LEFT", -2, 0)

	AS:SkinFrame(Recount.MainWindow.FileButton)
	Recount.MainWindow.FileButton:SetNormalTexture("")
	Recount.MainWindow.FileButton:SetPushedTexture("")	
	Recount.MainWindow.FileButton:SetHighlightTexture("")
	Recount.MainWindow.FileButton:FontString("text", AS.PixelFont, AS.DataTextFontSize) --"MONOCHROMEOUTLINE"
	Recount.MainWindow.FileButton.text:SetText("F")
	Recount.MainWindow.FileButton.text:SetPoint("CENTER", 1, 1)
	Recount.MainWindow.FileButton:SetPoint("RIGHT", Recount.MainWindow.ResetButton, "LEFT", -2, 0)

	AS:SkinFrame(Recount.MainWindow.ConfigButton)
	Recount.MainWindow.ConfigButton:SetNormalTexture("")
	Recount.MainWindow.ConfigButton:SetPushedTexture("")	
	Recount.MainWindow.ConfigButton:SetHighlightTexture("")
	Recount.MainWindow.ConfigButton:FontString("text", AS.PixelFont, AS.DataTextFontSize) --"MONOCHROMEOUTLINE"
	Recount.MainWindow.ConfigButton.text:SetText("C")
	Recount.MainWindow.ConfigButton.text:SetPoint("CENTER", 1, 1)
	Recount.MainWindow.ConfigButton:SetPoint("RIGHT", Recount.MainWindow.FileButton, "LEFT", -2, 0)

	AS:SkinFrame(Recount.MainWindow.ReportButton)
	Recount.MainWindow.ReportButton:SetNormalTexture("")
	Recount.MainWindow.ReportButton:SetPushedTexture("")	
	Recount.MainWindow.ReportButton:SetHighlightTexture("")
	Recount.MainWindow.ReportButton:FontString("text", AS.PixelFont, AS.DataTextFontSize) --"MONOCHROMEOUTLINE"
	Recount.MainWindow.ReportButton.text:SetText("S")
	Recount.MainWindow.ReportButton.text:SetPoint("CENTER", 1, 1)
	Recount.MainWindow.ReportButton:SetPoint("RIGHT", Recount.MainWindow.ConfigButton, "LEFT", -2, 0)

	AS:SkinFrame(Recount.DetailWindow.ReportButton)
	Recount.DetailWindow.ReportButton:SetNormalTexture("")
	Recount.DetailWindow.ReportButton:SetPushedTexture("")	
	Recount.DetailWindow.ReportButton:SetHighlightTexture("")
	Recount.DetailWindow.ReportButton:FontString("text", AS.PixelFont, AS.DataTextFontSize) --"MONOCHROMEOUTLINE"
	Recount.DetailWindow.ReportButton.text:SetText("S")
	Recount.DetailWindow.ReportButton.text:SetPoint("CENTER", 1, 1)

	local ResetFrame = CreateFrame("Frame", nil, UIParent)
	ResetFrame:SetTemplate("Transparent")
	ResetFrame:SetSize(250, 70)
	ResetFrame:SetPoint("CENTER", UIParent, "CENTER")
	ResetFrame:SetFrameStrata("DIALOG")
	ResetFrame:Hide()
	ResetFrame:FontString("text", AS.PixelFont, 14) --"MONOCHROMEOUTLINE"
	ResetFrame.text:SetPoint("TOP", ResetFrame, "TOP", 0, -10)
	ResetFrame.text:SetText("Do you want to reset Recount?")

	local ResetAccept = CreateFrame("Button", nil, ResetFrame)
	AS:SkinButton(ResetAccept)
	ResetAccept:SetSize(70, 25)
	ResetAccept:SetPoint("RIGHT", ResetFrame, "BOTTOM", -1, 20)
	ResetAccept:SetScript("OnClick", function(self) Recount:ResetData() self:GetParent():Hide() end)
	ResetAccept:FontString("text", AS.PixelFont, 14) --"MONOCHROMEOUTLINE"
	ResetAccept.text:SetPoint("CENTER")
	ResetAccept.text:SetText(YES)

	local ResetClose = CreateFrame("Button", nil, ResetFrame)
	AS:SkinButton(ResetClose)
	ResetClose:SetSize(70, 25)
	ResetClose:SetPoint("LEFT", ResetFrame, "BOTTOM", 1, 20)
	ResetClose:SetScript("OnClick", function(self) self:GetParent():Hide() end)
	ResetClose:FontString("text", AS.PixelFont, 14) --"MONOCHROMEOUTLINE"
	ResetClose.text:SetPoint("CENTER")
	ResetClose.text:SetText(NO)

	function Recount:ShowReset()
		ResetFrame:Show()
	end
end

AS:RegisterSkin(name, AS.SkinRecount)