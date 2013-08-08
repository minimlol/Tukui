if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local AS = unpack(select(2,...))

AS.Skins = {
	["ACPSkin"] = {
		["buttonText"] = "Addon Control Panel",
	},
	["AraBrokerGuildFriendsSkin"] = {
		["buttonText"] = "Ara Broker Guild Friends",
		["addon"] = "Ara_Broker_Guild_Friends",
	},
	["AraBrokerTradeskillsSkin"] = {
		["buttonText"] = "Ara Broker Tradeskills",
		["addon"] = "Ara_Broker_Tradeskills",
	},
	['ArhSkin'] = {
		["buttonText"] = "Archaeology Helper",
	},
	["AtlasLootSkin"] = {
		["buttonText"] = "AtlasLoot",
		["addon"] = "AtlasLoot_Loader",
	},
	["ATSWSkin"] = {
		["addon"] = "AdvancedTradeSkillWindow",
	},
	["AuctioneerSkin"] = {
		["buttonText"] = "Auctioneer",
		["addon"] = "Auc-Advanced"
	},
	["BPTSkin"] = {
		["buttonText"] = "Balance Power Tracker",
		["addon"] = "BalancePowerTracker",
	},
	["DBMSkin"] = {
		["buttonText"] = "DBM",
		["addon"] = "DBM-Core",
	},
	["ExtVendorSkin"] = {
		["buttonText"] = "Extended Vendor",
	},
	["KarniCrapSkin"] = {
		["buttonText"] = "Karni's Crap Filter",
	},
	["LootCouncilLiteSkin"] = {
		["addon"] = "LootCouncil_Lite",
	},
	["MRTSkin"] = {
		["buttonText"] = "Mizus Raid Tracker",
		["addon"] = "MizusRaidTracker",
	},
	["OgriLazySkin"] = {
		["addon"] = "Ogri'Lazy",
	},
	["RaidInviteOrganizerSkin"] = {
		["buttonText"] = "Raid Invite Organizer",
	},
	["RaidBuffStatusSkin"] = {
		["buttonText"] = "Raid Buff Status",
	},
	["SearingPlasmaTrackerSkin"] = {
		["buttonText"] = "Searing Plasma Tracker",
	},
	["SexyCooldownSkin"] = {
		["buttonText"] = "SexyCooldown 2",
		["addon"] = "SexyCooldown2",
	},
	["ShieldMonitorSkin"] = {
		["buttonText"] = "Shield Monitor",
		["addon"] = "shieldmonitor",
	},
	["SpineCounterSkin"] = {
		["buttonText"] = "Spine Blood Counter",
	},
	["SwatterSkin"] = {
		["buttonText"] = "Swatter",
		["addon"] = "!Swatter",
	},
	["TitanPanelSkin"] = {
		["buttonText"] = "TitanPanel",
		["addon"] = "Titan",
	},
	["ZygorSkin"] = {
		["buttonText"] = "Zygor",
		["addon"] = "ZygorGuidesViewer",
	},
	["MiscFixes"] = {
		["addon"] = "Tukui_Skins",
		["hide"] = true,
	},
}