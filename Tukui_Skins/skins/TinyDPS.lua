if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

local name = "TinyDPSSkin"
function AS:SkinTinyDPS()
	AS:SkinFrame(tdpsFrame)
	if tdps then
		tdps.width = AS.Minimap:GetWidth()
	end
	if tdpsStatusBar then
		tdpsStatusBar:SetBackdrop({bgFile = AS.NormTex, edgeFile = AS.Blank, tile = false, tileSize = 0, edgeSize = 1})
		tdpsStatusBar:SetStatusBarTexture(AS.NormTex)
	end
end

AS:RegisterSkin(name, AS.SkinTinyDPS)