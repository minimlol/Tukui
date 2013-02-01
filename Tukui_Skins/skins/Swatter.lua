if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
if IsAddOnLoaded("!BugGrabber") then return end
if IsAddOnLoaded("!ImprovedErrorFrame") then return end
local U = unpack(select(2,...))
local name = "SwatterSkin"
local function SkinSwatter(self)
	if SwatterErrorFrame then
		U.SkinFrame(SwatterErrorFrame)
		U.SkinButton(Swatter.Error.Done)
		U.SkinButton(Swatter.Error.Next)
		U.SkinButton(Swatter.Error.Prev)
		U.SkinButton(Swatter.Drag)
		U.SkinScrollBar(SwatterErrorInputScrollScrollBar)
	end
end

U.RegisterSkin(name,SkinSwatter)