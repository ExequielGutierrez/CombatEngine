--Lua WARLOCK/rogue BY NEORAXER 08-03-2024 -> Rotación base kitty Solara
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

local juicio = true
local flag_juicio = "flag"

--Temporizador en cero
local function FLAG_JUICIO_FUNCTION()
	TimerQueue[flag_juicio] = nil
	juicio = true
end

function CE_WARLOCK_BARD()
	local foco = UnitMana("player");
	local psi = GetSoulPoint();
	--Oleada de conciencia
	local OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2 = Match_CE(498555);
	local OLE_CON_CD = CE_CD(OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2);
	--Golpe de recolección de corazón
	local GOL_REC_SKILL, GOL_REC_ID_1, GOL_REC_ID_2 = Match_CE(498545);
	local GOL_REC_CD = CE_CD(GOL_REC_SKILL, GOL_REC_ID_1, GOL_REC_ID_2);
	--Espada de fuerza de voluntad
	local ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2 = Match_CE(497955);
	local ESP_FUE_CD = CE_CD(ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2);
	-- Notes from the Hell
	local NOTE_HELL_SKILL, NOTE_HELL_ID_1, NOTE_HELL_ID_2 = Match_CE(1491297);
	-- Wicked Inspiration
	local WICKED_INS_SKILL, WICKED_INS_ID_1, WICKED_INS_ID_2 = Match_CE(1491290);
	-- Sublimination Weave Curse
	local SUBLI_WE_SKILL, SUBLI_WE_ID_1, SUBLI_WE_ID_2 = Match_CE(498914);
	-- Perception Extraction
	local PER_EXTRA_SKILL, PER_EXTRA_ID_1, PER_EXTRA_ID_2 = Match_CE(497960);
	local PER_EXTRA_CD = CE_CD(PER_EXTRA_SKILL, PER_EXTRA_ID_1, PER_EXTRA_ID_2);
	-- Dark Exchange
	local DARK_EX_SKILL, DARK_EX_ID_1, DARK_EX_ID_2 = Match_CE(1491292);
	--Carga combada
	local CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2 = Match_CE(497958);
	local CARG_COMB_CD = CE_CD(CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2);
	--Rugido de la bestia
	local RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2 = Match_CE(498547);
	local RUG_BES_CD = CE_CD(RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2);
	--Maldición del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(497959);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Oleada de malicia
	local OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2 = Match_CE(497966);
	local OLE_MAL_CD = CE_CD(OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Adquisición del conocimiento - Knowledge Acquisition
	local ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2 = Match_CE(498552);
	--Juicio Implacable
	local JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2 = Match_CE(1491512);
	local JUI_IMP_CD = CE_CD(JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2);
	-- Heart Collection Strike
	local HEART_CO_SKILL, HEART_CO_ID_1, HEART_CO_ID_2 = Match_CE(498545);
	local HEART_CO_CD = CE_CD(HEART_CO_SKILL, HEART_CO_ID_1, HEART_CO_ID_2);
	-- Severed Consciousness
	local SEVE_CON_SKILL, SEVE_CON_ID_1, SEVE_CON_ID_2 = Match_CE(497962);
	local SEVE_CON_CD = CE_CD(SEVE_CON_SKILL, SEVE_CON_ID_1, SEVE_CON_ID_2);
	-- Otherworldly Whisper
	local OTHER_WHI_SKILL, OTHER_WHI_ID_1, OTHER_WHI_ID_2 = Match_CE(498551);
	-- Dark Blast
	local DARK_BLA_SKILL, DARK_BLA_ID_1, DARK_BLA_ID_2 = Match_CE(1491295);
	local DARK_BLA_CD = CE_CD(DARK_BLA_SKILL, DARK_BLA_ID_1, DARK_BLA_ID_2);
	-- Ethernal Blade
	local ETHER_BLA_SKILL, ETHER_BLA_ID_1, ETHER_BLA_ID_2 = Match_CE(1491296);
	local ETHER_BLA_CD = CE_CD(ETHER_BLA_SKILL, ETHER_BLA_ID_1, ETHER_BLA_ID_2)
	--Adquisición del conocimiento
	local ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2 = Match_CE(498552);
	--The Hex
	local THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2 = Match_CE(1492465);
	local THE_HEX_CD = CE_CD(THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2);
	--Inspiración Malvada
	local INS_MAL_SKILL, INS_MAL_ID_1, INS_MAL_ID_2 = Match_CE(1491290);

	----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if CE_TARGET_IS_BOSS() and (energia <= 20 or foco <= 20 or psi <= 2 ) and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los espíritus de antaño
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		end
		CE_HEALING_ITEM()
	end

--ROTACIÓN--
	--Adquisición del conocimiento
	if ADQ_CON_SKILL and (CE_BuffIdPlayer(621277) == false) and foco >= 10 then
		UseSkill(ADQ_CON_ID_1, ADQ_CON_ID_2);
	--Inspiración Malvada
	elseif (CE_BuffIdPlayer(1502255) == false) and foco >= 40 then
		UseSkill(INS_MAL_ID_1, INS_MAL_ID_2);
	--The Hex
	elseif _G.C_EngineSettings.FastBuffs and THE_HEX_CD <= 0.25 then
		UseSkill(THE_HEX_ID_1, THE_HEX_ID_2);
	--Astaroth's Dark Magic
	elseif (CE_ISS_CD(CE_toName(1490928)) == true) and psi < 2 then
		CastSpellByName(CE_toName(1490928));
	--Curso del tormento del alma
	elseif CE_ISS_CD(CE_toName(490342)) then
		CastSpellByName(CE_toName(490342));
	--Oleada de conciencia - Surge of Awareness
	elseif _G.C_EngineSettings.FastBuffs and OLE_CON_SKILL and OLE_CON_CD <= 0.45 and CE_isMoving() == false and foco >= 25 then
		UseSkill(OLE_CON_ID_1, OLE_CON_ID_2);
	--Golpe de recolección de corazón - Heart Collection Strike
	elseif HEART_CO_SKILL and HEART_CO_CD <= 0.25 and foco <= 50 then
		UseSkill(HEART_CO_ID_1, HEART_CO_ID_2);
	--Espada de fuerza de voluntad
	elseif ESP_FUE_SKILL and ESP_FUE_CD <= 0.25 and (CE_BuffIdPlayer(501571) == false) and psi >= 6 then
		UseSkill(ESP_FUE_ID_1, ESP_FUE_ID_2);
	-- Dark Exchange
	elseif DARK_EX_SKILL and foco >= 50 and (CE_BuffIdPlayer(501571)==true)	and (psi < 2) then
		UseSkill(DARK_EX_ID_1, DARK_EX_ID_2);
	--Carga combada
	elseif CARG_COMB_SKILL and (CARG_COMB_CD <= 0.45) and (CE_BuffIdPlayer(501575) == false) then
		UseSkill(CARG_COMB_ID_1, CARG_COMB_ID_2);
	-- Perception Extraction
	elseif PER_EXTRA_SKILL and (CE_BuffIdPlayer(1502257)==false) and PER_EXTRA_CD <= 0.25 then
		UseSkill(PER_EXTRA_ID_1, PER_EXTRA_ID_2);
	-- Grieta espacial
	elseif foco >= 25 and CE_ISS_CD(CE_toName(490444)) and (CE_isMoving() == false) and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490444));
	--Rugido de la bestia
	elseif RUG_BES_SKILL and RUG_BES_CD <= 0.25 and foco >= 30 and not CE_TARGET_IS_BOSS() and C_EngineSettings.AOE then
		UseSkill(RUG_BES_ID_1, RUG_BES_ID_2);
	--Maldición del tejido debilitante
	elseif MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.45 and foco >= 20 and not CE_TARGET_IS_BOSS() and (CE_DebuffIdTarget(501577) == false) and (CE_isMoving() == false) and C_EngineSettings.AOE then
		UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Oleada de malicia
	elseif OLE_MAL_SKILL and OLE_MAL_CD <= 0.25 and not CE_TARGET_IS_BOSS() and foco >= 20 and C_EngineSettings.AOE then
		UseSkill(OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Juicio Implacable
	elseif CE_AFE(621199, 11) then
		if (CE_READ_BUFF_FAST(621199) == false) and JUI_IMP_SKILL and JUI_IMP_CD <= 0.45 and psi >= 1 and CE_isMoving() == false and CE_BuffIdPlayer(501571) and juicio and not TimerQueue[flag_juicio] then
			UseSkill(JUI_IMP_ID_1, JUI_IMP_ID_2);
			TimerQueue[flag_juicio] = { GetTime() + 2.5, FLAG_JUICIO_FUNCTION }
			juicio = false
		end
	-- Ethereal Blade
	elseif ETHER_BLA_SKILL and ETHER_BLA_CD <= 0.25 and (CE_BuffIdPlayer(501571)== true) and (CE_BuffIdPlayer(1502257)==true) and foco >= 10 then
		UseSkill(ETHER_BLA_ID_1, ETHER_BLA_ID_2);
	-- Severed Consciousness
	elseif SEVE_CON_SKILL and SEVE_CON_CD <= 0.25 and psi >=2 and (CE_BuffIdPlayer(501571)==true) then
		UseSkill(SEVE_CON_ID_1, SEVE_CON_ID_2);
	-- Dark Blast
	elseif DARK_BLA_SKILL and DARK_BLA_CD <= 0.25 and (CE_BuffIdPlayer(1502257)==true) and foco >= 15 then
		UseSkill(DARK_BLA_ID_1, DARK_BLA_ID_2);
	end
end

function CE_WARLOCK_BARD_IMPORT()
	local Skills = { 1502255, 1244064, 1244059, 1244063, 200192, 498552, 1492465, 1490928, 497955, 490342, 498544, 497805, 490339, 498555, 498545, 1491292, 497958, 497960, 490444, 498547, 497959, 497966, 1491296, 497962, 1491295 }
	local conditions = {
		-- 0 Inspiración Malvada 1502255
		{
			[3]={ max="500", min="40", status=true },
			[12]={ id1="1502255", id2="0", id3="0", id4="0", status=true } 
		  },
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
		-- 13 Oleada de conciencia 498555
		{ [3]={ max="500", min="25", status=true }, [19]={ enable=true, status=true } },
		-- 14 Golpe de recolección de corazón 498545
		{},
		-- 15 Intercambio oscuro 1491292
		{
			[3]={ max="500", min="50", status=true },
			[4]={ max="2", min="0", status=true }
		},
		-- 16 Carga combada 497958
		{
			[3]={ max="100", min="20", status=true },
			[12]={ id1="501575", id2="0", id3="0", id4="0", status=true }
		},
		-- 17 Perception Extraction 497960
		{ [12]={ id1="621655", id2="0", id3="0", id4="0", status=true } },
		-- 18 Grieta espacial 490444
		{ [3]={ max="500", min="15", status=true }, [19]={ enable=true, status=true } },
		-- 19 Rugido de la bestia 498547
		{
			[3]={ max="500", min="30", status=true },
			[12]={ id1="621268", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 20 Maldición del tejido debilitante 497959
		{
			[3]={ max="500", min="20", status=true },
			[33]={ id1="501577", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 21 Oleada de malicia 497966
		{ [3]={ max="500", min="20", status=true }, [39]={ enable=true, status=true } },
		-- 22 Ethereal Blade 1491296
		{
			[3]={ max="500", min="10", status=true },
			[11]={ id1="501571", id2="1502257", id3="0", id4="0", status=true } 
		  },
		-- 23 Severed Consciousness 497962
		{
			[4]={ max="6", min="2", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true }
		},
		-- 24 Explosión oscura 1491295
		{
			[3]={ max="500", min="15", status=true },
			[11]={ id1="1502257", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true } 
		  } 
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