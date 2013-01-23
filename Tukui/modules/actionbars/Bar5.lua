local T, C, L, G = unpack(select(2, ...)) 

if not C["actionbar"].enable == true then return end

---------------------------------------------------------------------------
-- setup MultiBarLeft as bar #5
---------------------------------------------------------------------------

local bar = TukuiBar5
MultiBarLeft:SetParent(bar)

for i= 1, 12 do
	local b = _G["MultiBarLeftButton"..i]
	local b2 = _G["MultiBarLeftButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("TOPLEFT", bar, "TOPLEFT", T.buttonspacing, -T.buttonspacing)
	else
		b:SetPoint("TOP", b2, "BOTTOM", 0, -T.buttonspacing)
	end
	
	G.ActionBars.Bar5["Button"..i] = b
end

RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
