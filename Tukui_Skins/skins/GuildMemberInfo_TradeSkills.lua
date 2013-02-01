if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "GuildMemberInfo_TradeSkillsSkin"
local function SkinGuildMemberInfo_TradeSkills()
	U.SkinFrame(GMIFrame)
	U.SkinIconButton(GMItsButton1, true)
	U.SkinIconButton(GMItsButton2, true)
	GMItsIcon1:SetTexCoord(0.12, 0.88, 0.12, 0.88)
	GMItsIcon2:SetTexCoord(0.12, 0.88, 0.12, 0.88)
end
U.RegisterSkin(name, SkinGuildMemberInfo_TradeSkills)