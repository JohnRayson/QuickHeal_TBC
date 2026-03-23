---------------------------------------------------------------------------------------------
-- QHParty Class
---------------------------------------------------------------------------------------------
QHParty = {};
QHParty.__index = QHParty;

function QHParty:new(id)
	-- Metatable
	local self = {};
	setmetatable(self, QHParty);
     	
	-- Position Variables
	self.x = 0;
	self.y = 0;
	self.align = "TOPLEFT";
	self.relative = "TOPLEFT";
	self.anchor = UIParent;
	self.width = 0;
	self.height = 0;
	self.moving = nil;
	
	-- Frame Variables
	self.id = id;
	self.name = QH:Concat("QHParty", id);
	self.frame = CreateFrame("Frame", self.name, UIParent);

	-- Unit Frames
	self:UpdatePartyFrames();
	self:UpdatePetFrames();
	
	-- Target Frame 
	-- TODO: Create Target Class
	self.targetpoint, self.targetrelative, self.targetalign, self.targetx, self.targety = getglobal("TargetFrame"):GetPoint();
	
	-- Reference Variables
	self.obj = self;
	self.parent = nil;
	self.frame.obj = self;
	
	-- Call Initial Update Functions and Return
	self:UpdateSettings();
	return self;
end

---------------------------------------------------------------------------------------------
-- QHParty Methods
---------------------------------------------------------------------------------------------
function QHParty:Initialize()
	
end

---------------------------------------------------------------------------------------------
-- QHParty Events
---------------------------------------------------------------------------------------------
function QHParty:ForceUpdate(now)

	self.forceupdate = true;
	if now then self:Update(); end
end

function QHParty:UpdateSettings()
	self.player:UpdateSettings();
	self.pet:UpdateSettings();
	self.party1:UpdateSettings();
	self.partypet1:UpdateSettings();
	self.party2:UpdateSettings();
	self.partypet2:UpdateSettings();
	self.party3:UpdateSettings();
	self.partypet3:UpdateSettings();
	self.party4:UpdateSettings();
	self.partypet4:UpdateSettings();
	
	-- Force Secure Update
	self:ForceUpdate();
	self:Update();
end

function QHParty:Update()
	-- Update Ranges
	self.pet:UpdateRange();
	self.party1:UpdateRange();
	self.partypet1:UpdateRange();
	self.party2:UpdateRange();
	self.partypet2:UpdateRange();
	self.party3:UpdateRange();
	self.partypet3:UpdateRange();
	self.party4:UpdateRange();
	self.partypet4:UpdateRange();

	-- Adjust Target Frame
	if not InCombatLockdown() then
		if QH:GetSetting("TargetFrame_Disable_Adjust") then
			if target_frame_adjusted then
				target_frame_adjusted = false;
				getglobal("TargetFrame"):SetClampedToScreen(true);
				if getglobal("TargetFrame"):IsMovable() then getglobal("TargetFrame"):SetUserPlaced(false); end
				getglobal("TargetFrame"):SetPoint(self.targetpoint, self.targetrelative, self.targetalign, self.targetx, self.targety);
			end
		else
			getglobal("TargetFrame"):SetClampedToScreen(true);
			--getglobal("TargetFrame"):RegisterForDrag("LeftButton");
			--getglobal("TargetFrame"):SetScript("OnDragStart", function() if(IsShiftKeyDown()) then getglobal("TargetFrame"):SetMovable(true); getglobal("TargetFrame"):StartMoving(); end end);
			--getglobal("TargetFrame"):SetScript("OnDragStop", function() getglobal("TargetFrame"):StopMovingOrSizing(); getglobal("TargetFrame"):SetUserPlaced(true); getglobal("TargetFrame"):SetMovable(false); end);
			if not getglobal("TargetFrame"):IsUserPlaced() then
				getglobal("TargetFrame"):SetUserPlaced(true);
				getglobal("TargetFrame"):SetPoint(self.targetpoint, self.targetrelative, self.targetalign, self.targetx + self.player.width, self.targety);
			end
			target_frame_adjusted = true;
		end
	end
	
	-- Secure Update
	if self.forceupdate then self:UpdateSecure(); end
end

local target_frame_adjusted = false;
function QHParty:UpdateSecure()
	if not InCombatLockdown() then
		self.forceupdate = false;

		-- Update Party Frames
		self:UpdatePartyFrames();
		
		-- Update Pet Frames
		self:UpdatePetFrames();
		
		-- Update Secure
		self.player:ForceUpdate(true);
		self.pet:ForceUpdate(true);
		self.party1:ForceUpdate(true);
		self.partypet1:ForceUpdate(true);
		self.party2:ForceUpdate(true);
		self.partypet2:ForceUpdate(true);
		self.party3:ForceUpdate(true);
		self.partypet3:ForceUpdate(true);
		self.party4:ForceUpdate(true);
		self.partypet4:ForceUpdate(true);
	end
end

function QHParty:UpdatePartyFrames()
	self:UpdatePartyAnchors();
	
	if (QH:IsRetail() and PartyFrame) then
		self.player = self:UpdatePartyFrame(self.player, self.playeranchor, "player", -10, -2);
	else
		self.player = self:UpdatePartyFrame(self.player, self.playeranchor, "player", 3, 5);
	end
	self.pet = self:UpdatePartyFrame(self.pet, self.petanchor, "pet", 0, 4);
	self.party1 = self:UpdatePartyFrame(self.party1, self.party1anchor, "party1", 3, 5);
	self.party2 = self:UpdatePartyFrame(self.party2, self.party2anchor, "party2", 3, 5);
	self.party3 = self:UpdatePartyFrame(self.party3, self.party3anchor, "party3", 3, 5);
	self.party4 = self:UpdatePartyFrame(self.party4, self.party4anchor, "party4", 3, 5);
end

function QHParty:UpdatePetFrames()
	self:UpdatePetAnchors();
	
	self.partypet1 = self:UpdatePartyFrame(self.partypet1, self.partypet1anchor, "partypet1", 0, 4);
	self.partypet2 = self:UpdatePartyFrame(self.partypet2, self.partypet2anchor, "partypet2", 0, 4);
	self.partypet3 = self:UpdatePartyFrame(self.partypet3, self.partypet3anchor, "partypet3", 0, 4);
	self.partypet4 = self:UpdatePartyFrame(self.partypet4, self.partypet4anchor, "partypet4", 0, 4);
end

function QHParty:UpdatePartyFrame(frame, anchor, unit, x, y)
	if (not frame) then
		frame = QHUnit:new(unit);
	end
	frame:SetPosition(x, y, "LEFT", "RIGHT", anchor);
	return frame;
end

function QHParty:UpdatePartyAnchors()
	if not InCombatLockdown() then
		self.playeranchor = self:UpdateAnchor(PlayerFrame, self.playeranchor, "Player");
		self.party1anchor = self:UpdateAnchor(self:GetPartyFrame(1), self.party1anchor, "party1");
		self.party2anchor = self:UpdateAnchor(self:GetPartyFrame(2), self.party2anchor, "party2");
		self.party3anchor = self:UpdateAnchor(self:GetPartyFrame(3), self.party3anchor, "party3");
		self.party4anchor = self:UpdateAnchor(self:GetPartyFrame(4), self.party4anchor, "party4");
	end
end

function QHParty:UpdatePetAnchors()
	if not InCombatLockdown() then
		C_CVar.SetCVar("showPartyPets",1);
		self.partypet1anchor = self:UpdateAnchor(self:GetPartyFrame(1, true), self.partypet1anchor, "party1pet");
		self.partypet2anchor = self:UpdateAnchor(self:GetPartyFrame(2, true), self.partypet2anchor, "party2pet");
		self.partypet3anchor = self:UpdateAnchor(self:GetPartyFrame(3, true), self.partypet3anchor, "party3pet");
		self.partypet4anchor = self:UpdateAnchor(self:GetPartyFrame(4, true), self.partypet4anchor, "party4pet");
	end
end

function QHParty:UpdateAnchor(frame, anchor, unit)
	if(frame) then
		if (not anchor) then
			return QH:CloneFrame(frame, QH:Concat(self.name, "_Anchor_", unit));
		else
			return QH:CopyFrame(frame, anchor);
		end
	end
end

function QHParty:GetPartyFrame(id, isPet)
	if (QH:IsRetail() and PartyFrame) then
		for memberFrame in PartyFrame.PartyMemberFramePool:EnumerateActive() do
			if (memberFrame:GetUnit() == "party"..id) then
				if (not isPet) then
					return memberFrame;
				else
					return memberFrame.PetFrame;
				end
			end
		end
	elseif (not isPet) then
		return _G["PartyMemberFrame"..id];
	else
		return _G["PartyMemberFrame"..id.."PetFrame"];
	end
end
