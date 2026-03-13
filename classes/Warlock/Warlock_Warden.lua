--Lua WARLOCK/WARRIOR BY NEORAXER 18-03-2024 
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

local juicio = true
local flag_juicio = "flag"

--Temporizador en cero
local function FLAG_JUICIO_FUNCTION()
	TimerQueue[flag_juicio] = nil
	juicio = true
end

function CE_WARLOCK_WARDEN()
	local foco = UnitMana("player");
	local mana = UnitSkill("player");
	local psi = GetSoulPoint();
	--Susurro
	local SUSU_SKILL, SUSU_ID_1, SUSU_ID_2 = Match_CE(498551);
	--Oleada de conciencia - Surge of Awareness
	local OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2 = Match_CE(498555);
	local OLE_CON_CD = CE_CD(OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2);
	--Adquisición del conocimiento
	local ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2 = Match_CE(498552);
	--Espada de fuerza de voluntad
	local ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2 = Match_CE(497955);
	local ESP_FUE_CD = CE_CD(ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2);
	--Carga combada
	local CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2 = Match_CE(497958);
	local CARG_COMB_CD = CE_CD(CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2);	
	--Maldición del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(497959);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Rugido de la bestia
	local RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2 = Match_CE(498547);
	local RUG_BES_CD = CE_CD(RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2);
	--Juicio Implacable
	local JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2 = Match_CE(1490956);
	local JUI_IMP_CD = CE_CD(JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2);
	--Golpe de recolección de corazón
	local GOL_REC_SKILL, GOL_REC_ID_1, GOL_REC_ID_2 = Match_CE(498545);
	local GOL_REC_CD = CE_CD(GOL_REC_SKILL, GOL_REC_ID_1, GOL_REC_ID_2);
	--Oleada de malicia
	local OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2 = Match_CE(497966);
	local OLE_MAL_CD = CE_CD(OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Perplejidad
	local PER_SKILL, PER_ID_1, PER_ID_2 = Match_CE(498553);
	local PER_CD = CE_CD(PER_SKILL, PER_ID_1, PER_ID_2);	
	--Conciencia cercenada
	local CON_CER_SKILL, CON_CER_ID_1, CON_CER_ID_2 = Match_CE(497962);
	local CON_CER_CD = CE_CD(CON_CER_SKILL, CON_CER_ID_1, CON_CER_ID_2);	
	--The Hex
	local THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2 = Match_CE(1492465);
	local THE_HEX_CD = CE_CD(THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2);
	-- Charged Chop
	local CHAR_SKILL, CHAR_ID_1, CHAR_ID_2 = Match_CE(1490951);
	local CHAR_CD = CE_CD(CHAR_SKILL, CHAR_ID_1, CHAR_ID_2);
	-- Dark Method
	local DARK_SKILL, DARK_ID_1, DARK_ID_2 = Match_CE(1490608);
	local DARK_CD = CE_CD(DARK_SKILL, DARK_ID_1, DARK_ID_2);
	
	----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if CE_TARGET_IS_BOSS() and psi < 2  and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then	
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500234) == false) and  CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500238) == false) and  CE_UseItem(1244063) then
		--Usar agua de los espíritus de antiguo
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and (CE_BuffIdPlayer(500112) == false) and CE_UseItem(200192) then
		end
	CE_HEALING_ITEM()
	end
	
--BUFFOS--
	--Adquisición del conocimiento
	if ADQ_CON_SKILL and (CE_BuffIdPlayer(621277) == false) then
		UseSkill(ADQ_CON_ID_1, ADQ_CON_ID_2);
	-- 6%
	elseif (CE_BuffIdPlayer(621736)==false) then 
		CastSpellByName(CE_toName(498914));
	-- %
	elseif (CE_BuffIdPlayer(1501505)==false and foco >= 15) then 
		CastSpellByName(CE_toName(1490605));
	--Susurro
	elseif SUSU_SKILL and (CE_BuffIdPlayer(1503107) == false) then
		UseSkill(SUSU_ID_1, SUSU_ID_2);
	--The Hex
	elseif _G.C_EngineSettings.FastBuffs and THE_HEX_CD <= 0.25 then
		UseSkill(THE_HEX_ID_1, THE_HEX_ID_2);	
	--Poder mental de la hormiga reina
	elseif CE_ISS_CD(CE_toName(490339)) and psi <= 1 then 
		CastSpellByName(CE_toName(490339));
	--Espada de fuerza de voluntad
	elseif ESP_FUE_SKILL and ESP_FUE_CD <= 0.45 and (CE_BuffIdPlayer(501571) == false) and psi == 6 then
		UseSkill(ESP_FUE_ID_1, ESP_FUE_ID_2);
	end
	
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		if DARK_SKILL and DARK_CD <= 0.25 and foco >= 20 then
			UseSkill(DARK_ID_1, DARK_ID_2);
		elseif OLE_CON_SKILL and OLE_CON_CD <= 0.45 and CE_isMoving() == false and foco >= 25 then
			UseSkill(OLE_CON_ID_1, OLE_CON_ID_2);
		elseif (CE_ISS_CD(CE_toName(490342)) == true) and foco >= 10 then
			CastSpellByName(CE_toName(490342));
		end	
	end
	
	--ROTACION--
	if (CE_ISS_CD(CE_toName(490342)) == true) and foco >= 10 then
		CastSpellByName(CE_toName(490342));
	--Astaroth's Dark Magic
	elseif (CE_ISS_CD(CE_toName(1490928)) == true) and psi < 2 then
		CastSpellByName(CE_toName(1490928));
	--Usar poción del enano
	elseif CE_TARGET_IS_BOSS() and (psi < 1 ) and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then
	--Warp Charge Buff
	elseif CARG_COMB_SKILL and (CARG_COMB_CD <= 0.45) and (CE_BuffIdPlayer(501575) == false) then
		UseSkill(CARG_COMB_ID_1, CARG_COMB_ID_2);
	-- Grieta espacial
	elseif foco >= 25 and CE_ISS_CD(CE_toName(490444)) and (CE_isMoving() == false) and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then 
		CastSpellByName(CE_toName(490444));
	-- Puzzlement
	elseif PER_SKILL and PER_CD <= 0.25 and (IsSpellUsable(498553)==true) then
		UseSkill(PER_ID_1, PER_ID_2);
	--Juicio Implacable
	elseif JUI_IMP_SKILL and (JUI_IMP_CD <= 0.45) and (psi >= 1) and (CE_isMoving() == false) and CE_BuffIdPlayer(501571) then
		UseSkill(JUI_IMP_ID_1, JUI_IMP_ID_2);	
	--Rugido de la bestia
	elseif RUG_BES_SKILL and RUG_BES_CD <= 0.45 and foco >= 30 and not CE_TARGET_IS_BOSS() and C_EngineSettings.AOE then
		UseSkill(RUG_BES_ID_1, RUG_BES_ID_2);
	--Maldición del tejido debilitante
	elseif MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.45 and foco >= 20 and (CE_isMoving() == false) and not CE_TARGET_IS_BOSS() and C_EngineSettings.AOE then
		UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);    	
	--Oleada de malicia
	elseif OLE_MAL_SKILL and OLE_MAL_CD <= 0.45 and not CE_TARGET_IS_BOSS() and foco >= 20 and C_EngineSettings.AOE then
		UseSkill(OLE_MAL_ID_1, OLE_MAL_ID_2);
	elseif CHAR_SKILL and CHAR_CD <= 0.45 then
		UseSkill(CHAR_ID_1, CHAR_ID_2);
	end
end 

function CE_WARLOCK_WARDEN_IMPORT()
	local Skills = { 1244064, 1244059, 1244063, 200192, 498552, 1492465, 1490928, 497955, 490342, 497958, 498544, 498914, 1490605, 1490608, 498555, 490342, 490444, 498553, 1493657, 497959, 497966, 1490951 }
	local conditions = {
		-- 1 Poción del enano 1244064
		{ [4]={ max="2", min="0", status=true }, [29]={ enable=true, status=true } },
		-- 2 Papas de col rizada 1244059
		{
			[12]={ id1="1500234", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 3 Frasco del espíritu élfico 1244063
		{
			[12]={ id1="1500238", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true } 
		},
		-- 4 Agua de los espíritus de antaño 200192
		{
			[12]={ id1="1500238", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true } 
		},
		-- 5 Adquisición del conocimiento 498552
		{
			[3]={ max="500", min="10", status=true },
			[12]={ id1="621277", id2="0", id3="0", id4="0", status=true } 
		},
		-- 6 The Hex 1492465
		{
			[12]={ id1="1503926", id2="0", id3="0", id4="0", status=true },
			[41]={ enable=true, status=true } 
		},
		-- 7 Astaroth's Dark Magic 1490928
		{ [4]={ max="2", min="0", status=true } },
		-- 8 Espada de fuerza de voluntad 497955
		{
			[4]={ max="6", min="6", status=true },
			[12]={ id1="501571", id2="0", id3="0", id4="0", status=true } 
		},
		-- 9 Curso del tormento de alma 490342
		{
			[3]={ max="500", min="10", status=true },
			[12]={ id1="624386", id2="0", id3="0", id4="0", status=true } 
		},
		-- 10 Carga combada 497958
		{
			[3]={ max="100", min="20", status=true },
			[12]={ id1="501575", id2="0", id3="0", id4="0", status=true } 
		},
		-- 11 Juicio Implacable 498544
		{
			[4]={ max="6", min="2", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true },
			[17]={ id="621199", status=true, time="10" },
			[19]={ enable=true, status=true },
			[26]={ status=true, time="1" } 
		},
		-- 12 Maldición del tejido de subliumación 498914
		{
			[3]={ max="500", min="50", status=true },
			[12]={ id1="621736", id2="0", id3="0", id4="0", status=true } 
		},
		-- 13 Maldición del tejido mejorada 1490605
		{
			[3]={ max="100", min="15", status=true },
			[12]={ id1="1501505", id2="0", id3="0", id4="0", status=true } 
		},
		-- 14 Dark Method 1490608
		{
			[3]={ max="500", min="20", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="501571", id2="0", id3="0", id4="0", status=true } 
		},
		-- 15 Oleada de conciencia 498555
		{ [3]={ max="500", min="25", status=true }, [19]={ enable=true, status=true } },
		-- 16 Curso del tormento de alma ISS 490342
		{
			[3]={ max="500", min="10", status=true },
			[12]={ id1="624386", id2="0", id3="0", id4="0", status=true } 
		},
		-- 17 Grieta espacial ISS 490444
		{ [3]={ max="500", min="15", status=true }, [19]={ enable=true, status=true } },
		-- 18 Perplejidad 498553
		{ [3]={ max="500", min="20", status=true } },
		-- 19 Rugido de la bestia 1493657
		{ [3]={ max="500", min="30", status=true }, [39]={ enable=true, status=true } },
		-- 20 Maldición del tejido debilitante 497959
		{
			[3]={ max="500", min="20", status=true },
			[19]={ enable=true, status=true },
			[33]={ id1="501577", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true } 
		},
		--Oleada de malicia 497966
		{
			[3]={ max="500", min="20", status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true } 
		},
		-- Corte cargado 1490951
		{},
	}
	local iss =  { 
		[850867] = true, 
		[850868] = true, 
		[850869] = true, 
		[850870] = true, 
		[850871] = true, 
		[850872] = true, 
		[850873] = true, 
		[850874] = true, 
		[490339] = true, 
		[490449] = true, 
		[490270] = true, 
		[490342] = true, 
		[490348] = true, 
		[490444] = true, 
		[491151] = true, 
		[497805] = true, 
		[1490928] = true, 
	};
	local consumables = {
		[1244064] = true,
		[1244059] = true,
		[1244063] = true,
		[200192] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
