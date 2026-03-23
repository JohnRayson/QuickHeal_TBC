---------------------------------------------------------------------------------------------
-- QHIcon Class
---------------------------------------------------------------------------------------------
QHIcon = {};
QHIcon.__index = QHIcon;

function QHIcon:new(name, parent)

	-- Metatable
	local self = {};
	setmetatable(self, QHIcon);
	
	-- Position Variables
	self.x = 0;
	self.y = 0;
	self.align = "TOPLEFT";
	self.relative = "TOPLEFT";
	self.anchor = parent;
	self.width = 0;
	self.height = 0;
	self.moving = nil;
     	
     	-- Display Variables
	self.fading = nil;
	self.flashing = nil;
	
	-- Frame Variables
	self.name = name;
	self.frame = getglobal(self.name);
	if not self.frame then 
		self.frame = CreateFrame("Frame", self.name, parent, "QHICONTEMPLATE");
	end
	
	-- Set Icon Variables
	self.icon = getglobal(QuickHeal:Concat(self.frame:GetName(), "_Icon"));
	self.icontexture = getglobal(QuickHeal:Concat(self.icon:GetName(), "Texture"));
	self.iconpath = nil;
	self.iconcoordinates = nil;
	
	-- Background Variables
	self.background = getglobal(QH:Concat(self.frame:GetName(), "_Icon", "Background"));
	self.backgroundr = 0.0;
	self.backgroundg = 0.0;
	self.backgroundb = 0.0;
	self.backgrounda = 0.0;
	
	-- Label Variables
	self.label = getglobal(QuickHeal:Concat(self.icon:GetName(), "Label"));
	self.labeltext = "";

	-- Timer Variables
	self.timer = getglobal(QuickHeal:Concat(self.icon:GetName(), "Timer"));
	self.timertext = "";
	self.timerexpiration = nil;
	
	-- Reference Variables
	self.obj = self;
	self.parent = parent;
	self.frame.obj = self;
	self.icon.obj = self;
	
	-- Call Update Function and Return
	--self.frame:SetScript("OnUpdate", self.OnUpdate);
	--self.frame:SetScript("OnUpdate", function(s, event) self:Update(); end);
	self.frame:SetScript("OnUpdate", self.OnUpdate);
	return self;
end

---------------------------------------------------------------------------------------------
-- QHIcon Methods
---------------------------------------------------------------------------------------------
function QHIcon:Clear()

	-- Display Variables
	self.fading = nil;
	self.flashing = nil;

	-- Icon Variables
	self.iconpath = nil;
	self.iconcoordinates = nil;

	-- Label Variables
	self.labeltext = "";
	self.timertext = "";
	
	-- Background Color
	self:SetBackgroundColor(0.0, 0.0, 0.0, 0.0);
	
	-- Call Update
	self:Update();
end

function QHIcon:SetText(text)
	self.labeltext = text;
end

function QHIcon:SetExpiration(expiration)
	self.timerexpiration = expiration;
end

function QHIcon:SetPosition(x, y, align, relative, anchor)
	self.x = x;
	self.y = y;
	self.align = align;
	self.relative = relative;
	self.anchor = anchor;
end

function QHIcon:SetSize(width, height)
	self:SetWidth(width);
	self:SetHeight(height);	
end

function QHIcon:SetWidth(width)
	self.width = width;
end

function QHIcon:SetHeight(height)
	self.height = height;
end
	
function QHIcon:FadeIn()
	self.fading = -0.5;
	self.frame:SetScript("OnUpdate", function() self:Update(); end);
end

function QHIcon:FadeOut()
	self.fading = 0.5;
	self.frame:SetScript("OnUpdate", function() self:Update(); end);
end

function QHIcon:StopFading()
	self.fading = nil;
	if not self.flashing and not self.fading then self.frame:SetScript("OnUpdate", nil); end
end

function QHIcon:StartFlashing()
	self.flashing = 0;
	self.frame:SetScript("OnUpdate", function() self:Update(); end);
end

function QHIcon:StopFlashing()
	self.flashing = nil;
	if not self.flashing and not self.fading then self.frame:SetScript("OnUpdate", nil); end
end

function QHIcon:SetIcon(texturepath, coordinates)
	self.iconpath = texturepath;
	self.iconcoordinates = coordinates;
end

function QHIcon:SetBackgroundColor(r, g, b, a)
	self.backgroundr = r;
	self.backgroundg = g;
	self.backgroundb = b;
	self.backgrounda = a;
end

function QHIcon:StartMoving(button)

	if self.obj.parent then
		self.obj.parent:StartMoving(button);
	elseif IsShiftKeyDown() then
		self.obj.moving = true;
		self.obj.frame:SetMovable(true);
		self.obj.frame:StartMoving();
	end
end

function QHIcon:StopMoving()

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

function QHIcon:Hide()

	-- if self.frame:IsVisible() then self.frame:Hide(); end
end

function QHIcon:Show()

	-- if not self.frame:IsVisible() then self.frame:Show(); end
end

---------------------------------------------------------------------------------------------
-- QHIcon Events
---------------------------------------------------------------------------------------------
function QHIcon:OnUpdate()
	self.obj:Update();
end

function QHIcon:UpdateAlpha(alpha)
	self.frame:SetAlpha(alpha);
end

function QHIcon:Update()

	-- Secure Update
	self:SecureUpdate();

	-- Set Icon Texture
	if not self.iconpath then self.icontexture:SetColorTexture(0, 0, 0, 0);
	else self.icontexture:SetTexture(self.iconpath); end
	if self.iconcoordinates then self.icontexture:SetTexCoord(self.iconcoordinates[1], self.iconcoordinates[2], self.iconcoordinates[3], self.iconcoordinates[4]); end
	--self.icontexture:SetTexture(ActionButton1Icon:GetTexture());

	-- Set Text
	if not self.labeltext then self.labeltext = ""; end
	self.label:SetText(self.labeltext);
	--self.label:SetTextColor(0.99, 0.82, 0);

	-- Set Timer
	if not self.timerexpiration then self.timertext = "";
	else self.timertext = max(0, floor(self.timerexpiration - GetTime())); end
	self.timer:SetText(self.timertext);

	-- Set Background Texture
	self.background:SetColorTexture(self.backgroundr, self.backgroundg, self.backgroundb, self.backgrounda);

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
			self:StopFading();
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
	elseif not self.fading then
		self.icon:SetAlpha(1);
	end
end

function QHIcon:SecureUpdate()

	-- Secure Code
	--if not InCombatLockdown() then

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

		-- Icon Size
		self.icon:SetWidth(self.width);
		self.icon:SetHeight(self.height);
		self.icontexture:SetWidth(self.width);
		self.icontexture:SetHeight(self.height);

		-- Set Frame Position
		if not self.moving then
			self.frame:ClearAllPoints();
			self.frame:SetPoint(self.align, self.anchor, self.relative, self.x, self.y);
		end
	--end
end
