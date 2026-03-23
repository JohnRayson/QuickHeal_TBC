---------------------------------------------------------------------------------------------
-- QHNameplate Class
---------------------------------------------------------------------------------------------
QHNameplate = {};
QHNameplate.__index = QHNameplate;

function QHNameplate:new(name, parent)

	-- Metatable
	local self = {};
     	setmetatable(self, QHNameplate);

	-- Position Variables
	self.x = 0;
	self.y = 0;
	self.textalign = "CENTER";
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
		self.frame = CreateFrame("Frame", self.name, parent, "QHNAMEPLATETEMPLATE"); 
	end
	
	-- Background Variables
	self.background = nil;
	self.backgroundr = 0.0;
	self.backgroundg = 0.0;
	self.backgroundb = 0.0;
	self.backgrounda = 0.0;
	
	-- Button Variables
	self.button = getglobal(QuickHeal:Concat(self.frame:GetName(), "_Button"));
	
	-- Plate Variables
	self.plate = getglobal(QuickHeal:Concat(self.frame:GetName(), "_Plate"));
	self.platetexture = getglobal(QuickHeal:Concat(self.plate:GetName(), "Texture"));
	
	-- Label Variables
	self.label = getglobal(QuickHeal:Concat(self.plate:GetName(), "Label"));
	--self.labelcolor = {r=1.0, g=1.0, b=1.0, a=1.0};
	self.labelr = 1.0;
	self.labelg = 1.0;
	self.labelb = 1.0;
	self.labela = 1.0;
	self.labeltext = "";
	
	-- Icon Variables
	self.iconleft = getglobal(QuickHeal:Concat(self.plate:GetName(), "IconLeft"));
	self.iconright = getglobal(QuickHeal:Concat(self.plate:GetName(), "IconRight"));
	
	-- Dropdowm Variables
	self.dropdown = getglobal(QuickHeal:Concat(self.frame:GetName(), "_DropDown"));
	
	-- Reference Variables
	self.obj = self;
	self.parent = parent;
	self.frame.obj = self;
	self.button.obj = self;
	self.plate.obj = self;
	
	-- Call Update Function and Return
	self:Update();
	return self;
end

---------------------------------------------------------------------------------------------
-- QHNameplate Methods
---------------------------------------------------------------------------------------------
function QHNameplate:Clear()

	-- Display Variables
	self.fading = nil;
	self.flashing = nil;

	-- Background Variables
	self.background = nil;

	-- Label Variables
	--self.labelcolor = {r=1.0, g=1.0, b=1.0, a=1.0};
	self:SetTextColor(1.0, 1.0, 1.0, 1.0);
	self.labeltext = "";
	
	-- Call Update
	self:Update();
end

function QHNameplate:SetText(labeltext)
	self.labeltext = labeltext;
end

function QHNameplate:SetTextPosition(align)
	self.textalign = align;
end

function QHNameplate:SetPosition(x, y, align, relative, anchor)
	self.x = x;
	self.y = y;
	self.align = align;
	self.relative = relative;
	self.anchor = anchor;
end

function QHNameplate:SetSize(width, height)
	self:SetWidth(width);
	self:SetHeight(height);	
end

function QHNameplate:SetWidth(width)
	self.width = width;
end

function QHNameplate:SetHeight(height)
	self.height = height;
end

function QHNameplate:SetTextColor(r, g, b, a)
	self.labelr = r;
	self.labelg = g;
	self.labelb = b;
	self.labela = a;
end
	
function QHNameplate:FadeIn()
	self.fading = -0.5;
end

function QHNameplate:FadeOut()
	self.fading = 0.5;
end

function QHNameplate:StartFlashingFront()
	self.flashing = 0;
end

function QHNameplate:StopFlashingFront()
	self.flashing = nil;
end

function QHNameplate:StartFlashingBack()
	self.flashingback = 0;
end

function QHNameplate:StopFlashingBack()
	self.flashingback = nil;
end

function QHNameplate:SetTexture(texture)
	self.background = texture;
end

function QHNameplate:SetBackgroundColor(r, g, b, a)
	self.backgroundr = r;
	self.backgroundg = g;
	self.backgroundb = b;
	self.backgrounda = a;
end

function QHNameplate:StartMoving(button)

	if self.obj.parent then
		self.obj.parent:StartMoving(button);
	elseif IsShiftKeyDown() then
		self.obj.moving = true;
		self.obj.frame:SetMovable(true);
		self.obj.frame:StartMoving();
	end
end

function QHNameplate:StopMoving()

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

function QHNameplate:Hide()

	-- if self.frame:IsVisible() then self.frame:Hide(); end
end

function QHNameplate:Show()

	-- if not self.frame:IsVisible() then self.frame:Show(); end
end

---------------------------------------------------------------------------------------------
-- QHNameplate Events
---------------------------------------------------------------------------------------------
function QHNameplate:UpdateAlpha(alpha)
	self.frame:SetAlpha(alpha);
end

function QHNameplate:Update()

	-- Secure Update
	self:SecureUpdate();

	-- Set Plate Texture
	if type(self.background) == "string" then self.platetexture:SetTexture(self.background);
	else self.platetexture:SetColorTexture(self.backgroundr, self.backgroundg, self.backgroundb, self.backgrounda); end

	-- Set Text
	if not self.labeltext then self.labeltext = ""; end
	self.label:SetText(self.labeltext);

	-- Set Text Color
	self.label:SetTextColor(self.labelr, self.labelg, self.labelb, self.labela);

	-- Set Text Position
	if not self.textalign then self.textalign = "CENTER"; end
	self.label:ClearAllPoints();
	self.label:SetPoint(self.textalign, self.frame, self.textalign, 0, 0);

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
			self.plate:SetAlpha(1);
		elseif ftime >= 0.25 then
			self.plate:SetAlpha(1 - (0.5 - ftime) / 0.25);
		else
			self.plate:SetAlpha(1 - (ftime / 0.25));
		end
		self.flashing = self.flashing + 0.02;
	end
end

function QHNameplate:SecureUpdate()

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

		-- Plate Size
		self.plate:SetWidth(self.width);
		self.plate:SetHeight(self.height);
		self.platetexture:SetWidth(self.width);
		self.platetexture:SetHeight(self.height);

		-- Frame Position
		if not self.moving then
			self.frame:ClearAllPoints();
			self.frame:SetPoint(self.align, self.anchor, self.relative, self.x, self.y);
		end		
	end
end