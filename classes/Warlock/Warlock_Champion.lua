
--Lua WARLOCK/CHAMOION BY NEORAXER 18-03-2024 
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

local juicio = true
local flag_juicio = "flag"


--Temporizador en cero
local function FLAG_JUICIO_FUNCTION()
	TimerQueue[flag_juicio] = nil
	juicio = true
end

function CE_WARLOCK_CHAMPION()

	local foco = UnitMana("player");
	local ira = UnitSkill("player");
	local psi = GetSoulPoint();

	--Adquisición del conocimiento
	local ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2 = Match_CE(498552);
	--Espada de fuerza de voluntad
	local ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2 = Match_CE(497955);
	local ESP_FUE_CD = CE_CD(ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2);
	--Juicio Implacable
	local JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2 = Match_CE(498544);
	local JUI_IMP_CD = CE_CD(JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2);
	--Sublimación
	local SUB_SKILL, SUB_ID_1, SUB_ID_2 = Match_CE(499854);
	local SUB_CD = CE_CD(SUB_SKILL, SUB_ID_1, SUB_ID_2);
	--Susurro
	local SUSU_SKILL, SUSU_ID_1, SUSU_ID_2 = Match_CE(498551);
	--Oleada de conciencia
	local OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2 = Match_CE(498555);
	local OLE_CON_CD = CE_CD(OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2);
	--Impulso de saces
	local IMP_SAC_SKILL, IMP_SAC_ID_1, IMP_SAC_ID_2 = Match_CE(498677);
	local IMP_SAC_CD = CE_CD(IMP_SAC_SKILL, IMP_SAC_ID_1, IMP_SAC_ID_2);
	--Devoción de energía rínica
	local DEV_ENE_SKILL, DEV_ENE_ID_1, DEV_ENE_ID_2 = Match_CE(498673);
	local DEV_ENE_CD = CE_CD(DEV_ENE_SKILL, DEV_ENE_ID_1, DEV_ENE_ID_2);
	--Carga combada
	local CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2 = Match_CE(497958);
	local CARG_COMB_CD = CE_CD(CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2);	
	--Golpe de recolección de corazón
	local GOL_REC_SKILL, GOL_REC_ID_1, GOL_REC_ID_2 = Match_CE(498545);
	local GOL_REC_CD = CE_CD(GOL_REC_SKILL, GOL_REC_ID_1, GOL_REC_ID_2);
	--Maldición del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(497959);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Electrocución
	local ELECT_SKILL, ELECT_ID_1, ELECT_ID_2 = Match_CE(498692);
	local ELECT_CD = CE_CD(ELECT_SKILL, ELECT_ID_1, ELECT_ID_2);
	--Rugido de la bestia
	local RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2 = Match_CE(498547);
	local RUG_BES_CD = CE_CD(RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2);
	--Canalización crítica
	local CAN_CRI_SKILL, CAN_CRI_ID_1, CAN_CRI_ID_2 = Match_CE(498693);
	local CAN_CRI_CD = CE_CD(CAN_CRI_SKILL, CAN_CRI_ID_1, CAN_CRI_ID_2);
	--Oleada de malicia
	local OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2 = Match_CE(497966);
	local OLE_MAL_CD = CE_CD(OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Conciencia cercenada
	local CON_CER_SKILL, CON_CER_ID_1, CON_CER_ID_2 = Match_CE(497962);
	local CON_CER_CD = CE_CD(CON_CER_SKILL, CON_CER_ID_1, CON_CER_ID_2);	
	--Flecha psíquica
	local FLE_PSI_SKILL, FLE_PSI_ID_1, FLE_PSI_ID_2 = Match_CE(1492094);
	local FLE_PSI_CD = CE_CD(FLE_PSI_SKILL, FLE_PSI_ID_1, FLE_PSI_ID_2);
	--The Hex
	local THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2 = Match_CE(1492465);
	local THE_HEX_CD = CE_CD(THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2);
	
    ----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if (ira <= 20 or foco <= 20 or psi <= 2 ) and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then	
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los espíritus de antiguo
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		end
	CE_HEALING_ITEM()
	end
	
	-----BUFFAR---------
	
	--Adquisición de conocimiento

	--Espada de fuerza de voluntad para modo DPS
    if ESP_FUE_SKILL and (CE_BuffIdPlayer(501571) == false) and psi == 6 then
		UseSkill(ESP_FUE_ID_1, ESP_FUE_ID_2);
	elseif ADQ_CON_SKILL and (CE_BuffIdPlayer(621277) == false) then
        UseSkill(ADQ_CON_ID_1, ADQ_CON_ID_2);
	--Sublimación
    elseif SUB_SKILL and SUB_CD <= 0.25 and (CE_BuffIdPlayer(501571) == false) and psi < 6 and ira > 0 then
        UseSkill(SUB_ID_1, SUB_ID_2);
	elseif (CE_ISS_CD(CE_toName(490339)) == true) and psi < 6 then
        CastSpellByName(CE_toName(490339)); 
	end
	--ROTACION--
	if _G.C_EngineSettings.FastBuffs then
		if THE_HEX_SKILL and THE_HEX_CD <= 0.25 then
			UseSkill(THE_HEX_ID_1, THE_HEX_ID_2);
		elseif DEV_ENE_SKILL and DEV_ENE_CD <= 0.25 then
			UseSkill(DEV_ENE_ID_1, DEV_ENE_ID_2);
		elseif IMP_SAC_SKILL and IMP_SAC_CD <= 0.25 and (CE_BuffIdPlayer(621407) == false) and psi >= 2 and CE_BuffIdPlayer(501571) then
			UseSkill(IMP_SAC_ID_1, IMP_SAC_ID_2);
		end
	end
	--Carga combada
	if CARG_COMB_SKILL and CARG_COMB_CD <= 0.45 and ((CE_BuffIdPlayer(501575) == false) or psi <= 2 or CE_BuffIdPlayer(501571) == false) then
		UseSkill(CARG_COMB_ID_1, CARG_COMB_ID_2)
	end

	--Juicio Implacable
	if CE_AFE(621199, 11) then
		if (CE_READ_BUFF_FAST(621199) == false) and JUI_IMP_SKILL and JUI_IMP_CD <= 0.45 and psi >= 2 and CE_isMoving() == false and CE_BuffIdPlayer(501571) and juicio and not TimerQueue[flag_juicio] then
			TimerQueue[flag_juicio] = { GetTime() + 2.5, FLAG_JUICIO_FUNCTION }
			UseSkill(JUI_IMP_ID_1, JUI_IMP_ID_2);	
			juicio = false
		end
	end 
	--Curso del tormento de alma
    if (CE_ISS_CD(CE_toName(490342)) == true) and foco >= 10 then
        CastSpellByName(CE_toName(490342)); 
	--Destructor de almas
    elseif (CE_BuffIdPlayer(501920) == false) and IsSpellUsable(497805) and foco >= 20 then
         CastSpellByName(CE_toName(497805));
    --Susurro
    elseif SUSU_SKILL and (CE_BuffIdPlayer(1503107) == false) then
        UseSkill(SUSU_ID_1, SUSU_ID_2);
    --Oleada de conciencia
    elseif foco >= 25 and OLE_CON_SKILL and OLE_CON_CD <= 0.25 and (CE_isMoving() == false) then
        UseSkill(OLE_CON_ID_1, OLE_CON_ID_2);
    --Golpe de recolección del corazón
    elseif GOL_REC_SKILL and GOL_REC_CD <= 0.25 then
        UseSkill(GOL_REC_ID_1, GOL_REC_ID_2);
    -- Maldición del tejido debilitado
    elseif MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.25 and (CE_DebuffIdTarget(501577) == false) and foco >= 20 and (CE_isMoving()  == false) and _G.C_EngineSettings.AOE then
        UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
    --Conciencia cercenada
    elseif CON_CER_SKILL and CON_CER_CD <= 0.25 and psi >= 2 and CE_BuffIdPlayer(501571) then
        UseSkill(CON_CER_ID_1, CON_CER_ID_2);
    -- Grieta espacial
	elseif foco >= 25 and CE_ISS_CD(CE_toName(490444)) and (CE_isMoving() == false) and _G.C_EngineSettings.AOE then 
		CastSpellByName(CE_toName(490444));	
    --Electrocución
    elseif ELECT_SKILL and ELECT_CD <= 0.25 and (CE_DebuffIdTarget(621396) == false) and ira >= 15 then 
        UseSkill(ELECT_ID_1, ELECT_ID_2);
    -- Rugido de la bestia
    elseif RUG_BES_SKILL and RUG_BES_CD <= 0.25 and (CE_BuffIdPlayer(621268) == false) and foco >= 30 and _G.C_EngineSettings.AOE then
        UseSkill(RUG_BES_ID_1, RUG_BES_ID_2);
    -- Canalización Critica
    elseif CAN_CRI_SKILL and CAN_CRI_CD <= 0.25 and CE_DebuffIdTarget(621396) and ira >= 20 then
        UseSkill(CAN_CRI_ID_1, CAN_CRI_ID_2);
    --Oleada de malicia
    elseif OLE_MAL_SKILL and OLE_MAL_CD <= 0.25 and foco >= 20 and CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
        UseSkill(OLE_MAL_ID_1, OLE_MAL_ID_2);
    --Flecha_psiquica
    elseif FLE_PSI_SKILL and foco >= 15 and IsSpellUsable(1492094) then 
        UseSkill(FLE_PSI_ID_1, FLE_PSI_ID_2); 

    end

end 

function CE_WARLOCK_CHAMPION_IMPORT()

	local Skills = { 1244064, 1244059, 1244063, 200192, 498552, 1492465, 1490928, 497955, 499854, 497958, 498544, 490342, 497805, 498551, 498555, 498545, 497959, 497962, 490444, 498692, 498547, 498693, 497966, 1492094 };
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
		-- 9 Sublimación 499854
		{
		  [4]={ max="5", min="0", status=true },
		  [6]={ max="100", min="1", status=true },
		  [12]={ id1="501571", id2="0", id3="0", id4="0", status=true } 
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
		-- 13 Destructor de almas 497805
		{
			[3]={ max="100", min="20", status=true },
			[12]={ id1="501920", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 14 Susurro 498551
		{ [12]={ id1="1503107", id2="0", id3="0", id4="0", status=true } },
		-- 15 Oleada de conciencia 498555
		{ [3]={ max="500", min="25", status=true }, [19]={ enable=true, status=true } },
		-- 16 Golpe de recolección del corazón 498545
		{  },
		-- 17 Maldición del tejido debilitado 497959
		{
			[3]={ max="500", min="20", status=true },
			[19]={ enable=true, status=true },
			[33]={ id1="501577", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true } 
		  },
		-- 18 Conciencia cercenada 497962
		{
			[4]={ max="6", min="2", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 19 Grieta espacial 490444
		{ [3]={ max="500", min="15", status=true }, [19]={ enable=true, status=true } },
		-- 20 Electrocución 498692
		{
			[6]={ max="100", min="15", status=true },
			[33]={ id1="621396", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 21 Rugido de la bestia 498547
		{
			[3]={ max="500", min="30", status=true },
			[33]={ id1="621268", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true } 
		  },
		-- 22 Canalización Critica 498693
		{
			[3]={ max="500", min="15", status=true },
			[32]={ id1="621396", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 23 Oleada de malicia 497966
		{
			[3]={ max="500", min="20", status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true } 
		  },
		-- 24 Flecha_psiquica 1492094
		{ [3]={ max="500", min="15", status=true } } 
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
