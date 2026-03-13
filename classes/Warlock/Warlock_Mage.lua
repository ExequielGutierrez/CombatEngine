--Lua WARLOCK/MAGE BY NEORAXER 18-03-2024 
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

local juicio = true
local flag_juicio = "flag"

--Temporizador en cero
local function FLAG_JUICIO_FUNCTION()
	--DEFAULT_CHAT_FRAME:AddMessage("Slide_1");
	TimerQueue[flag_juicio] = nil
	juicio = true
end

function CE_WARLOCK_MAGE()
	--DEFAULT_CHAT_FRAME:AddMessage("Usando BRUJO/PICA")
	local foco = UnitMana("player");
	local mana = UnitSkill("player");
	local psi = GetSoulPoint();

	--Maldición del tejido de subliumación
	local MALD_TEJ_SKILL, MALD_TEJ_ID_1, MALD_TEJ_ID_2 = Match_CE(498914);
	--Susurro
	local SUSU_SKILL, SUSU_ID_1, SUSU_ID_2 = Match_CE(498551);
	--Extracción de percepción
	local EXT_PER_SKILL, EXT_PER_ID_1, EXT_PER_ID_2 = Match_CE(497960);
	--Aumento de la concentración
	local AUM_CON_SKILL, AUM_CON_ID_1, AUM_CON_ID_2 = Match_CE(498703);
	--Adquisición del conocimiento
	local ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2 = Match_CE(498552);
	--Sobrecarga de pensamiento
	local SOB_PEN_SKILL, SOB_PEN_ID_1, SOB_PEN_ID_2 = Match_CE(498711);
	local SOB_PEN_CD = CE_CD(SOB_PEN_SKILL, SOB_PEN_ID_1, SOB_PEN_ID_2);
	--Espada de fuerza de voluntad
	local ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2 = Match_CE(497955);
	local ESP_FUE_CD = CE_CD(ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2);
	--Carga combada
	local CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2 = Match_CE(498701);
	local CARG_COMB_CD = CE_CD(CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2);
	--Maldición del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(497959);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Juicio Implacable
	local JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2 = Match_CE(498544);
	local JUI_IMP_CD = CE_CD(JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2);
	--Rugido de la bestia
	local RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2 = Match_CE(498547);
	local RUG_BES_CD = CE_CD(RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2);
	--Oleada de malicia
	local OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2 = Match_CE(497966);
	local OLE_MAL_CD = CE_CD(OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Pinchazo de marca del alma
	local PIN_MAR_SKILL, PIN_MAR_ID_1, PIN_MAR_ID_2 = Match_CE(498710);
	local PIN_MAR_CD = CE_CD(PIN_MAR_SKILL, PIN_MAR_ID_1, PIN_MAR_ID_2);
	--Golpe de corazón llameante
	local GOL_COR_SKILL, GOL_COR_ID_1, GOL_COR_ID_2 = Match_CE(498697);
	local GOL_COR_CD = CE_CD(GOL_COR_SKILL, GOL_COR_ID_1, GOL_COR_ID_2);
	--The Hex
	local THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2 = Match_CE(1492465);
	local THE_HEX_CD = CE_CD(THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2);

	----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if (foco <= 20 or psi <= 2 ) and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los espíritus de antaño
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		end
	CE_HEALING_ITEM()
	end

	--ROTACION--
	--Sobrecarga de pensamiento
	if SOB_PEN_SKILL and SOB_PEN_CD <= 0.25 and _G.C_EngineSettings.FastBuffs then
		UseSkill(SOB_PEN_ID_1, SOB_PEN_ID_2);
	--The Hex
	elseif _G.C_EngineSettings.FastBuffs and THE_HEX_CD <= 0.25 then
		UseSkill(THE_HEX_ID_1, THE_HEX_ID_2);
	--Maldición del tejido de subliumación
	elseif MALD_TEJ_SKILL and (CE_BuffIdPlayer(621736) == false) and foco >= 50 then
		UseSkill(MALD_TEJ_ID_1, MALD_TEJ_ID_2);
	--Susurro
	elseif SUSU_SKILL and (CE_BuffIdPlayer(1503107) == false) then
		UseSkill(SUSU_ID_1, SUSU_ID_2);
	--Extracción de percepción
	elseif EXT_PER_SKILL and (CE_BuffIdPlayer(621655) == false) then
		UseSkill(EXT_PER_ID_1, EXT_PER_ID_2);
	--Adquisición de conocimiento
	elseif ADQ_CON_SKILL and (CE_BuffIdPlayer(621277) == false) then
		UseSkill(ADQ_CON_ID_1, ADQ_CON_ID_2);
	--Aumento de la concentración
	elseif AUM_CON_SKILL and (CE_BuffIdPlayer(621444) == false) then
		UseSkill(AUM_CON_ID_1, AUM_CON_ID_2);
	--Espada de fuerza de voluntad
	elseif ESP_FUE_SKILL and ESP_FUE_CD <= 0.25 and (CE_BuffIdPlayer(501571) == false) and psi == 6 then
		UseSkill(ESP_FUE_ID_1, ESP_FUE_ID_2);
	--Carga combada
	elseif CARG_COMB_SKILL and (CARG_COMB_CD <= 0.25) and ((CE_BuffIdPlayer(501575) == false) or CE_BuffTimeLeftById(501575)) then
		UseSkill(CARG_COMB_ID_1, CARG_COMB_ID_2)
	--Curso del tormento de alma
	elseif (CE_ISS_CD(CE_toName(490342)) == true) and foco >= 10 then
		CastSpellByName(CE_toName(490342));
	--Hormiga reina
	elseif (CE_ISS_CD(CE_toName(490339)) == true) and psi < 6 then
		CastSpellByName(CE_toName(490339));
	-- Maldición del tejido debilitado
	elseif MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.25 and (CE_DebuffIdTarget(501577) == false) and foco >= 20 and (CE_isMoving()  == false) and _G.C_EngineSettings.AOE then
		UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Juicio Implacable
	elseif CE_AFE(621199, 11) then
		if (CE_READ_BUFF_FAST(621199) == false) and JUI_IMP_SKILL and JUI_IMP_CD <= 0.45 and psi >= 1 and CE_isMoving()  == false and CE_BuffIdPlayer(501571) and juicio and not TimerQueue[flag_juicio] then
			UseSkill(JUI_IMP_ID_1, JUI_IMP_ID_2);
			TimerQueue[flag_juicio] = { GetTime() + 2.5, FLAG_JUICIO_FUNCTION }
			juicio = false
		end
	-- Rugido de la bestia
	elseif RUG_BES_SKILL and RUG_BES_CD <= 0.25 and (CE_BuffIdPlayer(621268) == false) and foco >= 30 and _G.C_EngineSettings.AOE then
		UseSkill(RUG_BES_ID_1, RUG_BES_ID_2);
	--Oleada de malicia
	elseif OLE_MAL_SKILL and OLE_MAL_CD <= 0.25 and foco >= 20 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
		UseSkill(OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Pinchazo de marca del alma
	elseif PIN_MAR_SKILL and PIN_MAR_CD <= 0.25 and CE_DebuffIdTarget(501577) and GOL_COR_CD > 0 and psi >= 2 and CE_BuffIdPlayer(501571) then
		UseSkill(PIN_MAR_ID_1, PIN_MAR_ID_2);
	--Golpe de corazón llameante
	elseif GOL_COR_SKILL and GOL_COR_CD <= 0.25 and mana > 1500 then
		UseSkill(GOL_COR_ID_1, GOL_COR_ID_2);
	end
end

function CE_WARLOCK_MAGE_IMPORT()
	local Skills = { 1244064, 1244059, 1244063, 200192, 498552, 1492465, 1490928, 497955, 490342, 498544, 497805, 490339, 498711, 498914, 498551, 497960, 498703, 498701, 497959, 498547, 497966, 498710, 498697 }
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
		-- 7 Astaroth's Dark Magic 149092
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
		-- 10 Juicio Implacable 498544
		{
			[4]={ max="6", min="2", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true },
			[17]={ id="621199", status=true, time="10" },
			[19]={ enable=true, status=true },
			[26]={ status=true, time="1" }
		},
		-- 11 Destructor de almas 497805
		{
			[3]={ max="100", min="20", status=true },
			[12]={ id1="501920", id2="0", id3="0", id4="0", status=true }
		},
		-- 12 Ant Queen 490339
		{
			[4]={ max="3", min="0", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true }
		},
		-- 13 Sobrecarga de pensamiento 498711
		{ [41]={ enable=true, status=true } },
		-- 14 Maldición del tejido de subliumación 498914
		{
			[3]={ max="500", min="50", status=true },
			[12]={ id1="621736", id2="0", id3="0", id4="0", status=true }
		},
		-- 15 Susurro 498551
		{ [12]={ id1="1503107", id2="0", id3="0", id4="0", status=true } },
		-- 16 Extracción de percepción 497960
		{ [12]={ id1="621655", id2="0", id3="0", id4="0", status=true } },
		-- 17 Aumento de la concentración 498703
		{ [12]={ id1="621444", id2="0", id3="0", id4="0", status=true } },
		-- 18 Carga combada 498701
		{
			[3]={ max="500", min="20", status=true },
			[12]={ id1="501575", id2="0", id3="0", id4="0", status=true }
		},
		-- 19 Maldición del tejido debilitado 497959
		{
			[3]={ max="500", min="20", status=true },
			[33]={ id1="501577", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 20 Rugido de la bestia 498547
		{
			[3]={ max="500", min="30", status=true },
			[12]={ id1="621268", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 21 Oleada de malicia 497966
		{ [3]={ max="500", min="20", status=true }, [39]={ enable=true, status=true } },
		-- 22 Pinchazo de marca del alma 498710
		{
			[4]={ max="6", min="2", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true }
		},
		-- 23 Golpe de corazón llameante 498697
		{ }
	}
	local iss = {
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