---------------------------------------------------------------------------------------------
QHVERSION = "QuickHeal2 v11.0.7.1"
---------------------------------------------------------------------------------------------
-- Author
--
--	WakeZero
-- 
-- Description
--
--	This addon allows a player to quickly use spells/macros on their party and raid with 
--	single mouse clicks as well as providing customized unit frames for raids.
--
-- Example
--
--	When enabled, damage taken bars will appear beside each player and party
--	unit frame. These bars increase with the amount of damage a player in the
--	party receives, changing colors from green to yellow to red upon death. When
--	in a raid, damage taken bars will appear beside the name of everyone in the
--	raid for quick and easy monitoring. A range checking option also gives the
--	ability to focus on party and raid members within range.
--
--	By opening the options menu (/QH2 or assigned keybinding) the user may
--	choose spells from their spellbook to cast upon the corresponding party/raid
--	member when the bars are clicked. Currently all mouse buttons may be assigned
--	as well as their Shift, Ctrl and Alt variants.
--
--	Macros may also be assigned by prefixing the macro name with an exclamation mark (!).
--	In order to allow macros to function the way you would expect them to when 
--	clicking on a unit's damage bar, you may use the keyword 'unit' to tell 
--	Quick Heal that you want the spell cast on the bar's unit. To cast the spell
--	renew, you could therefore create a macro '/cast [target=unit] Renew'.
--
-- Changelog
--
--  v11.0.7.1 [2025-02-13]: - Fix buff display in classic era
--
--	v11.0.7.0 [2025-01-07]: - Fix debuff display
--
--							- Fix raid right-click context menus
--
-- 							- Fix range finding for self and non-healers
--
--	v11.0.5.0 [2024-12-18]: - Add support for Cataclysm Classic
--
--  v11.0.2.0 [2024-09-17]: - Replace UnitAura with C_UnitAuras.GetAuraDataByIndex
--
--	v11.0.0.0 [2024-08-02]: - Release for patch 11.0.0
--
--  v10.1.0.0 [2023-05-03]: - Enable showPartyPets by default
--
--	v10.0.2.2 [2023-02-06]: - Enabled dual-spec profile swapping in WotLK Classic
--
--							- Enabled raid threat bars in WotLK Classic
--
--							- Fixed Shaman range checks in WotLK Classic
--
--	v10.0.2.0 [2022-12-12]: - Added Evoker class support
--
--	v10.0.0.1 [2022-10-26]: - Fixed version check error
--
--	v10.0.0.0 [2022-10-19]: - Release for patch 10.0.0
--
--							- Only show player buffs in WotLK
--
--	v9.2.7.0 [2022-09-12] : - Fixed loading errors in WotLK
--
--							- Roles shown in WotLK are now determined by assignment (UnitGroupRolesAssigned)
--
--							- Added TOC configurations for WotLK and Vanilla so addon will not be labeled as out of date
--
--	v9.2.5.0 [2022-07-04] : - Fixed frozen bars on classic servers by using UNIT_HEALTH_FREQUENT instead of UNIT_HEALTH
--
--							- Added buff expiration timers beneath player and party buffs
--
--							- Added right click raid unit menu option to show unit as tank (only shows in Quick Heal)
--
--  v9.0.5.0 [2021-05-21] : - Add support for WOW_PROJECT_BURNING_CRUSADE_CLASSIC
--
--  v9.0.2.1 [2020-12-30] : - Fixed checkbox errors in options panel
--
--  v9.0.1.1 [2020-10-14] : - Fixed target frame adjustment
--
--  v9.0.1.0 [2020-09-26] : - Release for patch 9.0.1
--
--							- Added improved German translation (thanks to ICrashDump!)
--
--  v8.3.0.0 [2020-04-20] : - Fixed buffs not being displayed on unit bars
--
--  v8.2.5.0 [2019-10-07] : - Added support for WoW Classic
--
--							- Added support for Druid battle resurrection on left click while in combat
--
--							- Switched channel messages to addon messages to check for latest version
--
--	v8.0.1.1 [2018-07-23] : - Fixed raid frame in battelgrounds
--
--							- Fixed performance issues in raids
--
--	v8.0.1.0 [2018-07-17] : - Release for patch 8.0.1
--
--	v7.0.3.0 [2016-07-27] :	- Release for patch 7.0.3
--
--							- Added Demonhunter class support
--
--							- Added multiple specs to automatic profile swapping
--
--							- Fixed overlapping elements
--
--							- Removed default raid warnings
--
--	v6.0.3.0 [2014-11-11] : - Release for patch 6.0.3
--
--							- Fixed divide by zero error...
--
--	v5.4.1.0 [2013-10-29] : - Fix for patch 5.4.1 removal of GetCVar("realmName")
--
--	v5.2.0.0 [2013-05-10] : - Added Default Monk Spells
--
--							- Fixed Range Checking Spells
--
--							- Added Raid Frame Sorting By Role
--
--							- Added Option To Display Role Icons
--
--	v5.0.5.0 [2012-09-27] : - Added Monk Class Support
--
--							- Fixed Raid Frame Problems In Battlegrounds
--
--	v5.0.4.2 [2012-09-10] : - Fixed Buff Icons
--
--							- Fixed Arena Frames
--
--	v5.0.4.1 [2012-09-06] : - Fixed Glyph Execution Taint
--
--							- Fixed Raid Frame Not Showing/Updating
--
--	v5.0.4.0 [2012-08-30] : - Fixed LUA Raid Frame Error Bug
--
--							- Fixed Raid Frame Showing Up In Arena
--
--	v4.0.3.0 [2010-11-16] : - Fixed Priest Range Finding Bug
--
--							- Fixed Target Frame Bug
--
--							- Fixed Bar Background And Spark Bugs
--
--							- Fixed Party/Pet Bar Hide/Show Bug
--				
--							- Fixed Profile Memory Bug
--
--							- Fixed Profile Talent Swap Settings Bug
--
--							- Fixed Raid Frame Moving Background Bug
--
--	v4.0.1.0 [2010-10-26] : - Added Dual Spec Profile Swapping!
--
--							- Added Threat Warnings!
--
--							- Added Right-Click Menus to Raid Units!
--
--							- Improved Performance (No More Lag in Large Raids!)
--				
--							- Fixed Taint Problems
--
--	v3.3.3.0 [2010-06-04] : - Added Raid Icons To Raid Frames
--
--							- Added Debuff Warning Feature
--
--							- Added Version Number To Options Tab Label
--
--							- Added New Raid Frame Options
--
--							- Moved General And Raid Frame Options To Subcategories
--
--							- Option Subcategories Are Now Shown By Default
--
--	v3.2.2.1 [2009-11-23] : - Fixed Memory Leaks!
--
--							- Improved Performance!
--
--							- Fixed Raid Frame Disable Option
--
--							- Added Party Pet Frames
--
--	v3.2.2.0 [2009-10-22] : - Fixed Options Resetting... Really...
--
--							- Fixed Update Message Displaying Multiple Times
--
--							- Added Saving, Loading and Deleting Of Custom Profiles
--
--	v3.1.3.0 [2009-07-07] : - Hopefully fixed Options Resetting Unexpectedly
--
--							- Added Option To Throttle Raid Frame Updates
--
--							- Added Default Settings Button In Options Frame
--
--	v3.1.1.3 [2009-05-06] : - Fixed HoT Display Bugs
--
--							- Fixed Damage Bars Not Updating Properly
--
--	v3.1.1.2 [2009-05-05] : - Added HoT Display!
--
--							- Added Decurse Options Panel
--
--							- Fixed Options Not Saving Properly
--
--							- Fixed Options Resetting Between Panels
--
--	v3.1.1.1 [2009-04-30] : - Fixed Options Not Updating Damage Bar Spells
--
--							- Fixed Profile Variables Resetting
--
--							- Fixed Player/Party Frame Anchor Adjustments
--
--							- Fixed Raid Frame Not Being Moveable
--				
--							- Fixed Shift/Ctrl/Alt Macro Bindings
--
--							- Added Debuff Labels
--
--  v3.1.1.0 [2009-04-27] : - Beta Version Of QuickHeal2
--
--							- All New Code Base Allows For Better Maintainability
--
--							- Added New Bar Textures
--
--							- Added Clickable Debuff Icons
--
--							- Integrated Options Frame Into Interface Settings
--
--	v3.0.8.0 [2009-01-22] : - Fixed UIDROPDOWNMENU_INIT_MENU Bug
--
--	v3.0.3.1 [2008-12-28] : - Added Party Pet Frames!
--
--							- Raid Names Now Change Purple On Cureable Debuffs
--
--							- Cureable Debuffs Now More Accurate
--
--							- Fixed Damage Bar Text Transparency Bug
--
--							- Party Frame Combat Bugs Should Be Less Frequent
--
--	v3.0.3.0 [2008-11-25] : - Added French Translation (Thanks psykose!)
--
--							- Fixed Party Frame In Combat Bug
--
--							- Fixed Vehicle/Player Frame Bug
--
--							- Fixed Errors On Login/Console Reload
--
--	v3.0.2.0 [2008-10-13] : - Fixed For Patch 3.0
--
--	v2.4.1.0 [2008-04-13] : - Added Option To Display Cureable Debuffs (Changes Bar Purple)
--
--							- Added Option To Display Units Out Of Range (75% Transparency)
--
--							- Fixed Unit Names Rearranging In Combat
--
--							- Fixed Range Checking
--
--	v2.3.3.1 [2008-02-11] : - Added Confirm Button To Reset Option
--
--							- Reset Button Now Only Affects Current Tab
--
--							- Added Optional Background To Raid Frame
--
--							- Added Automatic Macro Refresh On Change
--
--							- Made Target Frame Moveable By Holding Shift
--
--							- Fixed Non-English Client Raid Bug
--
--	v2.3.3.0 [2008-01-29] : - Added Raid Functionality
--
--							- Added Macros To Spell List
--
--							- Added Range Checking Option
--
--							- Options Frame Is Now Moveable
--
--	v2.3.0.0 [2007-12-19] : - Added Mouse Button4 and Button5 bindings
--
--							- Added Option to Disable Target Frame Adjustment
--
--							- Added Width/Height Options For Player and Party Damage Bars
--
--	v2.2.3.1 [2007-10-29] : - Added Option Tabs
--
--							- Added Shift, Alt, and Control bindings
--
--							- Added Damage Bar Transparency Setting
--
--							- Added Damage Bar Value Display
--
--							- Added Resurrection to Left Click When Party Member Dies
--
--	v2.2.3.0 [2007-10-25] : - First Release
--
-- Shoutouts
--
--	Jesus Christ - For joy, life, eternal love and forgiveness of sins!
--
--	Curse (wow.curse.com) - For hosting my addon and many others.
--
--	WoWInterface (www.wowinterface.com) - For hosting this addon and many others.
--
--	Wowpedia (www.wowpedia.org) - Greatest resource and API for WoW addon developers.
--
--	QuickHeal Donors - Thank you for your support!
--
---------------------------------------------------------------------------------------------
-- QuickHeal Class
---------------------------------------------------------------------------------------------
QuickHeal = {};
QuickHeal.__index = QuickHeal;

function QuickHeal:new()

	-- Metatable
	local self = {};
	setmetatable(self, QuickHeal);
	
	-- Frame Variables
	self.name = "QHMain_Frame";
	self.frame = CreateFrame("Frame", self.name, UIParent);
	
	-- Options Variables
	self.options = QHOptions:new();
	self.profiles = {};
	self.backupsettings = {};
	self.macrosloaded = false;
	
	-- Update Variables
	self.updatestart = 0;
	self.updateend = 0;
	self.updateinterval = 0.25;
	self.updatelast = 0;
	self.updatetime = 0;
	
	-- Party/Raid Variables
	self.partyframe = nil;
	self.raidframe = nil;

	-- Reference Variables
	self.obj = self;
	self.parent = nil;
	self.frame.obj = self;

	self.tankoverrides = {};

	-- Setup Slash Commands
	self:SetupSlashCommands();
	
	-- Register Events
	self:RegisterForEvents();
	
	-- Report Status and Return
	self:Report();
	return self;
end 

local _;

---------------------------------------------------------------------------------------------
-- QuickHeal Methods
---------------------------------------------------------------------------------------------
function QuickHeal:GetGlobal(variable)
	if QHProfile2["GlobalSettings"] and variable then
		return QHProfile2["GlobalSettings"][variable];
	end
end

function QuickHeal:SetGlobal(variable, value)
	if not QHProfile2["GlobalSettings"] then
		QHProfile2["GlobalSettings"] = {};
	end
	if variable then
		if not value then QHProfile2["GlobalSettings"][variable] = false;
		else QHProfile2["GlobalSettings"][variable] = value; end
	end
end

function QuickHeal:GetSetting(variable)
	local profile = self:GetProfileName();
	if variable then
		-- Constants Override Variables
		if QHCONSTANTS[variable] then
			return QHCONSTANTS[variable];
		elseif QHProfile2[profile] then
			return QHProfile2[profile][variable];
		end
	end
end

function QuickHeal:TestSetting(variable)
	local profile = self:GetProfileName();
	QH:PrintAll(profile);
	if variable then
		-- Constants Override Variables
		QH:PrintAll("QHCONSTANTS[", variable, "]:", QHCONSTANTS[variable]);
		QH:PrintAll("QHProfile2[", profile, "][", variable, "]:", QHProfile2[profile][variable]);
		if QHCONSTANTS[variable] then
			return QHCONSTANTS[variable];
		elseif QHProfile2[profile] then
			return QHProfile2[profile][variable];
		end
	end
end

function QuickHeal:SetSetting(variable, value)
	local profile = self:GetProfileName();
	if QHProfile2[profile] and variable then
		if not value then QHProfile2[profile][variable] = false;
		else QHProfile2[profile][variable] = value; end
	end
end

function QuickHeal:ResetSettings()
	QHProfile2[self:GetProfileName()] = {};
end

function QuickHeal:LoadDefaultSettings(class)
	local profile = self:GetProfileName();
	if not class then _,class = UnitClass("player"); end
	if (QH:IsClassic()) then class = "CLASSIC_" .. class; end
	QHProfile2[profile] = {};
	--self:PrintAll("Loading settings for ", profile, " : ", class, " : ", self:GetGlobal("VAR_COUNT"));
	self:CopyTable(QHProfile2[profile], QHDEFAULT[class]);
end

function QuickHeal:LoadProfile(name)
	if name then
		QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_ActiveProfile"), name);
		name = QH:Concat("!", name);
		local profile = self:GetProfileName();
		self:CopyTable(QHProfile2[profile], QHProfile2[name]);
	end
end

function QuickHeal:SaveProfile(name)
	if name then
		QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_ActiveProfile"), name);
		name = QH:Concat("!", name);
		local profile = self:GetProfileName();
		QHProfile2[name] = {};
		self:CopyTable(QHProfile2[name], QHProfile2[profile]);
	end
end

function QuickHeal:DeleteProfile(name)
	if name then
		if QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_ActiveProfile")) == name then
			QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_ActiveProfile"), ""); 
		end
		name = QH:Concat("!", name);
		QHProfile2[name] = nil;
	end
end

function QuickHeal:GetProfileName()
	return self:Concat(UnitName("player"), "|", string.gsub(GetRealmName(), "^%s*(.-)%s*$", "%1"));
end

function QuickHeal:GetProfiles()
	wipe(self.profiles);
	for k,v in pairs(QHProfile2) do
		if string.find(k, "!") then tinsert(self.profiles, string.sub(k, 2)); end
	end
	return self.profiles;
end

function QuickHeal:SetupSlashCommands()
	-- Displays Options
	SlashCmdList["QuickHeal"] = self.ShowOptions;
	SLASH_QuickHeal1 = "/QH2";
	SLASH_QuickHeal2 = "/QHeal";
	SLASH_QuickHeal3 = "/QuickHeal";
end

function QuickHeal:Report()
	self:Print("QuickHeal2 is |cFF00FF00ON".."|cFFFFFFFF ["..QH_LOCALE_HELP.."]");
end

function QuickHeal:ShowOptions()
	if Settings and Settings.RegisterCanvasLayoutCategory then
		Settings.OpenToCategory(QH.options.panel.name);
	else
		-- Hack: Show Profile Panel First To Open Sub Categories
		InterfaceOptionsFrame_OpenToCategory(QH.options.decursepanel);
		InterfaceOptionsFrame_OpenToCategory(QH.options.panel);
	end
end

function QuickHeal:GetLabel()
	return "Quick Heal 2";
end

function QuickHeal:GetVersion()
	local version = string.gsub(QHVERSION, "QuickHeal2 v", "");
	return version;
end

function QuickHeal:GetPrettyVersion()
	local pretty_version = self:Concat("Version ", self:GetVersion());
	return pretty_version;
end

function QuickHeal:CheckVersion()
	
	local pre_ver = self:GetGlobal("VERSION_NUM");
	local cur_ver = self:GetVersion();
	
	if not pre_ver or pre_ver ~= cur_ver then
		-- Display ThankYou Message
		self:ShowThankYouNotice();
	end
	
	-- Set Global Version Number
	self:SetGlobal("VERSION_NUM", cur_ver);
	
	-- Check For Newer Version
	local chatindex = GetChannelName("QuickHealMod");
	if chatindex then
		-- Send Version Information To Global Channel
		--SendChatMessage(QHVERSION, "CHANNEL", nil, chatindex);
		C_ChatInfo.SendAddonMessage("QH2", QHVERSION, "CHANNEL", chatindex);
	end
end

function QuickHeal:CompareVersion(version)
	local current = string.gsub(QHVERSION, "QuickHeal2 v", "");
	version = string.gsub(version, "QuickHeal2 v", "");
	for i=1, select('#', strsplit(".", current)) do
		local c = select(i, strsplit(".", current));
		local v = select(i, strsplit(".", version));
		if tonumber(c) > tonumber(v) then return -1; -- This Is Latest Version
		elseif tonumber(c) < tonumber(v) then return 1; end -- This Is Not Latest Version
	end
	return 0; -- Versions Are Equal
end

function QuickHeal:ShowThankYouNotice()
	
	if not QH.thankyoumessage then
		QH.thankyoumessage = true;
		local msg = QH:Concat(QH_LOCALE_THANKS, QHVERSION, string.char(13), QH_LOCALE_CONFIGURE, string.char(13,13), QH_LOCALE_SUPPORT);
		self:ShowNotice(350, 130, msg, QH_LOCALE_SUPPORTLINK);
	end
end

function QuickHeal:ShowUpdateNotice()

	if not QH.updatemessage then
		QH.updatemessage = true;
		local msg = QH:Concat(QH_LOCALE_UPDATENOTICE, string.char(13,13), QH_LOCALE_UPDATEINSTRUCT);
		self:ShowNotice(350, 115, msg, QH_LOCALE_SUPPORTLINK);
	end
end

function QuickHeal:ShowNotice(width, height, msg, link)

	local frame = CreateFrame("Frame", nil, UIParent, BackdropTemplateMixin and "BackdropTemplate");
	frame:SetFrameStrata("DIALOG");
	frame:SetWidth(width);
	frame:SetHeight(height);
	frame:SetPoint("TOP", 0, -230);
	frame:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", tile = true, tileSize = 32, edgeSize = 32,
		insets = {left = 11, right = 12, top = 12, bottom = 11},
	});
	local fontstring = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal");
	fontstring:SetWidth(410);
	fontstring:SetHeight(0);
	fontstring:SetPoint("TOP", 0, -16);
	fontstring:SetText(msg);
	
	if link then
		local editBox = CreateFrame("EditBox", nil, frame);
		do
			local editBoxLeft = editBox:CreateTexture(nil, "BACKGROUND");
			local editBoxRight = editBox:CreateTexture(nil, "BACKGROUND");
			local editBoxMiddle = editBox:CreateTexture(nil, "BACKGROUND");
			editBoxLeft:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Left");
			editBoxLeft:SetHeight(32);
			editBoxLeft:SetWidth(32);
			editBoxLeft:SetPoint("LEFT", -14, 0);
			editBoxLeft:SetTexCoord(0, 0.125, 0, 1);
			editBoxRight:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Right");
			editBoxRight:SetHeight(32);
			editBoxRight:SetWidth(32);
			editBoxRight:SetPoint("RIGHT", 6, 0);
			editBoxRight:SetTexCoord(0.875, 1, 0, 1);
			editBoxMiddle:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Right");
			editBoxMiddle:SetHeight(32);
			editBoxMiddle:SetWidth(1);
			editBoxMiddle:SetPoint("LEFT", editBoxLeft, "RIGHT");
			editBoxMiddle:SetPoint("RIGHT", editBoxRight, "LEFT");
			editBoxMiddle:SetTexCoord(0, 0.9375, 0, 1);
		end
		editBox:SetHeight(32);
		editBox:SetWidth(250);
		editBox:SetPoint("TOP", fontstring, "BOTTOM", 0, 2);
		editBox:SetFontObject("GameFontHighlight");
		editBox:SetTextInsets(0, 0, 0, 1);
		editBox:SetFocus();
		editBox:SetText(link);
		editBox:HighlightText();
		editBox:SetScript("OnHide", function(self)
			ChatEdit_FocusActiveWindow();
		end);
		editBox:SetScript("OnTextChanged", function(self)
			editBox:SetText(link);
			editBox:HighlightText();
		end);
	end
	local button = CreateFrame("Button", nil, frame);
	button:SetHeight(24);
	button:SetWidth(75);
	button:SetPoint("BOTTOM", 0, 13);
	button:SetNormalFontObject("GameFontNormal");
	button:SetHighlightFontObject("GameFontHighlight");
	button:SetNormalTexture(button:CreateTexture(nil, nil, "UIPanelButtonUpTexture"));
	button:SetPushedTexture(button:CreateTexture(nil, nil, "UIPanelButtonDownTexture"));
	button:SetHighlightTexture(button:CreateTexture(nil, nil, "UIPanelButtonHighlightTexture"));
	button:SetText(QH_LOCALE_OKAY);
	button:SetScript("OnClick", function(self)
		frame:Hide();
	end);
end

---------------------------------------------------------------------------------------------
-- QuickHeal Events
---------------------------------------------------------------------------------------------
function QuickHeal:RegisterForEvents()

	-- Register Event Handler
	self.frame:SetScript("OnEvent", self.OnEvent);
	self.frame:SetScript("OnUpdate", self.OnUpdate);

	-- System Events
	self:RegisterEvent("ADDON_LOADED");
	self:RegisterEvent("PLAYER_LOGIN");
	self:RegisterEvent("PLAYER_LOGOUT");

	-- Chat Events
	C_ChatInfo.RegisterAddonMessagePrefix("QH2");
	self:RegisterEvent("CHANNEL_UI_UPDATE");
	self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE");
	self:RegisterEvent("CHAT_MSG_CHANNEL");
	self:RegisterEvent("CHAT_MSG_ADDON");
	
	-- Group Events
	self:RegisterEvent("GROUP_ROSTER_UPDATE");
	
	-- Unit Events
	self:RegisterEvent("UNIT_NAME_UPDATE");
	self:RegisterEvent("UNIT_AURA");
	if(self:IsClassic()) then
		self:RegisterEvent("UNIT_HEALTH_FREQUENT");
	else
		self:RegisterEvent("UNIT_HEALTH");
	end
	self:RegisterEvent("UNIT_PET");
	
	-- Macro Events
	self:RegisterEvent("UPDATE_MACROS");
	
	-- Player Events
	self:RegisterEvent("PLAYER_TARGET_CHANGED");

	if(self:IsWotLKOrAbove()) then
		self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED");
		self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE");
		self:RegisterEvent("PLAYER_FOCUS_CHANGED");
	end
end

function QuickHeal:RegisterEvent(event)
	self.frame:RegisterEvent(event);
end

function QuickHeal:OnUpdate(elapsed)

	QH.updatelast = QH.updatelast + elapsed;
	if (QH.updatelast > QH.updateinterval) then
		QH:OnEvent("UPDATE");
		QH.updatelast = 0;
		QH.updatetime = 0;
	end
end

function QuickHeal:OnEvent(event, ...)

	-- DEBUG
	--if event ~= 'UPDATE' and event ~= 'CHAT_MSG_CHANNEL' then QH:PrintAll(1,1,1,event,...); end

	local estart = GetTime();
	if (type(self.obj[event]) == 'function') then
		-- Call Event Specific Function
		self.obj[event](self.obj, event, ...);
	else
		-- Call Unit Function
		QHUnit:OnEvent(event, ...);
	end
	QH.updatetime = QH.updatetime + (GetTime() - estart);
end

function QuickHeal:UPDATE(event, ...)
	
	-- Set Update Start Time
	QH.updatestart = GetTime();
	
	-- Update Party/Raid Frame
	if (QH.partyframe) then
		QH.partyframe:Update();
	end
	if (QH.raidframe) then
		QH.raidframe:Update();
	end
	
	-- Set Update End Time
	QH.updateend = GetTime();
	QH.updatetime = QH.updatetime + (QH.updateend - QH.updatestart);
	if(QH.updatetime > 0) then fps = 1 / QH.updatetime; end
	
	-- FOR DEBUG
	-- if QH.fps then --and QH.updatetime > 0.033 then
		-- getglobal(QH:Concat(QH.raidframe.globalframe:GetName(), "_FrameDebug")):SetText(QH.fps); --QH.updateend - QH.updatestart);
	-- end
end

function QuickHeal:ACTIVE_TALENT_GROUP_CHANGED(event, ...)
	if self.player_login and QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_SpecSwap")) then
		-- Swap Profiles
		local spec;
		if (QH:IsWotLK()) then
			spec = GetActiveTalentGroup();
		else
			spec = GetSpecialization();
		end
		if spec ~= self.current_spec then
			self.current_spec = spec;
			local profile = QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_Spec", spec));
			if profile then
				QH:LoadProfile(profile);
				QHOptions:SetupOptions(true);
				QHOptions:Update();
				QH:Print(QH:Concat("QuickHeal Profile '|cFF00FF00", profile, "|cFFFFFFFF' has been loaded."));
			end
		end
	end
end

function QuickHeal:GROUP_ROSTER_UPDATE(event, ...)
	
	-- Update Party/Raid Frames
	QH.partyframe:ForceUpdate();
	QH.raidframe:ForceUpdate();
end

function QuickHeal:UNIT_PET(event, ...)
	
	-- Update Pet Frames
	if (QH.partyframe) then
		QH.partyframe:UpdatePetFrames();
	end
end

function QuickHeal:UPDATE_MACROS(event, ...)

	-- Set Macro Loaded Variable
	QH.macrosloaded = true;

	-- Update Party/Raid Frames
	if (QH.partyframe) then
		QH.partyframe:ForceUpdate();
	end
	if (QH.raidframe) then
		QH.raidframe:ForceUpdate();
	end
end

function QuickHeal:ADDON_LOADED(event, addon, ...)

	if addon == "QuickHeal" then

		-- Load Settings
		local profile = self:GetProfileName();
		if not QHProfile2[profile] then QHProfile2[profile] = {}; end

		-- Set Global Variable Count
		local _, englishClass = UnitClass("player");
		self:SetGlobal("VAR_COUNT", self:CountTable(QHDEFAULT[englishClass]));

		-- Verify Settings
		if self:CountTable(QHProfile2[profile]) ~= self:GetGlobal("VAR_COUNT") then

			--self:PrintAll("Loading New Settings:", englishClass, ":", self:GetGlobal("VAR_COUNT"));

			-- Backup Current Settings
			wipe(self.backupsettings); 
			self:CopyTable(self.backupsettings, QHProfile2[profile]);

			-- Load Default Settings
			self:LoadDefaultSettings(englishClass);

			-- Restore Backup Settings
			for index,value in pairs(self.backupsettings) do
				if value ~= nil then QHProfile2[profile][index] = value; end
			end
		end

		-- Initialize Options
		QHOptions:SetupOptions();
	end
end

function QuickHeal:PLAYER_LOGIN(event, ...)
	self.player_login = true;

	-- Setup Player/Raid Frames
	self.partyframe = QHParty:new(1);
	self.raidframe = QHRaid:new(1);

	QHOptions:SetupOptions(true);

	-- Join Global QuickHeal Channel
	if GetChannelName("QuickHealMod") == 0 then
		JoinChannelByName("QuickHealMod", "i<3QuickHeal");
	end
	self:CheckVersion();
end

function QuickHeal:CHANNEL_UI_UPDATE(event, ...)
	---self:Print("CHANNEL_UI_UPDATE");
end

function QuickHeal:CHAT_MSG_CHANNEL_NOTICE(event, msg, arg2, arg3, namenum, arg5, arg6, chantype, channum, channel, ...)
	--self:Print("CHAT_MSG_CHANNEL_NOTICE:" .. msg .. "-" .. channel);
	-- Check QuickHealMod Global Channel
	if channel == "QuickHealMod" then
		-- Check QuickHeal Version
		self:CheckVersion();
	end
end

function QuickHeal:CHAT_MSG_CHANNEL(event, msg, author, language, namenum, target, flags, zoneid, num, channel, lineid, guid, ...)
	-- Check QuickHealMod Global Channel
	if channel == "QuickHealMod" then
		local name,realm = UnitFullName("player");
		local fullname = self:Concat(name, "-", realm);
		--self:PrintAll(1, 1, 1, "QH2 CHANNEL", " (", fullname, "):", author, "-", msg);
	end
end

function QuickHeal:CHAT_MSG_ADDON(event, addon, msg, distribution, author, ...)
	-- Check QuickHealMod Global Channel
	if addon == "QH2" then
		local name,realm = UnitFullName("player");
		local fullname = self:Concat(name, "-", realm);
		--self:PrintAll(1, 1, 1, "QH2 ADDON", " (", fullname, "):", author, "-", msg);
		if author ~= fullname then
			-- Check Reported Version
			local compare = self:CompareVersion(msg);
			if compare > 0 then
				-- Display Update Notice
				self:ShowUpdateNotice();
			elseif compare < 0 then
				-- Whisper New Version Notice
				C_ChatInfo.SendAddonMessage("QH2", QHVERSION, "WHISPER", author);
			end
		end
	end
end

function QuickHeal:PLAYER_LOGOUT(event, ...)

end

---------------------------------------------------------------------------------------------
-- Global Utility Functions
---------------------------------------------------------------------------------------------
function QuickHeal:Print(msg, red, green, blue)
	DEFAULT_CHAT_FRAME:AddMessage(msg, red, green, blue);
end

function QuickHeal:PrintAll(...)
	local msg = self:Concat(...);
	DEFAULT_CHAT_FRAME:AddMessage(msg, 1, 1, 1);
end

function QuickHeal:PrintSeparated(...)
	local msg = self:ConcatSeparated(...);
	DEFAULT_CHAT_FRAME:AddMessage(msg, 1, 1, 1);
end

function QuickHeal:Concat(...)

	local s = "";
	for n = 1, select("#", ...) do
		local value = select(n, ...);
		if value == true then s = s .. "true";
		elseif value == false then s = s.."false";
		elseif type(value) == "table" then s = s;
		elseif value ~= nil then s = s..value; end
	end
	return s;
end

function QuickHeal:ConcatSeparated(...)
	local s = "";
	for n = 1, select("#", ...) do
		if (n > 1) then s = s.." : "; end
		local value = select(n, ...);
		if value == true then s = s .. "true";
		elseif value == false then s = s.."false";
		elseif type(value) == "table" then s = s;
		elseif value ~= nil then s = s..value; end
	end
	return s;
end

function QuickHeal:Wrap(min, max, value)

	if value > max then value = min + (value - max) - 1; end
	if value < min then value = max - (min - value) + 1; end
	return value;
end

function QuickHeal:CountTable(tab)
	
	local n = 0;
	for index,value in pairs(tab) do
		n = n + 1;
	end
	return n;
end

function QuickHeal:CopyTable(to, from)
	if not to then to = {}; end
	if not from then from = {}; end
	for k,v in pairs(from) do
		if type(v) == "table" then
			to[k] = {}
			QuickHeal:CopyTable(to[k], v);
		else
			to[k] = v;
		end
	end
end

function QuickHeal:CloneFrame(frame, name)
	if (frame and frame:IsVisible()) then
		-- Get Frame Info
		local point, relativeTo, relativePoint, x, y = frame:GetPoint();
		local width = frame:GetWidth();
		local height = frame:GetHeight();

		--QH:PrintSeparated(name, frame:GetName(), point, relativeTo:GetName(), x, y);

		-- Create Clone
		clone = CreateFrame("Frame", name, UIParent);
		clone:SetWidth(width);
		clone:SetHeight(height);
		clone:SetPoint(point, relativeTo, relativePoint, x, y);
		return clone;
	end
end

function QuickHeal:CopyFrame(frame, copy)
	if (frame and frame:IsVisible()) then
		-- Get Frame Info
		local align, anchor, relative, x, y = frame:GetPoint();
		local width = frame:GetWidth();
		local height = frame:GetHeight();

		-- Copy Frame
		copy:SetWidth(width);
		copy:SetHeight(height);
		copy:SetPoint(align, anchor, relative, x, y);
		return copy;
	end
end

function QuickHeal:IsInArena()
	return not self:IsClassic() and IsActiveBattlefieldArena();
end

function QuickHeal:DoesArena1Exist()

	if UnitExists("arena1") then QH:Print("Arena1 Exists", 0, 1, 0);
	else QH:Print("Arena1 Doesn't Exist", 1, 0, 0); end
end

function QuickHeal:GetBuildNumber()
	local version,_ = GetBuildInfo();
	local build,_ = select(1, strsplit(".", version));
	return build;
end

function QuickHeal:IsClassic()
	return WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE;
end

function QuickHeal:IsWotLK()
	return WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC;
end

function QuickHeal:IsCata()
	return WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC;
end

function QuickHeal:IsWotLKOrAbove()
	--return self:IsRetail() or WOW_PROJECT_ID >= 11;
	return false;
end

function QuickHeal:IsRetail()
	--return WOW_PROJECT_ID == WOW_PROJECT_MAINLINE;
	return true;
end

local QH_HEALERS = {"PRIEST", "DRUID", "PALADIN", "SHAMAN"}
function QuickHeal:GetRole(unit)
	if(tContains(QH.tankoverrides, UnitName(unit))) then
		return "TANK";
	elseif(QH:IsRetail() or QH:IsWotLK()) then
		return UnitGroupRolesAssigned(unit);
	elseif(GetPartyAssignment("MAINTANK", unit)) then
		return "TANK";
	else
		local _,class = UnitClass(unit);
		if(tContains(QH_HEALERS, class)) then
			return "HEALER";
		end
	end
	return "DAMAGER";
end

function QuickHeal:ToggleTankOverride(unit)
	local name = UnitName(unit);
	if(tContains(QH.tankoverrides, name)) then
		for i,n in ipairs(QH.tankoverrides) do
			if n == name then
				tremove(QH.tankoverrides, i);
				break;
			end
		end
	else
		tinsert(QH.tankoverrides, name);
	end
	QH.raidframe:ForceUpdate();
	if (getn(QH.tankoverrides) > 0) then
		QH:PrintAll("TANK OVERRIDES:");
		QH:PrintSeparated(unpack(QH.tankoverrides));
	else
		QH:PrintAll("NO TANK OVERRIDES.");
	end
end