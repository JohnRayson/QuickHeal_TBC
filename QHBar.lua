---------------------------------------------------------------------------------------------
-- QHBar Class
---------------------------------------------------------------------------------------------
QHBar = {};
QHBar.__index = QHBar;

function QHBar:new(name, parent)

	-- Metatable
	local self = {};
     	setmetatable(self, QHBar);
	
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
	self.flashingfront = nil;
	self.flashingback = nil;

	-- Frame Variables
	self.name = name;
	self.frame = getglobal(self.name);
	if not self.frame then 
		self.frame = CreateFrame("Frame", self.name, parent, "QHBARTEMPLATE"); 
	end
	
	-- Left Label Variables
	self.labelleft = getglobal(QH:Concat(self.frame:GetName(), "_BarFront", "LabelLeft"));
	--self.labelleftcolor = {r=1.0, g=1.0, b=1.0, a=1.0};
	self.labelleftr = 1.0;
	self.labelleftg = 1.0;
	self.labelleftb = 1.0;
	self.labellefta = 1.0;
	self.labellefttext = "";

	-- Right Label Variables
	self.labelright = getglobal(QH:Concat(self.frame:GetName(), "_BarFront", "LabelRight"));
	--self.labelrightcolor = {r=1.0, g=1.0, b=1.0, a=1.0};
	self.labelrightr = 1.0;
	self.labelrightg = 1.0;
	self.labelrightb = 1.0;
	self.labelrighta = 1.0;
	self.labelrighttext = "";
	
	-- Background Variables
	self.background = getglobal(QH:Concat(self.frame:GetName(), "_BarFront", "Background"));
	--self.backgroundcolor = {r=0.0, g=0.0, b=0.0, a=0.0};
	self.backgroundr = 1.0;
	self.backgroundg = 1.0;
	self.backgroundb = 1.0;
	self.backgrounda = 1.0;
	
	-- Button Variables
	self.button = getglobal(QH:Concat(self.frame:GetName(), "_Button"));
	
	-- Front Bar Variables
	self.barfront = getglobal(QH:Concat(self.frame:GetName(), "_BarFront"));
	self.barfronttexture = getglobal(QH:Concat(self.frame:GetName(), "_BarFront", "Texture"));
	--self.barfrontcolor = {r=0.0, g=1.0, b=0.0, a=1.0};
	self.barfrontr = 0.0;
	self.barfrontg = 1.0;
	self.barfrontb = 0.0;
	self.barfronta = 1.0;
	self.barfrontvalue = 0;
	self.barmaxvalue = 100;
	
	-- Spark Variables
	self.spark = getglobal(QH:Concat(self.frame:GetName(), "_BarFront", "Spark"));
	self.sparkwidthratio = 32/195;
	self.sparkheightratio = 3.2;
	
	-- Reference Variables
	self.obj = self;
	self.parent = parent;
	self.frame.obj = self;
	self.button.obj = self;
	self.barfront.obj = self;
	
	-- Call Update Function and Return
	self:Update();
	return self;
end

---------------------------------------------------------------------------------------------
-- QHBar Methods
---------------------------------------------------------------------------------------------
function QHBar:Clear()

	-- Display Variables
	self.fading = nil;
	self.flashingfront = nil;
	self.flashingback = nil;
	
	-- Left Label Variables
	self:SetTextColorLeft(1.0, 1.0, 1.0, 1.0);
	self.labellefttext = "";

	-- Right Label Variables
	self:SetTextColorRight(1.0, 1.0, 1.0, 1.0);
	self.labelrighttext = "";

	-- Front Bar Variables
	self:SetColorFront(0.0, 1.0, 0.0, 1.0);
	self.barfrontvalue = 0;
	self.barmaxvalue = 100;
	
	-- Call Update
	self:Update();
end

function QHBar:SetValue(value, barmaxvalue)

	self:SetValueFront(value, barmaxvalue);
	self:SetValueBack(value, barmaxvalue);
end

function QHBar:SetValueFront(value, barmaxvalue)
	self.barfrontvalue = value;
	self:SetMaxValue(barmaxvalue);
end

function QHBar:SetMaxValue(barmaxvalue)
	self.barmaxvalue = barmaxvalue;
end

function QHBar:SetTextLeft(text)
	self.labellefttext = text;
end

function QHBar:SetTextRight(text)
	self.labelrighttext = text;
end

function QHBar:SetTextColorLeft(r, g, b, a)
	self.labelleftr = r;
	self.labelleftg = g;
	self.labelleftb = b;
	self.labellefta = a;
end

function QHBar:SetTextColorRight(r, g, b, a)
	self.labelrightr = r;
	self.labelrightg = g;
	self.labelrightb = b;
	self.labelrighta = a;
end

function QHBar:SetPosition(x, y, align, relative, anchor)
	self.x = x;
	self.y = y;
	self.align = align;
	self.relative = relative;
	self.anchor = anchor;
end

function QHBar:SetSize(width, height)
	self:SetWidth(width);
	self:SetHeight(height);	
end

function QHBar:SetWidth(width)
	self.width = width;
end

function QHBar:SetHeight(height)
	self.height = height;
end

function QHBar:StartMoving(button)

	if self.obj.parent then
		self.obj.parent:StartMoving(button);
	elseif IsShiftKeyDown() then
		self.obj.moving = true;
		self.obj.frame:SetMovable(true);
		self.obj.frame:StartMoving();
	end
end

function QHBar:StopMoving()

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
	
function QHBar:FadeIn()
	self.fading = -0.5;
end

function QHBar:FadeOut()
	self.fading = 0.5;
end

function QHBar:StartFlashingFront()
	self.flashingfront = 0;
end

function QHBar:StopFlashingFront()
	self.flashingfront = nil;
end

function QHBar:SetColorFront(r, g, b, a)
	self.barfrontr = r;
	self.barfrontg = g;
	self.barfrontb = b;
	self.barfronta = a;
end

function QHBar:SetBackgroundColor(r, g, b, a)
	self.backgroundr = r;
	self.backgroundg = g;
	self.backgroundb = b;
	self.backgrounda = a;
end

function QHBar:StartMoving(button)

	if self.obj.parent then
		self.obj.parent:StartMoving(button);
	elseif IsShiftKeyDown() then
		self.obj.moving = true;
		self.obj.frame:SetMovable(true);
		self.obj.frame:StartMoving();
	end
end

function QHBar:StopMoving()

	if self.obj.parent then
		self.obj.parent:StopMoving();
	else
		self.obj.frame:StopMovingOrSizing();
		align, anchor, relative, x, y = self.frame:GetPoint();
		if not anchor then anchor = UIParent; end
		self.obj:SetPosition(x, y, align, relative, anchor);
		self.obj.moving = nil;
	end
end

function QHBar:Hide()

	-- if self.frame:IsVisible() then self.frame:Hide(); end
end

function QHBar:Show()
	
	-- if not self.frame:IsVisible() then self.frame:Show(); end
end

---------------------------------------------------------------------------------------------
-- QHBar Events
---------------------------------------------------------------------------------------------
function QHBar:UpdateAlpha(alpha)
	self.frame:SetAlpha(alpha);
end

function QHBar:Update()

	-- Secure Update
	self:SecureUpdate();

	-- Set Bar Positions
	self.spark:ClearAllPoints();
	if not self.barmaxvalue or self.barmaxvalue <= 0.0 then
	
		-- Zero Bars
		self.spark:SetVertexColor(0,0,0,0);
		self.barfront:SetValue(0);
		self.spark:SetPoint("CENTER", self.barfront, "LEFT", 0);
	else
		-- Front Bar Value
		if self.barfrontvalue and self.barfrontvalue < self.barmaxvalue then
			self.barfront:SetValue(self.barfrontvalue/self.barmaxvalue);
		elseif self.barfrontvalue and self.barfrontvalue >= self.barmaxvalue then
			self.barfront:SetValue(self.barmaxvalue);
		else
			self.barfront:SetValue(0);
		end

		-- Place Spark On Biggest Bar
		if self.barfrontvalue and self.barfrontvalue > 0.0 then

			-- Set Spark Position/Color
			self.spark:SetPoint("CENTER", self.barfront, "LEFT", self.barfront:GetValue() * self.barfront:GetWidth(), -1);
			self.spark:SetVertexColor(self.barfrontr, self.barfrontg, self.barfrontb, self.barfronta); 
			
		elseif QH:GetSetting("Bar_Always_Show_Spark") then

			-- Always Show Spark
			self.spark:SetPoint("CENTER", self.barfront, "LEFT", self.barfront:GetValue() * self.barfront:GetWidth(), -1);
			self.spark:SetVertexColor(self.barfrontr, self.barfrontg, self.barfrontb, self.barfronta); 
		else
			self.spark:SetVertexColor(0,0,0,1);
			self.spark:SetPoint("CENTER", self.barfront, "LEFT", 0);
		end
	end

	-- Set Left Text Label
	if not self.labellefttext then self.labellefttext = ""; end
	self.labelleft:SetText(self.labellefttext);
	self.labelleft:SetTextColor(self.labelleftr, self.labelleftg, self.labelleftb, self.labellefta);

	-- Set Right Text Label
	if not self.labelrighttext then self.labelrighttext = ""; end
	self.labelright:SetText(self.labelrighttext);
	self.labelright:SetTextColor(self.labelrightr, self.labelrightg, self.labelrightb, self.labelrighta);
	self.labelright:SetText("");

	-- Set Front Bar Color
	self.barfront:SetStatusBarColor(self.barfrontr, self.barfrontg, self.barfrontb, self.barfronta);

	-- Set Background Texture
	self.background:SetColorTexture(self.backgroundr, self.backgroundg, self.backgroundb, self.backgrounda);

	-- Set Bar Fading
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

	-- Set Front Bar Flashing
	if self.flashingfront then
		local ftime = self.flashingfront % 1.25;
		if ftime >= 0.5 then
			self.barfronttexture:SetAlpha(1);
		elseif ftime >= 0.25 then
			self.barfronttexture:SetAlpha(1 - (0.5 - ftime) / 0.25);
		else
			self.barfronttexture:SetAlpha(1 - (ftime / 0.25));
		end
		self.flashingfront = self.flashingfront + 0.02;
	end
end

function QHBar:SecureUpdate()

	-- Secure Code
	if not InCombatLockdown() then
		
		-- Verify Size
		if not self.width then self.width = 0; end
		if not self.height then self.height = 0; end
		if not self.sparkwidthratio then self.sparkwidthratio = 1; end
		if not self.sparkheightratio then self.sparkheightratio = 1; end
		
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

		-- Front Bar Size
		self.barfront:SetWidth(self.width);
		self.barfront:SetHeight(self.height);
		
		-- Spark Size
		self.spark:SetWidth(self.width * self.sparkwidthratio);
		self.spark:SetHeight(self.height * self.sparkheightratio);

		-- Frame Position
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