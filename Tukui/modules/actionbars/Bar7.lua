local T, C, L, G = unpack(select(2, ...)) 
if not C["actionbar"].enable == true or not T.lowversion then return end

local bar = TukuiBar7
bar:SetAlpha(1)
MultiBarBottomRight:SetParent(bar)

for i= 1, 12 do
	local b = _G["MultiBarBottomRightButton"..i]
	local b2 = _G["MultiBarBottomRightButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if i == 1 then
		b:SetPoint("TOP", bar, 0, -T.buttonspacing)
	else
		b:SetPoint("TOP", b2, "BOTTOM", 0, -T.buttonspacing)
	end
	
	G.ActionBars.Bar7["Button"..i] = b
end

RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")

