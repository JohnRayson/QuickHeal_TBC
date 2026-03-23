---------------------------------------------------------------------------------------------
-- QuickHeal Constant And Default Variables
---------------------------------------------------------------------------------------------
QHDEFAULT = {};
QHDEFAULT["GLOBAL"] = {};
QHCONSTANTS = {};

-- TARGET FRAME SETTINGS
QHDEFAULT["GLOBAL"]["TargetFrame_Disable_Adjust"]	= false;

-- NAMEPLATE SETTINGS
QHCONSTANTS["Name_Background_Texture"]			    = false;
QHCONSTANTS["Name_Range_Alpha"]				        = 0.5;
QHCONSTANTS["Name_Background_Color"] 			    = {r=0.0, g=0.0, b=0.0, a=0.0};

-- BAR SETTINGS
QHDEFAULT["GLOBAL"]["Bar_Label_Show"]			    = true;
QHDEFAULT["GLOBAL"]["Bar_Range_Check"]			    = true;
QHDEFAULT["GLOBAL"]["Bar_Always_Show_Spark"] 	    = false;
QHDEFAULT["GLOBAL"]["Bar_Background_Show"] 		    = false;
QHCONSTANTS["Bar_Range_Alpha"]				        = 0.15;
QHCONSTANTS["Bar_Start_Color"] 				        = {r=0.0, g=1.0, b=0.0, a=1.0};
QHCONSTANTS["Bar_Mid_Color"] 				        = {r=1.0, g=1.0, b=0.0, a=1.0};
QHCONSTANTS["Bar_End_Color"] 				        = {r=1.0, g=0.0, b=0.0, a=1.0};
QHCONSTANTS["Bar_Hot_Color"] 				        = {r=0.0, g=1.0, b=1.0, a=0.75};
QHCONSTANTS["Bar_Background_Color"] 			    = {r=0.0, g=0.0, b=0.0, a=0.5};
QHCONSTANTS["Bar_Label_Color"] 				        = {r=1.0, g=1.0, b=1.0, a=1.0};

-- DECURSE BUTTON SETTINGS
QHDEFAULT["GLOBAL"]["Decurse_Show"]			        = true;
QHDEFAULT["GLOBAL"]["Warnings_Show"]			    = true;
QHDEFAULT["GLOBAL"]["Warnings_Flash"]			    = true;
QHDEFAULT["GLOBAL"]["Warnings_Show_Standard"]	    = true;
QHDEFAULT["GLOBAL"]["Warning_List"]			        = "";
QHDEFAULT["GLOBAL"]["Warnings_Threat"]			    = true;
QHCONSTANTS["Decurse_Range_Alpha"]			        = 0.15;
QHCONSTANTS["Decurse_Background_Color"] 		    = {r=0.0, g=0.0, b=0.0, a=0.0};

-- BUFF SETTINGS
QHDEFAULT["GLOBAL"]["Buff_Show"]			        = true;
QHCONSTANTS["Buff_Row_Spacing"]				        = 2;
QHCONSTANTS["Buff_Row_Offset"]				        = 2;
QHCONSTANTS["Buff_Col_Spacing"]				        = 2;
QHCONSTANTS["Buff_Col_Offset"]				        = 2;

-- PLAYER FRAME SETTINGS
QHDEFAULT["GLOBAL"]["Player_Bar_Width"] 		    = 100;
QHDEFAULT["GLOBAL"]["Player_Bar_Height"] 		    = 40;
QHCONSTANTS["Player_Name_Position"] 			    = false;
QHCONSTANTS["Player_Name_Width"] 			        = 75;
QHCONSTANTS["Player_Name_Height"] 			        = 40;
QHCONSTANTS["Player_Name_Text_Position"] 		    = "RIGHT";
QHCONSTANTS["Player_Bar_Position"] 			        = 2;
QHCONSTANTS["Player_Decurse_Position"] 			    = 3;
QHCONSTANTS["Player_Decurse_Width"] 			    = 40;
QHCONSTANTS["Player_Decurse_Height"] 			    = 40;
QHCONSTANTS["Player_Buff_Width"] 			        = 18;
QHCONSTANTS["Player_Buff_Height"] 			        = 18;
QHCONSTANTS["Player_Raid_Icon_Width"] 			    = 18;
QHCONSTANTS["Player_Raid_Icon_Height"] 			    = 18;
QHCONSTANTS["Player_Raid_Icon_Offset"] 			    = 5;

-- PARTY FRAME SETTINGS
QHDEFAULT["GLOBAL"]["Party_Bar_Width"] 			    = 100;
QHDEFAULT["GLOBAL"]["Party_Bar_Height"] 		    = 40;
QHCONSTANTS["Party_Name_Position"] 			        = false;
QHCONSTANTS["Party_Name_Width"] 			        = 75;
QHCONSTANTS["Party_Name_Height"] 			        = 40;
QHCONSTANTS["Party_Name_Text_Position"] 		    = "RIGHT";
QHCONSTANTS["Party_Bar_Position"] 			        = 2;
QHCONSTANTS["Party_Decurse_Position"] 			    = 3;
QHCONSTANTS["Party_Decurse_Width"] 			        = 40;
QHCONSTANTS["Party_Decurse_Height"] 			    = 40;
QHCONSTANTS["Party_Buff_Width"] 			        = 18;
QHCONSTANTS["Party_Buff_Height"] 			        = 18;
QHCONSTANTS["Party_Raid_Icon_Width"] 			    = 18;
QHCONSTANTS["Party_Raid_Icon_Height"] 			    = 18;
QHCONSTANTS["Party_Raid_Icon_Offset"] 			    = 5;

-- PET FRAME SETTINGS
QHDEFAULT["GLOBAL"]["Pet_Bar_Width"] 		        = 50;
QHDEFAULT["GLOBAL"]["Pet_Bar_Height"] 		        = 20;
QHCONSTANTS["Pet_Name_Position"] 			        = false;
QHCONSTANTS["Pet_Name_Width"] 				        = 75;
QHCONSTANTS["Pet_Name_Height"] 				        = 20;
QHCONSTANTS["Pet_Name_Text_Position"] 		        = "RIGHT";
QHCONSTANTS["Pet_Bar_Position"] 			        = 2;
QHCONSTANTS["Pet_Decurse_Position"] 		        = 3;
QHCONSTANTS["Pet_Decurse_Width"] 			        = 20;
QHCONSTANTS["Pet_Decurse_Height"] 			        = 20;
QHCONSTANTS["Pet_Buff_Width"] 				        = 9;
QHCONSTANTS["Pet_Buff_Height"] 				        = 9;
QHCONSTANTS["Pet_Raid_Icon_Width"] 			        = 9;
QHCONSTANTS["Pet_Raid_Icon_Height"] 		        = 9;
QHCONSTANTS["Pet_Raid_Icon_Offset"] 		        = 1;

-- RAID FRAME SETTINGS
QHDEFAULT["GLOBAL"]["Raid_Frame_Show"]			    = true;
QHDEFAULT["GLOBAL"]["Raid_Position_X"] 			    = 12;
QHDEFAULT["GLOBAL"]["Raid_Position_Y"] 			    = -110;
QHDEFAULT["GLOBAL"]["Raid_Position_Align"] 		    = "TOPLEFT";
QHDEFAULT["GLOBAL"]["Raid_Position_Relative"] 	    = "TOPLEFT";
QHDEFAULT["GLOBAL"]["Raid_Position_Anchor"] 	    = "UIParent";
QHDEFAULT["GLOBAL"]["Raid_Party_Hide"] 			    = true;
QHDEFAULT["GLOBAL"]["Raid_Background_Show"] 	    = true;
QHDEFAULT["GLOBAL"]["Raid_Default_Frame_Hide"]	    = true;
QHDEFAULT["GLOBAL"]["Raid_Bar_Width"] 			    = 40;
QHDEFAULT["GLOBAL"]["Raid_Bar_Height"] 			    = 12;
QHDEFAULT["GLOBAL"]["Raid_Rows"] 			        = 26;
QHDEFAULT["GLOBAL"]["Raid_Sort_By"] 			    = "ROLE";
QHDEFAULT["GLOBAL"]["Raid_Background_Color"] 	    = {r=0.0, g=0.0, b=0.0, a=0.75};
QHDEFAULT["GLOBAL"]["Raid_Icon_Show"]			    = true;
QHDEFAULT["GLOBAL"]["Raid_Role_Show"]			    = true;
QHDEFAULT["GLOBAL"]["Raid_Dynamic_Groups"]		    = false;
QHDEFAULT["GLOBAL"]["Raid_Groups"]			        = "1;2;3;4;5;6;7;8;";
QHCONSTANTS["Raid_Row_Spacing"] 			        = 3;
QHCONSTANTS["Raid_Row_Offset"] 				        = 8;
QHCONSTANTS["Raid_Col_Spacing"] 			        = 25;
QHCONSTANTS["Raid_Col_Offset"] 				        = 8;
QHCONSTANTS["Raid_Class_Order"] 			        = "WARRIOR,DEATHKNIGHT,DEMONHUNTER,DRUID,PALADIN,MONK,PRIEST,SHAMAN,ROGUE,MAGE,WARLOCK,HUNTER";
QHCONSTANTS["Raid_Name_Position"] 			        = 1;
QHCONSTANTS["Raid_Name_Width"] 				        = 75;
QHCONSTANTS["Raid_Name_Height"] 			        = 12;
QHCONSTANTS["Raid_Name_Text_Position"] 			    = "RIGHT";
QHCONSTANTS["Raid_Role_Position"] 			        = 2;
QHCONSTANTS["Raid_Bar_Position"] 			        = 3;
QHCONSTANTS["Raid_Decurse_Position"] 			    = 4;
QHCONSTANTS["Raid_Decurse_Width"] 			        = 12;
QHCONSTANTS["Raid_Decurse_Height"] 			        = 12;
QHCONSTANTS["Raid_Buff_Width"] 				        = 12;
QHCONSTANTS["Raid_Buff_Height"] 			        = 12;
QHCONSTANTS["Raid_Raid_Icon_Width"] 			    = 12;
QHCONSTANTS["Raid_Raid_Icon_Height"] 			    = 12;
QHCONSTANTS["Raid_Raid_Icon_Offset"] 			    = 2;
QHCONSTANTS["Raid_Role_Icon_Width"] 			    = 12;
QHCONSTANTS["Raid_Role_Icon_Height"] 			    = 12;
QHCONSTANTS["Raid_Role_Icon_Offset"] 			    = 2;

-- CLASS SETTINGS
QHDEFAULT["WARRIOR"] = {};
QHDEFAULT["CLASSIC_WARRIOR"] = {};
QuickHeal:CopyTable(QHDEFAULT["WARRIOR"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_WARRIOR"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["DEATHKNIGHT"] = {};
QHDEFAULT["CLASSIC_DEATHKNIGHT"] = {};
QuickHeal:CopyTable(QHDEFAULT["DEATHKNIGHT"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_DEATHKNIGHT"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["DRUID"] = {};
QHDEFAULT["CLASSIC_DRUID"] = {};
QuickHeal:CopyTable(QHDEFAULT["DRUID"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_DRUID"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["PALADIN"] = {};
QHDEFAULT["CLASSIC_PALADIN"] = {};
QuickHeal:CopyTable(QHDEFAULT["PALADIN"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_PALADIN"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["PRIEST"] = {};
QHDEFAULT["CLASSIC_PRIEST"] = {};
QuickHeal:CopyTable(QHDEFAULT["PRIEST"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_PRIEST"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["SHAMAN"] = {};
QHDEFAULT["CLASSIC_SHAMAN"] = {};
QuickHeal:CopyTable(QHDEFAULT["SHAMAN"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_SHAMAN"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["ROGUE"] = {};
QHDEFAULT["CLASSIC_ROGUE"] = {};
QuickHeal:CopyTable(QHDEFAULT["ROGUE"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_ROGUE"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["MAGE"] = {};
QHDEFAULT["CLASSIC_MAGE"] = {};
QuickHeal:CopyTable(QHDEFAULT["MAGE"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_MAGE"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["WARLOCK"] = {};
QHDEFAULT["CLASSIC_WARLOCK"] = {};
QuickHeal:CopyTable(QHDEFAULT["WARLOCK"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_WARLOCK"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["HUNTER"] = {};
QHDEFAULT["CLASSIC_HUNTER"] = {};
QuickHeal:CopyTable(QHDEFAULT["HUNTER"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_HUNTER"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["MONK"] = {};
QHDEFAULT["CLASSIC_MONK"] = {};
QuickHeal:CopyTable(QHDEFAULT["MONK"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_MONK"], QHDEFAULT["GLOBAL"]);

QHDEFAULT["DEMONHUNTER"] = {};
QHDEFAULT["CLASSIC_DEMONHUNTER"] = {};
QuickHeal:CopyTable(QHDEFAULT["DEMONHUNTER"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_DEMONHUNTER"], QHDEFAULT["GLOBAL"]);

-- PRIEST SETTINGS
QHDEFAULT["PRIEST"]["Player_Left_Click"] 		            = QH_LOCALE_FLASHHEAL;
QHDEFAULT["PRIEST"]["Party_Left_Click"] 		            = QH_LOCALE_FLASHHEAL;
QHDEFAULT["PRIEST"]["Raid_Left_Click"] 			            = QH_LOCALE_FLASHHEAL;

QHDEFAULT["PRIEST"]["Player_Right_Click"] 		            = QH_LOCALE_PWSHIELD;
QHDEFAULT["PRIEST"]["Player_Shift_Right_Click"] 	        = QH_LOCALE_GUARDIANSPIRIT;
QHDEFAULT["PRIEST"]["Party_Right_Click"] 		            = QH_LOCALE_PWSHIELD;
QHDEFAULT["PRIEST"]["Party_Shift_Right_Click"] 		        = QH_LOCALE_GUARDIANSPIRIT;
QHDEFAULT["PRIEST"]["Raid_Right_Click"] 		            = QH_LOCALE_PWSHIELD;
QHDEFAULT["PRIEST"]["Raid_Shift_Right_Click"] 		        = QH_LOCALE_GUARDIANSPIRIT;

QHDEFAULT["PRIEST"]["Player_Middle_Click"] 		            = QH_LOCALE_PRAYEROFMEND;
QHDEFAULT["PRIEST"]["Player_Shift_Middle_Click"] 	        = QH_LOCALE_RENEW;
QHDEFAULT["PRIEST"]["Party_Middle_Click"] 		            = QH_LOCALE_PRAYEROFMEND;
QHDEFAULT["PRIEST"]["Party_Shift_Middle_Click"] 	        = QH_LOCALE_RENEW;
QHDEFAULT["PRIEST"]["Raid_Middle_Click"] 		            = QH_LOCALE_PRAYEROFMEND;
QHDEFAULT["PRIEST"]["Raid_Shift_Middle_Click"] 		        = QH_LOCALE_RENEW;

QHDEFAULT["PRIEST"]["Decurse_Left_Click"] 		            = QH_LOCALE_PURIFY;

QHDEFAULT["PRIEST"]["Buff_List"] 			                = QH_LOCALE_RENEW .. "; " .. QH_LOCALE_PRAYEROFMEND .. "; " .. QH_LOCALE_PWSHIELD .. "; " .. QH_LOCALE_ATONEMENT .. ";";

-- CLASSIC PRIEST SETTINGS
QHDEFAULT["CLASSIC_PRIEST"]["Player_Left_Click"] 		    = QH_LOCALE_FLASHHEAL;
QHDEFAULT["CLASSIC_PRIEST"]["Player_Shift_Left_Click"] 		= QH_LOCALE_GREATERHEAL;
QHDEFAULT["CLASSIC_PRIEST"]["Party_Left_Click"] 		    = QH_LOCALE_FLASHHEAL;
QHDEFAULT["CLASSIC_PRIEST"]["Party_Shift_Left_Click"] 		= QH_LOCALE_GREATERHEAL;
QHDEFAULT["CLASSIC_PRIEST"]["Raid_Left_Click"] 			    = QH_LOCALE_FLASHHEAL;
QHDEFAULT["CLASSIC_PRIEST"]["Raid_Shift_Left_Click"] 		= QH_LOCALE_GREATERHEAL;

QHDEFAULT["CLASSIC_PRIEST"]["Player_Right_Click"] 		    = QH_LOCALE_PWSHIELD;
QHDEFAULT["CLASSIC_PRIEST"]["Party_Right_Click"] 		    = QH_LOCALE_PWSHIELD;
QHDEFAULT["CLASSIC_PRIEST"]["Raid_Right_Click"] 		    = QH_LOCALE_PWSHIELD;

QHDEFAULT["CLASSIC_PRIEST"]["Player_Middle_Click"] 		    = QH_LOCALE_RENEW;
QHDEFAULT["CLASSIC_PRIEST"]["Party_Middle_Click"] 		    = QH_LOCALE_RENEW;
QHDEFAULT["CLASSIC_PRIEST"]["Raid_Middle_Click"] 		    = QH_LOCALE_RENEW;

QHDEFAULT["CLASSIC_PRIEST"]["Decurse_Left_Click"] 		    = QH_LOCALE_DISPELMAGIC;
QHDEFAULT["CLASSIC_PRIEST"]["Decurse_Right_Click"] 		    = QH_LOCALE_ABOLISH_DISEASE;
QHDEFAULT["CLASSIC_PRIEST"]["Decurse_Middle_Click"] 		= QH_LOCALE_CURE_DISEASE;

QHDEFAULT["CLASSIC_PRIEST"]["Buff_List"] 			        = QH_LOCALE_RENEW .. "; " .. QH_LOCALE_PWSHIELD .. ";";

-- DRUID SETTINGS
QHDEFAULT["DRUID"]["Player_Left_Click"] 		            = QH_LOCALE_REGROWTH;
QHDEFAULT["DRUID"]["Player_Shift_Left_Click"] 		        = QH_LOCALE_HEALINGTOUCH;
QHDEFAULT["DRUID"]["Party_Left_Click"] 			            = QH_LOCALE_REGROWTH;
QHDEFAULT["DRUID"]["Party_Shift_Left_Click"] 		        = QH_LOCALE_HEALINGTOUCH;
QHDEFAULT["DRUID"]["Raid_Left_Click"] 			            = QH_LOCALE_REGROWTH;
QHDEFAULT["DRUID"]["Raid_Shift_Left_Click"] 		        = QH_LOCALE_HEALINGTOUCH;

QHDEFAULT["DRUID"]["Player_Right_Click"] 		            = QH_LOCALE_LIFEBLOOM;
QHDEFAULT["DRUID"]["Player_Shift_Right_Click"] 		        = QH_LOCALE_WILDGROWTH;
QHDEFAULT["DRUID"]["Party_Right_Click"] 		            = QH_LOCALE_LIFEBLOOM;
QHDEFAULT["DRUID"]["Party_Shift_Right_Click"] 		        = QH_LOCALE_WILDGROWTH;
QHDEFAULT["DRUID"]["Raid_Right_Click"] 			            = QH_LOCALE_LIFEBLOOM;
QHDEFAULT["DRUID"]["Raid_Shift_Right_Click"] 		        = QH_LOCALE_WILDGROWTH;

QHDEFAULT["DRUID"]["Player_Middle_Click"] 		            = QH_LOCALE_REJUVENATION;
QHDEFAULT["DRUID"]["Player_Shift_Middle_Click"] 	        = QH_LOCALE_SWIFTMEND;
QHDEFAULT["DRUID"]["Party_Middle_Click"] 		            = QH_LOCALE_REJUVENATION;
QHDEFAULT["DRUID"]["Party_Shift_Middle_Click"] 		        = QH_LOCALE_SWIFTMEND;
QHDEFAULT["DRUID"]["Raid_Middle_Click"] 		            = QH_LOCALE_REJUVENATION;
QHDEFAULT["DRUID"]["Raid_Shift_Middle_Click"] 		        = QH_LOCALE_SWIFTMEND;

QHDEFAULT["DRUID"]["Decurse_Left_Click"] 		            = QH_LOCALE_NATURESCURE;
QHDEFAULT["DRUID"]["Decurse_Right_Click"] 		            = QH_LOCALE_REMOVE_CORRUPTION;
QHDEFAULT["DRUID"]["Decurse_Middle_Click"] 		            = "";

QHDEFAULT["DRUID"]["Buff_List"] 			                = QH_LOCALE_REJUVENATION .. "; " .. QH_LOCALE_REGROWTH .. "; " .. QH_LOCALE_WILDGROWTH .. "; " .. QH_LOCALE_LIFEBLOOM .. ";";

-- CLASSIC DRUID SETTINGS
QHDEFAULT["CLASSIC_DRUID"]["Player_Left_Click"] 		    = QH_LOCALE_REGROWTH;
QHDEFAULT["CLASSIC_DRUID"]["Player_Shift_Left_Click"] 		= QH_LOCALE_HEALINGTOUCH;
QHDEFAULT["CLASSIC_DRUID"]["Party_Left_Click"] 			    = QH_LOCALE_REGROWTH;
QHDEFAULT["CLASSIC_DRUID"]["Party_Shift_Left_Click"] 		= QH_LOCALE_HEALINGTOUCH;
QHDEFAULT["CLASSIC_DRUID"]["Raid_Left_Click"] 			    = QH_LOCALE_REGROWTH;
QHDEFAULT["CLASSIC_DRUID"]["Raid_Shift_Left_Click"] 		= QH_LOCALE_HEALINGTOUCH;

QHDEFAULT["CLASSIC_DRUID"]["Player_Right_Click"] 		    = QH_LOCALE_REJUVENATION;
QHDEFAULT["CLASSIC_DRUID"]["Party_Right_Click"] 		    = QH_LOCALE_REJUVENATION;
QHDEFAULT["CLASSIC_DRUID"]["Raid_Right_Click"] 			    = QH_LOCALE_REJUVENATION;

QHDEFAULT["CLASSIC_DRUID"]["Player_Middle_Click"] 		    = QH_LOCALE_TRANQUILITY;
QHDEFAULT["CLASSIC_DRUID"]["Party_Middle_Click"] 		    = QH_LOCALE_TRANQUILITY;
QHDEFAULT["CLASSIC_DRUID"]["Raid_Middle_Click"] 		    = QH_LOCALE_TRANQUILITY;

QHDEFAULT["CLASSIC_DRUID"]["Decurse_Left_Click"] 		    = QH_LOCALE_REMOVE_CURSE;
QHDEFAULT["CLASSIC_DRUID"]["Decurse_Right_Click"] 		    = QH_LOCALE_ABOLISH_POISON;
QHDEFAULT["CLASSIC_DRUID"]["Decurse_Middle_Click"] 		    = QH_LOCAL_CURE_POISON;

QHDEFAULT["CLASSIC_DRUID"]["Buff_List"] 			        = QH_LOCALE_REJUVENATION .. "; " .. QH_LOCALE_REGROWTH .. "; " .. ";";

-- PALADIN SETTINGS
QHDEFAULT["PALADIN"]["Player_Left_Click"] 		            = QH_LOCALE_FLASHOFLIGHT;
QHDEFAULT["PALADIN"]["Player_Shift_Left_Click"] 	        = QH_LOCALE_HOLYLIGHT;
QHDEFAULT["PALADIN"]["Player_Ctrl_Left_Click"] 		        = QH_LOCALE_LAYONHANDS;
QHDEFAULT["PALADIN"]["Party_Left_Click"] 		            = QH_LOCALE_FLASHOFLIGHT;
QHDEFAULT["PALADIN"]["Party_Shift_Left_Click"] 		        = QH_LOCALE_HOLYLIGHT;
QHDEFAULT["PALADIN"]["Party_Ctrl_Left_Click"] 		        = QH_LOCALE_LAYONHANDS;
QHDEFAULT["PALADIN"]["Raid_Left_Click"] 		            = QH_LOCALE_FLASHOFLIGHT;
QHDEFAULT["PALADIN"]["Raid_Shift_Left_Click"] 		        = QH_LOCALE_HOLYLIGHT;
QHDEFAULT["PALADIN"]["Raid_Ctrl_Left_Click"] 		        = QH_LOCALE_LAYONHANDS;

QHDEFAULT["PALADIN"]["Player_Right_Click"] 		            = QH_LOCALE_BLESSINGOFPROTECTION;
QHDEFAULT["PALADIN"]["Player_Shift_Right_Click"] 	        = QH_LOCALE_BLESSINGOFFREEDOM;
QHDEFAULT["PALADIN"]["Player_Ctrl_Right_Click"] 	        = QH_LOCALE_BLESSINGOFSALVATION;
QHDEFAULT["PALADIN"]["Party_Right_Click"] 		            = QH_LOCALE_BLESSINGOFPROTECTION;
QHDEFAULT["PALADIN"]["Party_Shift_Right_Click"] 	        = QH_LOCALE_BLESSINGOFFREEDOM;
QHDEFAULT["PALADIN"]["Party_Ctrl_Right_Click"] 		        = QH_LOCALE_BLESSINGOFSALVATION;
QHDEFAULT["PALADIN"]["Raid_Right_Click"] 		            = QH_LOCALE_BLESSINGOFPROTECTION;
QHDEFAULT["PALADIN"]["Raid_Shift_Right_Click"] 		        = QH_LOCALE_BLESSINGOFFREEDOM;
QHDEFAULT["PALADIN"]["Raid_Ctrl_Right_Click"] 		        = QH_LOCALE_BLESSINGOFSALVATION;

QHDEFAULT["PALADIN"]["Player_Middle_Click"] 		        = QH_LOCALE_HOLYSHOCK;
QHDEFAULT["PALADIN"]["Player_Shift_Middle_Click"] 	        = QH_LOCALE_LIGHTOFDAWN;
QHDEFAULT["PALADIN"]["Party_Middle_Click"] 		            = QH_LOCALE_HOLYSHOCK;
QHDEFAULT["PALADIN"]["Party_Shift_Middle_Click"] 	        = QH_LOCALE_LIGHTOFDAWN;
QHDEFAULT["PALADIN"]["Raid_Middle_Click"] 		            = QH_LOCALE_HOLYSHOCK;
QHDEFAULT["PALADIN"]["Raid_Shift_Middle_Click"] 	        = QH_LOCALE_LIGHTOFDAWN;

QHDEFAULT["PALADIN"]["Decurse_Left_Click"] 		            = QH_LOCALE_CLEANSE;
QHDEFAULT["PALADIN"]["Decurse_Right_Click"] 		        = QH_LOCALE_CLEANSETOXINS;

-- CLASSIC PALADIN SETTINGS
QHDEFAULT["CLASSIC_PALADIN"]["Player_Left_Click"] 		    = QH_LOCALE_FLASHOFLIGHT;
QHDEFAULT["CLASSIC_PALADIN"]["Player_Shift_Left_Click"] 	= QH_LOCALE_HOLYLIGHT;
QHDEFAULT["CLASSIC_PALADIN"]["Player_Ctrl_Left_Click"] 		= QH_LOCALE_LAYONHANDS;
QHDEFAULT["CLASSIC_PALADIN"]["Party_Left_Click"] 		    = QH_LOCALE_FLASHOFLIGHT;
QHDEFAULT["CLASSIC_PALADIN"]["Party_Shift_Left_Click"] 		= QH_LOCALE_HOLYLIGHT;
QHDEFAULT["CLASSIC_PALADIN"]["Party_Ctrl_Left_Click"] 		= QH_LOCALE_LAYONHANDS;
QHDEFAULT["CLASSIC_PALADIN"]["Raid_Left_Click"] 		    = QH_LOCALE_FLASHOFLIGHT;
QHDEFAULT["CLASSIC_PALADIN"]["Raid_Shift_Left_Click"] 		= QH_LOCALE_HOLYLIGHT;
QHDEFAULT["CLASSIC_PALADIN"]["Raid_Ctrl_Left_Click"] 		= QH_LOCALE_LAYONHANDS;

QHDEFAULT["CLASSIC_PALADIN"]["Player_Right_Click"] 		    = QH_LOCALE_BLESSINGOFPROTECTION;
QHDEFAULT["CLASSIC_PALADIN"]["Player_Shift_Right_Click"] 	= QH_LOCALE_BLESSINGOFFREEDOM;
QHDEFAULT["CLASSIC_PALADIN"]["Player_Ctrl_Right_Click"] 	= QH_LOCALE_BLESSINGOFSALVATION;
QHDEFAULT["CLASSIC_PALADIN"]["Party_Right_Click"] 		    = QH_LOCALE_BLESSINGOFPROTECTION;
QHDEFAULT["CLASSIC_PALADIN"]["Party_Shift_Right_Click"] 	= QH_LOCALE_BLESSINGOFFREEDOM;
QHDEFAULT["CLASSIC_PALADIN"]["Party_Ctrl_Right_Click"] 		= QH_LOCALE_BLESSINGOFSALVATION;
QHDEFAULT["CLASSIC_PALADIN"]["Raid_Right_Click"] 		    = QH_LOCALE_BLESSINGOFPROTECTION;
QHDEFAULT["CLASSIC_PALADIN"]["Raid_Shift_Right_Click"] 		= QH_LOCALE_BLESSINGOFFREEDOM;
QHDEFAULT["CLASSIC_PALADIN"]["Raid_Ctrl_Right_Click"] 		= QH_LOCALE_BLESSINGOFSALVATION;

QHDEFAULT["CLASSIC_PALADIN"]["Player_Middle_Click"] 		= QH_LOCALE_HOLYSHOCK;
QHDEFAULT["CLASSIC_PALADIN"]["Party_Middle_Click"] 		    = QH_LOCALE_HOLYSHOCK;
QHDEFAULT["CLASSIC_PALADIN"]["Raid_Middle_Click"] 		    = QH_LOCALE_HOLYSHOCK;

QHDEFAULT["CLASSIC_PALADIN"]["Decurse_Left_Click"] 		    = QH_LOCALE_CLEANSE;
QHDEFAULT["CLASSIC_PALADIN"]["Decurse_Right_Click"] 		= QH_LOCALE_PURIFY;

-- SHAMAN SETTINGS
QHDEFAULT["SHAMAN"]["Player_Left_Click"] 	    	        = QH_LOCALE_CHAINHEAL;
QHDEFAULT["SHAMAN"]["Player_Shift_Left_Click"] 		        = QH_LOCALE_HEALINGWAVE;
QHDEFAULT["SHAMAN"]["Player_Ctrl_Left_Click"] 		        = QH_LOCALE_LESSER_HEALINGWAVE;
QHDEFAULT["SHAMAN"]["Party_Left_Click"] 		            = QH_LOCALE_CHAINHEAL;
QHDEFAULT["SHAMAN"]["Party_Shift_Left_Click"] 		        = QH_LOCALE_HEALINGWAVE;
QHDEFAULT["SHAMAN"]["Party_Ctrl_Left_Click"] 		        = QH_LOCALE_LESSER_HEALINGWAVE;
QHDEFAULT["SHAMAN"]["Raid_Left_Click"] 		    	        = QH_LOCALE_CHAINHEAL;
QHDEFAULT["SHAMAN"]["Raid_Shift_Left_Click"] 		        = QH_LOCALE_HEALINGWAVE;
QHDEFAULT["SHAMAN"]["Raid_Ctrl_Left_Click"] 		        = QH_LOCALE_LESSERHEALINGWAVE;

QHDEFAULT["SHAMAN"]["Player_Right_Click"] 		            = QH_LOCALE_EARTHSHIELD;
QHDEFAULT["SHAMAN"]["Player_Shift_Right_Click"] 	        = QH_LOCALE_WATERBREATHING;
QHDEFAULT["SHAMAN"]["Player_Ctrl_Right_Click"] 		        = QH_LOCALE_WATERWALKING;
QHDEFAULT["SHAMAN"]["Party_Right_Click"] 	    	        = QH_LOCALE_EARTHSHIELD;
QHDEFAULT["SHAMAN"]["Party_Shift_Right_Click"] 		        = QH_LOCALE_WATERBREATHING;
QHDEFAULT["SHAMAN"]["Party_Ctrl_Right_Click"] 		        = QH_LOCALE_WATERWALKING;
QHDEFAULT["SHAMAN"]["Raid_Right_Click"] 		            = QH_LOCALE_EARTHSHIELD;
QHDEFAULT["SHAMAN"]["Raid_Shift_Right_Click"] 		        = QH_LOCALE_WATERBREATHING;
QHDEFAULT["SHAMAN"]["Raid_Ctrl_Right_Click"] 		        = QH_LOCALE_WATERWALKING;

QHDEFAULT["SHAMAN"]["Player_Middle_Click"] 		            = QH_LOCALE_RIPTIDE;
QHDEFAULT["SHAMAN"]["Party_Middle_Click"] 	    	        = QH_LOCALE_RIPTIDE;
QHDEFAULT["SHAMAN"]["Raid_Middle_Click"] 	    	        = QH_LOCALE_RIPTIDE;

QHDEFAULT["SHAMAN"]["Decurse_Left_Click"] 	    	        = QH_LOCALE_PURIFYSPIRIT;
QHDEFAULT["SHAMAN"]["Decurse_Right_Click"] 	    	        = QH_LOCALE_CLEANSESPIRIT;

QHDEFAULT["SHAMAN"]["Buff_List"] 			                = "Earth Shield";

-- CLASSIC SHAMAN SETTINGS
QHDEFAULT["CLASSIC_SHAMAN"]["Player_Left_Click"] 	    	= QH_LOCALE_CHAINHEAL;
QHDEFAULT["CLASSIC_SHAMAN"]["Party_Left_Click"] 		    = QH_LOCALE_CHAINHEAL;
QHDEFAULT["CLASSIC_SHAMAN"]["Raid_Left_Click"] 		    	= QH_LOCALE_CHAINHEAL;

QHDEFAULT["CLASSIC_SHAMAN"]["Player_Right_Click"] 		    = QH_LOCALE_HEALINGWAVE;
QHDEFAULT["CLASSIC_SHAMAN"]["Party_Right_Click"] 	    	= QH_LOCALE_HEALINGWAVE;
QHDEFAULT["CLASSIC_SHAMAN"]["Raid_Right_Click"] 		    = QH_LOCALE_HEALINGWAVE;

QHDEFAULT["CLASSIC_SHAMAN"]["Player_Middle_Click"] 		    = QH_LOCALE_LESSER_HEALINGWAVE;
QHDEFAULT["CLASSIC_SHAMAN"]["Party_Middle_Click"] 	    	= QH_LOCALE_LESSER_HEALINGWAVE;
QHDEFAULT["CLASSIC_SHAMAN"]["Raid_Middle_Click"] 	    	= QH_LOCALE_LESSER_HEALINGWAVE;

QHDEFAULT["CLASSIC_SHAMAN"]["Decurse_Left_Click"] 	    	= QH_LOCAL_CURE_POISON;

-- MAGE SETTINGS
QHDEFAULT["MAGE"]["Decurse_Left_Click"] 		            = QH_LOCALE_REMOVECURSE;

-- CLASSIC MAGE SETTINGS
QHDEFAULT["CLASSIC_MAGE"]["Decurse_Left_Click"]             = QH_LOCALE_REMOVE_LESSER_CURSECURSE;

-- MONK SETTINGS
QHDEFAULT["MONK"]["Player_Left_Click"] 			            = QH_LOCALE_SOOTHINGMIST;
QHDEFAULT["MONK"]["Player_Shift_Left_Click"] 		        = QH_LOCALE_SURGINGMIST;
QHDEFAULT["MONK"]["Party_Left_Click"] 			            = QH_LOCALE_SOOTHINGMIST;
QHDEFAULT["MONK"]["Party_Shift_Left_Click"] 		        = QH_LOCALE_SURGINGMIST;
QHDEFAULT["MONK"]["Raid_Left_Click"] 		    	        = QH_LOCALE_SOOTHINGMIST;
QHDEFAULT["MONK"]["Raid_Shift_Left_Click"] 	    	        = QH_LOCALE_SURGINGMIST;

QHDEFAULT["MONK"]["Player_Right_Click"] 		            = QH_LOCALE_LIFECOCOON;
QHDEFAULT["MONK"]["Party_Right_Click"] 		    	        = QH_LOCALE_LIFECOCOON;
QHDEFAULT["MONK"]["Raid_Right_Click"] 		    	        = QH_LOCALE_LIFECOCOON;

QHDEFAULT["MONK"]["Player_Middle_Click"] 	    	        = QH_LOCALE_RENEWINGMIST;
QHDEFAULT["MONK"]["Player_Shift_Middle_Click"] 		        = QH_LOCALE_ENVELOPINGMIST;
QHDEFAULT["MONK"]["Party_Middle_Click"] 		            = QH_LOCALE_RENEWINGMIST;
QHDEFAULT["MONK"]["Party_Shift_Middle_Click"] 		        = QH_LOCALE_ENVELOPINGMIST;
QHDEFAULT["MONK"]["Raid_Middle_Click"] 			            = QH_LOCALE_RENEWINGMIST;
QHDEFAULT["MONK"]["Raid_Shift_Middle_Click"] 		        = QH_LOCALE_ENVELOPINGMIST;

QHDEFAULT["MONK"]["Decurse_Left_Click"] 		            = QH_LOCALE_DETOX;

QHDEFAULT["MONK"]["Buff_List"] 				                = "Renewing Mist; Enveloping Mist; Life Cocoon;";

-- EVOKER SETTINGS
QHDEFAULT["EVOKER"] = {};
QHDEFAULT["CLASSIC_EVOKER"] = {};
QuickHeal:CopyTable(QHDEFAULT["EVOKER"], QHDEFAULT["GLOBAL"]);
QuickHeal:CopyTable(QHDEFAULT["CLASSIC_EVOKER"], QHDEFAULT["GLOBAL"]);

---------------------------------------------------------------------------------------------
-- QuickHeal Binding Variables
---------------------------------------------------------------------------------------------
BINDING_NAME_QUICKHEAL2 = QH_LOCALE_BINDING;
BINDING_HEADER_QUICKHEAL2 = QH_LOCALE_HEADER;

QHProfile2 = {};
QH = QuickHeal:new();