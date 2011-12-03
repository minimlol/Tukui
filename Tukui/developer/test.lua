-- temp code to fix a stupid Blizzard bug
local FuckShitBalls = CreateFrame("Frame")
FuckShitBalls:RegisterEvent("CVAR_UPDATE")
FuckShitBalls:RegisterEvent("PLAYER_ENTERING_WORLD")
FuckShitBalls:SetScript("OnEvent", function()
	SetCVar("profanityFilter", 0)
end)