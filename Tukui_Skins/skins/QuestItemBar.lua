if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local name = "QuestItemBarSkin"
local function SkinQuestItemBar(self)
	hooksecurefunc(QuestItemBar,"LibQuestItem_Update", function()
		for i = 1, 99 do
			if _G["QuestItemBarButton"..i] then U.SkinIconButton(_G["QuestItemBarButton"..i], true, true, true) end
		end
		QuestItemBar:UpdateBar()
	end)
end
U.RegisterSkin(name,SkinQuestItemBar)