CE_IMPORT_SKILLS = {}
LOCAL_EXTRACT_CONDITIONS = {}

CE_IMPORT_AUTHORS = {
	["HARPSYNBARD"]   = "Riechan",
	["HARPSYNMAGE"]   = "Riechan",
	["HARPSYNRANGER"] = "Riechan",
	["MAGETHIEF"]     = "Riechan",
	["MAGEDRUID"]     = "Riechan",
	["RANGERDRUID"]   = "Riechan",
	["BARDHARPSYN"]   = "Riechan",
}

-- Línea verde con el autor del preset base (solo combinaciones con autor registrado)
function CE_Import_AuthorTooltip()
	local author = CE_IMPORT_AUTHORS[COMBAT_ENG_SERIAL_RAW or ""]
	if author then
		GameTooltip:AddLine( "|cff00ff00" .. CE_LANG.Tooltip.PresetBy .. author .. "|r" );
	end
end

function CE_ExecuteImport()
	local serial = COMBAT_ENG_SERIAL
	local preset = COMBAT_ENGINE_CUSTOM_PRESETS[serial]
	if preset then
		for skill = 1, COMBAT_ENG_MAXSKILLS do
			preset[skill] = CE_deepCopy(COMBAT_ENG_DEFAULTSKILL[1])
		end
	end

	-- El import se elige por clase (sin sufijo de preset); se escribe sobre el preset activo
	CE_SET_IMPORT_SKILL(COMBAT_ENG_SERIAL_RAW or serial, preset)
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
		["HARPSYNAUGUR"]   = type(CE_WARLOCK_PRIEST_IMPORT)  == "function" and serial == "HARPSYNAUGUR" and CE_WARLOCK_PRIEST_IMPORT()    or {},
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
		["MAGEBARD"]       = type(CE_MAGE_BARD_IMPORT)       == "function" and serial == "MAGEBARD" and CE_MAGE_BARD_IMPORT()            or {},
		-- Scout (Ranger)
		["RANGERBARD"]     = type(CE_RANGER_BARD_IMPORT)     == "function" and serial == "RANGERBARD" and CE_RANGER_BARD_IMPORT()        or {},
		["RANGERPSYRON"]   = type(CE_RANGER_PSYRON_IMPORT)   == "function" and serial == "RANGERPSYRON" and CE_RANGER_PSYRON_IMPORT()    or {},
		["RANGERDRUID"]    = type(CE_RANGER_DRUID_IMPORT)    == "function" and serial == "RANGERDRUID" and CE_RANGER_DRUID_IMPORT()      or {},
		["RANGERKNIGHT"]   = type(CE_RANGER_KNIGHT_IMPORT)   == "function" and serial == "RANGERKNIGHT" and CE_RANGER_KNIGHT_IMPORT()    or {},
		["RANGERMAGE"]     = type(CE_RANGER_MAGE_IMPORT)     == "function" and serial == "RANGERMAGE" and CE_RANGER_MAGE_IMPORT()        or {},
		["RANGERAUGUR"]    = type(CE_RANGER_AUGUR_IMPORT)    == "function" and serial == "RANGERAUGUR" and CE_RANGER_AUGUR_IMPORT()      or {},
		["RANGERTHIEF"]    = type(CE_RANGER_THIEF_IMPORT)    == "function" and serial == "RANGERTHIEF" and CE_RANGER_THIEF_IMPORT()      or {},
		["RANGERWARDEN"]   = type(CE_RANGER_WARDEN_IMPORT)   == "function" and serial == "RANGERWARDEN" and CE_RANGER_WARDEN_IMPORT()    or {},
		["RANGERHARPSYN"]  = type(CE_RANGER_WARLOCK_IMPORT)  == "function" and serial == "RANGERHARPSYN" and CE_RANGER_WARLOCK_IMPORT()   or {},
		["RANGERWARRIOR"]  = type(CE_RANGER_WARRIOR_IMPORT)  == "function" and serial == "RANGERWARRIOR" and CE_RANGER_WARRIOR_IMPORT()   or {},
		-- Caballero (Knight)
		["KNIGHTDRUID"]    = type(CE_KNIGHT_DRUID_IMPORT)    == "function" and serial == "KNIGHTDRUID" and CE_KNIGHT_DRUID_IMPORT()      or {},
		["KNIGHTAUGUR"]    = type(CE_KNIGHT_AUGUR_IMPORT)    == "function" and serial == "KNIGHTAUGUR" and CE_KNIGHT_AUGUR_IMPORT()      or {},
		["KNIGHTWARDEN"]   = type(CE_KNIGHT_WARDEN_IMPORT)   == "function" and serial == "KNIGHTWARDEN" and CE_KNIGHT_WARDEN_IMPORT()    or {},
		["KNIGHTHARPSYN"]  = type(CE_KNIGHT_WARLOCK_IMPORT)  == "function" and serial == "KNIGHTHARPSYN" and CE_KNIGHT_WARLOCK_IMPORT()  or {},
		-- Bardo (Bard)
		["BARDPSYRON"]     = type(CE_BARD_CHAMPION_IMPORT)   == "function" and serial == "BARDPSYRON" and CE_BARD_CHAMPION_IMPORT()      or {},
		["BARDDRUID"]      = type(CE_BARD_DRUID_IMPORT)      == "function" and serial == "BARDDRUID" and CE_BARD_DRUID_IMPORT()          or {},
		["BARDMAGE"]       = type(CE_BARD_MAGE_IMPORT)       == "function" and serial == "BARDMAGE" and CE_BARD_MAGE_IMPORT()            or {},
		["BARDTHIEF"]      = type(CE_BARD_ROGUE_IMPORT)      == "function" and serial == "BARDTHIEF" and CE_BARD_ROGUE_IMPORT()          or {},
		["BARDRANGER"]     = type(CE_BARD_SCOUT_IMPORT)      == "function" and serial == "BARDRANGER" and CE_BARD_SCOUT_IMPORT()         or {},
		["BARDWARDEN"]     = type(CE_BARD_WARDEN_IMPORT)     == "function" and serial == "BARDWARDEN" and CE_BARD_WARDEN_IMPORT()        or {},
		["BARDHARPSYN"]    = type(CE_BARD_WARLOCK_IMPORT)    == "function" and serial == "BARDHARPSYN" and CE_BARD_WARLOCK_IMPORT()      or {},
		["BARDWARRIOR"]    = type(CE_BARD_WARRIOR_IMPORT)    == "function" and serial == "BARDWARRIOR" and CE_BARD_WARRIOR_IMPORT()      or {},
		-- Druida (Druid)
		["DRUIDHARPSYN"]   = type(CE_DRUID_WARLOCK_IMPORT)   == "function" and serial == "DRUIDHARPSYN" and CE_DRUID_WARLOCK_IMPORT()    or {},
		["DRUIDWARRIOR"]   = type(CE_DRUID_WARRIOR_IMPORT)   == "function" and serial == "DRUIDWARRIOR" and CE_DRUID_WARRIOR_IMPORT()    or {},
		["DRUIDAUGUR"]     = type(CE_DRUID_PRIEST_IMPORT)    == "function" and serial == "DRUIDAUGUR" and CE_DRUID_PRIEST_IMPORT()        or {},
		-- Sacerdote (Priest)
		["AUGURWARRIOR"]   = type(CE_PRIEST_WARRIOR_IMPORT)  == "function" and serial == "AUGURWARRIOR" and CE_PRIEST_WARRIOR_IMPORT()   or {},
		-- Alcaide (Warden)
		["WARDENPSYRON"]   = type(CE_WARDEN_CHAMPION_IMPORT) == "function" and serial == "WARDENPSYRON" and CE_WARDEN_CHAMPION_IMPORT() or {},
		["WARDENMAGE"]     = type(CE_WARDEN_MAGE_IMPORT)     == "function" and serial == "WARDENMAGE" and CE_WARDEN_MAGE_IMPORT()        or {},
		["WARDENRANGER"]   = type(CE_WARDEN_SCOUT_IMPORT)    == "function" and serial == "WARDENRANGER" and CE_WARDEN_SCOUT_IMPORT()     or {},
		-- Guerrero (Warrior)
		["WARRIORBARD"]    = type(CE_WARRIOR_BARD_IMPORT)    == "function" and serial == "WARRIORBARD" and CE_WARRIOR_BARD_IMPORT()      or {},
		["WARRIORMAGE"]    = type(CE_WARRIOR_MAGE_IMPORT)    == "function" and serial == "WARRIORMAGE" and CE_WARRIOR_MAGE_IMPORT()      or {},
		["WARRIORAUGUR"]   = type(CE_WARRIOR_PRIEST_IMPORT)  == "function" and serial == "WARRIORAUGUR" and CE_WARRIOR_PRIEST_IMPORT()   or {},
		["WARRIORTHIEF"]   = type(CE_WARRIOR_ROGUE_IMPORT)   == "function" and serial == "WARRIORTHIEF" and CE_WARRIOR_ROGUE_IMPORT()    or {},
		["WARRIORRANGER"]  = type(CE_WARRIOR_SCOUT_IMPORT)   == "function" and serial == "WARRIORRANGER" and CE_WARRIOR_SCOUT_IMPORT()   or {},
		["WARRIORWARDEN"]  = type(CE_WARRIOR_WARDEN_IMPORT)  == "function" and serial == "WARRIORWARDEN" and CE_WARRIOR_WARDEN_IMPORT()  or {},
		["WARRIORHARPSYN"] = type(CE_WARRIOR_WARLOCK_IMPORT) == "function" and serial == "WARRIORHARPSYN" and CE_WARRIOR_WARLOCK_IMPORT() or {},
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

function CE_Import_MakeExport(Skills, iss, consumables, conditions, equips, disabled)
	local export = {}
	for i = 1, #Skills do
		local id = Skills[i]
		local indexA, indexB, name, icon, type
		type = iss[id] and "skillplate" or consumables[id] and "item" or (equips and equips[id]) and "equip" or "skill"

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

		elseif type == "equip" then
			name = CE_toName(id)
			indexA = equips[id]
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
		export[i].enabled = not (disabled and disabled[i])
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
