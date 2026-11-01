--Lua WARLOCK/PRIEST BY NEORAXER
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
--Hybrid rotation: damage skills when the target is not a player, support skills when the target is a player.


function CE_WARLOCK_PRIEST()
	local psi = GetSoulPoint();
	--Percent of the secondary resource (nil when the player does not use it)
	local function ResPct(kind)
		if UnitManaType("player") == kind then
			return UnitMana("player") * 100 / UnitMaxMana("player");
		elseif UnitSkillType("player") == kind then
			return UnitSkill("player") * 100 / UnitMaxSkill("player");
		end
		return nil;
	end
	local manaP = ResPct(1);
	local focoP = ResPct(3);
	local tIsPlayer = UnitIsPlayer("target");

	--Susurro del otro mundo
	local SUSU_SKILL, SUSU_ID_1, SUSU_ID_2 = Match_CE(498551);
	local SUSU_CD = CE_CD(SUSU_SKILL, SUSU_ID_1, SUSU_ID_2);
	--Adquisicion de conocimientos
	local ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2 = Match_CE(498552);
	local ADQ_CON_CD = CE_CD(ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2);
	--Anillo de comodidad (area en el suelo)
	local ANI_COM_SKILL, ANI_COM_ID_1, ANI_COM_ID_2 = Match_CE(498641);
	local ANI_COM_CD = CE_CD(ANI_COM_SKILL, ANI_COM_ID_1, ANI_COM_ID_2);
	--Propagacion de dolor
	local PRO_DOL_SKILL, PRO_DOL_ID_1, PRO_DOL_ID_2 = Match_CE(499856);
	local PRO_DOL_CD = CE_CD(PRO_DOL_SKILL, PRO_DOL_ID_1, PRO_DOL_ID_2);
	--Flechas psiquicas
	local FLE_PSI_SKILL, FLE_PSI_ID_1, FLE_PSI_ID_2 = Match_CE(497957);
	local FLE_PSI_CD = CE_CD(FLE_PSI_SKILL, FLE_PSI_ID_1, FLE_PSI_ID_2);
	--Maldicion del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(497959);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Meditacion de fuerza de voluntad
	local MED_FUE_SKILL, MED_FUE_ID_1, MED_FUE_ID_2 = Match_CE(1494097);
	local MED_FUE_CD = CE_CD(MED_FUE_SKILL, MED_FUE_ID_1, MED_FUE_ID_2);
	--Oleada de conciencia
	local OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2 = Match_CE(498555);
	local OLE_CON_CD = CE_CD(OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2);
	--Iluminacion del alma
	local ILU_ALM_SKILL, ILU_ALM_ID_1, ILU_ALM_ID_2 = Match_CE(498649);
	local ILU_ALM_CD = CE_CD(ILU_ALM_SKILL, ILU_ALM_ID_1, ILU_ALM_ID_2);
	--Corte cargado
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(1492533);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2);
	--Regeneracion
	local REG_SKILL, REG_ID_1, REG_ID_2 = Match_CE(1490339);
	local REG_CD = CE_CD(REG_SKILL, REG_ID_1, REG_ID_2);
	--Barrera mental
	local BAR_MEN_SKILL, BAR_MEN_ID_1, BAR_MEN_ID_2 = Match_CE(498542);
	local BAR_MEN_CD = CE_CD(BAR_MEN_SKILL, BAR_MEN_ID_1, BAR_MEN_ID_2);
	--Escudo de mente solida
	local ESC_MEN_SKILL, ESC_MEN_ID_1, ESC_MEN_ID_2 = Match_CE(497965);
	local ESC_MEN_CD = CE_CD(ESC_MEN_SKILL, ESC_MEN_ID_1, ESC_MEN_ID_2);
	--Curacion urgente
	local CUR_URG_SKILL, CUR_URG_ID_1, CUR_URG_ID_2 = Match_CE(498783);
	local CUR_URG_CD = CE_CD(CUR_URG_SKILL, CUR_URG_ID_1, CUR_URG_ID_2);

	--Poder mental de la hormiga reina
	if CE_ISS_CD(CE_toName(490339)) and psi <= 2 and (CE_BuffIdPlayer(501571) or CE_BuffIdPlayer(501572)) then
		CastSpellByName(CE_toName(490339));
	--Usar pocion del enano
	elseif C_EngineSettings.Consumables and psi <= 2 and CE_UseItem(1244064) then
	--Susurro del otro mundo
	elseif SUSU_SKILL and SUSU_CD <= 0.25 and CE_BuffIdPlayer(1503107) == false then
		UseSkill(SUSU_ID_1, SUSU_ID_2);
	--Adquisicion de conocimientos
	elseif ADQ_CON_SKILL and ADQ_CON_CD <= 0.25 and CE_BuffIdPlayer(621277) == false then
		UseSkill(ADQ_CON_ID_1, ADQ_CON_ID_2);
	--Anillo de comodidad (area en el suelo)
	elseif ANI_COM_SKILL and ANI_COM_CD <= 0.25 then
		UseSkill(ANI_COM_ID_1, ANI_COM_ID_2);
		if not TimerQueue["castAoe"] then
			TimerQueue["castAoe"] = { GetTime() + 0.1, function() SpellTargetUnit("mouseover") end };
		end
	--Propagacion de dolor
	elseif PRO_DOL_SKILL and PRO_DOL_CD <= 0.25 and (focoP == nil or focoP >= 15) and (manaP == nil or manaP >= 10) and CE_BuffIdPlayer(1500674) == false and tIsPlayer == nil then
		UseSkill(PRO_DOL_ID_1, PRO_DOL_ID_2);
	--Flechas psiquicas
	elseif FLE_PSI_SKILL and FLE_PSI_CD <= 0.25 and CE_BuffIdPlayer(1500674) and tIsPlayer == nil and CE_BuffIdPlayer(621324) == false then
		UseSkill(FLE_PSI_ID_1, FLE_PSI_ID_2);
	--Maldicion del tejido debilitante
	elseif MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.25 and CE_BuffIdPlayer(1500674) and CE_DebuffIdTarget(501577) == false and CE_BuffIdPlayer(501577) == false and tIsPlayer == nil then
		UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Meditacion de fuerza de voluntad
	elseif MED_FUE_SKILL and MED_FUE_CD <= 0.25 and CE_BuffIdPlayer(1506081) == false then
		UseSkill(MED_FUE_ID_1, MED_FUE_ID_2);
	--Usar pocion universal
	elseif C_EngineSettings.Consumables and psi <= 2 and CE_BuffIdPlayer(501572) == false and CE_UseItem(202153) then
	--Oleada de conciencia
	elseif OLE_CON_SKILL and OLE_CON_CD <= 0.25 and (focoP == nil or focoP >= 25) and CE_BuffIdPlayer(621280) == false then
		UseSkill(OLE_CON_ID_1, OLE_CON_ID_2);
	--Iluminacion del alma
	elseif ILU_ALM_SKILL and ILU_ALM_CD <= 0.25 and CE_BuffIdPlayer(501572) and psi >= 2 and psi <= 6 and CE_BuffIdPlayer(621328) == false then
		UseSkill(ILU_ALM_ID_1, ILU_ALM_ID_2);
	--Corte cargado (solo si el objetivo es un jugador)
	elseif COR_CAR_SKILL and COR_CAR_CD <= 0.25 and tIsPlayer then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);
	--Regeneracion
	elseif REG_SKILL and REG_CD <= 0.25 and CE_BuffIdPlayer(1500708) == false and tIsPlayer then
		UseSkill(REG_ID_1, REG_ID_2);
	--Barrera mental (hasta 2 cargas de 621196)
	elseif BAR_MEN_SKILL and BAR_MEN_CD <= 0.25 and CE_BuffIdPlayer(501572) and CE_DebuffIdTarget(621196) == false and psi >= 1 and psi <= 6 and CE_BuffIdPlayer(621196, 2, true) == false and tIsPlayer then
		UseSkill(BAR_MEN_ID_1, BAR_MEN_ID_2);
	--Escudo de mente solida
	elseif ESC_MEN_SKILL and ESC_MEN_CD <= 0.25 and (focoP == nil or focoP >= 15) and CE_DebuffIdTarget(621190) == false and CE_BuffIdPlayer(621189) == false and tIsPlayer then
		UseSkill(ESC_MEN_ID_1, ESC_MEN_ID_2);
	--Curacion urgente
	elseif CUR_URG_SKILL and CUR_URG_CD <= 0.25 and tIsPlayer then
		UseSkill(CUR_URG_ID_1, CUR_URG_ID_2);
	end
end

function CE_WARLOCK_PRIEST_IMPORT()
	--Skills          [1]     [2]      [3]    [4]    [5]    [6]    [7]    [8]    [9]     [10]    [11]   [12]   [13]    [14]    [15]   [16]   [17]
	local Skills = { 490339, 1244064, 498551, 498552, 498641, 499856, 497957, 497959, 1494097, 202153, 498555, 498649, 1492533, 1490339, 498542, 497965, 498783 }
	local conditions = {
		-- 1 Poder mental de la hormiga reina 490339
		[1] = {
			[4]={ max="2", min="0", status=true },
			[11]={ id1="501571", id2="0", id3="0", id4="501572", status=true }
		},
		-- 2 Experimental del enano 1244064
		[2] = { [4]={ max="2", min="0", status=true } },
		-- 3 Susurro del otro mundo 498551
		[3] = { [12]={ id1="1503107", id2="0", id3="0", id4="0", status=true } },
		-- 4 Adquisicion de conocimientos 498552
		[4] = { [12]={ id1="621277", id2="0", id3="0", id4="0", status=true } },
		-- 5 Anillo de comodidad 498641
		[5] = { [43]={ enable=true, status=true } },
		-- 6 Propagacion de dolor 499856
		[6] = {
			[2]={ max="500", min="10", status=true },
			[3]={ max="500", min="15", status=true },
			[12]={ id1="1500674", id2="0", id3="0", id4="0", status=true },
			[51]={ enable=true, status=true }
		},
		-- 7 Flechas psiquicas 497957
		[7] = {
			[11]={ id1="1500674", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="621324", id2="0", id3="0", id4="0", status=true },
			[51]={ enable=true, status=true }
		},
		-- 8 Maldicion del tejido debilitante 497959
		[8] = {
			[11]={ id1="1500674", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="501577", id2="0", id3="0", id4="0", status=true },
			[33]={ id1="501577", id2="0", id3="0", id4="0", status=true },
			[51]={ enable=true, status=true }
		},
		-- 9 Meditacion de fuerza de voluntad 1494097
		[9] = { [12]={ id1="1506081", id2="0", id3="0", id4="0", status=true } },
		-- 10 Pocion universal 202153
		[10] = {
			[4]={ max="2", min="0", status=true },
			[12]={ id1="501572", id2="0", id3="0", id4="0", status=true }
		},
		-- 11 Oleada de conciencia 498555
		[11] = {
			[3]={ max="500", min="25", status=true },
			[12]={ id1="621280", id2="0", id3="0", id4="0", status=true }
		},
		-- 12 Iluminacion del alma 498649
		[12] = {
			[4]={ max="6", min="2", status=true },
			[11]={ id1="501572", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="621328", id2="0", id3="0", id4="0", status=true }
		},
		-- 13 Corte cargado 1492533
		[13] = { [50]={ enable=true, status=true } },
		-- 14 Regeneracion 1490339
		[14] = {
			[12]={ id1="1500708", id2="0", id3="0", id4="0", status=true },
			[50]={ enable=true, status=true }
		},
		-- 15 Barrera mental 498542
		[15] = {
			[4]={ max="6", min="1", status=true },
			[11]={ id1="501572", id2="0", id3="0", id4="0", status=true },
			[16]={ id="621196", stack="2", orMore=true, self=false, status=true },
			[33]={ id1="621196", id2="0", id3="0", id4="0", status=true },
			[50]={ enable=true, status=true }
		},
		-- 16 Escudo de mente solida 497965
		[16] = {
			[3]={ max="500", min="15", status=true },
			[12]={ id1="621189", id2="0", id3="0", id4="0", status=true },
			[33]={ id1="621190", id2="0", id3="0", id4="0", status=true },
			[50]={ enable=true, status=true }
		},
		-- 17 Curacion urgente 498783
		[17] = { [50]={ enable=true, status=true } }
	}
	local iss = {
		[490339] = true,
	}
	local consumables = {
		[1244064] = true,
		[202153] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
