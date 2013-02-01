if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "CoolLineSkin"
local c = U.c
local s = U.s

local function SkinCoolLine(self)
	CoolLineDB.bgcolor = { r = 0, g = 0, b = 0, a = 0, }
	CoolLineDB.border  = "None"
	CoolLine.updatelook()
	U.SkinBackdropFrame(CoolLine)
	CoolLine.backdrop:SetAllPoints(CoolLine)
	if IsAddOnLoaded("AzilSettings") then CoolLine.backdrop:CreateBackdrop() end
	CoolLine.backdrop:CreateShadow()
	PetBattleFrame:HookScript("OnShow", function() CoolLine:Hide() end)
	PetBattleFrame:HookScript("OnHide", function() CoolLine:Show() end)
	if U.CheckOption("CoolLineEmbed") then
		if not CoolLineDB.vertical then
			if DuffedUI then
				if C["actionbar"]["layout"] == 1 then
					DuffedUIBar2:HookScript("OnShow", function() 
						CoolLine:SetPoint("BOTTOMRIGHT", DuffedUIBar2, "TOPRIGHT", -2, 4)
						CoolLine:SetPoint("BOTTOMLEFT", DuffedUIBar2, "TOPLEFT", 2, 4)
					end)
					DuffedUIBar2:HookScript("OnHide", function() 
						CoolLine:SetPoint("BOTTOMRIGHT", DuffedUIBar1, "TOPRIGHT", -2, 4)
						CoolLine:SetPoint("BOTTOMLEFT", DuffedUIBar1, "TOPLEFT", 2, 4)
					end)
				elseif C["actionbar"]["layout"] == 2 then
					CoolLine:Point('BOTTOM', DuffedUIBar1, 'TOP', 0, 1)
				end
			end
			if Tukui then
				CoolLine:SetPoint("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", -2, 4)
				CoolLine:SetPoint("BOTTOMLEFT", InvTukuiActionBarBackground, "TOPLEFT", 2, 4)
			end
			if AsphyxiaUI then
				CoolLine:SetPoint("BOTTOMRIGHT", AsphyxiaUIActionBar1, "TOPRIGHT", -2, 4)
				CoolLine:SetPoint("BOTTOMLEFT", AsphyxiaUIActionBar1, "TOPLEFT", 2, 4)				
			end
		else
			print("Sorry will not embed a vertical frame.")
		end
	CoolLine.updatelook()
	end
end

U.RegisterSkin(name,SkinCoolLine)