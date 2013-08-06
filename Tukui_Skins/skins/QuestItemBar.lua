if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "QuestItemBarSkin"
function AS:SkinQuestItemBar()
	hooksecurefunc(QuestItemBar,"LibQuestItem_Update", function()
		for i = 1, 99 do
			if _G["QuestItemBarButton"..i] then AS:SkinIconButton(_G["QuestItemBarButton"..i], true, true, true) end
		end
		QuestItemBar:UpdateBar()
	end)
end

AS:RegisterSkin(name, AS.SkinQuestItemBar)