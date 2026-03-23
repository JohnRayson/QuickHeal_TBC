---------------------------------------------------------------------------------------------
-- QHButton Class
---------------------------------------------------------------------------------------------
QHButton = {};
QHButton.__index = QHButton;

function QHButton:new(name, parent)

	-- Metatable
	local self = {};
     	setmetatable(self, QHButton);
	
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
		self.frame = CreateFrame("Frame", self.name, parent, "QHBUTTONTEMPLATE");
	end
	
	-- Set Button Variables
	self.button = getglobal(QuickHeal:Concat(self.frame:GetName(), "_Button"));
	
	-- Set Icon Variables
	self.icon = getglobal(QuickHeal:Concat(self.frame:GetName(), "_Icon"));
	self.icontexture = getglobal(QuickHeal:Concat(self.icon:GetName(), "Texture"));
	self.iconpath = nil;
	
	-- Label Variables
	self.label = getglobal(QuickHeal:Concat(self.icon:GetName(), "Label"));
	self.labelleft = "";
	
	-- Reference Variables
	self.obj = self;
	self.parent = parent;
	self.frame.obj = self;
	self.button.obj = self;
	self.icon.obj = self;
	
	-- Call Update Function and Return
	self:Update();
	return self;
end

---------------------------------------------------------------------------------------------
-- QHButton Methods
---------------------------------------------------------------------------------------------
function QHButton:Clear()

	-- Display Variables
	self.fading = nil;
	self.flashing = nil;

	-- Icon Variables
	self.iconpath = nil;

	-- Label Variables
	self.labelleft = "";
	
	-- Call Update
	self:Update();
end

function QHButton:SetText(labelleft)
	self.labelleft = labelleft;
end

function QHButton:SetPosition(x, y, align, relative, anchor)
	self.x = x;
	self.y = y;
	self.align = align;
	self.relative = relative;
	self.anchor = anchor;
end

function QHButton:SetSize(width, height)
	self:SetWidth(width);
	self:SetHeight(height);	
end

function QHButton:SetWidth(width)
	self.width = width;
end

function QHButton:SetHeight(height)
	self.height = height;
end
	
function QHButton:FadeIn()
	self.fading = -0.5;
end

function QHButton:FadeOut()
	self.fading = 0.5;
end

function QHButton:StartFlashingFront()
	self.flashing = 0;
end

function QHButton:StopFlashingFront()
	self.flashing = nil;
end

function QHButton:StartFlashingBack()
	self.flashingback = 0;
end

function QHButton:StopFlashingBack()
	self.flashingback = nil;
end

function QHButton:SetIcon(texturepath)
	self.iconpath = texturepath;
end

function QHButton:StartMoving(button)

	if self.obj.parent then
		self.obj.parent:StartMoving(button);
	elseif IsShiftKeyDown() then
		self.obj.moving = true;
		self.obj.frame:SetMovable(true);
		self.obj.frame:StartMoving();
	end
end

function QHButton:StopMoving()

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

function QHButton:Hide()

	-- if self.frame:IsVisible() then self.frame:Hide(); end
end

function QHButton:Show()

	-- if not self.frame:IsVisible() then self.frame:Show(); end
end

---------------------------------------------------------------------------------------------
-- QHButton Events
---------------------------------------------------------------------------------------------
function QHButton:UpdateAlpha(alpha)
	self.frame:SetAlpha(alpha);
end

function QHButton:Update()

	-- Secure Update
	self:SecureUpdate();

	-- Set Icon Texture
	if not self.iconpath then self.icontexture:SetColorTexture(0, 0, 0, 0);
	else self.icontexture:SetTexture(self.iconpath); end
	--self.icontexture:SetTexture(ActionButton1Icon:GetTexture());

	-- Set Text
	if not self.labelleft then self.labelleft = ""; end
	self.label:SetText(self.labelleft);
	--self.label:SetTextColor(0.99, 0.82, 0);

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

function QHButton:SecureUpdate()

	-- Secure Code
	if not InCombatLockdown() then

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

		-- Button Size
		self.button:SetWidth(self.width);
		self.button:SetHeight(self.height);

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
		
		-- Enable Movement
		self.frame:EnableMouse(true);
		self.frame:RegisterForDrag("LeftButton");
		self.frame:SetScript("OnDragStart", self.StartMoving);
		self.frame:SetScript("OnDragStop", self.StopMoving);
	end
end