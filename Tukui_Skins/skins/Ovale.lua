if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local U = unpack(select(2,...))
local c = U.c
local name = "OvaleSkin"
local function SkinOvale(self)
-- U.Delay(5, function()
	-- Icon1n1:GetParent():StripTextures()
	-- for i = 1, 3 do
		-- U.SkinBackdropFrame(_G["Icon"..i.."n1"], true)
		-- _G["Icon"..i.."n1"].backdrop:SetFrameLevel(0)
		-- _G["Icon"..i.."n1"].backdrop:SetAllPoints()
		-- _G["Icon"..i.."n1"].backdrop:SetScale(c["general"].uiscale)
		-- _G["Icon"..i.."n1"].icone:SetInside(_G["Icon"..i.."n1"].backdrop, 1, 1)
	-- end
-- end)
end

U.RegisterSkin(name,SkinOvale)