if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end

local U = unpack(select(2,...))
local s = U.s
local c = U.c

function U.Round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function U.SkinButton(self, strip)
	if self == nil then return end
	self:SkinButton(strip)
end

function U.SkinScrollBar(self)
	if self == nil then return end
	self:SkinScrollBar()
end

function U.SkinTab(self, strip)
	if self == nil then return end
	if strip then self:StripTextures(True) end
	self:SkinTab()
end

function U.SkinNextPrevButton(self, horizonal)
	if self == nil then return end
	self:SkinNextPrevButton(horizonal)
end

function U.SkinRotateButton(self)
	if self == nil then return end
	self:SkinRotateButton()
end

function U.SkinEditBox(self, width, height)
	if self == nil then return end
	self:SkinEditBox()
	if width then self:SetWidth(width) end
	if height then self:SetHeight(height) end
end

function U.SkinDropDownBox(self, width)
	if self == nil then return end
	self:SkinDropDownBox(width)
end

function U.SkinCheckBox(self)
	if self == nil then return end
	self:SkinCheckBox()
end

function U.SkinCloseButton(self)
	if self == nil then return end
	self:SkinCloseButton()
end

function U.SkinSlideBar(self, height, movetext)
	if self == nil then return end
	self:SkinSlideBar(height, movetext)
end

function U.RegisterForPetBattleHide(frame)
	if frame.IsVisible and frame:GetName() then
		U.FrameLocks[frame:GetName()] = { shown = false }
	end
end

function U.SkinFrame(self, template, overridestrip)
	if self == nil then return end
	if not template then template = "Transparent" end
	if not overridestrip then self:StripTextures(True) end
	self:SetTemplate(template)
end

function U.SkinBackdropFrame(self, strip, icon)
	if self == nil then return end
	if strip then self:StripTextures(True) end
	if not icon then
		self:CreateBackdrop()
	else
		if self.icon then self.icon:SetTexCoord(0.12, 0.88, 0.12, 0.88) end
		if _G[self:GetName().."_Background"] then _G[self:GetName().."_Background"]:SetTexCoord(0.12, 0.88, 0.12, 0.88) end
	end
end

function U.SkinStatusBar(self, ClassColor)
	if self == nil then return end
	local c = U.c
	U.SkinBackdropFrame(self, true)
	self:SetStatusBarTexture(c["media"].normTex)
	if ClassColor then
		local color = RAID_CLASS_COLORS[U.ccolor]
		self:SetStatusBarColor(color.r, color.g, color.b)
	end
end

function U.SkinTooltip(tooltip, scale)
	if tooltip == nil then return end
	tooltip:HookScript("OnShow", function(self)
		self:SetTemplate("Transparent")
		if scale then self:SetScale(c["general"].uiscale) end
	end)
end

function U.SkinIconButton(self, strip, style, shrinkIcon)
	if self == nil then return end
	if self.isSkinned then return end

	if strip then self:StripTextures() end
	self:CreateBackdrop("Default", true)
	if style then self:StyleButton() end

	local icon = self.icon
	if self:GetName() and _G[self:GetName().."IconTexture"] then
		icon = _G[self:GetName().."IconTexture"]
	elseif self:GetName() and _G[self:GetName().."Icon"] then
		icon = _G[self:GetName().."Icon"]
	end

	if icon then
		icon:SetTexCoord(.08,.88,.08,.88)

		if shrinkIcon then
			self.backdrop:SetAllPoints()
			icon:SetInside(self)
		else
			self.backdrop:SetOutside(icon)
		end
		icon:SetParent(self.backdrop)
	end
	self.isSkinned = true
end

function U.Desaturate(self, point)
	if self == nil then return end
	for i = 1, self:GetNumRegions() do
		local region = select(i, self:GetRegions())
		if region:GetObjectType() == "Texture" then
			region:SetDesaturated(1)
			if region:GetTexture() == "Interface\\DialogFrame\\UI-DialogBox-Corner" then
				region:Kill()
			end
		end
	end	

	if point then
		self:Point("TOPRIGHT", point, "TOPRIGHT", 2, 2)
	end
end

function U.CheckOption(optionName,...)
	for i = 1,select('#',...) do
		local addon = select(i,...)
		if not addon then break end
		if not IsAddOnLoaded(addon) then return false end
	end
	return UISkinOptions[optionName] == "Enabled"
end

function U.DisableOption(optionName)
	UISkinOptions[optionName] = "Disabled"
end

function U.EnableOption(optionName)
	UISkinOptions[optionName] = "Enabled"
end

function U.ToggleOption(optionName)
	if U.CheckOption(optionName) then
		U.DisableOption(optionName)
	else
		U.EnableOption(optionName)
	end
end

function U.RegisterSkin(skinName,skinFunc,...)
	local XS = U.x
	local events = {}
	for i = 1,select('#',...) do
		local event = select(i,...)
		if not event then break end
		events[event] = true
	end
	local registerMe = { func = skinFunc, events = events }
	if not XS.register[skinName] then XS.register[skinName] = {} end
	XS.register[skinName][skinFunc] = registerMe
end

function U.UnregisterEvent(skinName,frame,event)
	local XS = U.x
	XS:UnregisterEvent(skinName,event)
end

function U.AddNonPetBattleFrames()
	for frame,data in pairs(U.FrameLocks) do
		if data.shown then
			_G[frame]:Show()
		end
	end
end

function U.RemoveNonPetBattleFrames()
	for frame,data in pairs(U.FrameLocks) do
		if(_G[frame]:IsVisible()) then
			data.shown = true
			_G[frame]:Hide()
		else
			data.shown = false
		end
	end
end

local waitTable = {}
local waitFrame
function U.Delay(delay, func, ...)
	if(type(delay)~="number" or type(func)~="function") then
		return false
	end
	if(waitFrame == nil) then
		waitFrame = CreateFrame("Frame")
		waitFrame:SetScript("OnUpdate",function (self,elapse)
			local count = #waitTable
			local i = 1
			while(i<=count) do
				local waitRecord = tremove(waitTable,i)
				local d = tremove(waitRecord,1)
				local f = tremove(waitRecord,1)
				local p = tremove(waitRecord,1)
				if(d>elapse) then
				  tinsert(waitTable,i,{d-elapse,f,p})
				  i = i + 1
				else
				  count = count - 1
				  f(unpack(p))
				end
			end
		end)
	end
	tinsert(waitTable,{delay,func,{...}})
	return true
end
local G = U.G
U.ChatBackgroundRight = AsphyxiaUI and AsphyxiaUIChatBackgroundRight or G.Panels.RightChatBackground
U.ChatBackgroundLeft = AsphyxiaUI and AsphyxiaUIChatBackgroundLeft or G.Panels.LeftChatBackground
U.InfoLeft = AsphyxiaUI and AsphyxiaUIDataPanelLeft or G.Panels.DataTextLeft
U.InfoRight = AsphyxiaUI and AsphyxiaUIDataPanelRight or G.Panels.DataTextRight
U.TabsRightBackground = AsphyxiaUI and AsphyxiaUIChatTabBackgroundRight or G.Panels.RightChatTabsBackground
U.TabsLeftBackground = AsphyxiaUI and AsphyxiaUIChatTabBackgroundLeft or G.Panels.LeftChatTabsBackground
U.Minimap = AsphyxiaUI and AsphyxiaUIMinimap or G.Maps.Minimap
U.Tooltip = AsphyxiaUI and AsphyxiaUITooltipAnchor or G.Tooltips.GameTooltip.Anchor