if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "GuildMemberInfo_TradeSkillsSkin"
function AS:SkinGuildMemberInfo_TradeSkills()
	AS:SkinFrame(GMIFrame)
	AS:SkinIconButton(GMItsButton1, true)
	AS:SkinIconButton(GMItsButton2, true)
	GMItsIcon1:SetTexCoord(0.12, 0.88, 0.12, 0.88)
	GMItsIcon2:SetTexCoord(0.12, 0.88, 0.12, 0.88)
end

AS:RegisterSkin(name, AS.SkinGuildMemberInfo_TradeSkills)