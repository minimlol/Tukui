if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "FlightMapEnhancedSkin"
local function SkinFlightMapEnhanced()
	U.SkinBackdropFrame(FlightMapEnhancedTaxiChoice, true)
	U.SkinCloseButton(FlightMapEnhancedTaxiChoice.CloseButton)
	U.SkinScrollBar(FlightMapEnhancedTaxiChoiceContainerScrollBar)
	FlightMapEnhancedTaxiChoice:HookScript("OnShow", function()
		for i = 1, 34 do
			if _G["FlightMapEnhancedTaxiChoiceContainerButton"..i] then _G["FlightMapEnhancedTaxiChoiceContainerButton"..i]:StripTextures() end
		end
	end)
	hooksecurefunc("FlightMapEnhancedTaxiChoiceButton_OnEnter", function() GameTooltip:Show() end)
end
U.RegisterSkin(name, SkinFlightMapEnhanced)