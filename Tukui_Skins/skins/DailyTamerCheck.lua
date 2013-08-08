if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "DailyTamerCheckSkin"
function AS:SkinDailyTamerCheck()
	local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
	local _tamerquestcheck
	if not _tamerquestcheck then
		_tamerquestcheck = SlashCmdList["DAILYTAMERCHECK"]
		SlashCmdList["DAILYTAMERCHECK"] = function()
			_tamerquestcheck()
			AS:SkinFrame(DailyTamerCheck_mainframe)
		end
		local DTC = ldb:GetDataObjectByName("DailyTamerCheck")
		DTC.OnClick = function(frame, button)
			_tamerquestcheck()
			AS:SkinFrame(DailyTamerCheck_mainframe)
		end
	end
end

AS:RegisterSkin(name, AS.SkinDailyTamerCheck)