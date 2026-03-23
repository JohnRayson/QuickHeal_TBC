---------------------------------------------------------------------------------------------
-- QHRaid Class
---------------------------------------------------------------------------------------------
QHRaid = {};
QHRaid.__index = QHRaid;

function QHRaid:new(id)

	-- Metatable
	local self = {};
     	setmetatable(self, QHRaid);
     	
     	-- Position Variables
	self.x = 0;
	self.y = 0;
	self.align = "TOPLEFT";
	self.relative = "TOPLEFT";
	self.anchor = "UIParent";
	self.width = 0;
	self.height = 0;
	self.moving = nil;
	
	-- Frame Variables
	self.id = id;
	self.name = QH:Concat("QHRaid", id);
	self.globalframe = CreateFrame("Frame", self.name, UIParent, "QHRAIDTEMPLATE");
	self.frame = getglobal(QH:Concat(self.globalframe:GetName(), "_Frame"));

	-- Background Variables
	self.background = CreateFrame("Frame", QH:Concat("QHRaid", id, "Background"), UIParent, "QHBACKGROUNDTEMPLATE");
	self.backgroundtexture = getglobal(QH:Concat(self.background:GetName(), "Texture"));
	self.backdrop = {bgFile = "", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
			 tile = true, tileSize = 4, edgeSize = 8,
			 insets = { left = 2, right = 2, top = 2, bottom = 2 }};
	
	-- Raid Unit Variables
	self.raidunit = {};
	self.notinraid = {};
	self.raidsorted = {};
	self.forceupdate = true;
	for n = 1,40 do
		self.raidunit[n] = QHUnit:new(QH:Concat("raid", n));
		self.raidunit[n].parent = self;
		self.raidunit[n]:SetPosition(0, 0, "CENTER", "CENTER", self.frame);
		self.raidsorted[n] = self.raidunit[n];
	end
	
	-- Modify raid unit menus
	Menu.ModifyMenu("MENU_UNIT_SELF", function(ownerRegion, rootDescription, contextData)
		if contextData.unit ~= nil then
			local text = "|cff20ff20Show as Tank";
			if(tContains(QH.tankoverrides, UnitName(contextData.unit))) then
				text ="|cffff2020Unshow as Tank";
			end
			rootDescription:CreateButton(text, function() QH:ToggleTankOverride(contextData.unit) end)
		end
	end)
	Menu.ModifyMenu("MENU_UNIT_RAID_PLAYER", function(ownerRegion, rootDescription, contextData)
		if contextData.unit ~= nil then
			local text = "|cff20ff20Show as Tank";
			if(tContains(QH.tankoverrides, UnitName(contextData.unit))) then
				text ="|cffff2020Unshow as Tank";
			end
			rootDescription:CreateButton(text, function() QH:ToggleTankOverride(contextData.unit) end)
		end
	end)
	
	-- Reference Variables
	self.obj = self;
	self.parent = nil;
	self.frame.obj = self;
	self.globalframe.obj = self;
	
	-- Call Update Function and Return
	self:UpdateSettings();
	return self;
end

---------------------------------------------------------------------------------------------
-- QHRaid Methods
---------------------------------------------------------------------------------------------
function QHRaid:SetPosition(x, y, align, relative, anchor)

	-- Set Position
	if x then self.x = x; end
	if y then self.y = y; end
	if align then self.align = align; end
	if relative then self.relative = relative; end
	self.anchor = UIParent;
	
	-- Save Position
	QH:SetSetting("Raid_Position_X", x);
	QH:SetSetting("Raid_Position_Y", y);
	QH:SetSetting("Raid_Position_Align", align);
	QH:SetSetting("Raid_Position_Anchor", "UIParent");
	QH:SetSetting("Raid_Position_Relative", relative);
end

function QHRaid:ReSize()

	local pad_width = 8;
	local pad_height = 4;
	local maxrows = QH:GetSetting("Raid_Rows");

	-- Calculate Dimensions of Sorted Rows
	local w = 0;
	local h = 0;
	for row,value in pairs(self.raidsorted) do
	
		local col = floor((row - 1) / maxrows);
		if value then
		
			if row <= maxrows then
				h = h + value.height + QH:GetSetting("Raid_Row_Spacing");
			end
			w = max(((col + 1) * value.width) + (QH:GetSetting("Raid_Col_Spacing") * col), w);
		end
	end

	-- Calculate Dimensions of Unsorted Rows
	local possible_w = w;
	local possible_h = h;
	for index, value in pairs(self.notinraid) do
	
		local row = #(self.raidsorted) + index;
		local col = floor((row - 1) / maxrows);
		if value then

			if row <= maxrows then
				possible_h = possible_h + value.height + QH:GetSetting("Raid_Row_Spacing");
			end
			possible_w = max(((col + 1) * value.width) + (QH:GetSetting("Raid_Col_Spacing") * col), possible_w);
		end
	
		if UnitExists(value.unitid) then -- and not value.hideinraid then
			w = possible_w;
			h = possible_h;
		end
	end
	
	self.width = w + pad_width + QH:GetSetting("Raid_Col_Offset");
	self.height = h + pad_height + QH:GetSetting("Raid_Row_Offset");
	return self.width, self.height;
end

function QHRaid:Sort()

	local method = QH:GetSetting("Raid_Sort_By");
	local groups = QH:GetSetting("Raid_Groups");
	local dynamic_groups = QH:GetSetting("Raid_Dynamic_Groups");
	if dynamic_groups then
		local _, _, _, _, instance_max = GetInstanceInfo();
		if instance_max > 0 then groups = "1;"; 
		else groups = "1;2;3;4;5;6;7;8;"; end
		if instance_max > 5 then groups = QH:Concat(groups, "2;"); end
		if instance_max > 10 then groups = QH:Concat(groups, "3;"); end
		if instance_max > 15 then groups = QH:Concat(groups, "4;"); end
		if instance_max > 20 then groups = QH:Concat(groups, "5;"); end
		if instance_max > 25 then groups = QH:Concat(groups, "6;"); end
		if instance_max > 30 then groups = QH:Concat(groups, "7;"); end
		if instance_max > 35 then groups = QH:Concat(groups, "8;"); end
	end	
	
	-- Clean Table
	table.wipe(self.notinraid);
	table.wipe(self.raidsorted);
	for n = 1,40 do
		local unit = self.raidunit[n];
		local name, rank, subgroup = GetRaidRosterInfo(tonumber(n));
		if unit then
			unit.hideinraid = not groups or not string.find(groups, subgroup);
			if UnitExists(unit.unitid) and not unit.hideinraid then
				table.insert(self.raidsorted, unit);
			else
				table.insert(self.notinraid, unit);
			end
		end
	end
	
	-- Sort Units
	if(method == "CLASS") then
	
		function CompareClass(a, b)
		
			if not a or not a.unitclass then return false; end
			if not b or not b.unitclass then return true; end
			
			local order = QH:GetSetting("Raid_Class_Order");
			local ai = string.find(order, a.unitclass);
			local bi = string.find(order, b.unitclass);
			
			if not ai then return false; end
			if not bi then return true; end
			
			if ai == bi then 
				if not a.unitname then return false; end
				if not b.unitname then return true; end
				return a.unitname < b.unitname; 
			end
		
			return ai < bi;
		end
		table.sort(self.raidsorted, CompareClass);
		
		-- Add Class Labels/Breaks
		
	elseif(method == "GROUP") then
	
		function CompareGroup(a, b)
			
			if not a or not a.unitid then return false; end
			if not b or not b.unitid then return true; end
			
			local ai = string.gsub(a.unitid, "raid", "");
			local bi = string.gsub(b.unitid, "raid", "");
			local namea, ranka, subgroupa = GetRaidRosterInfo(tonumber(ai));
			local nameb, rankb, subgroupb = GetRaidRosterInfo(tonumber(bi));
			
			if subgroupa == subgroupb then 
				if not a.unitname then return false; end
				if not b.unitname then return true; end
				return a.unitname < b.unitname;
			end
			return subgroupa < subgroupb;
		end
		table.sort(self.raidsorted, CompareGroup);
		
		-- Add Group Labels/Breaks
		
	elseif(method == "ROLE") then
	
		function CompareGroup(a, b)
					
			if not a or not a.unitid then return false; end
			if not b or not b.unitid then return true; end

			local ai = string.gsub(a.unitid, "raid", "");
			local bi = string.gsub(b.unitid, "raid", "");
			local namea, ranka, subgroupa,_,_,_,_,_,_,_,_,rolea = GetRaidRosterInfo(tonumber(ai));
			local nameb, rankb, subgroupb,_,_,_,_,_,_,_,_,roleb = GetRaidRosterInfo(tonumber(bi));
			if (QH:IsClassic()) then
				rolea = QH:GetRole(a.unitid);
				roleb = QH:GetRole(b.unitid);
			end
			
			if rolea == roleb then
				if subgroupa == subgroupb then 
					if not a.unitname then return false; end
					if not b.unitname then return true; end
					return a.unitname < b.unitname;
				end
				return subgroupa < subgroupb;
			end
			
			if rolea == "TANK" then return true;
			elseif roleb == "TANK" then return false;
			elseif rolea == "HEALER" then return true;
			elseif roleb == "HEALER" then return false;
			end;
			
			return rolea > roleb;
		end
		table.sort(self.raidsorted, CompareGroup);
	end
end

function QHRaid:GetUnitByName(name)
	for index, unit in pairs(self.raidunit) do
		if UnitName(unit) == name then return unit.unitid; end
	end
end

function QHRaid:StartMoving(button)

	if self.obj.parent then
		self.obj.parent:StartMoving(button);
	elseif IsShiftKeyDown() then
		self.obj.moving = true;
		self.obj.frame:SetMovable(true);
		self.obj.frame:StartMoving();
		self.background:SetScript("OnUpdate", function()
			local align, anchor, relative, x, y = self.obj.frame:GetPoint();
			if align and x and y then
				if not anchor then anchor = UIParent; end
				self.background:ClearAllPoints();
				self.background:SetPoint(align, anchor, relative, x, y);
			end
		end);
	end
end

function QHRaid:StopMoving()

	if self.obj.parent then
		self.obj.parent:StopMoving();
	else
		self.obj.frame:StopMovingOrSizing();
		if self.obj.frame:IsMovable() then self.obj.frame:SetUserPlaced(false); end
		self.background:SetScript("OnUpdate", nil);
		align, anchor, relative, x, y = self.frame:GetPoint();
		anchor = UIParent;
		self.obj:SetPosition(x, y, align, relative, anchor);
		self.background:SetPoint(align, anchor, relative, x, y);
		self.obj.moving = nil;
	end
end

local default_raid_frames_hidden = false;
function QHRaid:HideDefaultRaidFrames()
	if self.hide_default_raid_frame and CompactRaidFrameManager then
			local function hideRaid()
				if self.hide_default_raid_frame then
					CompactRaidFrameManager:UnregisterAllEvents()
					CompactRaidFrameContainer:UnregisterAllEvents()
					if( InCombatLockdown() ) then return end

					CompactRaidFrameManager:Hide()
					local shown = CompactRaidFrameManager_GetSetting("IsShown")
					if( shown and shown ~= "0" ) then
						CompactRaidFrameManager_SetSetting("IsShown", "0")
					end
				end
			end

			hooksecurefunc("CompactRaidFrameManager_UpdateShown", function()
					hideRaid()
			end)

			hideRaid()
			CompactRaidFrameContainer:HookScript("OnShow", hideRaid)
			CompactRaidFrameManager:HookScript("OnShow", hideRaid)
	end
	default_raid_frames_hidden = true;
end

function QHRaid:ShowDefaultRaidFrames()
	if default_raid_frames_hidden and not self.hide_default_raid_frame then
		CompactRaidFrameManager_OnLoad(CompactRaidFrameManager);
		if IsInRaid() then CompactRaidFrameManager:Show(); end
		CompactRaidFrameContainer_OnLoad(CompactRaidFrameContainer);
		CompactRaidFrameContainer:Show();
		default_raid_frames_hidden = false;
	end
end

---------------------------------------------------------------------------------------------
-- QHRaid Events
---------------------------------------------------------------------------------------------
function QHRaid:ForceUpdate(now)

	self.forceupdate = true;
	if now then self:Update(); end
end

function QHRaid:UpdateSettings()

	-- Update Settings
	self.hide_party = QH:GetSetting("Raid_Party_Hide");
	self.background_color = QH:GetSetting("Raid_Background_Color");
	self.background_show = QH:GetSetting("Raid_Background_Show");
	self.align = QH:GetSetting("Raid_Position_Align");
	self.relative = QH:GetSetting("Raid_Position_Relative");
	self.x = QH:GetSetting("Raid_Position_X");
	self.y = QH:GetSetting("Raid_Position_Y");
	self.hide_default_raid_frame = QH:GetSetting("Raid_Default_Frame_Hide");

	-- Update Unit Settings
	for index,value in pairs(self.raidunit) do
		value:UpdateSettings();
	end

	self:ForceUpdate();
	self:Update();
end

function QHRaid:Update()

	if UnitInRaid("player") and (not QH:IsInArena()) and QH:GetSetting("Raid_Frame_Show") then --  or GetNumGroupMembers() > 0

		-- Set Frame Background
		self:ReSize();
		if self.width and self.height then
			self.background:SetWidth(self.width);
			self.background:SetHeight(self.height);
		end
		if self.background_show then
			self.background:SetBackdrop(self.backdrop);
			self.backgroundtexture:SetColorTexture(self.background_color.r, self.background_color.g, self.background_color.b, self.background_color.a); 
		else
			self.background:SetBackdrop(nil);
			self.backgroundtexture:SetColorTexture(0, 0, 0, 0);
		end

		-- Update Range, Name and Raid Icons
		for index, value in pairs(self.raidunit) do
		
			value:LoadUnitInfo();
			value:UpdateNameplate();
			value:UpdateRange();
			value:UpdateRaidIcon();
		end

	elseif self.frame:IsVisible() then
	
		-- Clear Unit Frames
		for index,value in pairs(self.raidunit) do
			value:Clear();
		end
	end
	
	-- Check For Forced Secure Update
	if self.forceupdate then self:UpdateSecure(); end
end

function QHRaid:UpdateSecure()

	-- Secure Code
	if not InCombatLockdown() then

		self.forceupdate = false;

		-- Update Show/Hide Attribute
		if QH:GetSetting("Raid_Frame_Show") then

			RegisterStateDriver(self.frame, "visibility", "[group:raid] show; hide");
			RegisterStateDriver(self.background, "visibility", "[group:raid] show; hide");
		else
			RegisterStateDriver(self.frame, "visibility", "hide");
			RegisterStateDriver(self.background, "visibility", "hide");
		end

		-- Hide Party Frame In Raid
		local oldpartyinterface = HIDE_PARTY_INTERFACE;
		if self.hide_party then
			setglobal("HIDE_PARTY_INTERFACE", "1");
		else
			setglobal("HIDE_PARTY_INTERFACE", "0");
		end
		--if(oldpartyinterface ~= HIDE_PARTY_INTERFACE) then RaidOptionsFrame_UpdatePartyFrames(); end
		
		-- Hide Default Raid Frames
		if self.hide_default_raid_frame then self:HideDefaultRaidFrames();
		else self:ShowDefaultRaidFrames(); end

		-- Sort Raid
		self:Sort();

		-- Set Frame Position
		if not self.moving and self.align and self.x and self.y then
			self.frame:ClearAllPoints();
			self.background:ClearAllPoints();
			self.frame:SetPoint(self.align, self.anchor, self.relative, self.x, self.y);
			self.background:SetPoint(self.align, self.anchor, self.relative, self.x, self.y);
		end

		-- Set Frame Size
		if self.width and self.height then
			self.frame:SetWidth(self.width);
			self.frame:SetHeight(self.height);
		end

		-- Update Unit Positions
		for index, value in pairs(self.raidsorted) do
			if value then
				
				local row = index;
				local rows = QH:GetSetting("Raid_Rows"); --26
				local rowspacing = QH:GetSetting("Raid_Row_Spacing"); --3
				local rowoffset = QH:GetSetting("Raid_Row_Offset"); --8
				local colspacing = QH:GetSetting("Raid_Col_Spacing"); --25
				local coloffset = QH:GetSetting("Raid_Col_Offset"); --8

				-- Reset Unit Info
				value:LoadUnitInfo();
				value:Resize();

				-- Update Unit Position
				local y = -((mod(row-1,rows))*(value.height + rowspacing)) - rowoffset;
				local x = (floor((row-1) / rows) * (value.width + colspacing)) + coloffset;
				value:SetPosition(x, y, "TOPLEFT", "TOPLEFT", self.frame);
				
				-- Force Update
				value:ForceUpdate(true);
			end
		end

		-- Reset Old Unit Frames
		for index, value in pairs(self.notinraid) do

			local row = index + #(self.raidsorted);
			local rows = QH:GetSetting("Raid_Rows"); --26
			local rowspacing = QH:GetSetting("Raid_Row_Spacing"); --3
			local rowoffset = QH:GetSetting("Raid_Row_Offset"); --8
			local colspacing = QH:GetSetting("Raid_Col_Spacing"); --25
			local coloffset = QH:GetSetting("Raid_Col_Offset"); --8

			-- Reset Unit Info
			value:LoadUnitInfo();
			value:Resize();
			
			-- Update Unit Position
			local y = -((mod(row-1,rows))*(value.height + rowspacing)) - rowoffset;
			local x = (floor((row-1) / rows) * (value.width + colspacing)) + coloffset;
			value:SetPosition(x, y, "TOPLEFT", "TOPLEFT", self.frame);
			
			-- Force Update
			value:ForceUpdate(true);
		end
	end
end
