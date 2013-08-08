if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local HolderFrames = {}
local HolderUpdate = CreateFrame("Frame")

local OnUpdateHolders = function(self)
	for i = 1, #HolderFrames do
		if HolderFrames[i]:IsMouseOver() then
			HolderFrames[i].MousedOver = true
		elseif (HolderFrames[i].MousedOver and not HolderFrames[i]:IsMouseOver()) then
			HolderFrames[i].MousedOver = false
		end
	end
end

local ShowHolders = function()
	for i = 1, #HolderFrames do
		UIFrameFadeIn(HolderFrames[i], 0.4, 0, 1)
	end
end

local HideHolders = function()
	for i = 1, #HolderFrames do
		UIFrameFadeOut(HolderFrames[i], 0.4, 1, 0)
	end
end

local IsObjectHeld = function(obj)
	for i = 1, #HolderFrames do
		if (HolderFrames[i].Holding == obj) then
			return HolderFrames[i]
		end
	end
end

local Snap = function(self)
	local Chosen

	for i = 1, #HolderFrames do
		if (HolderFrames[i].MousedOver and not HolderFrames[i].Holding) then
			Chosen = HolderFrames[i]
			break
		end
	end
	
	if IsObjectHeld(self) then
		local Holder = IsObjectHeld(self)
		Holder.Holding = nil
	end
	
	if (not Chosen) then
		return
	end

	self:ClearAllPoints()
	self:Point("TOPLEFT", Chosen, "TOPLEFT", 0, 0)
	self:Point("BOTTOMRIGHT", Chosen, "BOTTOMRIGHT", 0, 0)
	Chosen.Holding = self
end

local OnDragStart = function(self)
	HolderUpdate:SetScript("OnUpdate", OnUpdateHolders)
	ShowHolders()
	self.Moving = true
	self:SetUserPlaced(true)
	self:StartMoving()
	Snap(self)
end

local OnDragStop = function(self)
	HolderUpdate:SetScript("OnUpdate", nil)
	HideHolders()
	self.Moving = false
	self:StopMovingOrSizing()
	Snap(self)
end

function AS:SnapHolder(frame)
	frame.MousedOver = false
	frame.Holding = nil
	tinsert(HolderFrames, frame)
	HideHolders()
end

function AS:SnapFrame(frame)
	frame:SetMovable(true)
	frame:EnableMouse(true)
	frame:SetClampedToScreen(true)
	frame:RegisterForDrag("LeftButton", "RightButton")
	frame:HookScript("OnDragStart", OnDragStart)
	frame:HookScript("OnDragStop", OnDragStop)
	frame:HookScript("OnMouseUp", Snap)
end