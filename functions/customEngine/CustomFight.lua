
COMBAT_ENGINE_CUSTOM_ENABLED = {};
COMBAT_ENGINE_CUSTOM_PRESETS = {};
COMBAT_ENGINE_SELECTED_CATEGORY = 1;
COMBAT_USER_COMBINATIONS = {};
COMBAT_ENGINE_CUSTOM_FOCUSED = { name = "", id = "", icon = "" };
CE_TEMP_COND = { conditions = {} };
COMBAT_ENG_SERIAL = nil;
COMBAT_ENG_SERIAL_RAW = nil;
COMBAT_ENG_MAXSKILLS = 50;
COMBAT_ENG_MAX_DISPLAY_SKILLS = 10;
CE_TOTAL_CONDITIONS = 71;
--Rotation
CE_PRESET_ACTIVE = 1;
CE_PRESET_MAX_PRESETS = 5;

COMBAT_ENG_DEFAULTSKILL = {
	[1] = {
		IndexA = 99, IndexB = 99, icon = "", name = "", type = "", id = 0, enabled = true,
		conditions = {
			[1] = { status = false, min = 0, max = 0 },
			[2] = { status = false, min = 0, max = 0 },
			[3] = { status = false, min = 0, max = 0 },
			[4] = { status = false, min = 0, max = 0 },
			[5] = { status = false, min = 0, max = 0 },
			[6] = { status = false, min = 0, max = 0 },
			[7] = { status = false, min = 0, max = 0 },
			[8] = { status = false, min = 0, max = 0 },
			[9] = { status = false, min = 0, max = 0 },
			[10] = { status = false, min = 0, max = 0 },
			[11] = { status = false, id1 = 0, id2 = 0, id3 = 0, id4 = 0 },
			[12] = { status = false, id1 = 0, id2 = 0, id3 = 0, id4 = 0 },
			[13] = { status = false, id1 = 0, id2 = 0, id3 = 0, id4 = 0 },
			[14] = { status = false, id1 = 0, id2 = 0, id3 = 0, id4 = 0 },
			[15] = { status = false, id = 0, stack = 0, self = false, orMore = false },
			[16] = { status = false, id = 0, stack = 0, self = false, orMore = false },
			[17] = { status = false, id = 0, time = 0 },
			[18] = { status = false, enable = false },
			[19] = { status = false, enable = false },
			[20] = { status = false, enable = false },
			[21] = { status = false, enable = false },
			[22] = { status = false, enable = false },
			[23] = { status = false, enable = false },
			[24] = { status = false, enable = false },
			[25] = { status = false, enable = false },
			[26] = { status = false, time = 0 },
			[27] = { status = false, min = 0, max = 0 },
			[28] = { status = false, enable = false },
			[29] = { status = false, enable = false },
			[30] = { status = false, enable = false },
			[31] = { status = false, name = "" },
			[32] = { status = false, id1 = 0, id2 = 0, id3 = 0, id4 = 0 },
			[33] = { status = false, id1 = 0, id2 = 0, id3 = 0, id4 = 0 },
			[34] = { status = false, id1 = 0, id2 = 0, id3 = 0, id4 = 0 },
			[35] = { status = false, id1 = 0, id2 = 0, id3 = 0, id4 = 0 },
			[36] = { status = false, id = 0, stack = 0, self = false, orMore = false },
			[37] = { status = false, id = 0, stack = 0, self = false, orMore = false },
			[38] = { status = false, id = 0, time = 0, self = false },
			[39] = { status = false, enable = false },
			[40] = { status = false, enable = false },
			[41] = { status = false, enable = false },
			[42] = { status = false, enable = false },
			[43] = { status = false, enable = false },
			[44] = { status = false, enable = false },
			[45] = { status = false, enable = false },
			[46] = { status = false, id = 0, time = 0, self = false },
			[47] = { status = false, id = 0, time = 0, self = false },
			[48] = { status = false, enable = false },
			[49] = { status = false, name = "" },
			[50] = { status = false, enable = false },
			[51] = { status = false, enable = false },
			[52] = { status = false, enable = false },
			[53] = { status = false, enable = false },
			[54] = { status = false, name = "" },
			[55] = { status = false, enable = false },
			[56] = { status = false, enable = false },
			[57] = { status = false, enable = false },
			[58] = { status = false, enable = false },
			[59] = { status = false, enable = false },
			[60] = { status = false, enable = false },
			[61] = { status = false, enable = false },
			[62] = { status = false, enable = false },
			[63] = { status = false, enable = false },
			[64] = { status = false, enable = false },
			[65] = { status = false, enable = false },
			[66] = { status = false, enable = false },
			[67] = { status = false, enable = false },
			[68] = { status = false, enable = false },
			[69] = { status = false, enable = false },
			[70] = { status = false, enable = false },
			[71] = { status = false, enable = false },
		}
	}
}

function COMBATENGINE_EDIT_LUA_OnLoad( this )
	this:RegisterEvent("EXCHANGECLASS_SUCCESS");
	this:RegisterEvent("VARIABLES_LOADED");
	
	COMBAT_ENGINE_CUSTOM_ENABLED = COMBAT_ENGINE_CUSTOM_ENABLED or {};
	COMBAT_ENGINE_CUSTOM_PRESETS = COMBAT_ENGINE_CUSTOM_PRESETS	or {};
	
	SaveVariablesPerCharacter("COMBAT_ENGINE_CUSTOM_ENABLED", "CombatEngine");
	SaveVariablesPerCharacter("COMBAT_ENGINE_CUSTOM_PRESETS", "CombatEngine");
	SaveVariablesPerCharacter("COMBAT_USER_COMBINATIONS", "CombatEngine");
end

function COMBATENGINE_EDIT_LUA_OnEvent( this, event )
	if event == "EXCHANGECLASS_SUCCESS" then
		COMBATENGINE_EDIT_LUA_CONDITIONS:Hide();
		COMBATENGINE_EDIT_LUA_MakePreset();
		TimerQueue["DelayExchangeClass"] = { GetTime() + 0.5, CE_DelayExchangeClass};
	elseif event == "VARIABLES_LOADED" then
		if not TimerQueue["BADload"] then
			TimerQueue["BADload"] = { GetTime() + 1, CE_DelayLoad};
		end	
	end	
end


function CE_DelayExchangeClass()
	local main, sec = UnitClassToken("player");
	if not COMBAT_USER_COMBINATIONS[main .. sec] then
		COMBAT_USER_COMBINATIONS[main .. sec] = 1;
	end
	CE_PRESET_ACTIVE = COMBAT_USER_COMBINATIONS[main .. sec] or 1;
	local UserPreset = CE_PRESET_ACTIVE == 1 and "" or CE_PRESET_ACTIVE;
	local serial = main .. sec .. UserPreset;
	COMBAT_ENG_SERIAL = serial;
	COMBAT_ENG_SERIAL_RAW = main .. sec;

	if not COMBAT_ENGINE_CUSTOM_PRESETS[serial] then
		COMBAT_ENGINE_CUSTOM_PRESETS[serial] = {};
	end

	COMBAT_USER_COMBINATIONS[main .. sec] = CE_PRESET_ACTIVE;

	CE_Preset_UpdateButtons();
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
	CE_CustomEngine_SetButtons();
	CE_ConfigSkill_Save();

end

function CE_DelayLoad()
	CE_DelayExchangeClass();
	COMBATENGINE_EDIT_LUA_MakePreset();
	CE_CustomEngine_SetButtons();
end

function CE_CustomEngine_SetButtons()
	local Main, Sec = UnitClassToken("player")
	local serial = Main .. Sec;
	if not COMBAT_ENGINE_CUSTOM_ENABLED[serial] then COMBAT_ENGINE_CUSTOM_ENABLED[serial] = false;end

	CE_BUTTON_DEFAULT:GetNormalTexture():SetLuminance( COMBAT_ENGINE_CUSTOM_ENABLED[serial] );
	CE_BUTTON_CUSTOM:GetNormalTexture():SetLuminance( not COMBAT_ENGINE_CUSTOM_ENABLED[serial] );
end

function COMBATENGINE_EDIT_LUA_MakePreset()
	local Main, Sec = UnitClassToken("player")
	local UserPreset = CE_PRESET_ACTIVE == 1 and "" or CE_PRESET_ACTIVE;
	local serial = Main .. Sec .. UserPreset;
	COMBAT_ENG_SERIAL = serial;
	if not COMBAT_ENGINE_CUSTOM_PRESETS[serial] then
		COMBAT_ENGINE_CUSTOM_PRESETS[serial] = {}
	end
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
end

function CE_CustomEngine_OnClicButton( this )
	local Main, Sec = UnitClassToken("player")
	local serial = Main .. Sec;
	--Default
	if this:GetID() == 1 then
		COMBAT_ENGINE_CUSTOM_ENABLED[serial] = false;
		CE_BUTTON_CUSTOM:GetNormalTexture():SetLuminance( true );
		CE_BUTTON_DEFAULT:GetNormalTexture():SetLuminance( false );
		if COMBATENGINE_EDIT_LUA:IsVisible() then
			COMBATENGINE_EDIT_LUA:Hide();
		end
	--Custom
	else
		COMBAT_ENGINE_CUSTOM_ENABLED[serial] = true;
		CE_BUTTON_CUSTOM:GetNormalTexture():SetLuminance( false );
		CE_BUTTON_DEFAULT:GetNormalTexture():SetLuminance( true );
	end
	CE_CustomEngine_SetButtons();
end

function COMBATENGINE_EDIT_LUA_OnShow( this )
	CE_SET_TEXT_JUST_CLASS(this.Title);
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
end

function CE_deepCopy(original)
	if not original then return end
	local copy = {}
	for key, value in pairs(original) do
		if type(value) == "table" then
			copy[key] = CE_deepCopy(value)
		else
			copy[key] = value
		end
	end
	return copy
end

function COMBATENGINE_EDIT_LUA_Slot_Skill_OnReceiveDrag( this )
	local slot = this:GetID();
	local cursorType, index1, index2 = CombatEngine_Custom.CommandConfigFrame.dragAndDropManager:getInfo();
	local serial = COMBAT_ENG_SERIAL
	--create skill
	if not COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot] then
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot] = {}
	end

	if cursorType == "skill" then
		local name, _, icon, type, level, _, _, _, _, _, id = GetSkillDetail( index1, index2 );
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA = tonumber(index1);
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexB = tonumber(index2);
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].icon = icon;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].name = name;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].type = "skill";
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id = id;
	elseif cursorType == "bag" then
		local pos, index, icon, name, count, locked, quality, id
		if index1 - 60 > 1 then
			pos = index1 - 60
			index, icon, name, count, locked, quality, id = GetBagItemInfo( pos );
		else
			pos = index1
			icon, name, count, locked, quality, id = GetGoodsItemInfo( pos );
		end
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA = pos;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexB = 99;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].icon = icon;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].name = name;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].type = "item";
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id = id;
	elseif cursorType == "SkillPlate" then
	
		local name, icon = SkillPlateUpdate(index1);
		local id
		for a = 1, 12 do
			local data = SkillSuitPlate_Data[a]
			for b = 1, #data do
				local Data_id = SkillSuitPlate_Data[a][b]
				local Data_name = CE_toName( Data_id );
				if Data_name == name then
					id = Data_id;
					break
				end
			end
		end

		if GetObjectInfo( id, "EffectType" ) == 2 then
			ItemClipboard_Clear();
			if GetLanguage() == "ES" then
				DEFAULT_CHAT_FRAME:AddMessage( "|cff00FF00Combat Engine:|r |cff0000FFNo puedes equipar habilidades pasivas|r" );
			else
				DEFAULT_CHAT_FRAME:AddMessage( "|cff00FF00Combat Engine:|r |cff0000FFYou cannot equip passive skills|r");
			end
			return
		end

		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA = index1;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexB = 99;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].icon = icon;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].name = name;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].type = "skillplate";
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id = id;
	elseif cursorType == "equip" then
		local icon, name, _, _, _, id = GetInventoryItemInfo( "player", index1 );
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA = index1;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexB = 99;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].icon = icon;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].name = name;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].type = "equip";
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id = id;
	elseif cursorType == "macro" then
		local icon, name, text = GetMacroInfo( index1 );
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA = index1;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexB = 99;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].icon = icon;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].name = name;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].type = "macro";
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id = index1;
	end
	COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].enabled = true;
	ItemClipboard_Clear();
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
	CE_CUSTOM_CLEANSKILL_Conditions( slot );
	CE_ConfigSkill_Save();
end

function COMBATENGINE_EDIT_LUA_Slot_Skill_OnDragStart( this )
end

function COMBATENGINE_EDIT_LUA_Slot_Skill_OnClick( this, key )

	local serial = COMBAT_ENG_SERIAL
	local slot = this:GetID();
	
	if not COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot] then return end	
	
    if (key == "RBUTTON") then
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA = 99;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexB = 99;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].icon = "";
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].name = "";
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].type = "";
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id = 0;
		COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].enabled = true;
		CE_CUSTOM_CLEANSKILL_Conditions( slot );
		ItemClipboard_Clear();
		COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
	elseif (key == "LBUTTON") then
		if CursorHasItem() then
			local cursorType, index1, index2 = CombatEngine_Custom.CommandConfigFrame.dragAndDropManager:getInfo();
			if cursorType == "skill" then
				local name, _, icon, type, level, _, _, _, _, _, id = GetSkillDetail( index1, index2 );
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA = index1;
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexB = index2;
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].icon = icon;
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].name = name;
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].type = "skill";
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id = id;
				COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
				ItemClipboard_Clear();
				return
			elseif cursorType == "bag" then
				local pos, index, icon, name, count, locked, quality, id
				if index1 - 60 > 1 then
					pos = index1 - 60
					index, icon, name, count, locked, quality, id = GetBagItemInfo( pos );
				else
					pos = index1
					icon, name, count, locked, quality, id = GetGoodsItemInfo( pos );
				end
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA = 99;
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexB = 99;
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].icon = icon;
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].name = name;
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].type = "item";
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id = id;
				ItemClipboard_Clear();
				COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
				return
			end
		end
		ItemClipboard_Clear();
		COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
		CE_ConfigSkill_Save();
	end
end
			
function COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots()
	local serial = COMBAT_ENG_SERIAL
	for i = 1, 10 do
		local slot = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i )
		local icon = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i .. "Icon" );
		local name = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i .. "Title" );
		local titleSkill = getglobal( "COMBATENGINE_EDIT_LUA_FontSkill" .. i );
		local gear = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i .. "_Config" );
		local upArrow = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i .. "_Up" );
		local DownArrow = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i .. "_Down" );
		local Enabled = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i .. "_Enabled" );
		local cdText = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i .. "CooldownText" );
		local share = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i .. "_Share" );

		local id = slot:GetID();
		local file, title
		local IndexA = COMBAT_ENGINE_CUSTOM_PRESETS[serial] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].IndexA
		local IndexB = COMBAT_ENGINE_CUSTOM_PRESETS[serial] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].IndexB
		local type = COMBAT_ENGINE_CUSTOM_PRESETS[serial] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].type
		
		if IndexA and IndexB and type == "skill" then
			local _, realIndexA, realIndexB = Match_CE(COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].id)
			if not realIndexA or not realIndexB then
				file = COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].icon or ""
				title = COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].name ~= "" and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].name or "...";
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].IndexA = 0
				COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].IndexB = 0
			else
				local name, _, icon, type, level, _, _, _, _, _, _ = GetSkillDetail( realIndexA, realIndexB );
				file = icon;
				title = name;
			end
		else
			file = COMBAT_ENGINE_CUSTOM_PRESETS[serial] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].icon or ""
			title = COMBAT_ENGINE_CUSTOM_PRESETS[serial] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].name ~= "" and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].name or "...";
		end
		icon:SetFile( file );
		name:SetText( title );
		titleSkill:SetText( "Skill " .. id );
		gear:SetVisible( title ~= "..." );
		upArrow:SetVisible( title ~= "..." );
		DownArrow:SetVisible( title ~= "..." );
		Enabled:SetVisible( title ~= "..." );
		cdText:SetVisible( title ~= "..." );
		share:SetVisible( title ~= "..." );
		local enabled = COMBAT_ENGINE_CUSTOM_PRESETS[serial] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].enabled or false
		Enabled:SetChecked( enabled );

		if id == 1 then upArrow:Hide(); end 
		if id == COMBAT_ENG_MAXSKILLS then DownArrow:Hide(); end
		
	end
end

local function searchIndex( id )
    for i = 1, 350 do
        local index, icon, name, count, locked, _, itemID = GetBagItemInfo(i)
        if id == itemID then
			return index
        end
    end	
	for i = 1, 50 do
        local icon, name, count, locked, rarity, itemID = GetGoodsItemInfo(i)
        if itemID == id then
			return i
        end
    end
end

function COMBATENGINE_EDIT_LUA_Slider_OnChangeValue( this )
	local value = this:GetValue();
	for i = 1, COMBAT_ENG_MAX_DISPLAY_SKILLS do
	local button = getglobal("COMBATENGINE_EDIT_LUA_Skill" .. i);
		button:SetID( i + value );
	end
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
end

function COMBATENGINE_EDIT_LUA_Slot_Skill_OnEnter( this )
	local language = GetLanguage()
	local serial = COMBAT_ENG_SERIAL
	local slot = this:GetID()
	local _type = COMBAT_ENGINE_CUSTOM_PRESETS[serial] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].type or ""
	local info = CE_LANG.Tooltip.CleanSlot;
	
	if _type == "skill" then
		local page, index = COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA, COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexB;
		GameTooltip:SetOwner( this );
		GameTooltip:SetSkillItem( page, index, 0, false, false, false );
		GameTooltip:AddSeparator();
		GameTooltip:AddLine( info );
	elseif _type == "skillplate" then
		local index = COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].IndexA
		local skillId = COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id
		if index then
			GameTooltip:SetOwner( this );
			GameTooltip:SetSuitSkillPlateItem( index + 1 );
			GameTooltip:AddSeparator();
			GameTooltip:AddLine( info );
		else
			local skillName = TEXT( "Sys" .. skillId .. "_name" );
			local linkType = "skill";
			local Color
			local Type = GetObjectInfo( skillId, "EffectType" )
			if Type == 0 then
				Color = string.sub( GetMagicTypeColor( "MAGIC" ), 3 );
			else
				Color = string.sub( GetMagicTypeColor( "PHYSICAL" ), 3 );
			end
			local link = CreateHyperlink( "skill", string.format( "%s 0", tostring( skillId ) ), GetReplaceSystemKeyword( "[" .. skillId .. "]" ), Color )
			GameTooltip:SetOwner( this );
			GameTooltip:SetHyperLink( link );
			GameTooltip:AddSeparator();
			local info = CE_LANG.Tooltip.NoSkill;
			GameTooltip:AddLine( info );
		end
	elseif _type == "item" then
		local id = COMBAT_ENGINE_CUSTOM_PRESETS[serial][slot].id
		local index = searchIndex( id );
		if index then
			GameTooltip:SetOwner( this );
			GameTooltip:SetBagItem( index );
			GameTooltip:AddSeparator();
			GameTooltip:AddLine( info );
		else
			local message = CE_LANG.Tooltip.NoItem;
			GameTooltip:SetOwner( this );
			GameTooltip:SetText( message, 1, 0, 0 );
			GameTooltip:AddSeparator();
			GameTooltip:AddLine( info );
		end
	end
end
--------------------------------------------------------
--------------------------------------------------------
if(_G and not _G.CombatEngine_Custom) then
	_G.CombatEngine_Custom = {
		name = "CombatEngine_Custom",
		Frames = {"CombatEngine_CustomMinimap",},
	};
end
--------------------------------------------------------------------------------
---------------------------------------- Hook ----------------------------------
--------------------------------------------------------------------------------
CombatEngine_Custom.HookManager = {};
CombatEngine_Custom.HookManager.override = function(orgFunc, overrideFunc, instance)
	local hookManager = CombatEngine_Custom.HookManager(orgFunc, nil, nil, instance);
	hookManager.overrideFunc = overrideFunc;
	return hookManager;
end;
CombatEngine_Custom.HookManager.call = function(self, ...)
	if(self.overrideFunc ~= nil) then
		local result = nil;
		if(self.instance ~= nil) then
			result = {pcall(self.overrideFunc, self.instance, self.orgFunc, ...)};
		else
			result = {pcall(self.overrideFunc, self.orgFunc, ...)};
		end

		if(result[1]) then
			return unpack(result, 2);
		else
			return;
		end
	end

	if(self.preFunc ~= nil) then
		local result = nil;
		if(self.instance ~= nil) then
			result = {pcall(self.preFunc, self.instance, ...)};
		else
			result = {pcall(self.preFunc, ...)};
		end
		if(not result[1]) then
		end
	end

	local resultList = {pcall(self.orgFunc, ...)};
	if(not resultList[1]) then
	end

	if(self.postFunc ~= nil) then
		local result = nil;
		if(self.instance ~= nil) then
			result = {pcall(self.postFunc, self.instance, ...)};
		else
			result = {pcall(self.postFunc, ...)};
		end
		if(not result[1]) then
		end
	end

	return unpack(resultList, 2);
end;
CombatEngine_Custom.HookManager.getOriginalFunction = function(self)
	return self.orgFunc;
end;
CombatEngine_Custom.HookManager.isHooked = function(self)
	return true;
end;
CombatEngine_Custom.HookManager.toString = function(self)
	return "orgFunc:[" .. tostring(self.orgFunc) .. "], preFunc:[" .. tostring(self.preFunc) .. "], postFunc:[" .. tostring(self.postFunc) .. "], overrideFunc:[" .. tostring(self.overrideFunc) .. "]";
end;

CombatEngine_Custom.HookManager.constructor = function(self, orgFunc, preFunc, postFunc, instance)

	local obj = {};
	obj.orgFunc = orgFunc;
	obj.preFunc = preFunc;
	obj.postFunc = postFunc;
	obj.instance = instance;
	obj.overrideFunc = nil;

	return setmetatable(obj, {__index=CombatEngine_Custom.HookManager, __tostring=CombatEngine_Custom.HookManager.toString, __call=CombatEngine_Custom.HookManager.call});
end;
setmetatable(CombatEngine_Custom.HookManager, {__call=CombatEngine_Custom.HookManager.constructor});	-- コンストラクタを指定

--------------------------------------------------------------------------------
------------------------------Drag and Drop ------------------------------------
--------------------------------------------------------------------------------
CombatEngine_Custom.CommandConfigFrame = {};
CombatEngine_Custom.DragAndDropManager = {};
CombatEngine_Custom.CommandConfigFrame.allCommandList = nil;
CombatEngine_Custom.CommandConfigFrame.targetCommandListIndex = nil;
CombatEngine_Custom.CommandConfigFrame.targetCommandList = nil;
CombatEngine_Custom.CommandConfigFrame.callbackFunc = nil;
CombatEngine_Custom.CommandConfigFrame.dragAndDropManager = nil;

function CombatEngine_CONFIG_OnShow(this)
	if(CombatEngine_Custom.CommandConfigFrame.dragAndDropManager == nil) then
		CombatEngine_Custom.CommandConfigFrame.dragAndDropManager = CombatEngine_Custom.DragAndDropManager();
	end
	CombatEngine_Custom.CommandConfigFrame.dragAndDropManager:startHook();
end
function CombatEngine_CONFIG_OnHide(this)
	if(CombatEngine_Custom.CommandConfigFrame.dragAndDropManager ~= nil) then
		CombatEngine_Custom.CommandConfigFrame.dragAndDropManager:endHook()
	end
end
--------------------------------------------------------------------------------
CombatEngine_Custom.DragAndDropManager.getClassName = function()
	return "DragAndDropManager";
end;
CombatEngine_Custom.DragAndDropManager.SKILL = "skill";
CombatEngine_Custom.DragAndDropManager.ACTION = "action";
CombatEngine_Custom.DragAndDropManager.BAG = "bag";
CombatEngine_Custom.DragAndDropManager.EQUIP = "equip";
CombatEngine_Custom.DragAndDropManager.BANK = "bank";
CombatEngine_Custom.DragAndDropManager.EMOTE = "emote";
CombatEngine_Custom.DragAndDropManager.MACRO = "macro";
CombatEngine_Custom.DragAndDropManager.SUIT_SKILL = "SuitSkill";
CombatEngine_Custom.DragAndDropManager.SUIT_SKILL_PLATE = "SkillPlate";
CombatEngine_Custom.DragAndDropManager.hookedFunctionList = {
	["DragSkillButton"] = CombatEngine_Custom.DragAndDropManager.SKILL,
	["PickupAction"] = CombatEngine_Custom.DragAndDropManager.ACTION,
	["PickupBagItem"] = CombatEngine_Custom.DragAndDropManager.BAG,
	["PickupEquipmentItem"] = CombatEngine_Custom.DragAndDropManager.EQUIP,
	["PickupBankItem"] = CombatEngine_Custom.DragAndDropManager.BANK,
	["DragEmoteItem"] = CombatEngine_Custom.DragAndDropManager.EMOTE,
	["PickupMacroItem"] = CombatEngine_Custom.DragAndDropManager.MACRO,
	["DragSuitSkill_job"] = CombatEngine_Custom.DragAndDropManager.SUIT_SKILL,
	["SkillPlateDragStart"] = CombatEngine_Custom.DragAndDropManager.SUIT_SKILL_PLATE,
};

CombatEngine_Custom.DragAndDropManager.createHookFunction = function(self, funcName)
	local func = function(index1, index2)
		local cursorType = CombatEngine_Custom.DragAndDropManager.hookedFunctionList[funcName];
		assert(cursorType, "Error: CursorType is nil. FuncName:[" .. funcName .. "]");
		self.cursorType = cursorType;
		self.index1 = index1;
		self.index2 = index2;
	end;
	return func;
end;
CombatEngine_Custom.DragAndDropManager.startHook = function(self)
	for functionName, _ in pairs(CombatEngine_Custom.DragAndDropManager.hookedFunctionList) do
		if(_G[functionName] ~= nil) then
			_G[functionName] = CombatEngine_Custom.HookManager(_G[functionName], self:createHookFunction(functionName));
		end
	end
end;
CombatEngine_Custom.DragAndDropManager.endHook = function(self)
	for functionName, _ in pairs(CombatEngine_Custom.DragAndDropManager.hookedFunctionList) do
		if(_G[functionName] ~= nil and type(_G[functionName]) == "table" and _G[functionName].getOriginalFunction ~= nil) then
			_G[functionName] = (_G[functionName]):getOriginalFunction();
		end
	end
end;
CombatEngine_Custom.DragAndDropManager.getInfo = function(self)
	return self.cursorType, self.index1, self.index2;
end;
CombatEngine_Custom.DragAndDropManager.clear = function(self)
	self.cursorType = "";
	self.index1 = 0;
	self.index2 = 0;
end;
CombatEngine_Custom.DragAndDropManager.toString = function(self)
	return "CursorType:[" .. tostring(self.cursorType) .. "], Index1:[" .. tostring(self.index1) .. "], Index2:[" .. tostring(self.index2) .. "]";
end;
CombatEngine_Custom.DragAndDropManager.constructor = function(self)
	local obj = {};
	obj.cursorType = "";
	obj.index1 = 0;
	obj.index2 = 0;
	return setmetatable(obj, {__index=CombatEngine_Custom.DragAndDropManager, __tostring=CombatEngine_Custom.DragAndDropManager.toString});
end;
setmetatable(CombatEngine_Custom.DragAndDropManager, {__call=CombatEngine_Custom.DragAndDropManager.constructor});

--------------------------------------------------------
------------------ Conditions Skills -------------------
--------------------------------------------------------
function CE_ConfigSkill_OnClick( this )
	local serial = COMBAT_ENG_SERIAL
	COMBAT_ENGINE_CUSTOM_FOCUSED.id = this:GetParent():GetID();
	local id = COMBAT_ENGINE_CUSTOM_FOCUSED.id;
	COMBAT_ENGINE_CUSTOM_FOCUSED.name = COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].name;
	COMBAT_ENGINE_CUSTOM_FOCUSED.icon  = COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].icon;
	COMBATENGINE_EDIT_LUA_CONDITIONS:Show();

	--Create Conditions
	for i = 1, CE_TOTAL_CONDITIONS do
		if not COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] then
			COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] = {}
		end
		if not COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].conditions then
			COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].conditions = {}
		end
		
		if COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].conditions[i] then
			CE_TEMP_COND.conditions[i] = COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].conditions[i]
		end
		
		if not COMBAT_ENGINE_CUSTOM_PRESETS[serial][id].conditions[i] then
			CE_TEMP_COND.conditions[i] = CE_deepCopy(COMBAT_ENG_DEFAULTSKILL[1].conditions[i])
		end
	end
	CE_ConfigSkill_SetPage();
	CE_CUSTOM_LOADSKILL( id );
end
function CE_ConfigSkill_SetPage()
	local focus = COMBAT_ENGINE_CUSTOM_FOCUSED;
	local name, id, icon = focus.name, focus.id, focus.icon;
	COMBATENGINE_EDIT_LUA_CONDITIONS.Title:SetText("|cff00FFFFSlot " .. id .. ": |r" .. "|cffFFFF00" .. name .. "|r");
	CE_Config_Skill_Icon:SetFile(icon);
	
end

function CE_ConfigSkill_EnableSkill( this )
	local serial = COMBAT_ENG_SERIAL
	local id = this:GetParent():GetID()
	local skill = COMBAT_ENGINE_CUSTOM_PRESETS[serial][id]
	skill.enabled = this:IsChecked();
end

--------------------------------------------------------
------------------ save optimization -------------------
--------------------------------------------------------
function CE_ConfigSkill_Save( this )
	for i = 1, COMBAT_ENG_MAXSKILLS do	
		--clean
		if COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i] then
			if COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i]["icon"] == "" then
				COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i] = nil
			else
				for x = 1, CE_TOTAL_CONDITIONS do
					if COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i]
					and COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i].conditions
					and COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i].conditions[x]
					and COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i].conditions[x].status == false then
						COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i].conditions[x] = nil;
					end					
				end
			end
		end		
	end
	CE_CleanFile();
	CombatEnigne_Patch();
	PerformSaveVariables();
end

function CE_CleanFile()
	for i = 1, COMBAT_ENG_MAXSKILLS do
		for x = 1, CE_TOTAL_CONDITIONS do
			if COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i]
			and	COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i][x]
			and COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i][x].icon
			and COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i][x].icon == "" then
				COMBAT_ENGINE_CUSTOM_PRESETS[COMBAT_ENG_SERIAL][i] = nil
			end
		end
	end
end

--------------------------------------------------------
--------------------Preset Buttons ---------------------
--------------------------------------------------------
function CE_Preset_UpdateButtons()
	local active = "Interface\\addons\\CombatEngine\\texture\\button_4.tga";
	local inactive = "Interface\\addons\\CombatEngine\\texture\\button_1.tga";
	for i = 1, CE_PRESET_MAX_PRESETS do
		local button = _G["COMBATENGINE_EDIT_LUA_Preset_" .. i];
		local file = i == CE_PRESET_ACTIVE and active or inactive;
		button:GetNormalTexture():SetFile( file );
	end

	for i = 1, COMBAT_ENG_MAX_DISPLAY_SKILLS do
		local shareButton = _G[ "COMBATENGINE_EDIT_LUA_Skill" .. i .. "_Share" ];
		if CE_PRESET_ACTIVE == 1 then
			shareButton:Enable();
			shareButton:GetNormalTexture():SetLuminance( false );
			shareButton:GetDisabledTexture():SetLuminance( false );
		else
			shareButton:Disable();
			shareButton:GetNormalTexture():SetLuminance( true );
			shareButton:GetDisabledTexture():SetLuminance( true );
		end
	end


end

function CE_Preset_OnClick( this )
	local id = this:GetID();
	local main, sec = UnitClassToken("player");
	local UserPreset = id == 1 and "" or id;
	local serial = main .. sec .. UserPreset;
	CE_PRESET_ACTIVE = id;
	COMBAT_ENG_SERIAL = serial;

	if not COMBAT_ENGINE_CUSTOM_PRESETS[serial] then
		COMBAT_ENGINE_CUSTOM_PRESETS[serial] = {};
	end

	if not COMBAT_USER_COMBINATIONS[main .. sec] then
		COMBAT_USER_COMBINATIONS[main .. sec] = 1;
	end

	COMBAT_USER_COMBINATIONS[main .. sec] = id;

	CE_Preset_UpdateButtons();
	PlaySoundByPath("interface\\addons\\CombatEngine\\sfx\\01.mp3");
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
	CE_ConfigSkill_Save();
end

function CE_Preset_OnShow( this )
	local id = this:GetID();
	CE_Preset_UpdateButtons();
end

function CE_CustomPreset_OnClick( this, key )
	if key == "LBUTTON" then
		CE_Preset_OnClick( this );
	elseif key == "RBUTTON" then
		Chat_CopyToClipboard("/run CombatEngine(" .. this:GetID() .. ")");
		DEFAULT_CHAT_FRAME:AddMessage("|cff0099ffCE: " .. string.format(_G.CE_LANG.Sys.ChatMsg2, this:GetID()))
	end
end

--------------------------------------------------------
------------------------- Tips -------------------------
--------------------------------------------------------
function CombatEngine_Conditions_Tips( this )
	local id = this:GetParent():GetID()
	local OffsetX = CombatEngine_ScrollFrame:GetHorizontalScroll();
	GameTooltip:SetOwner(this, "ANCHOR_TOPRIGHT", -OffsetX + CombatEngine_ScrollFrame:GetHorizontalScroll() /3.25, 0)
	GameTooltip:SetText(this:GetParent().name:GetText(), 0, 1, 1)
	local tipText = CE_LANG["Tip"..id]
	GameTooltip:AddLine(tipText)
end

--ScrollFrame MouseWheel
function CombatEngine_Conditions_OnMouseWheel(delta)
	if ( delta > 0 ) then
		CombatEngine_ScrollFrame:SetHorizontalScroll( CombatEngine_ScrollFrame:GetHorizontalScroll() - 50 )
	else
		CombatEngine_ScrollFrame:SetHorizontalScroll( CombatEngine_ScrollFrame:GetHorizontalScroll() + 50 )
	end

	local scroll = CombatEngine_ScrollFrame:GetHorizontalScroll()
	
	local ranges = {
		{ start = 0,    finish = 639 },
		{ start = 640,  finish = 1370 },
		{ start = 1371, finish = 1790 },
		{ start = 1800, finish = 2140 },
		{ start = 2141, finish = 999999 },
	}
	
	for i = 1, 5 do
		local button = _G["COMBATENGINE_EDIT_LUA_CONDITIONS_Section_" .. i];
		if scroll >= ranges[i].start and scroll <= ranges[i].finish then
			COMBAT_ENGINE_SELECTED_CATEGORY = i;
			button:LockHighlight();
		else
			button:UnlockHighlight();
		end
	end
end