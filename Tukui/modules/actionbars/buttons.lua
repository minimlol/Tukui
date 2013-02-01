local T, C, L, G = unpack(select(2, ...))

-- omg this file sux, it really need a rewrite someday, I was probably drunk when I made this. :X

local function ShowOrHideBar(bar, button)
	local db = TukuiDataPerChar

	if button == TukuiBarBottomButton then
		if TukuiBarUpper:IsShown() then
			db.hidebar3 = true
			db.hidebar4 = true
			TukuiBarUpper:Hide()
		else
			db.hidebar3 = false
			db.hidebar4 = false
			TukuiBarUpper:Show()
		end
	end
	
	if button == TukuiBar5Button then
		if TukuiBar5:IsShown() then
			db.hidebar5 = true
			TukuiBar5:Hide()
		else
			db.hidebar5 = false
			TukuiBar5:Show()
		end
	end
	
end

local function MoveButtonBar(button, bar)
	local db = TukuiDataPerChar
	
	if button == TukuiBarBLButton or  button == TukuiBarBRButton then
		if TukuiBar3:IsShown() then
			TukuiBarBLButton.text:SetText("|cff4BAF4C-|r")
			TukuiBarBRButton.text:SetText("|cff4BAF4C-|r")
		else
			TukuiBarBLButton.text:SetText("|cff4BAF4C+|r")
			TukuiBarBRButton.text:SetText("|cff4BAF4C+|r")
		end
	end
	
	if button == TukuiBar5Button then
		if TukuiBar5:IsShown() then
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:Point("RIGHT", TukuiBar5, "LEFT", -6, 0)
		else
			TukuiPetBar:ClearAllPoints()
			TukuiPetBar:Point("RIGHT", UIParent, "RIGHT", -23, -14)
		end
	end

end

local function DrPepper(self, bar) -- guess what! :P
	-- yep, you cannot drink DrPepper while in combat. :(
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	local button = self
	
	ShowOrHideBar(bar, button)
	MoveButtonBar(button, bar)
end

local TukuiBarBottomButton = CreateFrame("Button", "TukuiBarBottomButton", UIParrent)
TukuiBarBottomButton:SetWidth((T.buttonsize * 16) + (T.buttonspacing * 17))
TukuiBarBottomButton:Height(10)
TukuiBarBottomButton:SetPoint("TOP", TukuiBarLower, "BOTTOM", 0, -2)
TukuiBarBottomButton:SetTemplate("Default")
TukuiBarBottomButton:RegisterForClicks("AnyUp")
TukuiBarBottomButton:SetAlpha(0)
TukuiBarBottomButton:SetScript("OnClick", function(self) DrPepper(self, TukuiBar2) end)
TukuiBarBottomButton:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
TukuiBarBottomButton:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
TukuiBarBottomButton.text = T.SetFontString(TukuiBarBottomButton, C.media.uffont, 18)
TukuiBarBottomButton.text:SetPoint("CENTER", 0, 0)
TukuiBarBottomButton.text:SetText("- - - - - - - - - - - - - - - - -")

local TukuiBar5Button = CreateFrame("Button", "TukuiBar5Button", UIParent)
TukuiBar5Button:Width(TukuiLineToPetActionBarBackground:GetWidth())
TukuiBar5Button:Height(TukuiLineToPetActionBarBackground:GetHeight())
TukuiBar5Button:Point("RIGHT", UIParent, "RIGHT", 2, -14)
TukuiBar5Button:SetTemplate("Default")
TukuiBar5Button:RegisterForClicks("AnyUp")
TukuiBar5Button:SetAlpha(0)
TukuiBar5Button:SetScript("OnClick", function(self) if self:GetAlpha() == 1 then DrPepper(self, TukuiBar5) end end)
TukuiBar5Button:SetScript("OnEnter", function(self) if InCombatLockdown() == nil then self:SetAlpha(1) end end)
TukuiBar5Button:SetScript("OnLeave", function(self) self:SetAlpha(0) end)
TukuiBar5Button.text = T.SetFontString(TukuiBar5Button, C.media.uffont, 30)
TukuiBar5Button.text:SetPoint("CENTER", 0, 0)
TukuiBar5Button.text:SetText("<")

-- exit vehicle button on left side of bottom action bar
local vehicleleft = CreateFrame("Button", "TukuiExitVehicleButtonLeft", UIParent, "SecureHandlerClickTemplate")
vehicleleft:SetAllPoints(TukuiInfoLeft)
vehicleleft:SetFrameStrata("LOW")
vehicleleft:SetFrameLevel(10)
vehicleleft:SetTemplate("Default")
vehicleleft:SetBackdropBorderColor(75/255,  175/255, 76/255)
vehicleleft:RegisterForClicks("AnyUp")
vehicleleft:SetScript("OnClick", function() VehicleExit() end)
vehicleleft:FontString("text", C.media.font, 12)
vehicleleft.text:Point("CENTER", 0, 0)
vehicleleft.text:SetText("|cff4BAF4C"..string.upper(LEAVE_VEHICLE).."|r")
RegisterStateDriver(vehicleleft, "visibility", "[target=vehicle,exists] show;hide")
G.ActionBars.ExitVehicleLeft = vehicleleft

-- exit vehicle button on right side of bottom action bar
local vehicleright = CreateFrame("Button", "TukuiExitVehicleButtonRight", UIParent, "SecureHandlerClickTemplate")
vehicleright:SetAllPoints(TukuiInfoRight)
vehicleright:SetTemplate("Default")
vehicleright:SetFrameStrata("LOW")
vehicleright:SetFrameLevel(10)
vehicleright:SetBackdropBorderColor(75/255,  175/255, 76/255)
vehicleright:RegisterForClicks("AnyUp")
vehicleright:SetScript("OnClick", function() VehicleExit() end)
vehicleright:FontString("text", C.media.font, 12)
vehicleright.text:Point("CENTER", 0, 0)
vehicleright.text:SetText("|cff4BAF4C"..string.upper(LEAVE_VEHICLE).."|r")
RegisterStateDriver(vehicleright, "visibility", "[target=vehicle,exists] show;hide")
G.ActionBars.ExitVehicleRight = vehicleright

--------------------------------------------------------------
-- DrPepper taste is really good with Vodka. 
--------------------------------------------------------------

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not TukuiDataPerChar then TukuiDataPerChar = {} end
	local db = TukuiDataPerChar
	
	if db.hidebar3 or db.hidebar4 then
		DrPepper(TukuiBarBLButton, TukuiBar3)
	end
	
	if db.hidebar5 then
		DrPepper(TukuiBar5Button, TukuiBar5)
	end
end)