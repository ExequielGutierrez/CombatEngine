--Lua WARLOCK/WARRIOR BY NEORAXER 18-03-2024 
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

function CE_WARLOCK_WARRIOR()
	--DEFAULT_CHAT_FRAME:AddMessage("Usando BRUJO/PICA")
	local foco = UnitMana("player");
	local ira = UnitSkill("player");
	local psi = GetSoulPoint();
	--Susurro
	local SUSU_SKILL, SUSU_ID_1, SUSU_ID_2 = Match_CE(498551);
	--Oleada de conciencia
	local OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2 = Match_CE(498555);
	local OLE_CON_CD = CE_CD(OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2);
	--Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(498778);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);
	--Adquisición del conocimiento
	local ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2 = Match_CE(498552);
	--Espada de fuerza de voluntad
	local ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2 = Match_CE(497955);
	local ESP_FUE_CD = CE_CD(ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2);
	--Transferencia mental
	local TRA_MEN_SKILL, TRA_MEN_ID_1, TRA_MEN_ID_2 = Match_CE(498642);
	local TRA_MEN_CD = CE_CD(TRA_MEN_SKILL, TRA_MEN_ID_1, TRA_MEN_ID_2);
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(499871);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
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
	local JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2 = Match_CE(1491852);
	local JUI_IMP_CD = CE_CD(JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(498632);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Golpe de corazón constante
	local GOL_COR_SKILL, GOL_COR_ID_1, GOL_COR_ID_2 = Match_CE(498646);
	local GOL_COR_CD = CE_CD(GOL_COR_SKILL, GOL_COR_ID_1, GOL_COR_ID_2);
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
	
	----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if (ira <= 20 or foco <= 20 or psi <= 2 ) and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then	
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los espíritus de antaño
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		end
	CE_HEALING_ITEM()
	end
	
	--BUFFOS--
	--Destructor de almas
	if (CE_BuffIdPlayer(501920) == false) and IsSpellUsable(497805) and foco >= 20 then
		CastSpellByName(CE_toName(497805));
	--The Hex
	elseif _G.C_EngineSettings.FastBuffs and THE_HEX_CD <= 0.25 then
		UseSkill(THE_HEX_ID_1, THE_HEX_ID_2);	
	--Terror de Broken Souls
	elseif (CE_BuffIdPlayer(624386) == false) and (IsSpellUsable(850872)) then 
		CastSpellByName(CE_toName(850872));-- ISS 65         
	--Susurro
	elseif SUSU_SKILL and (CE_BuffIdPlayer(1503107) == false) then
		UseSkill(SUSU_ID_1, SUSU_ID_2);
	--Oleada de conciencia
	elseif OLE_CON_SKILL and (CE_BuffIdPlayer(621280) == false) and OLE_CON_CD <= 0.25 and (CE_isMoving() == false) then
		UseSkill(OLE_CON_ID_1, OLE_CON_ID_2);
	--Adquisición de conocimiento
	elseif ADQ_CON_SKILL and (CE_BuffIdPlayer(621277) == false) then
		UseSkill(ADQ_CON_ID_1, ADQ_CON_ID_2);		
	--Espada de fuerza de voluntad para modo DPS
	elseif ESP_FUE_SKILL and ESP_FUE_CD <= 0.25 and (CE_BuffIdPlayer(501571) == false) and psi == 6 then
		UseSkill(ESP_FUE_ID_1, ESP_FUE_ID_2);
	end
	
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		elseif FUR_SKILL and FUR_CD <= 0.25 and ira <= 40 then
			UseSkill(FUR_ID_1, FUR_ID_2)
		end	
	end

	--ROTACION--
	--Transferencia mental
	if TRA_MEN_SKILL and TRA_MEN_CD and (CE_BuffIdPlayer(501571)==false) and ira >= 50 and psi < 6 then
		UseSkill(TRA_MEN_ID_1, TRA_MEN_ID_2);  
	--Ant Queen 4psi
	elseif (CE_ISS_CD(CE_toName(490339)) == true) and psi < 6 then
		CastSpellByName(CE_toName(490339)); 
	--Curso del tormento de alma
	elseif (CE_ISS_CD(CE_toName(490342)) == true) and foco >= 10 then
		CastSpellByName(CE_toName(490342)); 
	end
	--Carga combada
	if CARG_COMB_SKILL and (CARG_COMB_CD <= 0.45) and ((CE_BuffIdPlayer(501575) == false) or psi <= 2 or CE_BuffTimeLeftById(501575)) then
		UseSkill(CARG_COMB_ID_1, CARG_COMB_ID_2)
	-- Maldición del tejido debilitado
	elseif MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.25 and (CE_DebuffIdTarget(501577) == false) and foco >= 20 and (CE_isMoving() == false) and _G.C_EngineSettings.AOE then
		UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	-- Rugido de la bestia
	elseif RUG_BES_SKILL and RUG_BES_CD <= 0.25 and (CE_BuffIdPlayer(621268) == false) and foco >= 30 and _G.C_EngineSettings.AOE then
		UseSkill(RUG_BES_ID_1, RUG_BES_ID_2);
	-- Grieta espacial
	elseif foco >= 25 and CE_ISS_CD(CE_toName(490444)) and (CE_isMoving() == false) and _G.C_EngineSettings.AOE then 
		CastSpellByName(CE_toName(490444));	
	--Juicio Implacable
	elseif CE_AFE(621199, 11) then
		if (CE_READ_BUFF_FAST(621199) == false) and JUI_IMP_SKILL and JUI_IMP_CD <= 0.45 and psi >= 1 and CE_isMoving() == false and CE_BuffIdPlayer(501571) and juicio and not TimerQueue[flag_juicio] then
			UseSkill(JUI_IMP_ID_1, JUI_IMP_ID_2);	
			TimerQueue[flag_juicio] = { GetTime() + 2.5, FLAG_JUICIO_FUNCTION }
			juicio = false
		end
	--Tajo 
	elseif TAJO_SKILL and TAJO_CD <= 0.25 and (CE_BuffIdPlayer(1500703) == false) and not CE_TARGET_IS_BOSS() and ira >= 15 then
		UseSkill(TAJO_ID_1, TAJO_ID_2);	   
	-- Golpe de corazón constante
	elseif GOL_COR_SKILL and GOL_COR_CD <= 0.25 and (CE_BuffIdPlayer(501571) == true) and psi >= 2 then
		UseSkill(GOL_COR_ID_1, GOL_COR_ID_2); -- Golpe de corazón constante
	--Oleada de malicia
	elseif OLE_MAL_SKILL and OLE_MAL_CD <= 0.25 and foco >= 20 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
		UseSkill(OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Tajo 
	elseif TAJO_SKILL and TAJO_CD <= 0.25 and not CE_TARGET_IS_BOSS() and ira >= 15 then
		UseSkill(TAJO_ID_1, TAJO_ID_2);		
	end
end 

function CE_WARLOCK_WARRIOR_IMPORT()
	local Skills = { 1244064, 1244059, 1244063, 200192, 498552, 1492465, 1490928, 497955, 490342, 497958, 498544, 497805, 498551, 498555, 498778, 499871, 498642, 490339, 497958, 498914, 497959, 498547, 490444, 498646, 497966, 498632 }
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
		-- 12 Destructor de almas 497805
		{
		  [3]={ max="100", min="20", status=true },
		  [12]={ id1="501920", id2="0", id3="0", id4="0", status=true } 
		},
		-- 13 Susurro 498551
		{ [12]={ id1="1503107", id2="0", id3="0", id4="0", status=true } },
		-- 14 Oleada de conciencia 498555
		{ [3]={ max="500", min="25", status=true }, [19]={ enable=true, status=true } },
		-- 15 Fiera 498778
		{ [6]={ max="100", min="25", status=true }, [41]={ enable=true, status=true } },
		-- 16 Furioso 499871
		{ [6]={ max="50", min="0", status=true }, [41]={ enable=true, status=true } },
		-- 17 Transferencia mental 498642
		{
		  [4]={ max="3", min="0", status=true },
		  [6]={ max="100", min="100", status=true },
		  [41]={ enable=true, status=true } 
		},
		-- 18 Poder mental de la hormiga reina 490339
		{
		  [4]={ max="3", min="0", status=true },
		  [11]={ id1="501571", id2="0", id3="0", id4="0", status=true } 
		},
		-- 19 Carga combada 497958
		{
		  [3]={ max="100", min="20", status=true },
		  [12]={ id1="501575", id2="0", id3="0", id4="0", status=true } 
		},
		-- 20 Maldición del tejido de subliumación 498914
		{
		  [3]={ max="500", min="50", status=true },
		  [12]={ id1="621736", id2="0", id3="0", id4="0", status=true } 
		},
		-- 21 Maldición del tejido debilitante 497959
		{
		  [3]={ max="500", min="20", status=true },
		  [19]={ enable=true, status=true },
		  [33]={ id1="501577", id2="0", id3="0", id4="0", status=true },
		  [39]={ enable=true, status=true } 
		},
		-- 22 Rugido de la bestia 498547
		{
		  [3]={ max="500", min="30", status=true },
		  [33]={ id1="621268", id2="0", id3="0", id4="0", status=true },
		  [39]={ enable=true, status=true } 
		},
		-- 23 Grieta espacial 490444
		{ [3]={ max="500", min="15", status=true }, [19]={ enable=true, status=true } },
		-- 24 Golpe de corazón constante 498646
		{
		  [4]={ max="6", min="2", status=true },
		  [11]={ id1="501571", id2="0", id3="0", id4="0", status=true } 
		},
		-- 25 Oleada de malicia 497966
		{
		  [3]={ max="500", min="20", status=true },
		  [39]={ enable=true, status=true },
		  [45]={ enable=true, status=true } 
		},
		-- 26 Tajo 498632
		{ [6]={ max="100", min="15", status=true } } 
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