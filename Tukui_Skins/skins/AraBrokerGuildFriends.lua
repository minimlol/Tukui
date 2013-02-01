if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))

local name = "AraBrokerGuildFriendsSkin"
local function SkinAraBrokerGuildFriends(self)
	AraBrokerGuildFriends:SetScript("OnUpdate", function(self) U.SkinFrame(self) end)
end

U.RegisterSkin(name,SkinAraBrokerGuildFriends)