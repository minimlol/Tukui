if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))
local format, gsub, sort, tinsert, pairs = format, gsub, sort, tinsert, pairs

function AS:LegacyOptions()
	local function CreateOptionsFrame(name, frametext, parent)
		local frame = CreateFrame("Frame", name, UIParent)
		frame:Hide()
		frame:SetTemplate("Transparent")
		frame:Point("CENTER", parent, "CENTER", 0, 0)
		frame:SetFrameStrata("DIALOG")
		frame:Width(550)
		frame:Height(210)
		frame:SetFrameStrata("DIALOG")
		frame:SetClampedToScreen(true)
		frame:SetMovable(true)
		frame:FontString("text", AS.Font, 14, "OUTLINE")
		frame.text:SetPoint("TOP", frame, 0, -6)
		frame.text:SetText(frametext..AS.Version)
		frame:EnableMouse(true)
		frame:RegisterForDrag("LeftButton")
	end

	CreateOptionsFrame("SkinOptions", "|cffC495DDTukui|r Skin Options - Version ", UIParent)
	SkinOptions:SetScript("OnDragStart", function(self) self:StartMoving() end)
	SkinOptions:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)	

	CreateOptionsFrame("SkinOptions2", "|cffC495DDTukui|r Module Options - Version ", SkinOptions)
	CreateOptionsFrame("SkinOptions3", "|cffC495DDTukui|r Embed Options - Version ", SkinOptions)
	SkinOptions3:FontString("text2", AS.Font, 14, "OUTLINE")
	SkinOptions3.text2:SetPoint("TOPRIGHT", SkinOptions3, "TOPRIGHT", -30, -38)
	SkinOptions3.text2:SetText("|cff00AAFFAvailable Embeds|r:\n\nalDamageMeter\nOmen\nRecount\nSkada\nTinyDPS")

	local function CreateOptionsButton(name, btntext, parent)
		local frame = CreateFrame("Button", name.."Button", SkinOptions)
		frame:Size(100, 24)
		AS:SkinButton(frame)
		frame:FontString("text", AS.Font, 12, "OUTLINE")
		frame.text:SetPoint("CENTER", frame, 0, 0)
		frame.text:SetText(btntext)
		frame:SetScript("OnClick", function()
			SkinOptions1Button:SetParent(parent)
			SkinOptions2Button:SetParent(parent)
			EmbedWindowSettingsButton:SetParent(parent)
			ApplySkinSettingsButton:SetParent(parent)
			SkinOptionsCloseButton:SetParent(parent)
		end)
	end

	CreateOptionsButton("SkinOptions1", "Skins", SkinOptions)
	SkinOptions1Button:SetPoint("TOP", SkinOptions, "BOTTOM", 0, -2)
	SkinOptions1Button:HookScript("OnClick", function() SkinOptions:Show() SkinOptions2:Hide() SkinOptions3:Hide() end)

	CreateOptionsButton("SkinOptions2", "Modules", SkinOptions2)
	SkinOptions2Button:SetPoint("RIGHT", SkinOptions1Button, "RIGHT", 102, 0)
	SkinOptions2Button:HookScript("OnClick", function() SkinOptions2:Show() SkinOptions:Hide() SkinOptions3:Hide() end)

	CreateOptionsButton("EmbedWindowSettings", "Embeds", SkinOptions3)
	EmbedWindowSettingsButton:SetPoint("RIGHT", SkinOptions1Button, "LEFT", -2, 0)
	EmbedWindowSettingsButton:HookScript("OnClick", function() SkinOptions3:Show() SkinOptions:Hide() SkinOptions2:Hide() end)

	CreateOptionsButton("SkinOptionsClose", "Close", SkinOptions)
	SkinOptionsCloseButton:SetPoint("RIGHT", SkinOptions2Button, "RIGHT", 102, 0)
	SkinOptionsCloseButton:HookScript("OnClick", function() SkinOptions3:Hide() SkinOptions:Hide() SkinOptions2:Hide() end)

	local ApplySkinSettingsButton = CreateFrame("Button", "ApplySkinSettingsButton", SkinOptions)
	ApplySkinSettingsButton:SetPoint("RIGHT", EmbedWindowSettingsButton, "LEFT", -2, 0)
	ApplySkinSettingsButton:Size(100, 24)
	AS:SkinButton(ApplySkinSettingsButton)
	ApplySkinSettingsButton:FontString("text", AS.Font, 12, "OUTLINE")
	ApplySkinSettingsButton.text:SetPoint("CENTER", ApplySkinSettingsButton, 0, 0)
	ApplySkinSettingsButton.text:SetText("Apply Settings")
	ApplySkinSettingsButton:SetScript("OnClick", function() ReloadUI() end)

	local function ToggleEmbed(AddOn)
		AS:DisableOption("EmbedOmen")
		AS:DisableOption("EmbedRecount")
		AS:DisableOption("EmbedTinyDPS")
		AS:DisableOption("EmbedSkada")
		if UISkinOptions["Embed"..AddOn] ~= nil then
			AS:EnableOption("Embed"..AddOn)
		end
		print(format("%s Embed System - Left: %s | Right: %s", AS.Title, UISkinOptions["EmbedLeft"], UISkinOptions["EmbedRight"]))
		AS:EmbedCheck()
	end

	local function CreateEmbedEditBox(name, boxtext)
		local frame = CreateFrame("EditBox", name.."EditBox", SkinOptions3)
		frame:FontString("text", AS.Font, 12, "OUTLINE")
		frame.text:SetPoint("BOTTOM", frame, "TOP", 0, 2)
		frame.text:SetText(boxtext)
		frame:SetAutoFocus(false)
		frame:SetMultiLine(false)
		frame:SetWidth(140)
		frame:SetHeight(20)
		frame:SetMaxLetters(255)
		frame:SetTextInsets(3,0,0,0)
		frame:SetFontObject(GameFontHighlight)
		frame:SetTemplate()
		frame:SetText(UISkinOptions[name])
		frame:SetScript("OnEscapePressed", function(self) self:ClearFocus() self:SetText(UISkinOptions[name]) end)
		frame:SetScript("OnEnterPressed", function(self)
			self:ClearFocus()
			if self:GetText() == "" then
				UISkinOptions[name] = "NONE"
			else
				UISkinOptions[name] = self:GetText()
			end
			ToggleEmbed(self:GetText())
		end)
	end

	CreateEmbedEditBox("EmbedRight", "Embed Right AddOn")
	EmbedRightEditBox:SetPoint("TOPLEFT", 12, -50)

	CreateEmbedEditBox("EmbedLeft", "Embed Left AddOn")
	EmbedLeftEditBox:SetPoint("TOPLEFT", 12, -100)

	local function CreateEmbedButton(name, btntext)
		local button = CreateFrame("Button", name.."Button", SkinOptions3)
		button:Size(16)
		AS:SkinBackdropFrame(button)
		button:SetBackdrop({bgFile = AS.NormTex, tile = false, tileSize = 0})
		button:FontString("text", AS.Font, 12, "OUTLINE")
		button.text:SetPoint("LEFT", button, "RIGHT", 10, 0)
		button.text:SetText(btntext)
		button:SetScript("OnShow", function(self)
			local r, g, b = .68, .14, .14
			if AS:CheckOption(name) then
				r, g, b = .6, 0, .86
			end
			self:SetBackdropColor(r, g, b)
		end)
		button:SetScript("OnClick", function(self)
			local r, g, b = .68, .14, .14
			AS:ToggleOption(name)
			if AS:CheckOption(name) then
				r, g, b = .6, 0, .86
			end
			self:SetBackdropColor(r, g, b)
		end)
	end

	CreateEmbedButton("EmbedSystem", "Embed System")
	EmbedSystemButton:SetPoint("TOPLEFT", EmbedLeftEditBox, "BOTTOMLEFT", 0, -45)

	CreateEmbedButton("EmbedOoC", "OoC Hide")
	EmbedOoCButton:SetPoint("TOPLEFT", EmbedLeftEditBox, "BOTTOMLEFT", 0, -20)

	CreateEmbedButton("EmbedSexyCooldown", "Embed SexyCooldown")
	EmbedSexyCooldownButton:SetPoint("TOP", -68, -50)

	CreateEmbedButton("EmbedCoolLine", "Embed CoolLine")
	EmbedCoolLineButton:SetPoint("TOP", -68, -75)

	CreateEmbedButton("SkadaTwoThirds", "Skada 1/3 | 2/3")
	SkadaTwoThirdsButton:SetPoint("TOP", -68, -100)

	CreateEmbedButton("SkadaBelowTop", "Skada Below Top Chat Tabs")
	SkadaBelowTopButton:SetPoint("TOP", -68, -125)

	local SkinsGameMenuButton = CreateFrame("Button", "SkinsGameMenuButton", GameMenuFrame, "GameMenuButtonTemplate")
	SkinsGameMenuButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -1)
	SkinsGameMenuButton:Size(GameMenuButtonLogout:GetWidth(),GameMenuButtonLogout:GetHeight())
	AS:SkinButton(SkinsGameMenuButton)
	SkinsGameMenuButton:FontString("text", AS.Font, 12, "NONE")
	SkinsGameMenuButton.text:SetPoint("CENTER", SkinsGameMenuButton, 0, 0)
	SkinsGameMenuButton.text:SetText("Skins")
	SkinsGameMenuButton:SetScript("OnClick", function() SkinOptions:Show() HideUIPanel(GameMenuFrame) end)
	GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -38)
	GameMenuFrame:Height(GameMenuFrame:GetHeight() + 26)
	if IsAddOnLoaded("stAddonmanager") then 
		GameMenuFrame:HookScript("OnShow",function()
			SkinsGameMenuButton:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -23)
			GameMenuButtonLogout:Point("TOP", GameMenuButtonMacros, "BOTTOM", 0 , -60)
		end)
	end

	local function CreateButton(name,buttonText,addon,option,x,y,skinOptions2)
		local button = CreateFrame("Button", name, skinOptions2 and SkinOptions2 or SkinOptions)
		local yOffset = -30 - (25*(y-1))
		local xTable = {
			[1] = { point = "TOPLEFT", offset = 12 },
			[2] = { point = "TOPLEFT", offset = 200 },
			[3] = { point = "TOPLEFT", offset = 388 },
			[4] = { point = "TOPLEFT", offset = 576 },
		}
		button:SetPoint(xTable[x].point, xTable[x].offset, yOffset)
		button:Size(16)
		AS:SkinBackdropFrame(button)
		button:SetBackdrop({bgFile = AS.NormTex, tile = false, tileSize = 0})
		button:FontString("text", AS.Font, 12, "OUTLINE")
		button.text:SetPoint("LEFT", button, "RIGHT", 10, 0)
		button.text:SetText(buttonText)
		button:SetScript("OnShow", function(self)
			local r, g, b = .68, .14, .14
			if AS:CheckOption(option) then
				r, g, b = .11, .66, .11
			end
			self:SetBackdropColor(r, g, b)
		end)
		button:SetScript("OnClick", function(self)
			local r, g, b = .68, .14, .14
			AS:ToggleOption(option)
			if AS:CheckOption(option) then
				r, g, b = .11, .66, .11
			end
			self:SetBackdropColor(r, g, b)
		end)
	end

	local function pairsByKeys(t, f)
		local a = {}
		for n in pairs(t) do tinsert(a, n) end
			sort(a, f)
			local i = 0
			local iter = function()
				i = i + 1
				if a[i] == nil then return nil
				else return a[i], t[a[i]]
			end
		end
		return iter
	end
    local curX, curY, maxY = 1, 1, 24
	for skin, options in pairsByKeys(AS.Skins) do
		local addon
		if options and options.addon then
			addon = options.addon
		else
			addon = gsub(skin, "Skin", "")
		end
		local buttonText = options.buttonText or addon
		if options.hide ~= true and IsAddOnLoaded(addon) then
			CreateButton(format('%sButton',skin),buttonText,addon,skin,curX,curY)
			SkinOptions:Height(70+(curY*22))
			SkinOptions2:Height(70+(curY*22))
			SkinOptions3:Height(70+(curY*22))
			if SkinOptions:GetHeight() < 210 then
				SkinOptions:Height(210)
				SkinOptions2:Height(210)
				SkinOptions3:Height(210)
			end
			curY = curY + 1
			if curY > maxY then
				curX = curX + 1
				curY = 1
			end
		end
	end

	local Skins2 = {
		["DBMSkinHalf"] = {
			["buttonText"] = "DBM Half-Bar Skin",
			["addon"] = "DBM-Core",
		},
		["CLCProtSkin"] = {
			["buttonText"] = "CLCProt Icons",
			["addon"] = "CLCProt",
		},
		["CLCRetSkin"] = {
			["buttonText"] = "CLCRet Icons",
			["addon"] = "CLCRet",
		},
		["WeakAurasSkin"] = {
			["buttonText"] = "WeakAuras Icons",
			["addon"] = "WeakAuras",
		},
	}

	curY = 1
	for skin, options in pairsByKeys(Skins2) do
		local addon = options.addon
		local buttonText = options.buttonText
		CreateButton(format('%sButton',skin),buttonText,addon,skin,1,curY,true)
		curY = curY + 1
	end

	SLASH_SKINOPTIONSWINDOW1 = '/skinoptions';
	function SlashCmdList.SKINOPTIONSWINDOW(msg, editbox)
		if SkinOptions:IsVisible() then
			SkinOptions:Hide()
		else
			SkinOptions:Show()
		end
	end
end