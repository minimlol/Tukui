if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "OmenSkin"
function AS:SkinOmen()
	if TukuiThreatBar then TukuiThreatBar:Kill() end

	Omen.UpdateBarTextureSettings_ = Omen.UpdateBarTextureSettings
	Omen.UpdateBarTextureSettings = function(self)
		self:UpdateBarTextureSettings_()
		--[[for i, v in ipairs(self.Bars) do
			v.texture:SetTexture(AS.NormTex)
		end]]
	end

	Omen.UpdateBarLabelSettings_ = Omen.UpdateBarLabelSettings
	Omen.UpdateBarLabelSettings = function(self)
		self:UpdateBarLabelSettings_()
		--[[for i, v in ipairs(self.Bars) do
			v.Text1:SetFont(AS.Font, AS.DataTextFontSize)
			v.Text2:SetFont(AS.Font, AS.DataTextFontSize)
			v.Text3:SetFont(AS.Font, AS.DataTextFontSize)
		end]]
	end

	Omen.UpdateTitleBar_ = Omen.UpdateTitleBar
	Omen.UpdateTitleBar = function(self)
		Omen.db.profile.Scale = 1
		Omen.db.profile.Background.EdgeSize = 1
		Omen.db.profile.Background.BarInset = 2
		Omen.db.profile.TitleBar.UseSameBG = true
		self:UpdateTitleBar_()
		self.Title:SetHeight(23)
		self.TitleText:SetFont(AS.Font, AS.DataTextFontSize)
		self.TitleText:ClearAllPoints()
		self.TitleText:SetPoint("CENTER")
		self.BarList:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, 1)
	end

	Omen.UpdateBackdrop_ = Omen.UpdateBackdrop
	Omen.UpdateBackdrop = function(self)
		Omen.db.profile.Scale = 1
		Omen.db.profile.Background.EdgeSize = 1
		Omen.db.profile.Background.BarInset = 2
		self:UpdateBackdrop_()
		AS:SkinFrame(self.BarList, "Default")
		AS:SkinFrame(self.Title, "Default")
		self.BarList:SetPoint("TOPLEFT", self.Title, "BOTTOMLEFT", 0, 1)
	end

	local omen_mt = getmetatable(Omen.Bars)
	local oldidx = omen_mt.__index
	omen_mt.__index = function(self, barID)
		local bar = oldidx(self, barID)
		Omen:UpdateBarTextureSettings()
		Omen:UpdateBarLabelSettings()
		return bar
	end

	Omen.db.profile.Bar.Spacing = 1
	Omen:UpdateBarTextureSettings()
	Omen:UpdateBarLabelSettings()
	Omen:UpdateTitleBar()
	Omen:UpdateBackdrop()
	Omen:ReAnchorBars()
	Omen:ResizeBars()
end

AS:RegisterSkin(name, AS.SkinOmen)