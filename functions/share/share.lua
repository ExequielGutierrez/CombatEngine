
---------------Share Skills---------------
-----ENDOCE /DECODE MODE  BY NEORAXER-----
------------------------------------------
COMBAT_ENGINE_VIRTUAL_DATA = {}
COMBAT_ENGINE_RAW_DATA = {}
COMBAT_ENGINE_RAW_SKILLS = {}
COMBAT_ENGINE_DECODE_PRESET = {}
COMBAT_ENGINE_DECODE_CONDITIONS = {}
COMBAT_ENGINE_DATA_RECEIVED = ""
local MaxRawDataSupport = 469
local OutData = {
	["GM"] = 0,
	["WARRIOR"] = 1,
	["RANGER"] = 2,
	["THIEF"] = 3,
	["MAGE"] = 4,
	["AUGUR"] = 5,
	["KNIGHT"] = 6,
	["WARDEN"] = 7,
	["DRUID"] = 8,
	["HARPSYN"] = 9,
	["PSYRON"] = 10,
	["DUELIST"] = 11,
	["BARD"] = 12,
}
local InData = {
	[0] = "GM",
	[1] = "WARRIOR",
	[2] = "RANGER",
	[3] = "THIEF",
	[4] = "MAGE",
	[5] = "AUGUR",
	[6] = "KNIGHT",
	[7] = "WARDEN",
	[8] = "DRUID",
	[9] = "HARPSYN",
	[10] = "PSYRON",
	[11] = "DUELIST",
	[12] = "BARD",
}
local typeIn = {
	[1] = "skill",
	[2] = "bag",
	[3] = "skillplate",
	[4] = "equip",
	[5] = "macro",
	[6] = "item",
}
local typeOut = {
	["skill"] = 1,
	["bag"] = 2,
	["skillplate"] = 3,
	["equip"] = 4,
	["macro"] = 5,
	["item"] = 6,
}
local RequestCondition_Out = {
	["status"] = "S",
	["self"] = "F",
	["enable"] = "N",
	["max"] = "+",
	["min"] = "-",
	["stack"] = "T",
	["orMore"] = "O",
	["id"] = "Z",
	["time"] = "W",
	["id1"] = "J",
	["id2"] = "K",
	["id3"] = "L",
	["id4"] = "M",
	["name"] = "Y:",
}
local RequestCondition_In = {
	["S"] = "status",
	["F"] = "self",
	["N"] = "enable",
	["+"] = "max",
	["-"] = "min",
	["T"] = "stack",
	["O"] = "orMore",
	["Z"] = "id",
	["W"] = "time",
	["J"] = "id1",
	["K"] = "id2",
	["L"] = "id3",
	["M"] = "id4",
	["Y:"] = "name",
}
-----------------------------------------------------
------------------------SEND-------------------------
-----------------------------------------------------
StaticPopupDialogs["MAXLIMIT_COMBATENGINE"] = {
	text = "",
	button1 = TEXT("ACCEPT"),
}
StaticPopupDialogs["NOCOMBINATION_COMBATENGINE"] = {
	text = "",
	button1 = TEXT("ACCEPT"),
}
--Share link
function CombatEngine_Share( posSkill )

	--Save current preset
	CE_ConfigSkill_Save();

	--Check current class
 	local MAIN_CLASS, SEC_CLASS = UnitClassToken("player")
	if SEC_CLASS == "" then
		local message

		if GetLanguage() == "ES" then
			message = "|cff8888FFCombat Engine:|r\nSolo se pueden compartir clases combinadas (principal/secundaria)."
		else
			message = "|cff8888FFCombat Engine:|r\nOnly combined classes (main/secondary) can be shared."
		end

		StaticPopupDialogs["NOCOMBINATION_COMBATENGINE"].text = message
		StaticPopup_Show("NOCOMBINATION_COMBATENGINE")
		return
	end

	--Create encoded link
	local encodeData = CombatEngine_EncodePreset( posSkill );
	COMBAT_ENGINE_RAW_DATA = encodeData
	local link = CreateHyperlink("CE", encodeData, "C. Engine: " .. "Skill " .. posSkill, "CC22FF");
	
	if #COMBAT_ENGINE_RAW_DATA >= MaxRawDataSupport then
		local message

		if GetLanguage() == "ES" then
			message = "|cff8888FFCombat Engine:|r\nHas excedido el numero de datos posibles para enviar, por favor elimina condiciones de la habilidad para reducir el tamaño de los datos"
		else
			message = "|cff8888FFCombat Engine:|r\nHas exceeded the maximum number of data entries that can be sent. Please remove conditions from the skill to reduce the data size."
		end

		StaticPopupDialogs["MAXLIMIT_COMBATENGINE"].text = message
		StaticPopup_Show("MAXLIMIT_COMBATENGINE")
		return
	end	
	
	if (ChatEdit_AddItemLink(link)) then
		return
	end
	SELECTED_CHAT_FRAME:AddMessage(link)
end
-- Encode raw Data
function CombatEngine_EncodePreset(posSkill)
	local MAIN_CLASS, SEC_CLASS = UnitClassToken("player")
	local index = MAIN_CLASS .. SEC_CLASS
	local preset = COMBAT_ENGINE_CUSTOM_PRESETS[index][posSkill]
	local outIndex = "x" .. OutData[MAIN_CLASS] .. "-" .. OutData[SEC_CLASS] .. "x"
	local key = ""

	local Enabled = preset and preset.enabled and 1 or 0
	local Type = preset and typeOut[preset.type] or ""
	local IndexA = Type and Type ~= 6 and preset and preset.IndexA or 0
	local IndexB = Type and Type ~= 6 and preset and preset.IndexB or 0

	local Name = 0
	local ID
	if Type and Type == 1 then
		local name, _, icon, type, level, _, _, _, _, _, id = GetSkillDetail( IndexA, IndexB )
		ID = id		
	else
		ID = preset and preset.id or 0
	end
	
	local Icon = 0
	local groupCond = ""
	if preset and preset.conditions then
		for numberCond, content in pairs(preset.conditions) do
			local conditionsStr = ""
			for name, value in pairs(content) do
				local encodeCondition = CombatEngine_EncodeConditions(numberCond, name, value)
				if name ~= "status" then
					if conditionsStr == "" then
						conditionsStr = encodeCondition
					else
						conditionsStr = conditionsStr .. "," .. encodeCondition
					end
				end
			end

			if groupCond == "" then
				if conditionsStr == "N" then
					groupCond = "c" .. numberCond
				else
					groupCond = "c" .. numberCond .. "[" .. conditionsStr .. "]"
				end
			else
				if conditionsStr == "N" then
					groupCond = groupCond .. "c" .. numberCond
				else
					groupCond = groupCond .. "c" .. numberCond .. "[" .. conditionsStr .. "]"
				end
			end
		end
	end

	key = key .. "[".. posSkill .. "]" .. "e" .. Enabled .. "t" .. Type .. "i" .. ID .. "A" .. IndexA .. "B" .. IndexB .. "{" .. groupCond .. "}"

	return outIndex .. key
end
-- Encode conditions
function CombatEngine_EncodeConditions(index, name, value)
	local key
	local shortName = RequestCondition_Out[name] or name
	if type(value) == "boolean" then
		local bin = value and 1 or 0
		key = shortName .. bin
	else
		key = shortName .. value
	end

	if key == "+0" then
		key = "+"
	elseif key == "-0" then
		key = "-"
	elseif key == "N1" then
		key = "N"
	elseif key == "S1" then
		key = ""
	end

	return key
end
-----------------------------------------------------
-----------------------Receive-----------------------
-----------------------------------------------------

StaticPopupDialogs["INVALID_DATA_COMBATENGINE"] = {
	text = "",
	button1 = TEXT("ACCEPT"),
}

-- Decode conditions
function CombatEngine_DecodeConditions()
	local _, _Data = ParseHyperlink(COMBAT_ENGINE_DATA_RECEIVED)

	local conditions = {}

	local conditionBlock = string.match(_Data, "{(.*)}")
	if not conditionBlock then
		return conditions
	end

	local clavesBooleanas = {
		["self"] = true,
		["orMore"] = true,
		["enable"] = true,
	}

	local tabla = {}

	local function procesarValor(valor)
		if valor == "+" or valor == "-" then
			return 0
		else
			local numeroStr = valor:gsub("[+-]", "")
			local numero = tonumber(numeroStr)
			return numero or valor
		end
	end

	local function procesarValoresConPrefijo(valores)
		local resultado = {}
		for _, valor in ipairs(valores) do
			if valor:sub(1, 1) == "+" then
				resultado["max"] = valor:sub(2) == "" and "0" or tostring(valor:sub(2))
			elseif valor:sub(1, 1) == "-" then
				resultado["min"] = valor:sub(2) == "" and "0" or tostring(valor:sub(2))
			else
				table.insert(resultado, procesarValor(valor))
			end
		end
		return resultado
	end

	local function procesarValores(valores)
		local resultado = {}
		for _, valor in ipairs(valores) do
			local procesado = procesarValor(valor)
			if type(procesado) == "string" then
				for prefijo, clave in pairs(RequestCondition_In) do
					if valor:sub(1, #prefijo) == prefijo then
						local numero = tonumber(valor:sub(#prefijo + 1))
						if numero then
							if clavesBooleanas[clave] then
								resultado[clave] = (numero == 1)
							else
								resultado[clave] = tostring(numero)
							end
						end
						break
					end
				end
			else
				table.insert(resultado, procesado)
			end
		end
		if #resultado >= 2 and type(resultado[1]) == "number" and type(resultado[2]) == "number" then
			if resultado[1] > resultado[2] then
				resultado[1], resultado[2] = resultado[2], resultado[1]
			end
		end
		return resultado
	end

	for c, contenido in conditionBlock:gmatch("(c%d+)(%b[])") do
		local claveNumerica = tonumber(c:sub(2))
		local valores = {}
		for valor in contenido:sub(2, -2):gmatch("[^,]+") do
			table.insert(valores, valor)
		end
		if #valores >= 2 then
			if valores[1]:match("[+-]") or valores[2]:match("[+-]") then
				tabla[claveNumerica] = procesarValoresConPrefijo(valores)
			else
				tabla[claveNumerica] = procesarValores(valores)
			end
		else
			if #valores == 1 and valores[1]:sub(1, 1) == "W" then
				tabla[claveNumerica] = { time = tostring(valores[1]:sub(2)), status = true }
			else
				tabla[claveNumerica] = { enable = true, status = true }
			end
		end
		if type(tabla[claveNumerica]) == "table" then
			tabla[claveNumerica]["status"] = true
		end
	end

	for c in conditionBlock:gmatch("(c%d+)%f[%D]") do
		local claveNumerica = tonumber(c:sub(2))
		if not tabla[claveNumerica] then
			tabla[claveNumerica] = { enable = true, status = true }
		end
	end

	for c, contenido in conditionBlock:gmatch("(c31)(%b[])") do
		local claveNumerica = tonumber(c:sub(2))
		local valores = {}
		for valor in contenido:sub(2, -2):gmatch("[^,]+") do
			table.insert(valores, valor)
		end
		if #valores == 1 and valores[1]:sub(1, 2) == "Y:" then
			tabla[claveNumerica] = { ["name"] = valores[1]:sub(3), status = true }
		end
	end

	for c, contenido in conditionBlock:gmatch("(c%d+)(%b[])") do
		local claveNumerica = tonumber(c:sub(2))
		local valores = {}
		for valor in contenido:sub(2, -2):gmatch("[^,]+") do
			table.insert(valores, valor)
		end
		if #valores == 1 and valores[1]:sub(1, 1) == "W" then
			tabla[claveNumerica] = { time = tostring(valores[1]:sub(2)), status = true }
		end
	end

	return tabla
end
--DECODE raw Data
function CombatEngine_DecodePreset(encodedData)
	local decodedPreset = {}
	local length = 0
	local main, sec = string.match(encodedData, "x(%d+)-(%d+)x")
	main = tonumber(main)
	sec = sec and sec ~= "" and tonumber(sec) or ""
	local key = InData[main] .. InData[sec]

	local skills = {}

	for skillPos, E, skillType, skillID, A, B in string.gmatch(encodedData, "%[(%d+)%]e(%d+)t(%d+)i(%d+)A(%d+)B(%d+)") do
		length = length + 1
		skillPos = tonumber(skillPos)
		skillType = tonumber(skillType)
		skillID = tonumber(skillID)
		A = tonumber(A)
		B = tonumber(B)
		E = tonumber(E)

		skills[skillPos] = {}
		skills[skillPos].skillPos = skillPos
		skills[skillPos].Type = skillType
		skills[skillPos].ID = skillID
		skills[skillPos].E = E
		skills[skillPos].A = A
		skills[skillPos].B = B
		skills[skillPos].conditions = {}
	end

	COMBAT_ENGINE_RAW_SKILLS = skills

	if length > 0 then
		decodedPreset[key] = skills
	end

	return decodedPreset
end
--Create skill Data
function CombatEngine_DecodeFinal()
	local _, _Data = ParseHyperlink(COMBAT_ENGINE_DATA_RECEIVED)
	local data = CombatEngine_DecodePreset(_Data)
	COMBAT_ENGINE_VIRTUAL_DATA = data

	local class
	local index
	for key, value in pairs(data) do
		class = key
		break
	end
	--nota: index representa el numero de la habilidad en la lista
	if data[class] then
		for i, _ in pairs(data[class]) do
			index = i
			break
		end

		local pos = data[class][index].skillPos
		COMBAT_ENGINE_DECODE_PRESET[class] = {}
		COMBAT_ENGINE_DECODE_PRESET[class][pos] = {}
		COMBAT_ENGINE_DECODE_PRESET[class][pos].enabled = data[class][index].E == 1 and true or false
		COMBAT_ENGINE_DECODE_PRESET[class][pos].type = typeIn[data[class][index].Type]
		local realID = COMBAT_ENGINE_RAW_SKILLS[index].ID
		if typeIn[data[class][index].Type] == "skill" then
			local learn, realIndexA, realIndexB = Match_CE(realID)
			if not realIndexA or not realIndexB then
				COMBAT_ENGINE_DECODE_PRESET[class][pos].id = data[class][index].ID
				COMBAT_ENGINE_DECODE_PRESET[class][pos].name = TEXT("Sys" .. data[class][index].ID .. "_name")
				COMBAT_ENGINE_DECODE_PRESET[class][pos].icon = GetObjectInfo(GetObjectInfo(data[class][index].ID, "imageid"), "actfield")
				COMBAT_ENGINE_DECODE_PRESET[class][pos].IndexA = data[class][index].A
				COMBAT_ENGINE_DECODE_PRESET[class][pos].IndexB = data[class][index].B	
			else
				local name, _, icon, type, level, _, _, _, _, _, id = GetSkillDetail(realIndexA, realIndexB);
				COMBAT_ENGINE_DECODE_PRESET[class][pos].id = id
				COMBAT_ENGINE_DECODE_PRESET[class][pos].name = name
				COMBAT_ENGINE_DECODE_PRESET[class][pos].icon = icon
				COMBAT_ENGINE_DECODE_PRESET[class][pos].IndexA = realIndexA
				COMBAT_ENGINE_DECODE_PRESET[class][pos].IndexB = realIndexB
			end
		else
			COMBAT_ENGINE_DECODE_PRESET[class][pos].id = data[class][index].ID
			COMBAT_ENGINE_DECODE_PRESET[class][pos].name = TEXT("Sys" .. data[class][index].ID .. "_name")
			COMBAT_ENGINE_DECODE_PRESET[class][pos].icon = GetObjectInfo(GetObjectInfo(data[class][index].ID, "imageid"), "actfield")
			COMBAT_ENGINE_DECODE_PRESET[class][pos].IndexA = data[class][index].A
			COMBAT_ENGINE_DECODE_PRESET[class][pos].IndexB = data[class][index].B
		end
		COMBAT_ENGINE_DECODE_PRESET[class][pos].conditions = {}
		--Request conditions
		COMBAT_ENGINE_DECODE_CONDITIONS = CombatEngine_DecodeConditions(_Data)

		--Data ready
		local className = class
		local skillPos = pos
		local skillConditions = COMBAT_ENGINE_DECODE_CONDITIONS
		local infoSkill = COMBAT_ENGINE_DECODE_PRESET[class][pos]
		CombatEngine_CopySkill( className, skillPos, skillConditions, infoSkill )
	else
		local message
		if GetLanguage() == "ES" then
			message = "|cff8888FFCombat Engine:|r\n Datos incorrectos..."
		else
			message = "|cff8888FFCombat Engine:|r\n Incorrect data..."
		end
		StaticPopupDialogs["INVALID_DATA_COMBATENGINE"].text = message
		StaticPopup_Show("INVALID_DATA_COMBATENGINE")
	end
end
-----------------------------------------------------
-----------------------Overwrite---------------------
-----------------------------------------------------
StaticPopupDialogs["SUCCESSFUL_COMBATENGINE"] = {
	text = "",
	button1 = TEXT("ACCEPT"),
}
--Copy skill
function CombatEngine_CopySkill( className, skillPos, skillConditions, infoSkill )
	--Close Engine
	if COMBATENGINE_EDIT_LUA:IsVisible() then
		COMBATENGINE_EDIT_LUA:Hide()
	end
	--Create preset
	if not COMBAT_ENGINE_CUSTOM_PRESETS[className] then
		COMBAT_ENGINE_CUSTOM_PRESETS[className] = {}
	end
	--Create posSkill
	if not COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos] then
		COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos] = {}
	end	
	--Fill values
	COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos].enabled = infoSkill.enabled
	COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos].type = infoSkill.type
	COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos].name = infoSkill.name
	COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos].id = infoSkill.id
	COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos].IndexA = infoSkill.IndexA
	COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos].IndexB = infoSkill.IndexB

	COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos].icon = infoSkill.icon
	COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos].conditions = {}	
	COMBAT_ENGINE_CUSTOM_PRESETS[className][skillPos].conditions = CE_deepCopy(skillConditions)

	--Save
	CombatEnigne_Patch();
	CE_ConfigSkill_Save();
	--successful
	local message
	if GetLanguage() == "ES" then
		message = "|cff8888FFCombat Engine:|r\n Guardado!"
	else
		message = "|cff8888FFCombat Engine:|r\n Successful!"
	end
	StaticPopupDialogs["SUCCESSFUL_COMBATENGINE"].text = message
	StaticPopup_Show("SUCCESSFUL_COMBATENGINE");
end
-----------------------------------------------------
---------------------Read Hyperlink------------------
-----------------------------------------------------
StaticPopupDialogs["NEWSKILL_COMBATENGINE"] = {
	text = "",
	button1 = TEXT("ACCEPT"),
	button2 = TEXT("CANCEL"),
	OnAccept = function()
		local _type, _data, _name = ParseHyperlink(COMBAT_ENGINE_DATA_RECEIVED);		
		if CombatEngine_CheckClass(_data) then
			CombatEngine_DecodeFinal();
		end
	end,
}

local org_Hyperlink_Assign = Hyperlink_Assign
Hyperlink_Assign =
function(link, key)
	org_Hyperlink_Assign(link, key)
	local _type, _data, _name = ParseHyperlink(link);
	if _type == "CE" then
		COMBAT_ENGINE_DATA_RECEIVED = link
		CombatEngine_SendMessage(_data);
	end
end

StaticPopupDialogs["CLASSNOTMATCH_COMBATENGINE"] = {
	text = "",
	button1 = TEXT("ACCEPT"),
}

function CombatEngine_CheckClass(_data)
local ClassTokenByID = 
{
	[0] = "GM",
	[1] = "WARRIOR",
	[2] = "RANGER",
	[3] = "THIEF",
	[4] = "MAGE",
	[5] = "AUGUR",
	[6] = "KNIGHT",
	[7] = "WARDEN",
	[8] = "DRUID",
	[9] = "HARPSYN",
	[10] = "PSYRON",
	[11] = "DUELIST",
	[12] = "BARD",
}
	local warningEn = "|cff8888FFCombat Engine:|r\nYour class does not match.\nTo use this option, you must change your class to %s/%s."
	local warningEs = "|cff8888FFCombat Engine:|r\nTu clase no coincide.\nPara usar esta opción debes cambiar tu clase a %s/%s."
	local main, sec = string.match(_data, "x(%d+)-(%d+)x")
	local A = tonumber(main)
	local B = tonumber(sec)
	local class = ClassTokenByID[A] .. ClassTokenByID[B] 
	local mainName = "|c" .. GetClassColorByIndex(main) .. GetClassInfoByID(main) .. "|r";
	local secName = "|c" .. GetClassColorByIndex(sec) .. GetClassInfoByID(sec) .. "|r";
	if class == COMBAT_ENG_SERIAL then
		return true
	else
		local message
		if GetLanguage() == "ES" then
			message = string.format(warningEs, mainName, secName)
		else
			message = string.format(warningEn, mainName, secName)
		end
		StaticPopupDialogs["CLASSNOTMATCH_COMBATENGINE"].text = message
		StaticPopup_Show("CLASSNOTMATCH_COMBATENGINE")
		return false
	end	
end

function CombatEngine_SendMessage(_data)
	local warningEn = "|cff8888FFCombat Engine:|r\nNew skill for %s/%s, in |cffFFFF00position %d|r.\n Overwrite the current configuration?"
	local warningEs = "|cff8888FFCombat Engine:|r\nNueva habilidad para %s/%s, en la |cffFFFF00posición %d|r.\n¿Sobrescribir la configuración actual?"

	local main, sec = string.match(_data, "x(%d+)-(%d+)x")
	local mainName = "|c" .. GetClassColorByIndex(main) .. GetClassInfoByID(main) .. "|r";
	local secName = "|c" .. GetClassColorByIndex(sec) .. GetClassInfoByID(sec) .. "|r";
	local pos

	for skillPos in string.gmatch(_data, "%[(%d+)%]") do
		pos = skillPos
		break
	end

	local message
	if GetLanguage() == "ES" then
		message = string.format(warningEs, mainName, secName, pos)
	else
		message = string.format(warningEn, mainName, secName, pos)
	end

	StaticPopupDialogs["NEWSKILL_COMBATENGINE"].text = message
	StaticPopup_Show("NEWSKILL_COMBATENGINE")
end