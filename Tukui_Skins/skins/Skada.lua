if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "SkadaSkin"
local function SkinSkada(self)
	local s = U.s
	local c = U.c
	local Skada = Skada
	local barSpacing = 0
	local borderWidth = 1
	local barmod = Skada.displays["bar"]
	local function StripOptions(options)
		options.baroptions.args.barspacing = nil
		options.titleoptions.args.texture = nil
		options.titleoptions.args.bordertexture = nil
		options.titleoptions.args.thickness = nil
		options.titleoptions.args.margin = nil
		options.titleoptions.args.color = nil
		options.windowoptions = nil
	end
	
	local ResetFrame = CreateFrame("Frame", nil, UIParent)
	ResetFrame:SetTemplate("Transparent")
	ResetFrame:SetSize(250, 70)
	ResetFrame:SetPoint("CENTER", UIParent, "CENTER")
	ResetFrame:SetFrameStrata("DIALOG")
	ResetFrame:Hide()
	local ResetText = ResetFrame:CreateFontString(nil, "Overlay")
	ResetText:SetFontObject(ChatFontNormal)
	ResetText:SetPoint("TOP", ResetFrame, "TOP", 0, -10)
	ResetText:SetText("Do you want to reset Skada?")
	local ResetAccept = CreateFrame("Button", nil, ResetFrame)
	U.SkinButton(ResetAccept)
	ResetAccept:SetSize(70, 25)
	ResetAccept:SetPoint("RIGHT", ResetFrame, "BOTTOM", -1, 20)
	ResetAccept:SetScript("OnClick", function(self) Skada:Reset() self:GetParent():Hide() end)
	local ResetAcceptText = ResetAccept:CreateFontString(nil, "Overlay")
	ResetAcceptText:SetFontObject(ChatFontNormal)
	ResetAcceptText:SetPoint("CENTER")
	ResetAcceptText:SetText("Yes")
	local ResetClose = CreateFrame("Button", nil, ResetFrame)
	U.SkinButton(ResetClose)
	ResetClose:SetSize(70, 25)
	ResetClose:SetPoint("LEFT", ResetFrame, "BOTTOM", 1, 20)
	ResetClose:SetScript("OnClick", function(self) self:GetParent():Hide() end)
	local ResetCloseText = ResetClose:CreateFontString(nil, "Overlay")
	ResetCloseText:SetFontObject(ChatFontNormal)
	ResetCloseText:SetPoint("CENTER")
	ResetCloseText:SetText("No")
	
	function Skada:ShowPopup()
		ResetFrame:Show()
	end
	
	local barmod = Skada.displays["bar"]
	barmod.AddDisplayOptions_ = barmod.AddDisplayOptions
	barmod.AddDisplayOptions = function(self, win, options)
		self:AddDisplayOptions_(win, options)
		StripOptions(options)
	end

	for k, options in pairs(Skada.options.args.windows.args) do
		if(options.type == "group") then
			StripOptions(options.args)
		end
	end

	local titleBG = {
		bgFile = c["media"].blank,
		tile = false,
		tileSize = 0
	}

	barmod.ApplySettings_ = barmod.ApplySettings
	barmod.ApplySettings = function(self, win)
		barmod.ApplySettings_(self, win)

		local skada = win.bargroup

		if(win.db.enabletitle) then
			skada.button:SetBackdrop(titleBG)
		end

		skada:SetTexture(c["media"].normTex)
		skada:SetSpacing(barSpacing)
		skada:SetFrameLevel(5)
		
		--[[
		if not skada.TitleBackGround then
			skada.TitleBackGround = CreateFrame("Frame", nil, skada.button)
			skada.TitleBackGround:SetPoint("TOP")
			skada.TitleBackGround:SetPoint("LEFT")
			skada.TitleBackGround:SetPoint("RIGHT")
			skada.TitleBackGround:SetPoint("BOTTOM", 0, 1)
			U.SkinFrame(skada.TitleBackGround,"Default")
			skada.TitleBackGround:SetFrameLevel(skada.button:GetFrameLevel() -1)
		end
		--]]
		
		local titlefont = CreateFont("TitleFont" .. win.db.name)
		skada.button:SetNormalFontObject(titlefont)
		local color = win.db.title.color
		skada.button:SetBackdropColor(0, 0, 0, 0)

		skada:SetBackdrop(nil)

		if not skada.backdrop then
			U.SkinBackdropFrame(skada)
		end

		skada.backdrop:ClearAllPoints()
		if(win.db.enabletitle) then
			skada.backdrop:Point("TOPLEFT", skada.button, "TOPLEFT", -2, 2)
		else
			skada.backdrop:Point("TOPLEFT", skada, "TOPLEFT", -2, 2)
		end
		skada.backdrop:Point("BOTTOMRIGHT", skada, "BOTTOMRIGHT", 2, -2)
		if (not U.CheckOption("SkadaBackdrop")) then skada.backdrop:Hide() end
		if (U.CheckOption("EmbedSkada")) then
			if UISkinOptions.EmbedLeft == "Skada" then
				win.bargroup:SetParent(EmbeddingWindowLeft)
			else
				win.bargroup:SetParent(EmbeddingWindow)
			end
			win.bargroup:SetFrameLevel(10)
		end
	end
end

U.RegisterSkin(name,SkinSkada)