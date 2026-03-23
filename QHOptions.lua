---------------------------------------------------------------------------------------------
-- QHOptions Class
---------------------------------------------------------------------------------------------
QHOptions = {};
QHOptions.__index = QHOptions;

function QHOptions:new()

	-- Metatable
	local self = {};
     	setmetatable(self, QHOptions);

	-- Splash Info Frame
	QHOptions.panel = CreateFrame("Frame", "QHOptions_Frame", UIParent, "QHOPTIONSMAINTEMPLATE");
	QHOptions.panel.okay = self.SaveOptions;
	QHOptions.panel.cancel = self.ReloadOptions;
	QHOptions.panel.default = self.LoadDefaultOptions;
	QHOptions.panel.label = QH_LOCALE_OPTIONSTAB;
	QHOptions_FrameLabel1:SetText(QuickHeal:GetLabel());
	QHOptions_FrameLabel2:SetText(QuickHeal:GetPrettyVersion());
	QHOptions_FrameLabel3:SetText(QuickHeal:Concat(QH_LOCALE_THANKS, QuickHeal:GetLabel(), "!"));
	QHOptions_FrameLabel4:SetText(QuickHeal:Concat(QH_LOCALE_SUPPORT, "   ", QH_LOCALE_SUPPORTLINK));
	
	-- Profile Options
	QHOptions.profilepanel = CreateFrame("Frame", "QHOptions_Profiles", UIParent, "QHOPTIONSPROFILESTEMPLATE");
	QHOptions.profilepanel.okay = self.SaveOptions;
	QHOptions.profilepanel.cancel = self.ReloadOptions;
	QHOptions.profilepanel.default = self.LoadDefaultOptions;
	QHOptions.profilepanel.label = QH_LOCALE_PROFILETAB;
	QHOptions_ProfilesLabel:SetText(QHOptions.profilepanel.label);
	QHOptions_Profiles_SaveProfile:SetScript("OnClick", QHOptions.SaveProfile);
	QHOptions_Profiles_LoadProfile:SetScript("OnClick", QHOptions.LoadProfile);
	QHOptions_Profiles_DeleteProfile:SetScript("OnClick", QHOptions.DeleteProfile);
	QHOptions_Profiles_Save:SetScript("OnClick", QHOptions.SaveOptions);
	QHOptions_Profiles_Reset:SetScript("OnClick", QHOptions.LoadDefaultOptions);
	
	-- General Options
	QHOptions.generalpanel = CreateFrame("Frame", "QHOptions_General", UIParent, "QHOPTIONSGENERALTEMPLATE");
	QHOptions.generalpanel.okay = self.SaveOptions;
	QHOptions.generalpanel.cancel = self.ReloadOptions;
	QHOptions.generalpanel.default = self.LoadDefaultOptions;
	QHOptions.generalpanel.label = QH_LOCALE_OPTIONSTAB;
	QHOptions_GeneralLabel:SetText(QHOptions.panel.label);
	QHOptions_General_Save:SetScript("OnClick", QHOptions.SaveOptions);
	QHOptions_General_Reset:SetScript("OnClick", QHOptions.LoadDefaultOptions);
	
	-- Raid Frame Options
	QHOptions.raidframepanel = CreateFrame("Frame", "QHOptions_Raid_Frame", UIParent, "QHOPTIONSRAIDFRAMETEMPLATE");
	QHOptions.raidframepanel.okay = self.SaveOptions;
	QHOptions.raidframepanel.cancel = self.ReloadOptions;
	QHOptions.raidframepanel.default = self.LoadDefaultOptions;
	QHOptions.raidframepanel.label = QH_LOCALE_RAIDFRAMETAB;
	QHOptions_Raid_FrameLabel:SetText(QHOptions.raidframepanel.label);
	QHOptions_Raid_Frame_Save:SetScript("OnClick", QHOptions.SaveOptions);
	QHOptions_Raid_Frame_Reset:SetScript("OnClick", QHOptions.LoadDefaultOptions);
	
	-- Player Bar Options
	QHOptions.playerpanel = CreateFrame("Frame", "QHOptions_Player_Bar", UIParent, "QHOPTIONSBARTEMPLATE");
	QHOptions.playerpanel.okay = self.SaveOptions;
	QHOptions.playerpanel.cancel = self.ReloadOptions;
	QHOptions.playerpanel.default = self.LoadDefaultOptions;
	QHOptions.playerpanel.label = QH_LOCALE_PLAYERTAB;
	QHOptions_Player_BarLabel:SetText(QHOptions.playerpanel.label);
	QHOptions_Player_Bar_Save:SetScript("OnClick", QHOptions.SaveOptions);
	QHOptions_Player_Bar_Reset:SetScript("OnClick", QHOptions.LoadDefaultOptions);
	
	-- Party Bar Options
	QHOptions.partypanel = CreateFrame("Frame", "QHOptions_Party_Bar", UIParent, "QHOPTIONSBARTEMPLATE");
	QHOptions.partypanel.okay = self.SaveOptions;
	QHOptions.partypanel.cancel = self.ReloadOptions;
	QHOptions.partypanel.default = self.LoadDefaultOptions;
	QHOptions.partypanel.label = QH_LOCALE_PARTYTAB;
	QHOptions_Party_BarLabel:SetText(QHOptions.partypanel.label);
	QHOptions_Party_Bar_Save:SetScript("OnClick", QHOptions.SaveOptions);
	QHOptions_Party_Bar_Reset:SetScript("OnClick", QHOptions.LoadDefaultOptions);
	
	-- Raid Bar Options
	QHOptions.raidpanel = CreateFrame("Frame", "QHOptions_Raid_Bar", UIParent, "QHOPTIONSBARTEMPLATE");
	QHOptions.raidpanel.okay = self.SaveOptions;
	QHOptions.raidpanel.cancel = self.ReloadOptions;
	QHOptions.raidpanel.default = self.LoadDefaultOptions;
	QHOptions.raidpanel.label = QH_LOCALE_RAIDTAB;
	QHOptions_Raid_BarLabel:SetText(QHOptions.raidpanel.label);
	QHOptions_Raid_Bar_Save:SetScript("OnClick", QHOptions.SaveOptions);
	QHOptions_Raid_Bar_Reset:SetScript("OnClick", QHOptions.LoadDefaultOptions);
	
	-- Decurse/Warning Options
	QHOptions.decursepanel = CreateFrame("Frame", "QHOptions_Decurse_Warning", UIParent, "QHOPTIONSDECURSETEMPLATE");
	QHOptions.decursepanel.okay = self.SaveOptions;
	QHOptions.decursepanel.cancel = self.ReloadOptions;
	QHOptions.decursepanel.default = self.LoadDefaultOptions;
	QHOptions.decursepanel.label = QH_LOCALE_DECURSETAB;
	QHOptions.decursepanel.label2 = QH_LOCALE_WARNINGTAB;
	QHOptions_Decurse_WarningLabel:SetText(QHOptions.decursepanel.label);
	QHOptions_Decurse_WarningLabel2:SetText(QHOptions.decursepanel.label2);
	QHOptions_Decurse_Warning_Save:SetScript("OnClick", QHOptions.SaveOptions);
	QHOptions_Decurse_Warning_Reset:SetScript("OnClick", QHOptions.LoadDefaultOptions);
	
	-- Buff Options
	QHOptions.buffpanel = CreateFrame("Frame", "QHOptions_Buff_Bar", UIParent, "QHOPTIONSBUFFTEMPLATE");
	QHOptions.buffpanel.okay = self.SaveOptions;
	QHOptions.buffpanel.cancel = self.ReloadOptions;
	QHOptions.buffpanel.default = self.LoadDefaultOptions;
	QHOptions.buffpanel.label = QH_LOCALE_BUFFTAB;
	QHOptions_Buff_BarLabel:SetText(QHOptions.buffpanel.label);
	QHOptions_Buff_Bar_Save:SetScript("OnClick", QHOptions.SaveOptions);
	QHOptions_Buff_Bar_Reset:SetScript("OnClick", QHOptions.LoadDefaultOptions);

	-- Register in the Interface Addon Options GUI
	QHOptions.panel.name = "Quick Heal 2";
	QHOptions:InterfaceOptions_AddCategory(QHOptions.panel);
	QHOptions.profilepanel.name = QH_LOCALE_PROFILES;
	QHOptions.profilepanel.parent = QHOptions.panel.name;
	QHOptions:InterfaceOptions_AddCategory(QHOptions.profilepanel, QHOptions.panel.name);
	QHOptions.generalpanel.name = QH_LOCALE_GENERAL;
	QHOptions.generalpanel.parent = QHOptions.panel.name;
	QHOptions:InterfaceOptions_AddCategory(QHOptions.generalpanel, QHOptions.panel.name);
	QHOptions.raidframepanel.name = QH_LOCALE_RAIDFRAME;
	QHOptions.raidframepanel.parent = QHOptions.panel.name;
	QHOptions:InterfaceOptions_AddCategory(QHOptions.raidframepanel, QHOptions.panel.name);
	QHOptions.playerpanel.name = QH_LOCALE_PLAYERBAR;
	QHOptions.playerpanel.parent = QHOptions.panel.name;
	QHOptions:InterfaceOptions_AddCategory(QHOptions.playerpanel, QHOptions.panel.name);
	QHOptions.partypanel.name = QH_LOCALE_PARTYBARS;
	QHOptions.partypanel.parent = QHOptions.panel.name;
	QHOptions:InterfaceOptions_AddCategory(QHOptions.partypanel, QHOptions.panel.name);
	QHOptions.raidpanel.name = QH_LOCALE_RAIDBARS;
	QHOptions.raidpanel.parent = QHOptions.panel.name;
	QHOptions:InterfaceOptions_AddCategory(QHOptions.raidpanel, QHOptions.panel.name);
	QHOptions.buffpanel.name = QH_LOCALE_BUFFBARS;
	QHOptions.buffpanel.parent = QHOptions.panel.name;
	QHOptions:InterfaceOptions_AddCategory(QHOptions.buffpanel, QHOptions.panel.name);
	QHOptions.decursepanel.name = QH_LOCALE_DECURSEBUTTON;
	QHOptions.decursepanel.parent = QHOptions.panel.name;
	QHOptions:InterfaceOptions_AddCategory(QHOptions.decursepanel, QHOptions.panel.name);

	return self;
end

function QHOptions:InterfaceOptions_AddCategory(panel, parent)
	if Settings and Settings.RegisterCanvasLayoutCategory then
		if parent then
			local category = Settings.GetCategory(parent);
			Settings.RegisterCanvasLayoutSubcategory(category, panel, panel.name);
			return category;
		else
			local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name);
			category.ID = panel.name;
			Settings.RegisterAddOnCategory(category);
			return category;
		end
	else
		InterfaceOptions_AddCategory(panel);
	end
end

function QHOptions:Update()

	if QH then
		if QH.partyframe then QH.partyframe:UpdateSettings(); end
		if QH.raidframe then QH.raidframe:UpdateSettings(); end
	end
end

function QHOptions:ReloadOptions()

	QHOptions:SetupOptions(true);
end

function QHOptions:LoadDefaultOptions()

	if QH then QH:LoadDefaultSettings(); end
	QHOptions:SetupOptions(true);
end

function QHOptions:SetupOptions(reload)

	if QH and (reload or not QHOptions.loaded) then

		-- General Options
		QHOptions:SetCheckButton(QHOptions_General_BarValues, QH_LOCALE_BARTEXT, QH:GetSetting("Bar_Label_Show"));
		QHOptions:SetCheckButton(QHOptions_General_RangeCheck, QH_LOCALE_RANGECHECK, QH:GetSetting("Bar_Range_Check"));
		QHOptions:SetCheckButton(QHOptions_General_BarBackground, QH_LOCALE_BARBACKDROP, QH:GetSetting("Bar_Background_Show"));
		QHOptions:SetCheckButton(QHOptions_General_AlwaysShowSpark, QH_LOCALE_ALWAYSSHOWSPARK, QH:GetSetting("Bar_Always_Show_Spark"));
		QHOptions:SetCheckButton(QHOptions_General_DisableTargetAdjust, QH_LOCALE_TARGETADJUST, QH:GetSetting("TargetFrame_Disable_Adjust"));
		
		-- Profile Options
		local active_profile = QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_ActiveProfile"));
		if active_profile then 
			QHOptions:SetEditBox(QHOptions_Profiles_SaveAs, nil, active_profile);
		end
		local specswap = QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_SpecSwap"));
		
		if specswap == nil then specswap = true; end
		QHOptions:SetCheckButton(QHOptions_Profiles_SpecSwap, QH_LOCALE_SPECSWAP, specswap);
		QHOptions:SetDropdown(QHOptions_Profiles_Profile, nil, nil, unpack(QH:GetProfiles()));
		QHOptions:SetDropdown(QHOptions_Profiles_Spec1, nil, QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_Spec1")), "", unpack(QH:GetProfiles()));
		QHOptions:SetDropdown(QHOptions_Profiles_Spec2, nil, QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_Spec2")), "", unpack(QH:GetProfiles()));
		QHOptions:SetDropdown(QHOptions_Profiles_Spec3, nil, QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_Spec3")), "", unpack(QH:GetProfiles()));
		QHOptions:SetDropdown(QHOptions_Profiles_Spec4, nil, QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_Spec4")), "", unpack(QH:GetProfiles()));
		
		if (not QH:IsWotLKOrAbove()) then
			QHOptions_Profiles_SpecSwap:Disable();
			QHOptions_Profiles_SpecSwap:Hide();
			QHOptions:HideDropdown(QHOptions_Profiles_Spec1);
			QHOptions:HideDropdown(QHOptions_Profiles_Spec2);
			QHOptions:HideDropdown(QHOptions_Profiles_Spec3);
			QHOptions:HideDropdown(QHOptions_Profiles_Spec4);
			QHOptions_ProfilesLabel2:SetText("");
			QHOptions_ProfilesSpec1Label:SetText("");
			QHOptions_ProfilesSpec2Label:SetText("");
			QHOptions_ProfilesSpec3Label:SetText("");
			QHOptions_ProfilesSpec4Label:SetText("");
		else
			if (QH:IsWotLK() or QH:IsCata()) then
				QHOptions:HideDropdown(QHOptions_Profiles_Spec3);
				QHOptions:HideDropdown(QHOptions_Profiles_Spec4);
				QHOptions_ProfilesSpec1Label:SetText("Primary Talents");
				QHOptions_ProfilesSpec2Label:SetText("Secondary Talents");
				QHOptions_ProfilesSpec3Label:SetText("");
				QHOptions_ProfilesSpec4Label:SetText("");
			else
				local _,spec1 = GetSpecializationInfo(1);
				local _,spec2 = GetSpecializationInfo(2);
				local _,spec3 = GetSpecializationInfo(3);
				local _,spec4 = GetSpecializationInfo(4);
				QHOptions_ProfilesSpec1Label:SetText(spec1);
				QHOptions_ProfilesSpec2Label:SetText(spec2);
				QHOptions_ProfilesSpec3Label:SetText(spec3);
				QHOptions_ProfilesSpec4Label:SetText(spec4);
				if (GetNumSpecializations() < 2) then QHOptions:HideDropdown(QHOptions_Profiles_Spec2) end
				if (GetNumSpecializations() < 3) then QHOptions:HideDropdown(QHOptions_Profiles_Spec3) end
				if (GetNumSpecializations() < 4) then QHOptions:HideDropdown(QHOptions_Profiles_Spec4) end
			end
		end

		-- Raid Frame Options
		QHOptions:SetCheckButton(QHOptions_Raid_Frame_RaidFrames, QH_LOCALE_RAIDENABLED, QH:GetSetting("Raid_Frame_Show"));
		QHOptions:SetCheckButton(QHOptions_Raid_Frame_HideParty, QH_LOCALE_PARTYHIDE, QH:GetSetting("Raid_Party_Hide"));
		QHOptions:SetCheckButton(QHOptions_Raid_Frame_RaidBackground, QH_LOCALE_RFBACKDROP, QH:GetSetting("Raid_Background_Show"));
		QHOptions:SetDropdown(QHOptions_Raid_Frame_RaidSort, QH_LOCALE_RAIDSORT, QH:GetSetting("Raid_Sort_By"), "CLASS", "GROUP", "ROLE");
		QHOptions:SetSlider(QHOptions_Raid_Frame_RaidRows, nil, QH_LOCALE_ROWCOUNT, 1, 40, 1, QH:GetSetting("Raid_Rows"));
		QHOptions:SetCheckButton(QHOptions_Raid_Frame_DynamicGroups, QH_LOCALE_DYNAMICGROUPS, QH:GetSetting("Raid_Dynamic_Groups"));
		QHOptions:SetCheckButton(QHOptions_Raid_Frame_HideDefaultRaidFrame, QH_LOCALE_HIDERAIDFRAME, QH:GetSetting("Raid_Default_Frame_Hide"));
		QHOptions:SetCheckButton(QHOptions_Raid_Frame_ShowRoleIcon, QH_LOCALE_SHOWROLEICON, QH:GetSetting("Raid_Role_Show"));
		
		QHOptions_Raid_Frame_DynamicGroups:SetScript("OnClick", 
		function()
			for n = 1,8 do
				local group_button = _G[QH:Concat("QHOptions_Raid_Frame_RaidGroup", n)];
				if group_button:IsEnabled() then
					group_button:Disable();
				else
					group_button:Enable();
				end
			end
		end
		);

		for n = 1,8 do
			local group_locale = _G[QH:Concat("QH_LOCALE_GROUP", n)];
			local group_button = _G[QH:Concat("QHOptions_Raid_Frame_RaidGroup", n)];
			local raid_groups = QH:GetSetting("Raid_Groups");
			if raid_groups and string.find(raid_groups, n) then
				QHOptions:SetCheckButton(group_button, group_locale, true);
			else
				QHOptions:SetCheckButton(group_button, group_locale, false);
			end
			if QH:GetSetting("Raid_Dynamic_Groups") then
				group_button:Disable();
			else
				group_button:Enable();
			end
		end

		if QH:GetSetting("Raid_Background_Color") then
			QHOptions:SetSlider(QHOptions_Raid_Frame_RaidBackgroundTransparency, nil, QH_LOCALE_RFBACKDROPTRANS, 0, 100, 1, QH:GetSetting("Raid_Background_Color").a * 100);
		end
	
		-- Player Bar Options
		QHOptions:SetEditBox(QHOptions_Player_Bar_Left, QH_LOCALE_LEFT, QH:GetSetting("Player_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_LeftShift, QH_LOCALE_LEFTSHIFT, QH:GetSetting("Player_Shift_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_LeftCtrl, QH_LOCALE_LEFTCTRL, QH:GetSetting("Player_Ctrl_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_LeftAlt, QH_LOCALE_LEFTALT, QH:GetSetting("Player_Alt_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Middle, QH_LOCALE_MIDDLE, QH:GetSetting("Player_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_MiddleShift, QH_LOCALE_MIDDLESHIFT, QH:GetSetting("Player_Shift_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_MiddleCtrl, QH_LOCALE_MIDDLECTRL, QH:GetSetting("Player_Ctrl_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_MiddleAlt, QH_LOCALE_MIDDLEALT, QH:GetSetting("Player_Alt_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Right, QH_LOCALE_RIGHT, QH:GetSetting("Player_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_RightShift, QH_LOCALE_RIGHTSHIFT, QH:GetSetting("Player_Shift_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_RightCtrl, QH_LOCALE_RIGHTCTRL, QH:GetSetting("Player_Ctrl_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_RightAlt, QH_LOCALE_RIGHTALT, QH:GetSetting("Player_Alt_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Button4, QH_LOCALE_BUTTON4, QH:GetSetting("Player_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Button4Shift, QH_LOCALE_BUTTON4SHIFT, QH:GetSetting("Player_Shift_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Button4Ctrl, QH_LOCALE_BUTTON4CTRL, QH:GetSetting("Player_Ctrl_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Button4Alt, QH_LOCALE_BUTTON4ALT, QH:GetSetting("Player_Alt_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Button5, QH_LOCALE_BUTTON5, QH:GetSetting("Player_Button5_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Button5Shift, QH_LOCALE_BUTTON5SHIFT, QH:GetSetting("Player_Shift_Button5_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Button5Ctrl, QH_LOCALE_BUTTON5CTRL, QH:GetSetting("Player_Ctrl_Button5_Click"));
		QHOptions:SetEditBox(QHOptions_Player_Bar_Button5Alt, QH_LOCALE_BUTTON5ALT, QH:GetSetting("Player_Alt_Button5_Click"));
		QHOptions:SetSlider(QHOptions_Player_Bar_Width, nil, QH_LOCALE_BARWIDTH, 1, 100, 1, QH:GetSetting("Player_Bar_Width"));
		QHOptions:SetSlider(QHOptions_Player_Bar_Height, nil, QH_LOCALE_BARHEIGHT, 1, 40, 1, QH:GetSetting("Player_Bar_Height"));

		-- Party Bar Options
		QHOptions:SetEditBox(QHOptions_Party_Bar_Left, QH_LOCALE_LEFT, QH:GetSetting("Party_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_LeftShift, QH_LOCALE_LEFTSHIFT, QH:GetSetting("Party_Shift_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_LeftCtrl, QH_LOCALE_LEFTCTRL, QH:GetSetting("Party_Ctrl_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_LeftAlt, QH_LOCALE_LEFTALT, QH:GetSetting("Party_Alt_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Middle, QH_LOCALE_MIDDLE, QH:GetSetting("Party_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_MiddleShift, QH_LOCALE_MIDDLESHIFT, QH:GetSetting("Party_Shift_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_MiddleCtrl, QH_LOCALE_MIDDLECTRL, QH:GetSetting("Party_Ctrl_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_MiddleAlt, QH_LOCALE_MIDDLEALT, QH:GetSetting("Party_Alt_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Right, QH_LOCALE_RIGHT, QH:GetSetting("Party_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_RightShift, QH_LOCALE_RIGHTSHIFT, QH:GetSetting("Party_Shift_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_RightCtrl, QH_LOCALE_RIGHTCTRL, QH:GetSetting("Party_Ctrl_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_RightAlt, QH_LOCALE_RIGHTALT, QH:GetSetting("Party_Alt_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Button4, QH_LOCALE_BUTTON4, QH:GetSetting("Party_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Button4Shift, QH_LOCALE_BUTTON4SHIFT, QH:GetSetting("Party_Shift_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Button4Ctrl, QH_LOCALE_BUTTON4CTRL, QH:GetSetting("Party_Ctrl_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Button4Alt, QH_LOCALE_BUTTON4ALT, QH:GetSetting("Party_Alt_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Button5, QH_LOCALE_BUTTON5, QH:GetSetting("Party_Button5_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Button5Shift, QH_LOCALE_BUTTON5SHIFT, QH:GetSetting("Party_Shift_Button5_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Button5Ctrl, QH_LOCALE_BUTTON5CTRL, QH:GetSetting("Party_Ctrl_Button5_Click"));
		QHOptions:SetEditBox(QHOptions_Party_Bar_Button5Alt, QH_LOCALE_BUTTON5ALT, QH:GetSetting("Party_Alt_Button5_Click"));
		QHOptions:SetSlider(QHOptions_Party_Bar_Width, nil, QH_LOCALE_BARWIDTH, 1, 100, 1, QH:GetSetting("Party_Bar_Width"));
		QHOptions:SetSlider(QHOptions_Party_Bar_Height, nil, QH_LOCALE_BARHEIGHT, 1, 40, 1, QH:GetSetting("Party_Bar_Height"));

		-- Raid Bar Options
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Left, QH_LOCALE_LEFT, QH:GetSetting("Raid_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_LeftShift, QH_LOCALE_LEFTSHIFT, QH:GetSetting("Raid_Shift_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_LeftCtrl, QH_LOCALE_LEFTCTRL, QH:GetSetting("Raid_Ctrl_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_LeftAlt, QH_LOCALE_LEFTALT, QH:GetSetting("Raid_Alt_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Middle, QH_LOCALE_MIDDLE, QH:GetSetting("Raid_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_MiddleShift, QH_LOCALE_MIDDLESHIFT, QH:GetSetting("Raid_Shift_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_MiddleCtrl, QH_LOCALE_MIDDLECTRL, QH:GetSetting("Raid_Ctrl_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_MiddleAlt, QH_LOCALE_MIDDLEALT, QH:GetSetting("Raid_Alt_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Right, QH_LOCALE_RIGHT, QH:GetSetting("Raid_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_RightShift, QH_LOCALE_RIGHTSHIFT, QH:GetSetting("Raid_Shift_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_RightCtrl, QH_LOCALE_RIGHTCTRL, QH:GetSetting("Raid_Ctrl_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_RightAlt, QH_LOCALE_RIGHTALT, QH:GetSetting("Raid_Alt_Right_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Button4, QH_LOCALE_BUTTON4, QH:GetSetting("Raid_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Button4Shift, QH_LOCALE_BUTTON4SHIFT, QH:GetSetting("Raid_Shift_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Button4Ctrl, QH_LOCALE_BUTTON4CTRL, QH:GetSetting("Raid_Ctrl_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Button4Alt, QH_LOCALE_BUTTON4ALT, QH:GetSetting("Raid_Alt_Button4_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Button5, QH_LOCALE_BUTTON5, QH:GetSetting("Raid_Button5_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Button5Shift, QH_LOCALE_BUTTON5SHIFT, QH:GetSetting("Raid_Shift_Button5_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Button5Ctrl, QH_LOCALE_BUTTON5CTRL, QH:GetSetting("Raid_Ctrl_Button5_Click"));
		QHOptions:SetEditBox(QHOptions_Raid_Bar_Button5Alt, QH_LOCALE_BUTTON5ALT, QH:GetSetting("Raid_Alt_Button5_Click"));
		QHOptions:SetSlider(QHOptions_Raid_Bar_Width, nil, QH_LOCALE_BARWIDTH, 1, 50, 1, QH:GetSetting("Raid_Bar_Width"));
		QHOptions:SetSlider(QHOptions_Raid_Bar_Height, nil, QH_LOCALE_BARHEIGHT, 1, 40, 1, QH:GetSetting("Raid_Bar_Height"));
	
		-- Buff Bar Options
		QHOptions:SetCheckButton(QHOptions_Buff_Bar_ShowBuffs, QH_LOCALE_SHOWBUFFS, QH:GetSetting("Buff_Show"));
		QHOptions:SetEditBox(QHOptions_Buff_Bar_BuffList, QH_LOCALE_BUFFLIST, QH:GetSetting("Buff_List"));

		-- Decurse/Warning Options
		QHOptions:SetCheckButton(QHOptions_Decurse_Warning_ShowDebuffs, QH_LOCALE_SHOWDEBUFFS, QH:GetSetting("Decurse_Show"));
		QHOptions:SetEditBox(QHOptions_Decurse_Warning_Left, QH_LOCALE_LEFT, QH:GetSetting("Decurse_Left_Click"));
		QHOptions:SetEditBox(QHOptions_Decurse_Warning_Middle, QH_LOCALE_MIDDLE, QH:GetSetting("Decurse_Middle_Click"));
		QHOptions:SetEditBox(QHOptions_Decurse_Warning_Right, QH_LOCALE_RIGHT, QH:GetSetting("Decurse_Right_Click"));
		QHOptions:SetCheckButton(QHOptions_Decurse_Warning_ShowWarnings, QH_LOCALE_SHOWWARNINGS, QH:GetSetting("Warnings_Show"));
		QHOptions:SetCheckButton(QHOptions_Decurse_Warning_FlashWarnings, QH_LOCALE_FLASHWARNINGS, QH:GetSetting("Warnings_Flash"));
		--QHOptions:SetCheckButton(QHOptions_Decurse_Warning_ShowStandard, QH_LOCALE_SHOWSTANDARDDEBUFFS, QH:GetSetting("Warnings_Show_Standard"));
		QHOptions:SetCheckButton(QHOptions_Decurse_Warning_ShowThreat, QH_LOCALE_SHOWTHREAT, QH:GetSetting("Warnings_Threat"));
		QHOptions:SetEditBox(QHOptions_Decurse_Warning_Warnings_ScrollFrame_EditBox, QH_LOCALE_WARNINGS, QH:GetSetting("Warning_List"));
	
		QHOptions.loaded = true;
		--QH:Print("QuickHeal Settings Loaded");
	end
end

function QHOptions:SaveOptions()

	-- Fail Safe To Guarantee Options Aren't Overwritten With Unitiliazed Variables
	if not QHOptions.loaded then QHOptions:SetupOptions(); end
	
	-- Profile Options
	QHOptions:SaveProfileOptions()

	-- General Options
	QHOptions:SaveGeneralOptions();
	
	-- Raid Frame Options
	QHOptions:SaveRaidFrameOptions();

	-- Player Bar Options
	QHOptions:SavePlayerOptions();

	-- Party Bar Options
	QHOptions:SavePartyOptions();

	-- Raid Bar Options
	QHOptions:SaveRaidOptions();

	-- Buff Bar Options
	QHOptions:SaveBuffOptions();

	-- Decurse Button Options
	QHOptions:SaveDecurseOptions();

	-- Keep active profile updated
	local active_profile = QH:GetGlobal(QH:Concat(QH:GetProfileName(), "_ActiveProfile"));
	if active_profile and active_profile ~= "" then
		QuickHeal:SaveProfile(active_profile);
	end

	--QH:Print("QuickHeal Settings Saved");
	
	QHOptions:Update();
end

function QHOptions:SaveProfileOptions()

	if QH then
	
		QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_SpecSwap"), QHOptions_Profiles_SpecSwap:GetChecked());
	
		local spec1 = UIDropDownMenu_GetSelectedValue(QHOptions_Profiles_Spec1);
		if not spec1 or spec1 == "" then QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_Spec1"), false);
		else QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_Spec1"), spec1); end
		
		local spec2 = UIDropDownMenu_GetSelectedValue(QHOptions_Profiles_Spec2);
		if not spec2 or spec2 == "" then QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_Spec2"), false);
		else QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_Spec2"), spec2); end

		local spec3 = UIDropDownMenu_GetSelectedValue(QHOptions_Profiles_Spec3);
		if not spec3 or spec3 == "" then QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_Spec3"), false);
		else QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_Spec3"), spec3); end

		local spec4 = UIDropDownMenu_GetSelectedValue(QHOptions_Profiles_Spec4);
		if not spec4 or spec4 == "" then QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_Spec4"), false);
		else QH:SetGlobal(QH:Concat(QH:GetProfileName(), "_Spec4"), spec4); end
	end
end

function QHOptions:SaveGeneralOptions()
	
	if QH then
	
		QH:SetSetting("Bar_Label_Show", QHOptions_General_BarValues:GetChecked());
		QH:SetSetting("Bar_Range_Check", QHOptions_General_RangeCheck:GetChecked());
		QH:SetSetting("Bar_Background_Show", QHOptions_General_BarBackground:GetChecked());
		QH:SetSetting("Bar_Always_Show_Spark", QHOptions_General_AlwaysShowSpark:GetChecked());
		QH:SetSetting("TargetFrame_Disable_Adjust", QHOptions_General_DisableTargetAdjust:GetChecked());
	end
end

function QHOptions:SaveRaidFrameOptions()
	
	if QH then
		QH:SetSetting("Raid_Frame_Show", QHOptions_Raid_Frame_RaidFrames:GetChecked());
		QH:SetSetting("Raid_Party_Hide", QHOptions_Raid_Frame_HideParty:GetChecked());
		QH:SetSetting("Raid_Background_Show", QHOptions_Raid_Frame_RaidBackground:GetChecked());
		QH:SetSetting("Raid_Sort_By", UIDropDownMenu_GetSelectedValue(QHOptions_Raid_Frame_RaidSort));
		QH:SetSetting("Raid_Rows", QHOptions_Raid_Frame_RaidRows:GetValue());
		QH:SetSetting("Raid_Dynamic_Groups", QHOptions_Raid_Frame_DynamicGroups:GetChecked());
		QH:SetSetting("Raid_Default_Frame_Hide", QHOptions_Raid_Frame_HideDefaultRaidFrame:GetChecked());
		QH:SetSetting("Raid_Role_Show", QHOptions_Raid_Frame_ShowRoleIcon:GetChecked());
		
		local groups = QH:GetSetting("Raid_Groups");
		for n = 1,8 do
			
			local group_button = _G[QH:Concat("QHOptions_Raid_Frame_RaidGroup", n)];
			if group_button:GetChecked() and not string.find(groups, n) then
				groups = QH:Concat(groups, n, ";");
			elseif not group_button:GetChecked() then
				groups = string.replace(groups, QH:Concat(n, ";"), "");
			end
		end
		QH:SetSetting("Raid_Groups", groups);

		local raid_background_color = QH:GetSetting("Raid_Background_Color");
		raid_background_color.a = QHOptions_Raid_Frame_RaidBackgroundTransparency:GetValue() / 100;
		QH:SetSetting("Raid_Background_Color", raid_background_color);
	end
end

function QHOptions:SavePlayerOptions()

	if QH then
	
		QH:SetSetting("Player_Left_Click", QHOptions_Player_Bar_Left:GetText());
		QH:SetSetting("Player_Shift_Left_Click", QHOptions_Player_Bar_LeftShift:GetText());
		QH:SetSetting("Player_Ctrl_Left_Click", QHOptions_Player_Bar_LeftCtrl:GetText());
		QH:SetSetting("Player_Alt_Left_Click", QHOptions_Player_Bar_LeftAlt:GetText());
		
		QH:SetSetting("Player_Middle_Click", QHOptions_Player_Bar_Middle:GetText());
		QH:SetSetting("Player_Shift_Middle_Click", QHOptions_Player_Bar_MiddleShift:GetText());
		QH:SetSetting("Player_Ctrl_Middle_Click", QHOptions_Player_Bar_MiddleCtrl:GetText());
		QH:SetSetting("Player_Alt_Middle_Click", QHOptions_Player_Bar_MiddleAlt:GetText());

		QH:SetSetting("Player_Right_Click", QHOptions_Player_Bar_Right:GetText());
		QH:SetSetting("Player_Shift_Right_Click", QHOptions_Player_Bar_RightShift:GetText());
		QH:SetSetting("Player_Ctrl_Right_Click", QHOptions_Player_Bar_RightCtrl:GetText());
		QH:SetSetting("Player_Alt_Right_Click", QHOptions_Player_Bar_RightAlt:GetText());
		
		QH:SetSetting("Player_Button4_Click", QHOptions_Player_Bar_Button4:GetText());
		QH:SetSetting("Player_Shift_Button4_Click", QHOptions_Player_Bar_Button4Shift:GetText());
		QH:SetSetting("Player_Ctrl_Button4_Click", QHOptions_Player_Bar_Button4Ctrl:GetText());
		QH:SetSetting("Player_Alt_Button4_Click", QHOptions_Player_Bar_Button4Alt:GetText());

		QH:SetSetting("Player_Button5_Click", QHOptions_Player_Bar_Button5:GetText());
		QH:SetSetting("Player_Shift_Button5_Click", QHOptions_Player_Bar_Button5Shift:GetText());
		QH:SetSetting("Player_Ctrl_Button5_Click", QHOptions_Player_Bar_Button5Ctrl:GetText());
		QH:SetSetting("Player_Alt_Button5_Click", QHOptions_Player_Bar_Button5Alt:GetText());
		
		QH:SetSetting("Player_Bar_Width", QHOptions_Player_Bar_Width:GetValue());
		QH:SetSetting("Player_Bar_Height", QHOptions_Player_Bar_Height:GetValue());
	end
end

function QHOptions:SavePartyOptions()

	if QH then
	
		QH:SetSetting("Party_Left_Click", QHOptions_Party_Bar_Left:GetText());
		QH:SetSetting("Party_Shift_Left_Click", QHOptions_Party_Bar_LeftShift:GetText());
		QH:SetSetting("Party_Ctrl_Left_Click", QHOptions_Party_Bar_LeftCtrl:GetText());
		QH:SetSetting("Party_Alt_Left_Click", QHOptions_Party_Bar_LeftAlt:GetText());
		
		QH:SetSetting("Party_Middle_Click", QHOptions_Party_Bar_Middle:GetText());
		QH:SetSetting("Party_Shift_Middle_Click", QHOptions_Party_Bar_MiddleShift:GetText());
		QH:SetSetting("Party_Ctrl_Middle_Click", QHOptions_Party_Bar_MiddleCtrl:GetText());
		QH:SetSetting("Party_Alt_Middle_Click", QHOptions_Party_Bar_MiddleAlt:GetText());

		QH:SetSetting("Party_Right_Click", QHOptions_Party_Bar_Right:GetText());
		QH:SetSetting("Party_Shift_Right_Click", QHOptions_Party_Bar_RightShift:GetText());
		QH:SetSetting("Party_Ctrl_Right_Click", QHOptions_Party_Bar_RightCtrl:GetText());
		QH:SetSetting("Party_Alt_Right_Click", QHOptions_Party_Bar_RightAlt:GetText());
		
		QH:SetSetting("Party_Button4_Click", QHOptions_Party_Bar_Button4:GetText());
		QH:SetSetting("Party_Shift_Button4_Click", QHOptions_Party_Bar_Button4Shift:GetText());
		QH:SetSetting("Party_Ctrl_Button4_Click", QHOptions_Party_Bar_Button4Ctrl:GetText());
		QH:SetSetting("Party_Alt_Button4_Click", QHOptions_Party_Bar_Button4Alt:GetText());

		QH:SetSetting("Party_Button5_Click", QHOptions_Party_Bar_Button5:GetText());
		QH:SetSetting("Party_Shift_Button5_Click", QHOptions_Party_Bar_Button5Shift:GetText());
		QH:SetSetting("Party_Ctrl_Button5_Click", QHOptions_Party_Bar_Button5Ctrl:GetText());
		QH:SetSetting("Party_Alt_Button5_Click", QHOptions_Party_Bar_Button5Alt:GetText());
		
		QH:SetSetting("Party_Bar_Width", QHOptions_Party_Bar_Width:GetValue());
		QH:SetSetting("Party_Bar_Height", QHOptions_Party_Bar_Height:GetValue());
	end
end

function QHOptions:SaveRaidOptions()

	if QH then
	
		QH:SetSetting("Raid_Left_Click", QHOptions_Raid_Bar_Left:GetText());
		QH:SetSetting("Raid_Shift_Left_Click", QHOptions_Raid_Bar_LeftShift:GetText());
		QH:SetSetting("Raid_Ctrl_Left_Click", QHOptions_Raid_Bar_LeftCtrl:GetText());
		QH:SetSetting("Raid_Alt_Left_Click", QHOptions_Raid_Bar_LeftAlt:GetText());
		
		QH:SetSetting("Raid_Middle_Click", QHOptions_Raid_Bar_Middle:GetText());
		QH:SetSetting("Raid_Shift_Middle_Click", QHOptions_Raid_Bar_MiddleShift:GetText());
		QH:SetSetting("Raid_Ctrl_Middle_Click", QHOptions_Raid_Bar_MiddleCtrl:GetText());
		QH:SetSetting("Raid_Alt_Middle_Click", QHOptions_Raid_Bar_MiddleAlt:GetText());

		QH:SetSetting("Raid_Right_Click", QHOptions_Raid_Bar_Right:GetText());
		QH:SetSetting("Raid_Shift_Right_Click", QHOptions_Raid_Bar_RightShift:GetText());
		QH:SetSetting("Raid_Ctrl_Right_Click", QHOptions_Raid_Bar_RightCtrl:GetText());
		QH:SetSetting("Raid_Alt_Right_Click", QHOptions_Raid_Bar_RightAlt:GetText());
		
		QH:SetSetting("Raid_Button4_Click", QHOptions_Raid_Bar_Button4:GetText());
		QH:SetSetting("Raid_Shift_Button4_Click", QHOptions_Raid_Bar_Button4Shift:GetText());
		QH:SetSetting("Raid_Ctrl_Button4_Click", QHOptions_Raid_Bar_Button4Ctrl:GetText());
		QH:SetSetting("Raid_Alt_Button4_Click", QHOptions_Raid_Bar_Button4Alt:GetText());

		QH:SetSetting("Raid_Button5_Click", QHOptions_Raid_Bar_Button5:GetText());
		QH:SetSetting("Raid_Shift_Button5_Click", QHOptions_Raid_Bar_Button5Shift:GetText());
		QH:SetSetting("Raid_Ctrl_Button5_Click", QHOptions_Raid_Bar_Button5Ctrl:GetText());
		QH:SetSetting("Raid_Alt_Button5_Click", QHOptions_Raid_Bar_Button5Alt:GetText());
		
		QH:SetSetting("Raid_Bar_Width", QHOptions_Raid_Bar_Width:GetValue());
		QH:SetSetting("Raid_Bar_Height", QHOptions_Raid_Bar_Height:GetValue());
	end
end

function QHOptions:SaveBuffOptions()

	if QH then
		QH:SetSetting("Buff_Show", QHOptions_Buff_Bar_ShowBuffs:GetChecked());
		QH:SetSetting("Buff_List", QHOptions_Buff_Bar_BuffList:GetText());
	end;
end

function QHOptions:SaveDecurseOptions()
	
	if QH then
		QH:SetSetting("Decurse_Show", QHOptions_Decurse_Warning_ShowDebuffs:GetChecked());
		QH:SetSetting("Decurse_Left_Click", QHOptions_Decurse_Warning_Left:GetText());
		QH:SetSetting("Decurse_Middle_Click", QHOptions_Decurse_Warning_Middle:GetText());
		QH:SetSetting("Decurse_Right_Click", QHOptions_Decurse_Warning_Right:GetText());
		
		QH:SetSetting("Warnings_Show", QHOptions_Decurse_Warning_ShowWarnings:GetChecked());
		QH:SetSetting("Warnings_Flash", QHOptions_Decurse_Warning_FlashWarnings:GetChecked());
		--QH:SetSetting("Warnings_Show_Standard", QHOptions_Decurse_Warning_ShowStandard:GetChecked());
		QH:SetSetting("Warnings_Threat", QHOptions_Decurse_Warning_ShowThreat:GetChecked());
		QH:SetSetting("Warning_List", QHOptions_Decurse_Warning_Warnings_ScrollFrame_EditBox:GetText());
	end
end

function QHOptions:SetCheckButton(checkbutton, label, value)

	if checkbutton and QH then
	
		local fonstring = getglobal(QH:Concat(checkbutton:GetName(), "Text"));
		if label then
			checkbutton.label = label;
			fonstring:SetText(label);
		end
		if value then checkbutton:SetChecked(value); 
		else checkbutton:SetChecked(false); end
		checkbutton:SetScript("OnClick", function() end);
	end
end

function QHOptions:SetEditBox(editbox, label, value)

	if editbox and QH then
	
		local fontstring = getglobal(QH:Concat(editbox:GetName(), "Text"));
		if label then
			editbox.label = label;
			fontstring:SetText(label);
		end
		if value then editbox:SetText(value); 
		else editbox:SetText(""); end
		editbox:SetCursorPosition(0);
	end
end

function QHOptions:SetSlider(slider, width, label, min, max, step, value)

	if slider and QH then
	
		local fontstring = getglobal(QH:Concat(slider:GetName(), "Text"));
		if label then slider.label = label; end
		fontstring:SetText(QH:Concat(label," [", value, "]"));
		fontstring:SetTextColor(0.99, 0.82, 0);
		if width then slider:SetWidth(width); end
		if min and max then slider:SetMinMaxValues(min, max); end
		if step then slider:SetValueStep(step); end
		if value then slider:SetValue(value); end
	end
end

function QHOptions:SetDropdown(dropdown, label, value, ...)

	if dropdown and QH then
		
		local fontstring = getglobal(QH:Concat(dropdown:GetName(), "Label"));
		if label then 
			dropdown.label = label;
			fontstring:SetText(label); 
		end
		dropdown.arguments = {...};
		UIDropDownMenu_Initialize(dropdown, QHOptions.SetDropdownList);
		if value then UIDropDownMenu_SetSelectedValue(dropdown, value); 
		else UIDropDownMenu_ClearAll(dropdown); end
		UIDropDownMenu_EnableDropDown(dropdown);
		dropdown:Show();
	end
end

function QHOptions:HideDropdown(dropdown)
	if dropdown and QH then
		UIDropDownMenu_DisableDropDown(dropdown);
		dropdown:Hide();
	end
end

QHOptions.DropDownInfo = {};
function QHOptions:SetDropdownList()
	
	local info = UIDropDownMenu_CreateInfo();
	for index,value in ipairs(self.arguments) do
		if(value) then
			wipe(QHOptions.DropDownInfo);
			QHOptions.DropDownInfo.text = value;
			QHOptions.DropDownInfo.value = value;
			QHOptions.DropDownInfo.owner = UIDROPDOWNMENU_INIT_MENU;
			QHOptions.DropDownInfo.func = QHOptions.DropdownOnClick;
			UIDropDownMenu_AddButton(QHOptions.DropDownInfo);
		end
	end
end

function QHOptions:DropdownOnClick()
	
	-- Set Dropdown Value	
	UIDropDownMenu_SetSelectedValue(self.owner, self.value);
end

function QHOptions:SaveProfile()

	local profile = QHOptions_Profiles_SaveAs:GetText();
	QuickHeal:SaveProfile(profile);
	--QHOptions_Profiles_SaveAs:SetText("");
	QHOptions:SetupOptions(true);
	QH:Print(QH:Concat("QuickHeal Profile '|cFF00FF00", profile, "|cFFFFFFFF' has been saved."));
end

function QHOptions:LoadProfile()

	local profile = UIDropDownMenu_GetSelectedValue(QHOptions_Profiles_Profile);
	QuickHeal:LoadProfile(profile);
	UIDropDownMenu_ClearAll(QHOptions_Profiles_Profile);
	QHOptions:SetupOptions(true);
	QH:Print(QH:Concat("QuickHeal Profile '|cFF00FF00", profile, "|cFFFFFFFF' has been loaded."));
end

function QHOptions:DeleteProfile()

	local profile = UIDropDownMenu_GetSelectedValue(QHOptions_Profiles_Profile);
	QuickHeal:DeleteProfile(profile);
	UIDropDownMenu_ClearAll(QHOptions_Profiles_Profile);
	QHOptions:SetupOptions(true);
	QH:Print(QH:Concat("QuickHeal Profile '|cFF00FF00", profile, "|cFFFFFFFF' has been deleted."));
end