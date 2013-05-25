if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local s = U.s
local c = U.c
local windows = {}

local function EmbedTooltip(self)
	local r, l, b, t = self:GetRight(), EmbeddingWindow:GetLeft(), self:GetBottom(), EmbeddingWindow:GetTop()
	if not r or not l or not b or not t or r < l or b > t then return end
	local point, relativeTo, relativePoint, xOffset, yOffset = self:GetPoint(1)
	if relativeTo == U.Tooltip and point == "BOTTOMRIGHT" and relativePoint == "TOPRIGHT" then
		local found = false
		if U.CheckOption("EmbedSkada","Skada") and Skada and Skada.GetWindows then
			for _, window in ipairs(Skada:GetWindows()) do if window:IsShown() then found = true end end
		end
		if (U.CheckOption("EmbedOmen","Omen")) then
			if OmenBarList and OmenBarList:IsVisible() then found = true end
		end
		if (U.CheckOption("EmbedRecount","Recount")) then
			if Recount_MainWindow and Recount_MainWindow:IsShown() then found = true end
		end
		if (U.CheckOption("EmbedTinyDPS","TinyDPS")) then
			if tdpsFrame and tdpsFrame:IsShown() then found = true end
		end
		if found then
			self:ClearAllPoints()
			self:SetPoint(point, EmbeddingWindow, relativePoint, xOffset, yOffset)
		end
	end
end

GameTooltip:HookScript("OnUpdate", function(self, ...) EmbedTooltip(self) end)

function EmbedCheck(login)
	if (U.CheckOption("EmbedOmen","Omen")) then EmbedOmen() end
	if (U.CheckOption("EmbedSkada","Skada")) then
		EmbedSkada()
		if login then 
			hooksecurefunc(Skada, "CreateWindow", EmbedSkada)
			hooksecurefunc(Skada, "DeleteWindow", EmbedSkada)
		end
	end
	if (U.CheckOption("EmbedTinyDPS","TinyDPS")) then EmbedTDPS() end
	if (U.CheckOption("EmbedRecount","Recount")) then EmbedRecount() end
	if (U.CheckOption("EmbedalDamageMeter","alDamageMeter")) then EmbedALDamageMeter() end
end

function EmbedRecount()
	Recount:LockWindows(true)
	Recount_MainWindow:ClearAllPoints()
	EmbedRecountResize()
	if UISkinOptions["EmbedLeft"] == "Recount" then
		Recount_MainWindow:SetParent(EmbeddingWindowLeft)
	else
		Recount_MainWindow:SetParent(EmbeddingWindow)
	end
	Recount.MainWindow:SetFrameLevel(10)
end

function EmbedRecountResize()
	if not InCombatLockdown() then
		if UISkinOptions["EmbedLeft"] == "Recount" then
			Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindowLeft,"TOPLEFT", 0, 7)
			Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindowLeft,"BOTTOMRIGHT", 0, 2)
		else
			Recount_MainWindow:SetPoint("TOPLEFT", EmbeddingWindow,"TOPLEFT", 0, 7)
			Recount_MainWindow:SetPoint("BOTTOMRIGHT", EmbeddingWindow,"BOTTOMRIGHT", 0, 2)
		end
	end
end

function EmbedOmen()
	Omen.db.profile.Locked = true
	Omen:UpdateGrips()
	Omen.UpdateGrips = function(...)
	local db = Omen.db.profile
		Omen.VGrip1:ClearAllPoints()
		Omen.VGrip1:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip1, 0)
		Omen.VGrip1:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip1, 0)
		Omen.VGrip2:ClearAllPoints()
		Omen.VGrip2:SetPoint("TOPLEFT", Omen.BarList, "TOPLEFT", db.VGrip2, 0)
		Omen.VGrip2:SetPoint("BOTTOMLEFT", Omen.BarList, "BOTTOMLEFT", db.VGrip2, 0)
		Omen.Grip:Hide()
		if db.Locked then
			Omen.VGrip1:Hide()
			Omen.VGrip2:Hide()
		else
			Omen.VGrip1:Show()
			if db.Bar.ShowTPS then
				Omen.VGrip2:Show()
			else
				Omen.VGrip2:Hide()
			end
		end
	end
	OmenTitle:Kill()
	OmenAnchor:ClearAllPoints()
	if UISkinOptions["EmbedLeft"] == "Omen" then
		OmenBarList:SetParent(EmbeddingWindowLeft)
	else
		OmenBarList:SetParent(EmbeddingWindow)
	end
	OmenBarList:SetFrameLevel(10)
	EmbedOmenResize()
end

function EmbedOmenResize()
	if not InCombatLockdown() then
		if UISkinOptions["EmbedLeft"] == "Omen" then
			OmenBarList:SetPoint("TOPLEFT", EmbeddingWindowLeft, "TOPLEFT", 0, 0)
			OmenBarList:SetPoint("BOTTOMRIGHT", EmbeddingWindowLeft, "BOTTOMRIGHT", 0, 2)
		else
			OmenBarList:SetPoint("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
			OmenBarList:SetPoint("BOTTOMRIGHT", EmbeddingWindow, "BOTTOMRIGHT", 0, 2)
		end
	end
end

function EmbedTDPS()
	U.SkinFrame(tdpsFrame, "Default")
	tdpsFrame:SetFrameLevel(10)
	if UISkinOptions["EmbedLeft"] == "TinyDPS" then
		tdpsFrame:SetParent(EmbeddingWindowLeft)
		tdpsAnchor:Point("TOPLEFT", EmbeddingWindowLeft, "TOPLEFT", 0, 0)
	else
		tdpsFrame:SetParent(EmbeddingWindow)
		tdpsAnchor:Point("TOPLEFT", EmbeddingWindow, "TOPLEFT", 0, 0)
	end
	EmbedTDPSResize()
	tdpsRefresh()
end

function EmbedTDPSResize()
	if not InCombatLockdown() then
		if UISkinOptions["EmbedLeft"] == "TinyDPS" then
			tdpsFrame:SetWidth(EmbeddingWindowLeft:GetWidth())
		else
			tdpsFrame:SetWidth(EmbeddingWindow:GetWidth())
		end
		tdpsRefresh()
	end
end

function EmbedALDamageMeter()
	dmconf.maxbars = U.Round(EmbeddingWindow:GetHeight() / (dmconf.barheight + dmconf.spacing))
	dmconf.width = EmbeddingWindow:GetWidth()
	alDamageMeterFrame:ClearAllPoints()
	if UISkinOptions["EmbedLeft"] == "alDamageMeter" then
		alDamageMeterFrame:SetInside(EmbeddingWindowLeft, 1, 1)
		alDamageMeterFrame:SetParent(EmbeddingWindowLeft)
	else
		alDamageMeterFrame:SetInside(EmbeddingWindow, 1, 1)
		alDamageMeterFrame:SetParent(EmbeddingWindow)
	end
	alDamageMeterFrame:SetFrameLevel(10)
end

local function EmbedWindow(window, width, height, point, relativeFrame, relativePoint, ofsx, ofsy)
	local barmod = Skada.displays["bar"]
	window.db.barwidth = width
	window.db.background.height = height
	window.db.spark = false
	window.db.barslocked = true
	window.bargroup:ClearAllPoints()
	window.bargroup:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy)

	barmod.ApplySettings(barmod, window)
end

function EmbedSkada()
	windows = {}
	for _, window in ipairs(Skada:GetWindows()) do
		tinsert(windows, window)
	end
	local EmbedParent
	if UISkinOptions["EmbedLeft"] == "Skada" then
		EmbedParent = EmbeddingWindowLeft
	else
		EmbedParent = EmbeddingWindow
	end
	if(#windows == 1) then
		EmbedWindow(windows[1], EmbedParent:GetWidth() - 4, (EmbedParent:GetHeight() - 19), "TOPRIGHT", EmbedParent, "TOPRIGHT", -2, -17)
	elseif(#windows == 2) then
		EmbedWindow(windows[1], ((EmbedParent:GetWidth() - 4) / 2) - (1 + s.mult), EmbedParent:GetHeight() - 19, "TOPRIGHT", EmbedParent, "TOPRIGHT", -2, -17)
		EmbedWindow(windows[2], ((EmbedParent:GetWidth() - 4) / 2) - (1 + s.mult), EmbedParent:GetHeight() - 19, "TOPLEFT", EmbedParent, "TOPLEFT", 2, -17)
	elseif(#windows > 2) then
		EmbedWindow(windows[1], ((EmbedParent:GetWidth() - 4) / 2) - (1 + s.mult), EmbedParent:GetHeight() - 19, "TOPRIGHT", EmbedParent, "TOPRIGHT", -2, -17)
		EmbedWindow(windows[2], ((EmbedParent:GetWidth() - 4) / 2) - (1 + s.mult), (EmbedParent:GetHeight()/2) - 19, "TOPLEFT", EmbedParent, "TOPLEFT", 2, -17)
		EmbedWindow(windows[3], ((EmbedParent:GetWidth() - 4) / 2) - (1 + s.mult), (EmbedParent:GetHeight()/2) - 19, "TOPLEFT", windows[2], "BOTTOMLEFT", 0, -2)
	end
end

local function EmbedWindowResize()
	if not U.ChatBackgroundRight then
		EmbeddingWindow:SetPoint("BOTTOM", U.InfoRight, "TOP", 0, 2)
		EmbeddingWindow:Size(U.InfoRight:GetWidth(), 142)
		EmbeddingWindowLeft:SetPoint("BOTTOM", U.InfoLeft, "TOP", 0, 2)
		EmbeddingWindowLeft:Size(U.InfoLeft:GetWidth(), 142)
	else
		if DuffedUI then
			EmbeddingWindow:SetInside(U.ChatBackgroundRight, 5, 5)
			EmbeddingWindowLeft:SetInside(U.ChatBackgroundLeft, 5, 5)
		else
			EmbeddingWindow:SetPoint("TOP", U.ChatBackgroundRight, "TOP", 0, -5)
			EmbeddingWindow:Size(U.InfoRight:GetWidth(), U.ChatBackgroundRight:GetHeight() - 34)
			EmbeddingWindowLeft:SetPoint("TOP", U.ChatBackgroundLeft, "TOP", 0, -5)
			EmbeddingWindowLeft:Size(U.InfoLeft:GetWidth(), U.ChatBackgroundLeft:GetHeight() - 34)
		end
	end
	EmbedCheck()
end

local EmbeddingWindowLeft = CreateFrame("Frame", "EmbeddingWindowLeft", UIParent)
local EmbeddingWindow = CreateFrame("Frame", "EmbeddingWindow", UIParent)
EmbeddingWindow:RegisterEvent("PLAYER_ENTERING_WORLD")
EmbeddingWindow:RegisterEvent("PLAYER_REGEN_DISABLED")
EmbeddingWindow:RegisterEvent("PLAYER_REGEN_ENABLED")
EmbeddingWindow:SetScript("OnEvent", function(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		EmbedWindowResize()
		EmbedCheck(true)
	elseif event == "PLAYER_REGEN_DISABLED" or InCombatLockdown() then
		if (U.CheckOption("EmbedOoC")) then
			if ChatFrame4Hide then ChatFrame4Tab:Hide() end
			EmbeddingWindow:Show()
			EmbeddingWindowLeft:Show()
		end
	else
		if (U.CheckOption("EmbedOoC")) then
			if ChatFrame4Hide then ChatFrame4Tab:Show() end
			EmbeddingWindow:Hide()
			EmbeddingWindowLeft:Hide()
		end
	end
end)

if U.ChatBackgroundRight then
	U.ChatBackgroundRight:SetFrameStrata("Background")
	U.ChatBackgroundLeft:SetFrameStrata("Background")
	U.TabsRightBackground:SetParent(U.ChatBackgroundRight)
	U.TabsLeftBackground:SetParent(U.ChatBackgroundLeft)
end

local function CreateToggleButton(name, buttontext, panel1, panel2, tooltiptext1, tooltiptext2)
	local frame = CreateFrame("Button", name, UIParent)
	frame:SetTemplate("Transparent")
	frame:Size(panel1:GetHeight()-4)
	frame:FontString("text", c["media"].pixelfont, 14, "MONOCHROMEOUTLINE")
	frame.text:SetText(buttontext)
	frame.text:SetPoint("CENTER", 2, 2)
	frame:RegisterForClicks("LeftButtonDown", "RightButtonDown");
	UIFrameFadeOut(frame, 0.2, frame:GetAlpha(), 0)
	frame:SetScript("OnClick", function(self, btn)
		if btn == 'LeftButton' then
			if (IsAddOnLoaded("Tukui_ChatTweaks") and ChatTweaksOptions["ChatHider"] == "Enabled") then
				if panel2 then
					if self.Faded then
						self.Faded = nil
						if not DuffedUI then UIFrameFadeIn(panel1, 0.2, panel1:GetAlpha(), 1) end
						UIFrameFadeIn(panel2, 0.2, panel2:GetAlpha(), 1)
						if name == "LeftToggleButton" then UIFrameFadeIn(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 1) end
					else
						self.Faded = true
						if not DuffedUI then UIFrameFadeOut(panel1, 0.2, panel1:GetAlpha(), 0) end
						UIFrameFadeOut(panel2, 0.2, panel2:GetAlpha(), 0)
						if name == "LeftToggleButton" then UIFrameFadeOut(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 0) end
					end
				end
			end
		end
	end)
	frame:SetScript("OnEnter", function(self, ...)
		UIFrameFadeIn(self, 0.2, self:GetAlpha(), 1)
		if self.Faded then
			if not DuffedUI then UIFrameFadeIn(panel1, 0.2, panel1:GetAlpha(), 1) end
			UIFrameFadeIn(panel2, 0.2, panel2:GetAlpha(), 1)
			if name == "LeftToggleButton" then UIFrameFadeIn(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 1) end
		end
		GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT', 0, 4)
		GameTooltip:ClearLines()
		if IsAddOnLoaded("Tukui_ChatTweaks") and (ChatTweaksOptions["ChatHider"] == "Enabled") then
			if U.ChatBackgroundRight then
				GameTooltip:AddDoubleLine("Left Click:", tooltiptext1, 1, 1, 1)
			end
		end
		GameTooltip:AddDoubleLine("Right Click:", tooltiptext2, 1, 1, 1)
	end)
	frame:SetScript("OnLeave", function(self, ...)
		UIFrameFadeOut(self, 0.2, self:GetAlpha(), 0)
		if self.Faded then
			if not DuffedUI then UIFrameFadeOut(panel1, 0.2, panel1:GetAlpha(), 0) end
			UIFrameFadeOut(panel2, 0.2, panel2:GetAlpha(), 0)
			if name == "LeftToggleButton" then UIFrameFadeOut(GeneralDockManager, 0.2, GeneralDockManager:GetAlpha(), 0) end
		end
	end)
end

CreateToggleButton("RightToggleButton", ">", U.InfoRight, U.ChatBackgroundRight, "Toggle Right Chat Panel", "Toggle Embedded AddOn")
RightToggleButton:Point("RIGHT", U.InfoRight, "RIGHT", -2, 0)
RightToggleButton:HookScript("OnClick", function(self, btn)
	if btn == "RightButton" then
		if EmbeddingWindow:IsShown() then
			EmbeddingWindow:Hide()
			EmbeddingWindowLeft:Hide()
			if ChatFrame4Hide then ChatFrame4Tab:Show() end
		else
			EmbeddingWindow:Show()
			EmbeddingWindowLeft:Show()
			if ChatFrame4Hide then ChatFrame4Tab:Hide() end
		end
	end
end)
RightToggleButton:SetScript("PreClick", function(self) if ChatFrame4Tab:IsShown() then ChatFrame4Hide = true end end)

CreateToggleButton("LeftToggleButton", "<", U.InfoLeft, U.ChatBackgroundLeft, "Toggle Left Chat Panel", "Toggle Extra Skins/Options")
LeftToggleButton:Point("LEFT", U.InfoLeft, "LEFT", 2, 0)
LeftToggleButton:HookScript("OnClick", function(self, btn)
	if btn == "RightButton" then
		if SkinOptions:IsShown() or SkinOptions2:IsShown() or SkinOptions3:IsShown() then
			SkinOptions:Hide()
			SkinOptions2:Hide()
			SkinOptions3:Hide()
			SkinOptions1Button:SetParent(SkinOptions)
			SkinOptions2Button:SetParent(SkinOptions)
			EmbedWindowSettingsButton:SetParent(SkinOptions)
			ApplySkinSettingsButton:SetParent(SkinOptions)
			SkinOptionsCloseButton:SetParent(SkinOptions)
		else
			SkinOptions:Show()
		end
	end
end)