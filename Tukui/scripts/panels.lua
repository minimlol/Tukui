-- ACTION BAR PANEL
TukuiDB.buttonsize = TukuiDB.Scale(27)
TukuiDB.buttonspacing = TukuiDB.Scale(4)
TukuiDB.petbuttonsize = TukuiDB.Scale(29)
TukuiDB.petbuttonspacing = TukuiDB.Scale(4)

-- set left and right info panel width
TukuiCF["panels"] = {["tinfowidth"] = 370}

local barbg = CreateFrame("Frame", "TukuiActionBarBackground", UIParent)
TukuiDB.CreatePanel(barbg, 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, TukuiDB.Scale(14))
if TukuiDB.lowversion == true then
	barbg:SetWidth((TukuiDB.buttonsize * 12) + (TukuiDB.buttonspacing * 13))
	if TukuiCF["actionbar"].bottomrows == 2 then
		barbg:SetHeight((TukuiDB.buttonsize * 2) + (TukuiDB.buttonspacing * 3))
	else
		barbg:SetHeight(TukuiDB.buttonsize + (TukuiDB.buttonspacing * 2))
	end
else
	barbg:SetWidth((TukuiDB.buttonsize * 22) + (TukuiDB.buttonspacing * 23))
	if TukuiCF["actionbar"].bottomrows == 2 then
		barbg:SetHeight((TukuiDB.buttonsize * 2) + (TukuiDB.buttonspacing * 3))
	else
		barbg:SetHeight(TukuiDB.buttonsize + (TukuiDB.buttonspacing * 2))
	end
end
barbg:SetFrameStrata("BACKGROUND")
barbg:SetFrameLevel(1)

-- INVISIBLE FRAME COVERING TukuiActionBarBackground
local invbarbg = CreateFrame("Frame", "InvTukuiActionBarBackground", UIParent)
invbarbg:SetSize(barbg:GetWidth(), barbg:GetHeight())
invbarbg:SetPoint("BOTTOM", 0, TukuiDB.Scale(14))

-- LEFT VERTICAL LINE
local ileftlv = CreateFrame("Frame", "TukuiInfoLeftLineVertical", barbg)
TukuiDB.CreatePanel(ileftlv, 2, 130, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", TukuiDB.Scale(22), TukuiDB.Scale(30))

-- RIGHT VERTICAL LINE
local irightlv = CreateFrame("Frame", "TukuiInfoRightLineVertical", barbg)
TukuiDB.CreatePanel(irightlv, 2, 130, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", TukuiDB.Scale(-22), TukuiDB.Scale(30))

-- CUBE AT LEFT, ACT AS A BUTTON (CHAT MENU)
local cubeleft = CreateFrame("Frame", "TukuiCubeLeft", barbg)
TukuiDB.CreatePanel(cubeleft, 10, 10, "BOTTOM", ileftlv, "TOP", 0, 0)
cubeleft:EnableMouse(true)
cubeleft:SetScript("OnMouseDown", function(self, btn)
	if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
		if btn == "RightButton" then
			if TukuiInfoLeftBattleGround:IsShown() then
				TukuiInfoLeftBattleGround:Hide()
			else
				TukuiInfoLeftBattleGround:Show()
			end
		end
	end
	
	if btn == "LeftButton" then	
		ToggleFrame(ChatMenu)
	end
end)

-- CUBE AT RIGHT, ACT AS A BUTTON (CONFIGUI or BG'S)
local cuberight = CreateFrame("Frame", "TukuiCubeRight", barbg)
TukuiDB.CreatePanel(cuberight, 10, 10, "BOTTOM", irightlv, "TOP", 0, 0)
if TukuiCF["bags"].enable then
	cuberight:EnableMouse(true)
	cuberight:SetScript("OnMouseDown", function(self)
		ToggleKeyRing()
	end)
end

-- HORIZONTAL LINE LEFT
local ltoabl = CreateFrame("Frame", "TukuiLineToABLeft", barbg)
TukuiDB.CreatePanel(ltoabl, 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabl:ClearAllPoints()
ltoabl:SetPoint("BOTTOMLEFT", ileftlv, "BOTTOMLEFT", 0, 0)
ltoabl:SetPoint("RIGHT", barbg, "BOTTOMLEFT", TukuiDB.Scale(-1), TukuiDB.Scale(17))

-- HORIZONTAL LINE RIGHT
local ltoabr = CreateFrame("Frame", "TukuiLineToABRight", barbg)
TukuiDB.CreatePanel(ltoabr, 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabr:ClearAllPoints()
ltoabr:SetPoint("LEFT", barbg, "BOTTOMRIGHT", TukuiDB.Scale(1), TukuiDB.Scale(17))
ltoabr:SetPoint("BOTTOMRIGHT", irightlv, "BOTTOMRIGHT", 0, 0)

-- INFO LEFT (FOR STATS)
local ileft = CreateFrame("Frame", "TukuiInfoLeft", barbg)
TukuiDB.CreatePanel(ileft, TukuiCF["panels"].tinfowidth, 23, "LEFT", ltoabl, "LEFT", TukuiDB.Scale(14), 0)
ileft:SetFrameLevel(2)
ileft:SetFrameStrata("BACKGROUND")

-- INFO RIGHT (FOR STATS)
local iright = CreateFrame("Frame", "TukuiInfoRight", barbg)
TukuiDB.CreatePanel(iright, TukuiCF["panels"].tinfowidth, 23, "RIGHT", ltoabr, "RIGHT", TukuiDB.Scale(-14), 0)
iright:SetFrameLevel(2)
iright:SetFrameStrata("BACKGROUND")

if TukuiMinimap then
	local minimapstatsleft = CreateFrame("Frame", "TukuiMinimapStatsLeft", TukuiMinimap)
	TukuiDB.CreatePanel(minimapstatsleft, ((TukuiMinimap:GetWidth() + 4) / 2) - 1, 19, "TOPLEFT", TukuiMinimap, "BOTTOMLEFT", 0, TukuiDB.Scale(-2))

	local minimapstatsright = CreateFrame("Frame", "TukuiMinimapStatsRight", TukuiMinimap)
	TukuiDB.CreatePanel(minimapstatsright, ((TukuiMinimap:GetWidth() + 4) / 2) -1, 19, "TOPRIGHT", TukuiMinimap, "BOTTOMRIGHT", 0, TukuiDB.Scale(-2))
end

--RIGHT BAR BACKGROUND
if TukuiCF["actionbar"].enable == true then
	local barbgr = CreateFrame("Frame", "TukuiActionBarBackgroundRight", UIParent)
	TukuiDB.CreatePanel(barbgr, 1, (TukuiDB.buttonsize * 12) + (TukuiDB.buttonspacing * 13), "RIGHT", UIParent, "RIGHT", TukuiDB.Scale(-23), TukuiDB.Scale(-13.5))
	if TukuiCF["actionbar"].rightbars == 1 then
		barbgr:SetWidth(TukuiDB.buttonsize + (TukuiDB.buttonspacing * 2))
	elseif TukuiCF["actionbar"].rightbars == 2 then
		barbgr:SetWidth((TukuiDB.buttonsize * 2) + (TukuiDB.buttonspacing * 3))
	elseif TukuiCF["actionbar"].rightbars == 3 then
		barbgr:SetWidth((TukuiDB.buttonsize * 3) + (TukuiDB.buttonspacing * 4))
	else
		barbgr:Hide()
	end
	if TukuiCF["actionbar"].rightbars > 0 then
		local rbl = CreateFrame("Frame", "TukuiRightBarLine", barbgr)
		local crblu = CreateFrame("Frame", "TukuiCubeRightBarUP", barbgr)
		local crbld = CreateFrame("Frame", "TukuiCubeRightBarDown", barbgr)
		TukuiDB.CreatePanel(rbl, 2, (TukuiDB.buttonsize / 2 * 27) + (TukuiDB.buttonspacing * 6), "RIGHT", barbgr, "RIGHT", TukuiDB.Scale(1), 0)
		rbl:SetWidth(TukuiDB.Scale(2))
		TukuiDB.CreatePanel(crblu, 10, 10, "BOTTOM", rbl, "TOP", 0, 0)
		TukuiDB.CreatePanel(crbld, 10, 10, "TOP", rbl, "BOTTOM", 0, 0)
	end

	local petbg = CreateFrame("Frame", "TukuiPetActionBarBackground", UIParent)
	if TukuiCF["actionbar"].rightbars > 0 then
		TukuiDB.CreatePanel(petbg, TukuiDB.petbuttonsize + (TukuiDB.petbuttonspacing * 2), (TukuiDB.petbuttonsize * 10) + (TukuiDB.petbuttonspacing * 11), "RIGHT", barbgr, "LEFT", TukuiDB.Scale(-6), 0)
	else
		TukuiDB.CreatePanel(petbg, TukuiDB.petbuttonsize + (TukuiDB.petbuttonspacing * 2), (TukuiDB.petbuttonsize * 10) + (TukuiDB.petbuttonspacing * 11), "RIGHT", UIParent, "RIGHT", TukuiDB.Scale(-6), TukuiDB.Scale(-13.5))
	end

	local ltpetbg1 = CreateFrame("Frame", "TukuiLineToPetActionBarBackground", petbg)
	TukuiDB.CreatePanel(ltpetbg1, 30, 265, "TOPLEFT", petbg, "TOPRIGHT", 0, TukuiDB.Scale(-33))
	ltpetbg1:SetFrameLevel(0)
	ltpetbg1:SetAlpha(.8)
end

--BATTLEGROUND STATS FRAME
if TukuiCF["datatext"].battleground == true then
	local bgframe = CreateFrame("Frame", "TukuiInfoLeftBattleGround", UIParent)
	TukuiDB.CreatePanel(bgframe, 1, 1, "TOPLEFT", UIParent, "BOTTOMLEFT", 0, 0)
	bgframe:SetAllPoints(ileft)
	bgframe:SetFrameStrata("LOW")
	bgframe:SetFrameLevel(0)
	bgframe:EnableMouse(true)
end

-- CHAT LEFT
ChatFrame1:SetFrameStrata("LOW")
local chatleft = CreateFrame("Frame", "ChatLeft", TukuiInfoLeft)
TukuiDB.CreatePanel(chatleft, TukuiCF["panels"].tinfowidth, TukuiDB.Scale(125), "BOTTOM", TukuiInfoLeft, "TOP", 0, TukuiDB.Scale(3))
chatleft:SetFrameLevel(2)
chatleft:SetFrameStrata("BACKGROUND")
chatleft:SetBackdropColor(.075,.075,.075,.7)
chatleft:SetBackdropBorderColor(unpack(TukuiCF["media"].bordercolor))
 
leftborder = CreateFrame("Frame", nil, UIParent)
leftborder:SetPoint("TOPLEFT", ChatLeft, "TOPLEFT", -1, 1)
leftborder:SetFrameStrata("BACKGROUND")
leftborder:SetBackdrop {
edgeFile = TukuiCF["media"].blank, edgeSize = 3,
insets = {left = 0, right = 0, top = 0, bottom = 0}
}
leftborder:SetBackdropColor(unpack(TukuiCF["media"].backdropcolor))
leftborder:SetBackdropBorderColor(unpack(TukuiCF["media"].backdropcolor))
leftborder:SetPoint("BOTTOMRIGHT", ChatLeft, "BOTTOMRIGHT", 1, -1)