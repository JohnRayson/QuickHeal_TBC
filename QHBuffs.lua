---------------------------------------------------------------------------------------------
-- QHBuffs Class
---------------------------------------------------------------------------------------------
QHBuffs = {};
QHBuffs.__index = QHBuffs;

function QHBuffs:new(name, parent)

	-- Metatable
	local self = {};
     	setmetatable(self, QHBuffs);
	
	-- Position Variables
	self.x = 0;
	self.y = 0;
	self.align = "TOPLEFT";
	self.relative = "TOPLEFT";
	self.anchor = parent;
	self.width = 0;
	self.height = 0;
	self.moving = nil;
	self.rows = 1;
     	
     	-- Display Variables
	self.fading = nil;
	self.flashing = nil;
	
	-- Frame Variables
	self.name = name;
	self.frame = getglobal(self.name);
	if not self.frame then 
		self.frame = CreateFrame("Frame", self.name, parent);
	end
	-- self.frame:SetAttribute("frameStrata", "LOW");
	-- self.frame:SetAttribute("topLevel", "true");
	
	-- Buff Variables
	self.buffs = {};
	self.buffcount = 4;
	self.buffwidth = 12;
	self.buffheight = 12;
	for n = 1,self.buffcount do
		self.buffs[n] = QHIcon:new(QH:Concat(self.name, n), self.frame);
		self.buffs[n].parent = self;
		self.buffs[n]:SetPosition(0, 0, "TOPLEFT", "TOPLEFT", self.frame);
		self.buffs[n]:SetSize(self.buffwidth, self.buffheight);
	end
	
	-- Reference Variables
	self.obj = self;
	self.parent = parent;
	self.frame.obj = self;
	
	-- Call Update Function and Return
	self:Update();
	return self;
end

---------------------------------------------------------------------------------------------
-- QHBuffs Methods
---------------------------------------------------------------------------------------------
function QHBuffs:Clear()

	-- Display Variables
	self.fading = nil;
	self.flashing = nil;
	
	-- Clear Buff Icons
	for n = 1,self.buffcount do
		self:SetBuff(n, "", "");
	end
	
	-- Call Update
	self:Update();
end

function QHBuffs:SetPosition(x, y, align, relative, anchor)
	self.x = x;
	self.y = y;
	self.align = align;
	self.relative = relative;
	self.anchor = anchor;
end

function QHBuffs:SetSize(width, height)
	self:SetWidth(width);
	self:SetHeight(height);	
end

function QHBuffs:SetWidth(width)
	self.width = width;
end

function QHBuffs:SetHeight(height)
	self.height = height;
end

function QHBuffs:SetRows(rows)
	self.rows = rows;
end

function QHBuffs:SetBuff(index, icon, label, expiration)
	if self.buffs[index] then
		self.buffs[index]:SetText(label);
		self.buffs[index]:SetIcon(icon);
		if (not string.find(self.name, "raid")) then
			self.buffs[index]:SetExpiration(expiration);
		end
	end
end

function QHBuffs:SetBuffSize(width, height)
	if width then self.buffwidth = width; end
	if height then self.buffheight = height; end
	for n = 1,self.buffcount do
		self.buffs[n]:SetSize(self.buffwidth, self.buffheight);
	end
end
	
function QHBuffs:FadeIn()
	self.fading = -0.5;
end

function QHBuffs:FadeOut()
	self.fading = 0.5;
end

function QHBuffs:StartFlashingFront()
	self.flashing = 0;
end

function QHBuffs:StopFlashingFront()
	self.flashing = nil;
end

function QHBuffs:StartFlashingBack()
	self.flashingback = 0;
end

function QHBuffs:StopFlashingBack()
	self.flashingback = nil;
end

function QHBuffs:StartMoving(button)

	if self.obj.parent then
		self.obj.parent:StartMoving(button);
	elseif IsShiftKeyDown() then
		self.obj.moving = true;
		self.obj.frame:SetMovable(true);
		self.obj.frame:StartMoving();
	end
end

function QHBuffs:StopMoving()

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

function QHBuffs:Hide()

	-- if self.frame:IsVisible() then self.frame:Hide(); end
end

function QHBuffs:Show()

	-- if not self.frame:IsVisible() then self.frame:Show(); end
end

---------------------------------------------------------------------------------------------
-- QHBuffs Events
---------------------------------------------------------------------------------------------
function QHBuffs:UpdateAlpha(alpha)
	self.frame:SetAlpha(alpha);
end

function QHBuffs:Update()

	-- Secure Update
	self:SecureUpdate();
	
	-- Update Buff Positions
	for index,value in pairs(self.buffs) do
		if value then 
			local rowspacing = QH:GetSetting("Buff_Row_Spacing");
			local rowoffset = QH:GetSetting("Buff_Row_Offset");
			local colspacing = QH:GetSetting("Buff_Col_Spacing");
			local coloffset = QH:GetSetting("Buff_Col_Offset");
			local y = -((mod(index-1,self.rows))*(value.height + rowspacing)) - rowoffset;
			local x = (floor((index-1) / self.rows) * (value.width + colspacing)) + coloffset;
			
			value:SetPosition(x, 0, "LEFT", "LEFT", self.frame);
			value:Update();
		end
	end

	-- Set Fading
	if self.fading then

		-- Fade In
		if self.fading < 0.0 then
			self.fading = min(self.fading + 0.02, 0.0);
			self.frame:SetAlpha((0.5 + self.fading) / 0.5);

		-- Fade Out
		elseif self.fading > 0.0 then
			self.fading = max(self.fading - 0.02, 0.0);
			self.frame:SetAlpha((self.fading) / 0.5);

		-- Stop Fading
		else
			self.fading = nil;
		end
	end

	-- Set Flashing
	if self.flashing then
		local ftime = self.flashing % 1.25;
		if ftime >= 0.5 then
			self.icon:SetAlpha(1);
		elseif ftime >= 0.25 then
			self.icon:SetAlpha(1 - (0.5 - ftime) / 0.25);
		else
			self.icon:SetAlpha(1 - (ftime / 0.25));
		end
		self.flashing = self.flashing + 0.02;
	end
end

function QHBuffs:SecureUpdate()

	-- Secure Code
	--if not InCombatLockdown() then
	
		-- Resize
		local rowspacing = QH:GetSetting("Buff_Row_Spacing");
		local rowoffset = QH:GetSetting("Buff_Row_Offset");
		local colspacing = QH:GetSetting("Buff_Col_Spacing");
		local coloffset = QH:GetSetting("Buff_Col_Offset");
		self.width = coloffset + ((self.buffwidth + colspacing) * (self.buffcount / self.rows));
		self.height = (self.buffheight) * (self.rows);

		-- Verify Size
		if not self.width then self.width = 0; end
		if not self.height then self.height = 0; end

		-- Verify Position
		if not self.x then self.x = 0; end
		if not self.y then self.y = 0; end
		if not self.align then self.align = "TOPLEFT"; end

		-- Frame Size
		self.frame:SetWidth(self.width);
		self.frame:SetHeight(self.height);

		-- Set Frame Position
		if not self.moving then
			self.frame:ClearAllPoints();
			self.frame:SetPoint(self.align, self.anchor, self.relative, self.x, self.y);
		end
	--end
end