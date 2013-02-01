if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "SexyCooldownSkin"
local c = U.c
local s = U.s

local function SCDStripSkinSettings(bar)
	-- Remove conflicting options
	bar.optionsTable.args.icon.args.borderheader = nil
	bar.optionsTable.args.icon.args.border = nil
	bar.optionsTable.args.icon.args.borderColor = nil
	bar.optionsTable.args.icon.args.borderSize = nil
	bar.optionsTable.args.icon.args.borderInset = nil
	--bar.optionsTable.args.icon.args.sizeOffset = nil
	bar.optionsTable.args.bar.args.bnbheader = nil
	bar.optionsTable.args.bar.args.texture = nil
	bar.optionsTable.args.bar.args.backgroundColor = nil
	bar.optionsTable.args.bar.args.border = nil
	bar.optionsTable.args.bar.args.borderColor = nil
	bar.optionsTable.args.bar.args.borderSize = nil
	bar.optionsTable.args.bar.args.borderInset = nil
end

-- Skin Bars
local function SkinSexyCooldownBar(bar)
	SCDStripSkinSettings(bar)
	U.SkinFrame(bar)
	cRegisterForPetBattleHide(bar)
	if(U.CheckOption("EmbedSexyCooldown")) then
		bar:ClearAllPoints()
		if DuffedUI then
			if C["actionbar"]["layout"] == 1 then
				DuffedUIBar2:HookScript("OnShow", function() 
					bar:Point('BOTTOM', DuffedUIBar2, 'TOP', 0, 1)
					bar:SetHeight(ActionButton1:GetHeight())
					bar:SetWidth(DuffedUIBar2:GetWidth())
				end)
				DuffedUIBar2:HookScript("OnHide", function() 
					bar:Point('BOTTOM', DuffedUIBar1, 'TOP', 0, 1)
					bar:SetHeight(ActionButton1:GetHeight())
					bar:SetWidth(DuffedUIBar1:GetWidth())
				end)
			elseif C["actionbar"]["layout"] == 2 then
				bar:Point('BOTTOM', DuffedUIBar1, 'TOP', 0, 1)
			end
		end
		if Tukui then
			bar:Point('BOTTOM', InvTukuiActionBarBackground, 'TOP', 0, 1)
			bar:SetHeight(ActionButton1:GetHeight())
			bar:SetWidth(TukuiBar1:GetWidth())
		end
		if AsphyxiaUI then
			if IsAddOnLoaded("AzilSettings") then
				bar:Point('BOTTOM', AsphyxiaUIActionBar1, 'TOP', 0, 16)
			end
			bar:Point('BOTTOM', AsphyxiaUIActionBar1, 'TOP', 0, 1)
			bar:SetHeight(ActionButton1:GetHeight())
			bar:SetWidth(AsphyxiaUIActionBar1:GetWidth())
		end
		bar:CreateShadow()
		bar:EnableMouse(false)
	end
end


-- Skin Icons
local function SkinSexyCooldownIcon(bar, icon)
	if not icon.skinned then
		U.SkinFrame(icon)
		U.SkinBackdropFrame(icon.overlay, false)
		icon.tex:SetTexCoord(0.08, 0.92, 0.08, 0.92)
		icon.tex.SetTexCoord = function() end
		icon.skinned = true
	end
end

local function SkinSexyCooldownLabel(bar,label,store)
	if not label.skinned then
		label:SetFont(c["media"].pixelfont, store.fontsize, "OUTLINE")
	end
end
local function SkinSexyCooldownBackdrop(bar)
	bar:SetTemplate("Transparent")
end

local function HookSCDBar(bar)
	hooksecurefunc(bar,"UpdateBarLook",SkinSexyCooldownBar)
	hooksecurefunc(bar,"UpdateSingleIconLook", SkinSexyCooldownIcon)
	hooksecurefunc(bar,"UpdateLabel",SkinSexyCooldownLabel)
	hooksecurefunc(bar,"UpdateBarBackdrop", SkinSexyCooldownBackdrop)
	bar.settings.icon.borderInset = 0
end

local function SkinSexyCooldown(self)
	local scd = SexyCooldown2
	scd.CreateBar_ = scd.CreateBar
	scd.CreateBar = function(self, settings, name)
		local bar = scd:CreateBar_(settings,name)
		HookSCDBar(bar)
		return bar
	end

	for _,bar in ipairs(scd.bars) do
		HookSCDBar(bar)
		bar:UpdateBarLook()
	end
end

U.RegisterSkin(name,SkinSexyCooldown)