---------------------------------------------------------------------------------------------
-- QHUnit Class
---------------------------------------------------------------------------------------------
QHUnit = {};
QHUnit.__index = QHUnit;

-- TODO: Add Element Container

function QHUnit:new(unitid)

	-- Metatable
	local self = {};
     	setmetatable(self, QHUnit);
     	
	-- Unit Variables
	self.unitid = unitid;
	self.unittype = self:GetUnitType();
	self.unitname = nil;
	self.unitrace = nil;
	self.unitclass = nil;
	self.unitlevel = nil;
	self.unithealth = nil;
	self.unithealthmax = nil;
	self.unitpower = nil;
	self.unitpowermax = nil;
	self.unitconnected = nil;
	self.hideinraid = false;
     	
     	-- Position Variables
	self.x = 0;
	self.y = 0;
	self.align = "TOPLEFT";
	self.relative = "TOPLEFT";
	self.anchor = UIParent;
	self.width = 0;
	self.height = 0;
	self.moving = nil;
	self.elements = {};
	self.numelements = 3;
	
	-- Frame Variables
	self.name = QH:Concat("QHUnit_", unitid);
	self.frame = CreateFrame("Frame", self.name, UIParent, "QHUNITTEMPLATE");
	
	-- Warning Bar Variables
	self.warning = false;
	self.warningbar = QHIcon:new(QH:Concat(self.name, "_WarningBar"), self.frame);
	self.warningbar.parent = self;
	
	-- Nameplate Variables
	self.nameplate = QHNameplate:new(QH:Concat(self.name, "_Name"), self.frame);
	self.nameplate.parent = self;
	
	-- Role Icon Variables
	self.roleicon = QHIcon:new(QH:Concat(self.name, "_RoleIcon"), self.frame);
	self.roleicon.parent = self;
	
	-- Raid Icon Variables
	self.raidicon = QHIcon:new(QH:Concat(self.name, "_RaidIcon"), self.frame);
	self.raidicon.parent = self;
	
	-- Dropdown Menu Variables
	----self.dropdownmenu = CreateFrame("Frame", QH:Concat(self.name, "_Dropdown"), self.nameplate.frame, "UIDropDownMenuTemplate");
	----self.dropdownmenu.unitid = unitid;
	----self.dropdownmenu:SetScript("OnLoad", function() UIDropDownMenu_Initialize(self.dropdownmenu, QHUnit.Initialize_DropDown, "MENU"); end);
	
	-- Decurse Button Variables
	self.decurse = QHButton:new(QH:Concat(self.name, "_Decurse"), self.frame);
	self.decurse.parent = self;

	-- Buff Variables
	self.buffs = QHBuffs:new(QH:Concat(self.name, "_Buff"), self.frame);
	self.buffs.parent = self;

	-- Damage Bar Variables
	self.damagebar = QHBar:new(QH:Concat(self.name, "_DamageBar"), self.frame);
	self.damagebar.parent = self;
	
	-- Reference Variables
	self.obj = self;
	self.parent = nil;
	self.frame.obj = self;
	
	-- Update Settings and Return
	self:UpdateSettings();
	return self;
end

---------------------------------------------------------------------------------------------
-- QHUnit Methods
---------------------------------------------------------------------------------------------
function QHUnit:Clear()
	
	-- Unit Variables
	self.unitname = nil;
	self.unitrace = nil;
	self.unitclass = nil;
	self.unitlevel = nil;
	self.unithealth = nil;
	self.unithealthmax = nil;
	self.unitpower = nil;
	self.unitpowermax = nil;
	
	self.nameplate:Clear();
	self.roleicon:Clear();
	self.raidicon:Clear();
	self.damagebar:Clear();
	self.decurse:Clear();
	self.buffs:Clear();
	self.warningbar:Clear();
	
	-- Call Update
	self:Update();
end

function QHUnit:SetPosition(x, y, align, relative, anchor)
	self.x = x;
	self.y = y;
	self.align = align;
	self.relative = relative;
	self.anchor = anchor;
end

function QHUnit:Resize()

	-- Calculate Total Width
	local w = 0;
	local count = 0;
	if self.name_pos and self.nameplate and self.nameplate.width then
		w = w + self.nameplate.width;
		count = count + 1;
	end
	if self.bar_pos and self.damagebar and self.damagebar.width then
		w = w + self.damagebar.width;
		count = count + 1;
	end
	if self.dec_pos and self.decurse and self.decurse.width then
		w = w + self.decurse.width;
		count = count + 1;
	end
	if self.role_pos and self.roleicon and self.roleicon_show and self:UnitIsRaid() then
		w = w + self.roleicon.width;
		count = count + 1;
	end
	
	w = w + max((count - 1) * 5, 0);

	-- Calculate Largest Height
	local h = 0;
	if self.nameplate and self.nameplate.height and self.nameplate.height > h then
		h = self.nameplate.height;
	end
	if self.damagebar and self.damagebar.height and self.damagebar.height > h then
		h = self.damagebar.height;
	end
	if self.decurse and self.decurse.height and self.decurse.height > h then
		h = self.decurse.height;
	end
	if self.roleicon and self.roleicon.height and self.roleicon.height > h then
		h = self.roleicon.height;
	end
	
	self.width = w;
	self.height = h;
	return w, h;
end

function QHUnit:SortElements()
	
	-- Wipe Element Table
	table.wipe(self.elements);
	
	-- TODO: Optional Order
	-- Insert Elements In Order
	if self.dec_pos then table.insert(self.elements, self.dec_pos, self.decurse); end
	if self.bar_pos then table.insert(self.elements, self.bar_pos, self.damagebar); end
	if self.name_pos then table.insert(self.elements, self.name_pos, self.nameplate); end
	if self.role_pos and self.roleicon_show then table.insert(self.elements, self.role_pos, self.roleicon); end
	
	-- Remove Gaps
	for n=1,self.numelements do
		if not self.elements[n] then
			self.elements[n] = "";
			table.remove(self.elements, n); 
		end
	end
end

function QHUnit:StartWarning()
	self.warning = true;
end

function QHUnit:StopWarning()
	self.warning = false;
end

function QHUnit:StartMoving(button)

	if self.obj.parent then
		self.obj.parent:StartMoving(button);
	elseif IsShiftKeyDown() then
		self.obj.moving = true;
		self.obj.frame:SetMovable(true);
		self.obj.frame:StartMoving();
	end
end

function QHUnit:StopMoving()

	if self.obj.parent then
		self.obj.parent:StopMoving();
	else
		self.obj.frame:StopMovingOrSizing();
		if self.obj.frame:IsMovable() then self.obj.frame:SetUserPlaced(false); end
		align, anchor, relative, x, y = self.frame:GetPoint();
		if not anchor then anchor = UIParent; end
		self.obj:SetPosition(x, y, align, relative, anchor);
		self.obj.moving = nil;
	end
end

---------------------------------------------------------------------------------------------
-- QHUnit Unit Methods
---------------------------------------------------------------------------------------------
function QHUnit:LoadUnitInfo()

	if UnitExists(self.unitid) then

		local _,var = nil;
		
		var = UnitName(self.unitid);
		if var ~= self.unitname then self.unitchanged = true; end
		self.unitname = var;
		
		_, var = UnitRace(self.unitid);
		if var ~= self.unitrace then self.unitchanged = true; end
		self.unitrace = var;
		
		_, var = UnitClass(self.unitid);
		if var ~= self.unitclass then self.unitchanged = true; end
		self.unitclass = var;

		var = UnitLevel(self.unitid);
		if var ~= self.unitlevel then self.unitchanged = true; end
		self.unitlevel = var;
		
		var = UnitHealth(self.unitid);
		if var ~= self.unithealth then self.unitchanged = true; end
		self.unithealth = var;

		var = UnitHealthMax(self.unitid);
		if var ~= self.unithealthmax then self.unitchanged = true; end
		self.unithealthmax = var;
		
		var = UnitPower(self.unitid);
		if var ~= self.unitpower then self.unitchanged = true; end
		self.unitpower = var;

		var = UnitPowerMax(self.unitid);
		if var ~= self.unitpowerhmax then self.unitchanged = true; end
		self.unitpowerhmax = var;
		
		var = UnitIsConnected(self.unitid);
		if var ~= self.unitconnected then self.unitchanged = true; end
		self.unitconnected = var;

		if (QH:IsWotLKOrAbove()) then
			var = UnitThreatSituation(self.unitid);
			if var ~= self.threat then self.unitchanged = true; end
			self.threat = var;
		end
	end
	return self.unitchanged;
end

function QHUnit:GetUnitType(unit)
	
	if not unit then unit = self.unitid; end
	
	-- Find Unit Type Of Unit
	if string.find(unit, "target", -6) then
		return "Target";
	elseif string.find(unit, "focus", -5) then
		return "Focus";
	elseif string.find(unit, "pet", -4) then
		return "Pet";
	elseif string.find(unit, "raid") then
		return "Raid";
	elseif string.find(unit, "party") then
		return "Party";
	elseif string.find(unit, "player") then
		return "Player";	
	end
end

function QHUnit:UnitIsPlayer(unit)

	if not unit then unit = self.unitid; end
	if string.find(unit, "player") then return true;
	else return false; end
end

function QHUnit:UnitIsParty(unit)

	if not unit then unit = self.unitid; end
	if string.find(unit, "party") then return true;
	else return false; end
end

function QHUnit:UnitIsRaid(unit)

	if not unit then unit = self.unitid; end
	if string.find(unit, "raid") then return true;
	else return false; end
end

function QHUnit:GetUnitID(unit)
	
	if not unit then unit = self.unitid; end
	
	-- Search Player/Target/Focus/Pet
	if UnitIsUnit(unit, "player") then
		return "player";
	elseif UnitIsUnit(unit, "target") then
		return "target";
	elseif UnitIsUnit(unit, "focus") then
		return "focus";
	elseif UnitIsUnit(unit, "pet") then
		return "pet";
	end

	-- Search Raid
	for i=1,40 do
		if UnitIsUnit(unit, QH:Concat("raid", i)) then
			return "raid";
		end
	end

	-- Search Party
	for i=1,4 do
		if UnitIsUnit(unit, QH:Concat("party", i)) then
			return "party";
		end
	end
end

function QHUnit:GetUnitHeals(unit)

	local amount = 0;
	
	-- Estimate Heals Being Cast On Unit
	
	return amount;
end

function QHUnit:GetUnitRoleIcon(unit)

	if not unit then unit = self.unitid; end

	local coordinates;
	local role = QH:GetRole(unit);
	if role == "TANK" then coordinates = {0, 19/64, 22/64, 41/64}; 			-- TANK
	elseif role == "HEALER" then coordinates = {20/64, 39/64, 1/64, 20/64}; -- HEALER
	else coordinates = {20/64, 39/64, 22/64, 41/64}; end				    -- DAMAGER
	--coordinates = {0, 19/64, 1/64, 20/64}; 					            -- LEADER
	
	return [[Interface\LFGFrame\UI-LFG-ICON-PORTRAITROLES]], coordinates;
end

function QHUnit:GetUnitRaidIcon(unit)

	if not unit then unit = self.unitid; end
	
	-- Get Raid Icon Texture
	local icon_texture = nil;
	local icon_index = GetRaidTargetIndex(unit);
	if icon_index then icon_texture = QH:Concat("Interface/TargetingFrame/UI-RaidTargetingIcon_", icon_index); end
	
	return icon_texture;

end

function QHUnit:GetCureableDebuff(unit)
	if not unit then unit = self.unitid; end
	return C_UnitAuras.GetAuraDataByIndex(unit,1,"HARMFUL|RAID");
end

function QHUnit:UnitHasBuffs(unit, buffs)
	if not unit then unit = self.unitid; end
	for n=1,40 do
		local aura = C_UnitAuras.GetAuraDataByIndex(unit, n);
		if (not aura) then break; end
		if (strfind(buffs, aura.name)) then
			return true;
		end
	end
	return false;
end

function QHUnit:ActionInRange(unit)
	for slot=1,72 do
		if(HasAction(slot) and ActionHasRange(slot) and IsActionInRange(slot, unit)) then return true; end
	end
end

function QHUnit:UnitInRange(unit)
	if UnitIsUnit(unit, "player") then return true; end
	
	local spell = "";
	local _, playerclass = UnitClass("player");
	if(playerclass == "PALADIN") then
		spell = QH_LOCALE_PALADINRANGE;
	elseif(playerclass == "PRIEST") then
		if (not QH:IsClassic() and GetSpecialization() == 2) then spell = QH_LOCALE_PRIESTRANGE2;
		else spell = QH_LOCALE_PRIESTRANGE; end
	elseif(playerclass == "DRUID") then
		spell = QH_LOCALE_DRUIDRANGE;
	elseif(playerclass == "SHAMAN") then
		if (QH:IsRetail()) then spell = QH_LOCALE_SHAMANRANGE;
		else spell = QH_LOCALE_SHAMANRANGE2; end
	elseif(playerclass == "MONK") then
		spell = QH_LOCALE_MONKRANGE;
	else
		return self:ActionInRange(unit);
	end

	if(C_Spell) then
		return C_Spell.IsSpellInRange(spell,unit) or self:ActionInRange(unit);
	else
		return IsSpellInRange(spell,unit) == 1 or CheckInteractDistance(unit, 4);
	end
end

function QHUnit:InitializeDropDown()
	local unit = self:GetParent().unit;
	if ( not unit ) then
		return;
	end
	local menu;
	local name;
	local id = nil;
	if ( UnitIsUnit(unit, "player") ) then
		menu = "SELF";
	elseif ( UnitIsUnit(unit, "vehicle") ) then
		-- NOTE: vehicle check must come before pet check for accuracy's sake because
		-- a vehicle may also be considered your pet
		menu = "VEHICLE";
	elseif ( UnitIsUnit(unit, "pet") ) then
		menu = "PET";
	elseif ( UnitIsPlayer(unit) ) then
		id = UnitInRaid(unit);
		if ( id ) then
			menu = "RAID_PLAYER";
		elseif ( UnitInParty(unit) ) then
			menu = "PARTY";
		else
			menu = "PLAYER";
		end
	else
		menu = "TARGET";
		name = RAID_TARGET_ICON;
	end
	if ( menu ) then
		--UnitPopup_ShowMenu(self, menu, unit, name, id);
		local contextData = {
			--fromTargetFrame = true;
			unit = unit,
			name = name,
		};
		UnitPopup_OpenMenu(menu, contextData)
	end
end

---------------------------------------------------------------------------------------------
-- QHUnit Events
---------------------------------------------------------------------------------------------
function QHUnit:OnEvent(event, unit, ...)
	
	-- Call Unit Update Method
	if unit then
	
		-- Get Unit Frame		
		local unit_frame = getglobal(QH:Concat("QHUnit_", unit));
		
		if unit_frame and not unit_frame.hideinraid and (type(unit_frame.obj[event]) == 'function') then
				
			-- Update Unit Info
			unit_frame.obj:LoadUnitInfo();
		
			-- Call Event Specific Function
			unit_frame.obj[event](unit_frame.obj, event, ...);
		end
	end
end

function QHUnit:UNIT_NAME_UPDATE(event, ...)

	-- Update Nameplate
	self.unitname = UnitName(self.unitid);
	self:UpdateNameplate();
end

function QHUnit:UNIT_HEALTH(event, ...)
	self:UpdateDamageBar();
end

function QHUnit:UNIT_HEALTH_FREQUENT(event, ...)
	self:UpdateDamageBar();
end

function QHUnit:UNIT_AURA(event, ...)
	self:UpdateAuras();
end

function QHUnit:UNIT_THREAT_SITUATION_UPDATE(event, ...)
	self:UpdateWarningBar();
end

function QHUnit:ForceUpdate(now)

	self.forceupdate = true;
	if now then self:Update(); end
end

function QHUnit:UpdateSettings()

	-- Update Settings
	self.range_check = QH:GetSetting("Bar_Range_Check");
	self.name_range_alpha = QH:GetSetting("Name_Range_Alpha");
	self.bar_range_alpha = QH:GetSetting("Bar_Range_Alpha");
	self.decurse_range_alpha = QH:GetSetting("Decurse_Range_Alpha");
	
	-- Update Nameplate Settings
	self.name_pos = QH:GetSetting(QH:Concat(self.unittype, "_Name_Position"));
	self.name_width = QH:GetSetting(QH:Concat(self.unittype, "_Name_Width"));
	self.name_height = QH:GetSetting(QH:Concat(self.unittype, "_Name_Height"));
	self.text_position = QH:GetSetting(QH:Concat(self.unittype, "_Name_Text_Position"));
	self.role_pos = QH:GetSetting(QH:Concat(self.unittype, "_Role_Position"));
	self.background_color = QH:GetSetting("Name_Background_Color");
	self.nameplate:SetSize(self.name_width, self.name_height);
	self.nameplate:SetTextPosition(self.text_position);
	if self.background_color then
		self.nameplate:SetBackgroundColor(self.background_color.r, self.background_color.g, self.background_color.b, self.background_color.a); 
	end
	
	-- Update RoleIcon Settings
	self.roleicon_show = QH:GetSetting("Raid_Role_Show");
	self.roleicon_width = QH:GetSetting(QH:Concat(self.unittype, "_Role_Icon_Width"));
	self.roleicon_height = QH:GetSetting(QH:Concat(self.unittype, "_Role_Icon_Height"));
	self.roleicon_offset = QH:GetSetting(QH:Concat(self.unittype, "_Role_Icon_Offset"));
	self.roleicon:SetSize(self.roleicon_width, self.roleicon_height);
	
	-- Update RaidIcon Settings
	self.raidicon_show = QH:GetSetting("Raid_Icon_Show");
	self.raidicon_width = QH:GetSetting(QH:Concat(self.unittype, "_Raid_Icon_Width"));
	self.raidicon_height = QH:GetSetting(QH:Concat(self.unittype, "_Raid_Icon_Height"));
	self.raidicon_offset = QH:GetSetting(QH:Concat(self.unittype, "_Raid_Icon_Offset"));
	self.raidicon:SetSize(self.raidicon_width, self.raidicon_height);
	
	-- Update WarningBar Settings
	self.warnings_show = QH:GetSetting("Warnings_Show");
	self.warnings_flash = QH:GetSetting("Warnings_Flash");
	self.warnings_standard = QH:GetSetting("Warnings_Show_Standard");
	self.warning_list =  QH:GetSetting("Warning_List");
	self.warnings_threat = QH:GetSetting("Warnings_Threat");
	self.instance = nil;
	self.warnings = self.warning_list;
	--self.warning_locale = QHWARNINGS[GetLocale()];
	self.warningbar:SetSize(self.width, self.height);
	
	-- Update DamageBar Settings
	self.bar_pos = QH:GetSetting(QH:Concat(self.unittype, "_Bar_Position"));
	self.bar_width = QH:GetSetting(QH:Concat(self.unittype, "_Bar_Width"));
	self.bar_height = QH:GetSetting(QH:Concat(self.unittype, "_Bar_Height"));
	self.bar_color_start = QH:GetSetting("Bar_Start_Color");
	self.bar_color_mid = QH:GetSetting("Bar_Mid_Color");
	self.bar_color_end = QH:GetSetting("Bar_End_Color");
	self.bar_color_hot = QH:GetSetting("Bar_Hot_Color");
	self.bar_label_show = QH:GetSetting("Bar_Label_Show");
	self.bar_color_label = QH:GetSetting("Bar_Label_Color");
	self.bar_background_show = QH:GetSetting("Bar_Background_Show");
	self.bar_background_color= QH:GetSetting("Bar_Background_Color");
	self.damagebar:SetSize(self.bar_width, self.bar_height);
	if self.bar_background_show then
		self.damagebar:SetBackgroundColor(self.bar_background_color.r, self.bar_background_color.g, self.bar_background_color.b, self.bar_background_color.a);
	else
		self.damagebar:SetBackgroundColor(0, 0, 0, 0);
	end

	-- Update DamageBar Button Settings
	self.bar_button_type = self.unittype;
	if self.bar_button_type == "Pet" then self.bar_button_type = "Party"; end
	self.bar_left_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Left_Click"));
	self.bar_shift_left_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Shift_Left_Click"));
	self.bar_ctrl_left_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Ctrl_Left_Click"));
	self.bar_alt_left_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Alt_Left_Click"));
	self.bar_right_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Right_Click"));
	self.bar_shift_right_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Shift_Right_Click"));
	self.bar_ctrl_right_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Ctrl_Right_Click"));
	self.bar_alt_right_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Alt_Right_Click"));
	self.bar_middle_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Middle_Click"));
	self.bar_shift_middle_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Shift_Middle_Click"));
	self.bar_ctrl_middle_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Ctrl_Middle_Click"));
	self.bar_alt_middle_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Alt_Middle_Click"));
	self.bar_button4_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Button4_Click"));
	self.bar_shift_button4_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Shift_Button4_Click"));
	self.bar_ctrl_button4_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Ctrl_Button4_Click"));
	self.bar_alt_button4_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Alt_Button4_Click"));
	self.bar_button5_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Button5_Click"));
	self.bar_shift_button5_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Shift_Button5_Click"));
	self.bar_ctrl_button5_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Ctrl_Button5_Click"));
	self.bar_alt_button5_click = QH:GetSetting(QH:Concat(self.bar_button_type, "_Alt_Button5_Click"));
	
	-- Update Decurse Settings
	self.dec_show = QH:GetSetting("Decurse_Show");
	self.dec_pos = QH:GetSetting(QH:Concat(self.unittype, "_Decurse_Position"));
	self.dec_width = QH:GetSetting(QH:Concat(self.unittype, "_Decurse_Width"));
	self.dec_height = QH:GetSetting(QH:Concat(self.unittype, "_Decurse_Height"));
	self.decurse:SetSize(self.dec_width, self.dec_height);

	-- Update Decurse Button Settings
	self.decurse_left_click = QH:GetSetting("Decurse_Left_Click");
	self.decurse_right_click = QH:GetSetting("Decurse_Right_Click");
	self.decurse_middle_click = QH:GetSetting("Decurse_Middle_Click");
	
	-- Update Buff Settings
	self.buff_show = QH:GetSetting("Buff_Show");
	self.buff_width = QH:GetSetting(QH:Concat(self.unittype, "_Buff_Width"));
	self.buff_height = QH:GetSetting(QH:Concat(self.unittype, "_Buff_Height"));
	self.buff_list = QH:GetSetting("Buff_List");
	self.buffs:SetBuffSize(self.buff_width, self.buff_height);
	
	-- Force Secure Update
	self:ForceUpdate(true);
end

function QHUnit:Update()

	-- Load Unit Info
	self:LoadUnitInfo();
	
	-- Hide If Unit Doesn't Exist
	if not UnitExists(self.unitid) or self.hideinraid then
	
		-- Clear
		if self.nameplate then self.nameplate:Clear(); end
		if self.roleicon then self.roleicon:Clear(); end
		if self.raidicon then self.raidicon:Clear(); end
		if self.damagebar then self.damagebar:Clear(); end
		if self.decurse then self.decurse:Clear(); end
		if self.buffs then self.buffs:Clear(); end
		if self.warningbar then self.warningbar:Clear(); end
	end
	
	-- Secure Update
	if self.forceupdate then self:UpdateSecure(); end

	-- Update Position
	self:UpdatePosition();

	-- Update Range
	self:UpdateRange();

	-- Update Nameplate
	self:UpdateNameplate();

	-- Update Raid Icon
	self:UpdateRoleIcon();

	-- Update Raid Icon
	self:UpdateRaidIcon();

	-- Update Damage Bar
	self:UpdateDamageBar();

	-- Update Decurse Button
	self:UpdateDecurse();

	-- Update Buffs
	self:UpdateBuffs();

	-- Update Warning Bar
	self:UpdateWarningBar();
	
	-- Mark Unit Updated
	self.unitchanged = false;
end

function QHUnit:UpdateSecure()

	-- if InCombatLockdown() then QH:Print("Quick Heal is Combat Locked!", 1, 0, 0); end
	
	-- Secure Code
	if not InCombatLockdown() then
		self.forceupdate = false;
	
		-- Set Show/Hide Attributes
		self.frame:SetAttribute("unit", unitid);
		if self:UnitIsParty() then
			if QH:IsInArena() then
				RegisterStateDriver(self.frame, "visibility", QH:Concat("[@", self.unitid,", party] show"));
			else
				RegisterStateDriver(self.frame, "visibility", QH:Concat("[group:raid] hide; [@", self.unitid,", party] show"));
			end
		elseif self:UnitIsRaid() then
			if QH:GetSetting("Raid_Frame_Show") then
				if QH:IsInArena() then
					RegisterStateDriver(self.frame, "visibility", "hide");
				else
					RegisterStateDriver(self.frame, "visibility", QH:Concat("[@", self.unitid, ", raid, group:raid] show; hide"));
				end
			else
				RegisterStateDriver(self.frame, "visibility", "hide");
			end
		else
			RegisterStateDriver(self.frame, "visibility", QH:Concat("[@", self.unitid,", exists] show; hide"));
		end
		
		-- Set Element Positions
		local x = 0;
		self:SortElements();
		for index,value in pairs(self.elements) do
			if value and value.width then
				value:SetPosition(x, 0, "LEFT", "LEFT", self.frame);
				x = x + value.width + 5;
			end
		end

		-- Verify Size
		self:Resize();
		if not self.width then self.width = 0; end
		if not self.height then self.height = 0; end

		-- Verify Position
		if not self.x then self.x = 0; end
		if not self.y then self.y = 0; end
		if not self.align then self.align = "TOPLEFT"; end
		
		self:UpdateNameplateSecure();
		self:UpdateDamageBarSecure();
		self:UpdateDecurseSecure();
	end
end

function QHUnit:UpdatePosition()

	-- Secure Code
	if not InCombatLockdown() then

		-- Frame Size
		self.frame:SetWidth(self.width);
		self.frame:SetHeight(self.height);

		-- Frame Position
		if not self.moving then
			self.frame:ClearAllPoints();
			self.frame:SetPoint(self.align, self.anchor, self.relative, self.x, self.y);
		end
	end
end

function QHUnit:UpdateRange()
	
	if not self.range_check or self:UnitInRange(self.unitid) then
		self.nameplate:UpdateAlpha(1.0);
		self.damagebar:UpdateAlpha(1.0);
		self.decurse:UpdateAlpha(1.0);
	else
		self.nameplate:UpdateAlpha(self.name_range_alpha);
		self.damagebar:UpdateAlpha(self.bar_range_alpha);
		self.decurse:UpdateAlpha(self.decurse_range_alpha);
	end
end

function QHUnit:UpdateNameplate()

	if self.nameplate then

		if not self.name_pos or not self.unitname or self.hideinraid then
			-- Clear
			self.nameplate:Clear();
		else
			-- Label Value
			self.nameplate:SetText(self.unitname);

			-- Set Label Color
			if not UnitIsConnected(self.unitid) then
				self.nameplate:SetTextColor(0.5, 0.5, 0.5, 1.0);
			elseif self.unitclass then
				self.nameplate:SetTextColor(RAID_CLASS_COLORS[self.unitclass].r, RAID_CLASS_COLORS[self.unitclass].g, RAID_CLASS_COLORS[self.unitclass].b, 1.0);
			else
				self.nameplate:SetTextColor(1.0, 1.0, 1.0, 1.0);
			end

			-- Update
			self.nameplate:Update();
		end
	end
end

function QHUnit:UpdateNameplateSecure()

	-- Secure Code
	if not InCombatLockdown() then
		if self.name_pos then
			-- Enable Button
			self.nameplate.button:EnableMouse(true);
			self.nameplate.button:RegisterForDrag("LeftButton");
			self.nameplate.button:SetScript("OnDragStart", self.StartMoving);
			self.nameplate.button:SetScript("OnDragStop", self.StopMoving);

			self.nameplate.frame.unit = self.unitid;
			self.nameplate.button:SetAttribute("unit", self.unitid);
			self.nameplate.button:SetAttribute("*type1", "target");
			self.nameplate.button:SetAttribute("*type2", "menu");
			self.nameplate.button:RegisterForClicks("LeftButtonUp", "RightButtonUp");

			self.nameplate.button.menu = function()
				--UIDropDownMenu_Initialize(self.nameplate.dropdown, CompactUnitFrameDropDown_Initialize, "MENU");
				UIDropDownMenu_Initialize(self.nameplate.dropdown, self.InitializeDropDown, "MENU");
				ToggleDropDownMenu(1, nil, self.nameplate.dropdown, self.nameplate.button, 0, 0);
				--_G["DropDownList1Button2"]:Hide();
			end
		else
			-- Disable Button
			self.nameplate.button:EnableMouse(false);
		end
	end
end

function QHUnit:UpdateRoleIcon()

	if self.roleicon then
		
		local roleicon, coordinates = self:GetUnitRoleIcon();
		if not roleicon or not self.roleicon_show or self.hideinraid or not self:UnitIsRaid() then
			-- Clear
			self.roleicon:Clear();
		else
			-- Set Role Icon
			if not self.roleicon_offset then self.roleicon_offset = 0; end
			--self.roleicon:SetPosition(0, 0, "RIGHT", "RIGHT", self.nameplate.frame);
			self.roleicon:SetIcon(roleicon, coordinates);

			-- Update
			self.roleicon:Update();
		end
	end
end

function QHUnit:UpdateRaidIcon()
	if self.raidicon then
		local raid_icon = self:GetUnitRaidIcon();
		--local raid_icon, coordinates = self:GetUnitRoleIcon();
		if not raid_icon or not self.raidicon_show or self.hideinraid then
			-- Clear
			self.raidicon:Clear();
		else
			-- Set Raid Icon
			if not self.raidicon_offset then self.raidicon_offset = 0; end
			self.raidicon:SetPosition(-self.nameplate.label:GetStringWidth() - self.raidicon_offset, 0, "RIGHT", "RIGHT", self.nameplate.frame);
			self.raidicon:SetIcon(raid_icon);

			-- Update
			self.raidicon:Update();
		end
	end
end

function QHUnit:UpdateWarningBar()
	if self.warningbar and not self.hideinraid then
		-- Check For Warnings
		self.warning = false;
		if self.warnings_show then
			-- Check Buffs
			if self.warnings and self:UnitHasBuffs(self.unitid, self.warnings) then self.warning = true; end
		end

		-- Show Warning Bar
		if self.warnings_threat and self:UnitIsRaid() and self.threat and self.threat >= 2 then
			-- Start Warning Bar
			self.warningbar:SetBackgroundColor(GetThreatStatusColor(self.threat));
			self.warningbar:StopFlashing();
			self.warningbar:Update();
		elseif self.warning then
			-- Start Warning Bar
			self.warningbar:SetBackgroundColor(0.6, 0.25, 0.6, 1.0);
			if self.warnings_flash then
				if not self.warningbar.flashing then self.warningbar:StartFlashing(); end
			else
				self.warningbar:StopFlashing();
			end
			self.warningbar:Update();
		else
			-- Clear
			self.warningbar:Clear();
		end
	else
		-- Clear
		self.warningbar:Clear();
	end
end

function QHUnit:UpdateDamageBar()
	if self.damagebar then
		if not self.bar_pos or not self.unithealth or not self.unithealthmax or not UnitIsConnected(self.unitid) or self.hideinraid then
			-- Clear And Hide
			self.damagebar:Clear();
		else
			-- Calculate Damage Percentage
			local damage = 1 - (self.unithealth / self.unithealthmax);

			-- Calculate Heal Estimates
			--local heals = self:GetUnitHeals(self.unitid);

			-- Set Bar Positions
			self.damagebar:SetValueFront(self.unithealthmax - self.unithealth, self.unithealthmax);

			-- Set Bar Colors
			local red, green, blue;
			if damage < 0.5 then
				red = self.bar_color_start.r + ((self.bar_color_mid.r - self.bar_color_start.r) * (damage / 0.5));
				green = self.bar_color_start.g + ((self.bar_color_mid.g - self.bar_color_start.g) * (damage / 0.5));
				blue = self.bar_color_start.b + ((self.bar_color_mid.b - self.bar_color_start.b) * (damage / 0.5));
			else
				red = self.bar_color_mid.r + ((self.bar_color_end.r - self.bar_color_mid.r) * ((damage / 0.5) - 1));
				green = self.bar_color_mid.g + ((self.bar_color_end.g - self.bar_color_mid.g) * ((damage / 0.5) - 1));
				blue = self.bar_color_mid.b + ((self.bar_color_end.b - self.bar_color_mid.b) * ((damage / 0.5) - 1));
			end
			self.damagebar:SetColorFront(red, green, blue, range_alpha);
			self.damagebar:SetTextColorLeft(self.bar_color_label.r, self.bar_color_label.g, self.bar_color_label.b, self.bar_color_label.a);
			self.damagebar:SetTextColorRight(self.bar_color_label.r, self.bar_color_label.g, self.bar_color_label.b, self.bar_color_label.a);

			-- Set Left Label
			if self.bar_label_show and UnitIsDeadOrGhost(self.unitid) then
				self.damagebar:SetTextLeft("Dead");
			elseif self.bar_label_show and damage > 0 then
				self.damagebar:SetTextLeft(-(self.unithealthmax - self.unithealth));
			else
				self.damagebar:SetTextLeft("");
			end

			-- Set Right Label
			--self.damagebar:SetTextRight(self.unitid);
						
			-- Update
			self.damagebar:Update();
			
			-- Set Buff Position
			self.buffs:SetPosition(self.damagebar.labelleft:GetStringWidth() + self.damagebar.x, 0, "LEFT", "LEFT", self.frame);
			self.buffs:Update();
		end
	end
end

function QHUnit:UpdateDamageBarSecure()
	-- Secure Code
	if not InCombatLockdown() then
		-- Set Button Attributes
		self:UpdateButton(self.damagebar.button, 1, self.bar_left_click, self.bar_shift_left_click, self.bar_ctrl_left_click, self.bar_alt_left_click, true);
		self:UpdateButton(self.damagebar.button, 2, self.bar_right_click, self.bar_shift_right_click, self.bar_ctrl_right_click, self.bar_alt_right_click, false);
		self:UpdateButton(self.damagebar.button, 3, self.bar_middle_click, self.bar_shift_middle_click, self.bar_ctrl_middle_click, self.bar_alt_middle_click, false);
		self:UpdateButton(self.damagebar.button, 4, self.bar_button4_click, self.bar_shift_button4_click, self.bar_ctrl_button4_click, self.bar_alt_button4_click, false);
		self:UpdateButton(self.damagebar.button, 5, self.bar_button5_click, self.bar_shift_button5_click, self.bar_ctrl_button5_click, self.bar_alt_button5_click, false);
	end
end

function QHUnit:UpdateAuras()
	-- Update Decurse Button
	self:UpdateDecurse();
	
	-- Update Buffs
	self:UpdateBuffs();
	
	-- Update Warning Bar
	self:UpdateWarningBar();
end

function QHUnit:UpdateDecurse()
	if self.decurse then
		local debuff = self:GetCureableDebuff();
		if not self.dec_pos or not self.dec_show or not debuff or self.hideinraid then
			-- Clear
			self.decurse:Clear();
		else
			-- Update Icon
			self.decurse:SetIcon(debuff.icon);
			if debuff.dispelName then
				if self.dec_width > 20 then self.decurse:SetText(debuff.dispelName);
				else self.decurse:SetText(string.sub(debuff.dispelName, 1, 1)); end
			else
				self.decurse:SetText("");
			end
			
			-- Update
			self.decurse:Update();
		end
	end
end

function QHUnit:UpdateDecurseSecure()
	
	-- Secure Code
	if not InCombatLockdown() then

		-- Set Button Attributes
		self:UpdateButton(self.decurse.button, 1, self.decurse_left_click);
		self:UpdateButton(self.decurse.button, 2, self.decurse_right_click);
		self:UpdateButton(self.decurse.button, 3, self.decurse_middle_click);
	end
end

function QHUnit:UpdateBuffs()
	if self.buffs then
		if not self.buff_list or not self.buff_show or self.hideinraid then
			-- Clear
			self.buffs:Clear();
		else
			-- Set Position
			self.buffs:SetPosition(self.damagebar.labelleft:GetStringWidth() + self.damagebar.x, 0, "LEFT", "LEFT", self.frame);
			
			-- Update Buffs
			self.buffs:Clear();
			local buff_index = 0;
			for n=1,40 do
				local filter;
				if (QH:IsWotLKOrAbove()) then filter = "PLAYER|HELPFUL"; end
				local aura = C_UnitAuras.GetAuraDataByIndex(self.unitid, n, filter);
				if (not aura) then break; end
				if (strfind(self.buff_list, aura.name)) then
					-- Update Icon
					buff_index = buff_index + 1;
					local count = aura.applications
					if count == 0 then count = ""; end
					self.buffs:SetBuff(buff_index, aura.icon, count, aura.expirationTime);
				end
			end

			-- Update
			self.buffs:Update();
		end
	end
end

function QHUnit:UpdateButton(button, index, action, shiftaction, ctrlaction, altaction, ondeath)
	if button then
		local unit = self.unitid;
		
		button:Enable();
		button:SetAttribute("unit", unit);
		button:RegisterForClicks("AnyUp", "AnyDown");

		local _, playerclass = UnitClass("player");
		local resurrection = "";
		local battle_resurrection = "";
		if(playerclass == "PRIEST") then
			resurrection = QH_LOCALE_PRIESTRES;
			battle_resurrection = QH_LOCALE_PRIESTRES;
		elseif(playerclass == "DRUID") then
			resurrection = QH_LOCALE_DRUIDRES;
			battle_resurrection = QH_LOCALE_DRUIDBATTLERES;
			if (QH:IsClassic()) then resurrection = battle_resurrection; end
		elseif(playerclass == "PALADIN") then
			resurrection = QH_LOCALE_PALADINRES;
			battle_resurrection = QH_LOCALE_PALADINRES;
		elseif(playerclass == "SHAMAN") then
			resurrection = QH_LOCALE_SHAMANRES;
			battle_resurrection = QH_LOCALE_SHAMANRES;
		elseif(playerclass == "MONK") then
			resurrection = QH_LOCALE_MONKRES;
			battle_resurrection = QH_LOCALE_MONKRES;
		end

		if(action == nil) then action = ""; end
		if(shiftaction == nil) then shiftaction = ""; end
		if(ctrlaction == nil) then ctrlaction = ""; end
		if(altaction == nil) then altaction = ""; end

		-- Get Macro Commands
		local name, texture, macrobody, localVar = GetMacroInfo(GetMacroIndexByName(string.gsub(action, "%!", "")));
		local shiftname, shifttexture, shiftmacrobody, shiftlocalVar = GetMacroInfo(GetMacroIndexByName(string.gsub(shiftaction, "%!", "")));
		local ctrlname, ctrltexture, ctrlmacrobody, ctrllocalVar = GetMacroInfo(GetMacroIndexByName(string.gsub(ctrlaction, "%!", "")));
		local altname, alttexture, altmacrobody, altlocalVar = GetMacroInfo(GetMacroIndexByName(string.gsub(altaction, "%!", "")));
		if QH.macrosloaded then
			if string.find(action, "!") then QH:SetSetting(action, macrobody); end
			if string.find(shiftaction, "!") then QH:SetSetting(shiftaction, shiftmacrobody); end
			if string.find(ctrlaction, "!") then QH:SetSetting(ctrlaction, ctrlmacrobody); end
			if string.find(altaction, "!") then QH:SetSetting(altaction, altmacrobody); end
		else
			if string.find(action, "!") then macrobody = QH:GetSetting(action); end
			if string.find(shiftaction, "!") then shiftmacrobody = QH:GetSetting(shiftaction); end
			if string.find(ctrlaction, "!") then ctrlmacrobody = QH:GetSetting(ctrlaction); end
			if string.find(altaction, "!") then macraltmacrobodybody = QH:GetSetting(altaction); end
		end

		--Add Ressurect spell to Click upon death
		if(ondeath) then
			button:SetAttribute(QH:Concat("type",index), "macro");
			if(string.find(action, "!") and macrobody) then
				button:SetAttribute(QH:Concat("macrotext",index), QH:Concat("/cast [@", unit, ", dead, combat] ", battle_resurrection, ";", "/cast [@", unit, ", dead] ", resurrection, ";", string.char(13), string.gsub(macrobody, "unit", unit), ""));
			else
				button:SetAttribute(QH:Concat("macrotext",index), QH:Concat("/cast [@", unit, ", dead, combat] ", battle_resurrection, ";", "/cast [@", unit, ", dead] ", resurrection, "; [@", unit, "] ", action, ";"));
				--button:SetAttribute(QH:Concat("macrotext",index), QH:Concat("/cast [@", unit, "] ", action, ";\n/run QH:PrintAll(\"Casting ", action, " on ", unit, "\");"));
			end

		--Normal Click
		else
			if(string.find(action, "!") and macrobody) then
				--Substitue "unit" variable in macro
				button:SetAttribute(QH:Concat("type",index), "macro");
				button:SetAttribute(QH:Concat("macrotext",index), string.gsub(macrobody, "unit", unit));
			else
				button:SetAttribute(QH:Concat("type",index), "spell");
				button:SetAttribute(QH:Concat("spell",index), string.gsub(action, "!", ""));
			end
		end

		--Shift-Click
		if(string.find(shiftaction, "!") and shiftmacrobody) then
			--Substitue "unit" variable in macro
			button:SetAttribute(QH:Concat("shift-type",index), "macro");
			button:SetAttribute(QH:Concat("shift-macrotext",index), string.gsub(shiftmacrobody, "unit", unit));
		else
			button:SetAttribute(QH:Concat("shift-type",index), "spell");
			button:SetAttribute(QH:Concat("shift-spell",index), string.gsub(shiftaction, "!", ""));
		end

		--Ctrl-Click
		if(string.find(ctrlaction, "!") and ctrlmacrobody) then
			--Substitue "unit" variable in macro
			button:SetAttribute(QH:Concat("ctrl-type",index), "macro");
			button:SetAttribute(QH:Concat("ctrl-macrotext",index), string.gsub(ctrlmacrobody, "unit", unit));
		else
			button:SetAttribute(QH:Concat("ctrl-type",index), "spell");
			button:SetAttribute(QH:Concat("ctrl-spell",index), string.gsub(ctrlaction, "!", ""));
		end

		--Alt-Click
		if(string.find(altaction, "!") and altmacrobody) then
			--Substitue "unit" variable in macro
			button:SetAttribute(QH:Concat("alt-type",index), "macro");
			button:SetAttribute(QH:Concat("alt-macrotext",index), string.gsub(altmacrobody, "unit", unit));
		else
			button:SetAttribute(QH:Concat("alt-type",index), "spell");
			button:SetAttribute(QH:Concat("alt-spell",index), string.gsub(altaction, "!", ""));
		end
	end
end