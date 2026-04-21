CE_IMPORT_SKILLS = {}
LOCAL_EXTRACT_CONDITIONS = {}

function CE_ExecuteImport()
	local serial = COMBAT_ENG_SERIAL
	local preset = COMBAT_ENGINE_CUSTOM_PRESETS[serial]
	if preset then
		for skill = 1, COMBAT_ENG_MAXSKILLS do
			preset[skill] = CE_deepCopy(COMBAT_ENG_DEFAULTSKILL[1])
		end
	end

	CE_SET_IMPORT_SKILL(serial, preset)
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots()
	if type(CE_ConfigSkill_Save) == "function" then
		CE_ConfigSkill_Save()
	end
end

function CE_SET_IMPORT_SKILL(serial, preset)
	local GetSkills = {
		-- Ladrón (Thief)
		["THIEFAUGUR"]     = type(CE_ROGUE_PRIEST_IMPORT)    == "function" and serial == "THIEFAUGUR" and CE_ROGUE_PRIEST_IMPORT()      or {},
		["THIEFBARD"]      = type(CE_ROGUE_BARD_IMPORT)      == "function" and serial == "THIEFBARD" and CE_ROGUE_BARD_IMPORT()          or {},
		["THIEFDRUID"]     = type(CE_ROGUE_DRUID_IMPORT)     == "function" and serial == "THIEFDRUID" and CE_ROGUE_DRUID_IMPORT()        or {},
		["THIEFHARPSYN"]   = type(CE_ROGUE_HARPSYN_IMPORT)   == "function" and serial == "THIEFHARPSYN" and CE_ROGUE_HARPSYN_IMPORT()    or {},
		["THIEFKNIGHT"]    = type(CE_ROGUE_KNIGHT_IMPORT)    == "function" and serial == "THIEFKNIGHT" and CE_ROGUE_KNIGHT_IMPORT()      or {},
		["THIEFMAGE"]      = type(CE_ROGUE_MAGE_IMPORT)      == "function" and serial == "THIEFMAGE" and CE_ROGUE_MAGE_IMPORT()          or {},
		["THIEFPSYRON"]    = type(CE_ROGUE_CHAMPION_IMPORT)  == "function" and serial == "THIEFPSYRON" and CE_ROGUE_CHAMPION_IMPORT()    or {},
		["THIEFRANGER"]    = type(CE_ROGUE_SCOUT_IMPORT)     == "function" and serial == "THIEFRANGER" and CE_ROGUE_SCOUT_IMPORT()       or {},
		["THIEFWARDEN"]    = type(CE_ROGUE_WARDEN_IMPORT)    == "function" and serial == "THIEFWARDEN" and CE_ROGUE_WARDEN_IMPORT()      or {},
		["THIEFWARRIOR"]   = type(CE_ROGUE_WARRIOR_IMPORT)   == "function" and serial == "THIEFWARRIOR" and CE_ROGUE_WARRIOR_IMPORT()    or {},
		-- Brujo (Warlock)
		["HARPSYNBARD"]    = type(CE_WARLOCK_BARD_IMPORT)    == "function" and serial == "HARPSYNBARD" and CE_WARLOCK_BARD_IMPORT()      or {},
		["HARPSYNMAGE"]    = type(CE_WARLOCK_MAGE_IMPORT)    == "function" and serial == "HARPSYNMAGE" and CE_WARLOCK_MAGE_IMPORT()      or {},
		["HARPSYNPSYRON"]  = type(CE_WARLOCK_CHAMPION_IMPORT)== "function" and serial == "HARPSYNPSYRON" and CE_WARLOCK_CHAMPION_IMPORT()or {},
		["HARPSYNRANGER"]  = type(CE_WARLOCK_SCOUT_IMPORT)   == "function" and serial == "HARPSYNRANGER" and CE_WARLOCK_SCOUT_IMPORT()   or {},
		["HARPSYNTHIEF"]   = type(CE_WARLOCK_THIEF_IMPORT)   == "function" and serial == "HARPSYNTHIEF" and CE_WARLOCK_THIEF_IMPORT()    or {},
		["HARPSYNWARDEN"]  = type(CE_WARLOCK_WARDEN_IMPORT)  == "function" and serial == "HARPSYNWARDEN" and CE_WARLOCK_WARDEN_IMPORT()  or {},
		["HARPSYNWARRIOR"] = type(CE_WARLOCK_WARRIOR_IMPORT) == "function" and serial == "HARPSYNWARRIOR" and CE_WARLOCK_WARRIOR_IMPORT()or {},
		-- Mago (Mage)
		["MAGETHIEF"]      = type(CE_MAGE_ROGUE_IMPORT)      == "function" and serial == "MAGETHIEF" and CE_MAGE_ROGUE_IMPORT()          or {},
		["MAGEWARRIOR"]    = type(CE_MAGE_WARRIOR_IMPORT)    == "function" and serial == "MAGEWARRIOR" and CE_MAGE_WARRIOR_IMPORT()      or {},
		["MAGEWARDEN"]     = type(CE_MAGE_WARDEN_IMPORT)     == "function" and serial == "MAGEWARDEN" and CE_MAGE_WARDEN_IMPORT()        or {},
		["MAGERANGER"]     = type(CE_MAGE_SCOUT_IMPORT)      == "function" and serial == "MAGERANGER" and CE_MAGE_SCOUT_IMPORT()         or {},
		["MAGEPSYRON"]     = type(CE_MAGE_CHAMPION_IMPORT)   == "function" and serial == "MAGEPSYRON" and CE_MAGE_CHAMPION_IMPORT()      or {},
		["MAGEAUGUR"]      = type(CE_MAGE_PRIEST_IMPORT)     == "function" and serial == "MAGEAUGUR" and CE_MAGE_PRIEST_IMPORT()         or {},
		["MAGEKNIGHT"]     = type(CE_MAGE_KNIGHT_IMPORT)     == "function" and serial == "MAGEKNIGHT" and CE_MAGE_KNIGHT_IMPORT()        or {},
		["MAGEDRUID"]      = type(CE_MAGE_DRUID_IMPORT)      == "function" and serial == "MAGEDRUID" and CE_MAGE_DRUID_IMPORT()          or {},
		["MAGEHARPSYN"]    = type(CE_MAGE_WARLOCK_IMPORT)    == "function" and serial == "MAGEHARPSYN" and CE_MAGE_WARLOCK_IMPORT()      or {},
		-- Scout (Ranger)
		["RANGERBARD"]      = type(CE_RANGER_BARD_IMPORT)      == "function" and serial == "RANGERBARD" and CE_RANGER_BARD_IMPORT()      or {},
	}
	CE_IMPORT_SKILLS = {}
	CE_IMPORT_SKILLS = GetSkills[serial]

	if not CE_IMPORT_SKILLS then
		print( "|cffFFFFFFCOMBAT ENGINE:|r Import skills coming soon" );
		return
	end

	PlaySoundByPath("interface\\addons\\CombatEngine\\sfx\\02.mp3");

	for i = 1, #CE_IMPORT_SKILLS do
		preset[i] = {}
		preset[i] = CE_deepCopy(CE_IMPORT_SKILLS[i])
	end

end

function CE_Import_MakeExport(Skills, iss, consumables, conditions)
	local export = {}
	for i = 1, #Skills do
		local id = Skills[i]
		local indexA, indexB, name, icon, type
		type = iss[id] and "skillplate" or consumables[id] and "item" or "skill"

		if type == "skillplate" then
			local indexISS
			for s = 0, 7 do
				local currentName, currentIcon = SkillPlateUpdate(s)
				if currentName == CE_toName(id) then
					indexISS = s
				end
			end

			if indexISS then
				local _name, _icon = SkillPlateUpdate(indexISS)
				indexA = indexISS
				indexB = 0
				name = _name
				icon = _icon
			else
				name = CE_toName(id)
				icon = GetObjectInfo(GetObjectInfo(id, "imageid"), "actfield")
			end

		elseif type == "item" then
			name = CE_toName(id)
			indexA = 99
			for i = 1, 350 do
				local index, _, n = GetBagItemInfo(i)
				if name == n then
					indexA = index
					break
				end
			end	
			indexB = 99
			icon = GetObjectInfo(GetObjectInfo(id, "imageid"), "actfield")

		elseif type == "skill" then
			local PRE_SKILL, PRE_ID_1, PRE_ID_2 = Match_CE(id)
			indexA = PRE_ID_1
			indexB = PRE_ID_2
			if PRE_ID_1 and PRE_ID_2 then
				local _name, _, _icon = GetSkillDetail(PRE_ID_1, PRE_ID_2)
				name = _name
				icon = _icon
			else
				name = CE_toName(id)
				icon = GetObjectInfo(GetObjectInfo(id, "imageid"), "actfield")
			end
		end

		export[i] = {}
		export[i].name = name
		export[i].enabled = true
		export[i].IndexA = indexA
		export[i].IndexB = indexB
		export[i].icon = icon
		-- Partir de la plantilla completa (1..CE_TOTAL_CONDITIONS) y sobrescribir solo las claves del import.
		-- Así las condiciones nuevas (p. ej. armas 58–68) quedan definidas y persisten igual que el resto.
		local mergedCond = CE_deepCopy(COMBAT_ENG_DEFAULTSKILL[1].conditions)
		if conditions and conditions[i] then
			for k, v in pairs(conditions[i]) do
				mergedCond[k] = CE_deepCopy(v)
			end
		end
		export[i].conditions = mergedCond
		export[i].type = type
		export[i].id = id

	end
	return export
end

function CE_Import_ExtractConditions()
	local serial = COMBAT_ENG_SERIAL
	local preset = COMBAT_ENGINE_CUSTOM_PRESETS[serial]
	LOCAL_EXTRACT_CONDITIONS = {}
	for i = 1, COMBAT_ENG_MAXSKILLS do
		if preset[i] and preset[i].conditions then
			LOCAL_EXTRACT_CONDITIONS[i] = CE_deepCopy(preset[i].conditions)
		end
	end
	return LOCAL_EXTRACT_CONDITIONS
end
