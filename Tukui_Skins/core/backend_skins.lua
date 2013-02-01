if not (IsAddOnLoaded("Tukui") or IsAddOnLoaded("AsphyxiaUI") or IsAddOnLoaded("DuffedUI")) then return end
local addon = select(1,...)
local U = unpack(select(2,...))

U.Version = GetAddOnMetadata(addon,"Version")

U.Skins = {
	["ACPSkin"] = {
		["buttonText"] = "Addon Control Panel",
		["addon"] = "ACP",
	},
	["AdiBagsSkin"] = {
		["addon"] = "AdiBags",
	},
	["AffDotsSkin"] = {
		["addon"] = "AffDots",
	},
	["AltoholicSkin"] = {
		["addon"] = "Altoholic",
	},
	["ALDamageMeterSkin"] = {
		["addon"] = "ALDamageMeter",
	},
	["AnalystSkin"] = {
		["addon"] = "Analyst",
	},
	["AraBrokerGuildFriendsSkin"] = {
		["buttonText"] = "Ara Broker Guild Friends",
		["addon"] = "Ara_Broker_Guild_Friends",
	},
	["AraBrokerTradeskillsSkin"] = {
		["buttonText"] = "Ara Broker Tradeskills",
		["addon"] = "Ara_Broker_Tradeskills",
	},
	["ArchySkin"] = {
		["addon"] = "Archy",
	},
	['ArhSkin'] = {
		["buttonText"] = "Archaeology Helper",
		["addon"] = "Arh",
	},
	["ArkInventorySkin"] = {
		["addon"] = "ArkInventory",
	},
	["AtlasLootSkin"] = {
		["buttonText"] = "AtlasLoot",
		["addon"] = "AtlasLoot_Loader",
	},
	["ATSWSkin"] = {
		["addon"] = "AdvancedTradeSkillWindow",
	},
	["AuctionatorSkin"] = {
		["addon"] = "Auctionator",
	},
	["AuctioneerSkin"] = {
		["buttonText"] = "Auctioneer",
		["addon"] = "Auc-Advanced"
	},
	["AuctionLiteSkin"] = {
		["addon"] = "AuctionLite",
	},
	["BagnonSkin"] = {
		["addon"] = "Bagnon",
	},
	["BGDefenderSkin"] = {
		["addon"] = "BGDefender",
	},
	["BigBrotherSkin"] = {
		["addon"] = "BigBrother"
	},
	["BigWigsSkin"] = {
		["addon"] = "BigWigs",
	},
	["BloodShieldTrackerSkin"] = {
		["addon"] = "BloodShieldTracker",
	},
	["BPTSkin"] = {
		["buttonText"] = "Balance Power Tracker",
		["addon"] = "BalancePowerTracker"
	},
	["BuyEmAllSkin"] = {
		["addon"] = "BuyEmAll",
	},
	["ChocolateBarSkin"] = {
		["addon"] = "ChocolateBar",
	},
	["CliqueSkin"] = {
		["addon"] = "Clique",
	},
	["CombustionHelperSkin"] = {
		["addon"] = "CombustionHelper",
	},
	["CoolLineSkin"] = {
		["addon"] = "CoolLine",
	},
	["CorkSkin"] = {
		["addon"] = "Cork",
	},
	["CritlineSkin"] = {
		["addon"] = "Critline",
	},
	["DBMSkin"] = {
		["buttonText"] = "DBM",
		["addon"] = "DBM-Core",
	},
	["DresserSkin"] = {
		["addon"] = "Dresser",
	},
	["EasyMailSkin"] = {
		["addon"] = "EasyMail",
	},
	["EavesDropSkin"] = {
		["addon"] = "EavesDrop",
	},
	["EnergyWatchSkin"] = {
		["addon"] = "EnergyWatch",
	},
	["ExaminerSkin"] = {
		["addon"] = "Examiner",
	},
	["ExtVendorSkin"] = {
		["buttonText"] = "Extended Vendor",
		["addon"] = "ExtVendor",
	},
	["EveryGoldToBankerSkin"] = {
		["addon"] = "EveryGoldToBanker",
	},
	["FactionizerSkin"] = {
		["addon"] = "Factionizer",
	},
	["FlightMapSkin"] = {
		["addon"] = "FlightMap",
	},
	["FlightMapEnhancedSkin"] = {
		["addon"] = "FlightMapEnhanced",
	},
	["GuildMemberInfo_TradeSkillsSkin"] = {
		["addon"] = "GuildMemberInfo_TradeSkills",
	},
	["GupPetSkin"] = {
		["addon"] = "GupPet",
	},
	["HealiumSkin"] = {
		["addon"] = "Healium",
	},
	["IncomingSkin"] = {
		["addon"] = "Incoming",
	},
	["InspectEquipSkin"] = {
		["addon"] = "InspectEquip",
	},
	["KarniCrapSkin"] = {
		["buttonText"] = "Karni's Crap Filter",
		["addon"] = "KarniCrap",
	},
	["LightheadedSkin"] = {
		["addon"] = "Lightheaded",
	},
	["LinkWranglerSkin"] = {
		["addon"] = "LinkWrangler",
	},
	["LootCouncilLiteSkin"] = {
		["buttonText"] = "LootCouncilLite",
		["addon"] = "LootCouncil_Lite",
	},
	["MageNuggetsSkin"] = {
		["addon"] = "MageNuggets",
	},
	["MasterLootManagerRemixSkin"] = {
		["addon"] = "MasterLootManagerRemix",
	},
	["MinimalArchaeologySkin"] = {
		["addon"] = "MinimalArchaeology",
	},
	["MogItSkin"] = {
		["addon"] = "MogIt",
	},
	["MoveAnythingSkin"] = {
		["addon"] = "MoveAnything",
	},
	["MRTSkin"] = {
		["buttonText"] = "Mizus Raid Tracker",
		["addon"] = "MizusRaidTracker",
	},
	["MyRolePlaySkin"] = {
		["addon"] = "MyRolePlay",
	},
	["NumerationSkin"] = {
		["addon"] = "Numeration",
	},
	["OdysseySkin"] = {
		["addon"] = "Odyssey",
	},
	["OgriLazySkin"] = {
		["addon"] = "Ogri'Lazy",
	},
	["OmenSkin"] = {
		["addon"] = "Omen",
	},
	["OneClickEnchantScrollSkin"] = {
		["addon"] = "OneClickEnchantScroll",
	},
	["OutfitterSkin"] = {
		["addon"] = "Outfitter",
	},
	["OvaleSkin"] = {
		["addon"] = "Ovale",
	},
	["PetBattleTeamsSkin"] = {
		["addon"] = "PetBattleTeams",
	},
	--["PoisonerSkin"] = {
	--	["addon"] = "Poisoner",
	--},
	["PoMTrackerSkin"] = {
		["addon"] = "PoMTracker",
	},
	["PostalSkin"] = {
		["addon"] = "Postal",
	},
	["QuartzSkin"] = {
		["addon"] = "Quartz",
	},
	["QuestCompletistSkin"] = {
		["addon"] = "QuestCompletist",
	},
	["QuestItemBarSkin"] = {
		["addon"] = "QuestItemBar",
	},
	["RaidInviteOrganizerSkin"] = {
		["buttonText"] = "Raid Invite Organizer",
		["addon"] = "RaidInviteOrganizer",
	},
	["RaidBuffStatusSkin"] = {
		["buttonText"] = "Raid Buff Status",
		["addon"] = "RaidBuffStatus",
	},
	["RecountSkin"] = {
		["addon"] = "Recount",
	},
	["ReforgenatorSkin"] = {
		["addon"] = "Reforgenator",
	},
	["ReforgeradeSkin"] = {
		["addon"] = "Reforgerade",
	},
	["SearingPlasmaTrackerSkin"] = {
		["buttonText"] = "Searing Plasma Tracker",
		["addon"] = "SearingPlasmaTracker",
	},
	["SexyCooldownSkin"] = {
		["buttonText"] = "SexyCooldown 2",
		["addon"] = "SexyCooldown2",
	},
	["ShieldBarsSkin"] = {
		["addon"] = "ShieldBars",
	},
	["ShieldMonitorSkin"] = {
		["buttonText"] = "Shield Monitor",
		["addon"] = "shieldmonitor",
	},
	["SkadaSkin"] = {
		["addon"] = "Skada",
	},
	["SkilletSkin"] = {
		["addon"] = "Skillet",
	},
	["SoundtrackSkin"] = {
		["addon"] = "Soundtrack",
	},
	["SpineCounterSkin"] = {
		["buttonText"] = "Spine Blood Counter",
		["addon"] = "SpineCounter",
	},
	["SpySkin"] = {
		["addon"] = "Spy",
	},
	["SwatterSkin"] = {
		["buttonText"] = "Swatter",
		["addon"] = "!Swatter",
	},
	["SymbiosisTipSkin"] = {
		["addon"] = "SymbiosisTip",
	},
	["tComboSkin"] = {
		["buttonText"] = "Tukui Combo",
		["addon"] = "tCombo",
	},
	["TellMeWhenSkin"] = {
		["addon"] = "TellMeWhen",
	},
	["TinyDPSSkin"] = {
		["addon"] = "TinyDPS",
	},
	["TitanPanelSkin"] = {
		["buttonText"] = "TitanPanel",
		["addon"] = "Titan",
	},
	["TomTomSkin"] = {
		["addon"] = "TomTom",
	},
	["TradeSkillDWSkin"] = {
		["addon"] = "TradeSkillDW",
	},
	["VengeanceStatusSkin"] = {
		["addon"] = "VengeanceStatus",
	},
	["WhollySkin"] = {
		["addon"] = "Wholly",
	},
	["WowLuaSkin"] = {
		["addon"] = "WowLua",
	},
	["WoWProSkin"] = {
		["addon"] = "WowPro",
	},
	["xMerchantSkin"] = {
		["addon"] = "xMerchant",
	},
	["ZygorSkin"] = {
		["buttonText"] = "Zygor",
		["addon"] = "ZygorGuidesViewer",
	},
--DO NOT REMOVE THESE
	["DBMSkinHalf"] = {
		["addon"] = "DBM-Core",
		["hide"] = "True",
	},
	["CLCProtSkin"] = {
		["addon"] = "CLCProt",
		["hide"] = "True",
	},
	["CLCRetSkin"] = {
		["addon"] = "CLCRet",
		["hide"] = "True",
	},
	["PowerAurasIconsSkin"] = {
		["addon"] = "PowerAuras",
		["hide"] = "True",
	},
	["WeakAurasSkin"] = {
		["addon"] = "WeakAuras",
		["hide"] = "True",
	},
	["MiscFixes"] = {
		["addon"] = "Tukui_Skins",
		["hide"] = "True",
	},
--
}