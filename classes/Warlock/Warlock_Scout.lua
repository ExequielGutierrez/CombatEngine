--Lua WARLOCK/MAGE BY NEORAXER 18-03-2024 
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_WARLOCK_SCOUT()
	--DEFAULT_CHAT_FRAME:AddMessage("Usando BRUJO/PICA")
	local foco = UnitMana("player");
	local psi = GetSoulPoint();
	local is_Moving = CE_isMoving()
	local hp = UnitHealth("player")
	local MaxHp = UnitMaxHealth("player")
	--Flecha sangrienta
	local FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2 = Match_CE(1490943);
	local FLE_SAN_CD = CE_CD(FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2);
	--Adquisicin del conocimiento
	local ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2 = Match_CE(498552);
	--Maldición del tejido
	local MALD_TEJ_SKILL, MALD_TEJ_ID_1, MALD_TEJ_ID_2 = Match_CE(498914);
	--Susurro
	local SUSU_SKILL, SUSU_ID_1, SUSU_ID_2 = Match_CE(498551);
	--Oleada de conciencia
	local OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2 = Match_CE(498555);
	local OLE_CON_CD = CE_CD(OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2);
	--Espada de fuerza de voluntad
	local ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2 = Match_CE(497955);
	local ESP_FUE_CD = CE_CD(ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2);
	--Carga combada
	local CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2 = Match_CE(497958);
	local CARG_COMB_CD = CE_CD(CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2);
	--Juicio Implacable
	local JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2 = Match_CE(498544);
	local JUI_IMP_CD = CE_CD(JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2);
	--Impaciencia de Saces
	local IMP_SAC_SKILL, IMP_SAC_ID_1, IMP_SAC_ID_2 = Match_CE(1490582);
	local IMP_SAC_CD = CE_CD(IMP_SAC_SKILL, IMP_SAC_ID_1, IMP_SAC_ID_2);
	--Enfoque acumulado
	local ENF_ACU_SKILL, ENF_ACU_ID_1, ENF_ACU_ID_2 = Match_CE(1490584);
	local ENF_ACU_CD = CE_CD(ENF_ACU_SKILL, ENF_ACU_ID_1, ENF_ACU_ID_2);
	--Lluvia oscura
	local LLU_OSC_SKILL, LLU_OSC_ID_1, LLU_OSC_ID_2 = Match_CE(1490585);
	local LLU_OSC_CD = CE_CD(LLU_OSC_SKILL, LLU_OSC_ID_1, LLU_OSC_ID_2);
	--Dispara
	local DISP_SKILL, DISP_ID_1, DISP_ID_2 = Match_CE(1490944);
	local DISP_CD = CE_CD(DISP_SKILL, DISP_ID_1, DISP_ID_2);
	--Conciencia cercenada
	local CON_CER_SKILL, CON_CER_ID_1, CON_CER_ID_2 = Match_CE(1491543);
	local CON_CER_CD = CE_CD(CON_CER_SKILL, CON_CER_ID_1, CON_CER_ID_2);	
	--Disparo psíquico
	local DIS_PSI_SKILL, DIS_PSI_ID_1, DIS_PSI_ID_2 = Match_CE(1490579);
	local DIS_PSI_CD = CE_CD(DIS_PSI_SKILL, DIS_PSI_ID_1, DIS_PSI_ID_2);	
	----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if (foco <= 20 or psi <= 2 ) and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then	
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los espíritus de antiguo
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		end
	CE_HEALING_ITEM()
	end
	--ROTACION--
	--Enfoque acumulado
	if ENF_ACU_SKILL and ENF_ACU_CD <= 0.25 and foco <= 20 then
		UseSkill(ENF_ACU_ID_1, ENF_ACU_ID_2);
	--Impaciencia de Saces
	elseif IMP_SAC_SKILL and IMP_SAC_CD <= 0.25 and psi <= 2 and CE_BuffIdPlayer(501571) then
		UseSkill(IMP_SAC_ID_1, IMP_SAC_ID_2);
	--Flecha sangrienta
	--elseif FLE_SAN_SKILL and FLE_SAN_CD <= 0.25 and hp >= MaxHp/2 and (CE_BuffIdPlayer(1501474) == false) then
		--UseSkill(FLE_SAN_ID_1, FLE_SAN_ID_2);
	--Adquisición de conocimiento
	elseif ADQ_CON_SKILL and (CE_BuffIdPlayer(621277) == false) then
		UseSkill(ADQ_CON_ID_1, ADQ_CON_ID_2);	
	--Maldición del tejido
	elseif MALD_TEJ_SKILL and (CE_BuffIdPlayer(621736) == false) and foco >= 50 then
		UseSkill(MALD_TEJ_ID_1, MALD_TEJ_ID_2);
	--Susurro
	elseif SUSU_SKILL and (CE_BuffIdPlayer(1503107) == false) then
		UseSkill(SUSU_ID_1, SUSU_ID_2);
	--Oleada de conciencia
	elseif OLE_CON_SKILL and (CE_BuffIdPlayer(621280) == false) and OLE_CON_CD <= 0.25 and (is_Moving == false) then
		UseSkill(OLE_CON_ID_1, OLE_CON_ID_2);
	--Hormiga reina
	elseif (CE_ISS_CD(CE_toName(490339)) == true) and psi < 6 then
		CastSpellByName(CE_toName(490339)); 
	--Curso del tormento de alma
	elseif (CE_ISS_CD(CE_toName(490342)) == true) and foco >= 10 then
		CastSpellByName(CE_toName(490342)); 
	--Espada de fuerza de voluntad
	elseif ESP_FUE_SKILL and ESP_FUE_CD <= 0.25 and (CE_BuffIdPlayer(501571) == false) and psi == 6 then
		UseSkill(ESP_FUE_ID_1, ESP_FUE_ID_2);
	--Carga combada
	elseif CARG_COMB_SKILL and (CARG_COMB_CD <= 0.25) and ((CE_BuffIdPlayer(501575) == false) or CE_BuffTimeLeftById(501575)) then
		UseSkill(CARG_COMB_ID_1, CARG_COMB_ID_2)
	--Juicio Implacable
	elseif IsSpellUsable(498544) and (CE_READ_BUFF_FAST(621199) == false) and JUI_IMP_SKILL and JUI_IMP_CD <= 0.45 and psi >= 1 and CE_AFE(621199, 11) and (is_Moving == false) and CE_BuffIdPlayer(501571) then
		UseSkill(JUI_IMP_ID_1, JUI_IMP_ID_2);
	--Lluvia oscura
	elseif LLU_OSC_SKILL and LLU_OSC_CD <= 0.25 then
		UseSkill(LLU_OSC_ID_1, LLU_OSC_ID_2)
	--Dispara
	elseif DISP_SKILL and DISP_CD <= 0.25 and foco >= 10 then
		UseSkill(DISP_ID_1, DISP_ID_2);
	--Conciencia cercenada
	elseif CON_CER_SKILL and CON_CER_CD <= 0.25 and CE_BuffIdPlayer(501571) and psi >= 2 then
		UseSkill(CON_CER_ID_1, CON_CER_ID_2);
	--Disparo psíquico
	elseif DIS_PSI_SKILL and DIS_PSI_CD <= 0.25 then
		UseSkill(DIS_PSI_ID_1, DIS_PSI_ID_2);
	end
end

function CE_WARLOCK_SCOUT_IMPORT()
	--Preset base by Riechan (HARPSYNRANGER)
	local Skills = { 498914, 498551, 1490588, 498552, 1244059, 1244063, 200192, 1490928, 202153, 1494096, 498545, 1490584, 497958, 498555, 490444, 498547, 1490582, 497966, 497959, 1491543, 498544, 1490585, 498553, 1490582, 1490585, 1490579, 1490944 }
	local conditions = {
		-- 1 Sublimation Weave Curse 498914
		[1] = {
			[12]={ id1="621736", id2="0", id3="0", id4="0", status=true }
		},
		-- 2 Otherworldly Whisper 498551
		[2] = {
			[12]={ id1="1503107", id2="0", id3="0", id4="0", status=true }
		},
		-- 3 Precise Dark Magic 1490588
		[3] = {
			[12]={ id1="1504178", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 4 Knowledge Acquisition 498552
		[4] = {
			[12]={ id1="621277", id2="0", id3="0", id4="0", status=true }
		},
		-- 5 Spicy Kale Chips 1244059
		[5] = {
			[40]={ enable=true, status=true },
			[12]={ id1="1500234", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 6 Elven Mind Flask 1244063
		[6] = {
			[40]={ enable=true, status=true },
			[12]={ id1="1500238", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 7 Ancient Spirit Water 200192
		[7] = {
			[40]={ enable=true, status=true },
			[12]={ id1="500112", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 8 Astaroth's Dark Magic 1490928
		[8] = {
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true },
			[4]={ min="0", max="1", status=true },
			[29]={ enable=true, status=true }
		},
		-- 9 Universal Potion 202153
		[9] = {
			[40]={ enable=true, status=true },
			[4]={ min="0", max="1", status=true },
			[29]={ enable=true, status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true }
		},
		-- 10 Willpower Sharpening 1494096
		[10] = {
			[4]={ min="6", max="6", status=true },
			[12]={ id1="501571", id2="0", id3="0", id4="0", status=true }
		},
		-- 11 Heart Collection Strike 498545
		[11] = {
			[3]={ min="0", max="50", status=true }
		},
		-- 12 Focus Build Up 1490584
		[12] = {
			[3]={ min="0", max="20", status=true }
		},
		-- 13 Warp Charge 497958
		[13] = {
			[12]={ id1="501575", id2="0", id3="0", id4="0", status=true }
		},
		-- 14 Surge of Awareness 498555
		[14] = {},
		-- 15 Spatial Rift 490444
		[15] = {
			[3]={ min="25", max="100", status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 16 Beast's Roar 498547
		[16] = {
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 17 Saces' Impatience 1490582
		[17] = {
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true },
			[4]={ min="1", max="6", status=true }
		},
		-- 18 Surge of Malice 497966
		[18] = {
			[3]={ min="20", max="100", status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 19 Weakening Weave Curse 497959
		[19] = {
			[33]={ id1="501577", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 20 Severed Consciousness 1491543
		[20] = {
			[4]={ min="2", max="6", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true }
		},
		-- 21 Ruthless Judgment 498544
		[21] = {
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true },
			[4]={ min="2", max="6", status=true },
			[17]={ id="621199", time="11", status=true }
		},
		-- 22 Dark Rain 1490585
		[22] = {
			[12]={ id1="501571", id2="0", id3="0", id4="0", status=true }
		},
		-- 23 Puzzlement 498553
		[23] = {
			[11]={ id1="500112", id2="1500238", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 24 Saces' Impatience 1490582
		[24] = {
			[4]={ min="0", max="1", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="0", status=true }
		},
		-- 25 Dark Rain 1490585
		[25] = {},
		-- 26 Psychic Shot 1490579
		[26] = {},
		-- 27 Shot 1490944
		[27] = {}
	}
	local iss = {
		[1490928] = true,
		[490444] = true,
	}
	local consumables = {
		[1244059] = true,
		[1244063] = true,
		[200192] = true,
		[202153] = true,
	}
	local equips = {}
	local disabled = {
		[9] = true,
		[10] = true,
		[26] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions, equips, disabled)
end
