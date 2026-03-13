--Lua ROUGE/WARRIOR BY NEORAXER 04-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_ROGUE_WARRIOR()
	local ira = UnitSkill("player");
	local energia = UnitMana("player");

	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
	--Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(490095);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);
	--Manos venenosas
	local MAN_VEN_SKILL, MAN_VEN_ID_1, MAN_VEN_ID_2 = Match_CE(490329);
	local is_Moving = CE_isMoving()
	--Reclamar energía
	local REC_ENE_SKILL, REC_ENE_ID_1, REC_ENE_ID_2 = Match_CE(493257);
	--Maniobra abandonada
	local MAN_ABA_SKILL, MAN_ABA_ID_1, MAN_ABA_ID_2 = Match_CE(490355);
	--Toque de la muerte
	local TOQ_MUE_SKILL, TOQ_MUE_ID_1, TOQ_MUE_ID_2 = Match_CE(491339);
	local TOQ_CD = CE_CD(TOQ_MUE_SKILL, TOQ_MUE_ID_1, TOQ_MUE_ID_2);
	--Putrefacción
	local PUTR_SKILL, PUTR_ID_1, PUTR_ID_2 = Match_CE(493017);
	local PUTR_CD = CE_CD(PUTR_SKILL, PUTR_ID_1, PUTR_ID_2);
	--Explosión venenosas
	local EXP_VEN_SKILL, EXP_VEN_ID_1, EXP_VEN_ID_2 = Match_CE(499477);
	local EXPL_VEN_CD = CE_CD(EXP_VEN_SKILL, EXP_VEN_ID_1, EXP_VEN_ID_2);
	--Infección ponzoñosa
	local INF_PON_SKILL, INF_PON_ID_1, INF_PON_ID_2 = Match_CE(492625);
	local INF_PON_CD = CE_CD(INF_PON_SKILL, INF_PON_ID_1, INF_PON_ID_2);
	--Herida grave
	local HER_GRA_SKILL, HER_GRA_ID_1, HER_GRA_ID_2 = Match_CE(1490921);
	local HER_GRAV_CD = CE_CD(HER_GRA_SKILL, HER_GRA_ID_1, HER_GRA_ID_2);
	--Golpe bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(1490920);
	local GOP_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Cuchillada Alevosa
	local CUCH_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2 = Match_CE(1490919);
	local CUCH_ALE_CD = CE_CD(CUCH_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(490053);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Torbellino
	local TORB_SKILL, TORB_ID_1, TORB_ID_2 = Match_CE(499481);
	local TORB_CD = CE_CD(TORB_SKILL, TORB_ID_1, TORB_ID_2);
	--Arrojar
	local ARR_SKILL, ARR_ID_1, ARR_ID_2 = Match_CE(491521);
	local ARR_CD = CE_CD(ARR_SKILL, ARR_ID_1, ARR_ID_2);

	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if energia <= 40 or ira <= 20 and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Estimulante fuerte
		elseif  CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
		elseif  CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end

	--ROTACION--
	if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 and C_EngineSettings.FastBuffs then
		UseSkill(FIERA_ID_1, FIERA_ID_2);
	--Furioso
	elseif FUR_SKILL and (FUR_CD <= 0.25) and ira <= 30 and (C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS()) then
		UseSkill(FUR_ID_1, FUR_ID_2);
	--Manos venenosas
	elseif MAN_VEN_SKILL and (CE_BuffIdPlayer(500715) == false) and (is_Moving == false) then
		UseSkill(MAN_VEN_ID_1, MAN_VEN_ID_2);
	--Reclamar energía
	elseif REC_ENE_SKILL and (energia >= 30) and (CE_BuffIdPlayer(1500601) == false) then
		UseSkill(REC_ENE_ID_1, REC_ENE_ID_2);
	--Herida grave
	elseif HER_GRA_SKILL and (HER_GRAV_CD<0.45) and (energia >= 35) and (CE_SELF_DEBUFF(620313) == true or CE_SELF_DEBUFF(620314) == true) then
		UseSkill(HER_GRA_ID_1, HER_GRA_ID_2);
	--Maniobra abandonada
	elseif MAN_ABA_SKILL and (CE_BuffIdPlayer(500744) == false) then
		UseSkill(MAN_ABA_ID_1,MAN_ABA_ID_2);
	--Tormento venenoso
	elseif (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314)) then
		CastSpellByName(CE_toName(490314));
	--Putrefacción
	elseif (PUTR_CD <= 0.45) and (energia >= 30) and (CE_BuffIdPlayer(500715) == true) then
		UseSkill(PUTR_ID_1, PUTR_ID_2);
	--Cicatriz de la garra ISS
	elseif (energia >= 35) and (CE_DebuffIdTarget(508530) == true) and (CE_ISS_CD(CE_toName(490356)) == true) then
		CastSpellByName(CE_toName(490356));
	--Explosión venenosas
	elseif EXP_VEN_SKILL and (EXPL_VEN_CD <= 0.45) and (CE_BuffIdPlayer(502894) == true) and (ira >= 15) and _G.C_EngineSettings.AOE then
		UseSkill(EXP_VEN_ID_1, EXP_VEN_ID_2);
	--Infección ponzoñosa
	elseif INF_PON_SKILL and (INF_PON_CD <= 0.45) and (CE_BuffIdPlayer(502894) == false) and (ira >= 20) and (CE_BuffIdPlayer(500715) == true) and _G.C_EngineSettings.AOE then
		UseSkill(INF_PON_ID_1, INF_PON_ID_2);
	--Tempestad del alma
	elseif (energia>=13) and (CE_ISS_CD(CE_toName(490345)) == true) and _G.C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490345));
	--Marca de garra ISS
	elseif (energia >= 20) and (CE_DebuffIdTarget(508530) == false) and (CE_ISS_CD(CE_toName(490144)) == true) then
		CastSpellByName(CE_toName(490144));
	--Golpe bajo
	elseif GOL_BAJ_SKILL and (GOP_BAJ_CD <= 0.45) and (energia>=30) and (CE_SELF_DEBUFF(620313) == true) and (CE_SELF_DEBUFF(620314) == false) then
		UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Cuchillada alevosa
	elseif CUCH_ALE_SKILL and (CUCH_ALE_CD <= 0.45) and (CE_SELF_DEBUFF(620313) == false) and (energia >= 20) then
		UseSkill(CUC_ALE_ID_1, CUC_ALE_ID_2);
	--Torbellino
	elseif TORB_SKILL and (TORB_CD <= 0.45) and (CE_DebuffIdTarget(622992) == true) and (ira >= 15) and _G.C_EngineSettings.AOE then
		UseSkill(TORB_ID_1, TORB_ID_2); 
	--Toque de la muerte
	elseif (CE_BuffIdPlayer(506222) == false) and TOQ_MUE_SKILL and (TOQ_CD <= 0.45) and (ira >= 20) then
		UseSkill(TOQ_MUE_ID_1, TOQ_MUE_ID_2);
	--Tajo
	elseif TAJO_SKILL and (TAJO_CD <= 0.45) and (ira >= 25) and (CE_SELF_DEBUFF(500081) == false) then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	--Arrojar
	elseif ARR_SKILL and (ARR_CD <= 0.45) then
		UseSkill(ARR_ID_1, ARR_ID_2);
	end
end

function CE_ROGUE_WARRIOR_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 490314, 490355, 490329, 490492, 493257, 1490921, 493017, 490356, 499477, 492625, 490345, 490144, 1490920, 1490919, 499481, 491339, 490053, 490309 }
	local conditions = {
		-- 1 poción de enano 1244064
		[1] = { [5]={ max="40", min="0", status=true }, [40]={ enable=true, status=true }},
		-- 2 estimulante fuerte 200173
		[2] ={ [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 3 agilidad elfica 1244062
		[3] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 4 filete de costilla 1244060
		[4] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 5 tormento venenoso 490314
		[5] ={
			[5]={ max="500", min="5", status=true },
			[12]={ id1="500093", id2="0", id3="0", id4="0", status=true } 
		},
		-- 6 maniobra abandonada 490355
		[6] = { [12]={ id1="500744", id2="0", id3="0", id4="0", status=true } },
		-- 7 manos venenosas 490329
		[7] = {
			[12]={ id1="500715", id2="0", id3="0", id4="0", status=true },
			[19]={ enable=true, status=true } 
		},
		-- 8 Furioso 490492
		[8] = { [6]={ max="30", min="0", status=true } },
		-- 9 Reclamar energía 493257
		[9] = {
			[5]={ max="500", min="30", status=true },
			[12]={ id1="1500601", id2="0", id3="0", id4="0", status=true } 
		},
		-- 10 Herida grave 1490921
		[10] = {
			[5]={ max="100", min="35", status=true },
			[34]={ id1="620313", id2="620314", id3="0", id4="0", status=true } 
		},
		-- 11 Putrefacción 493017
		[11] = {
			[5]={ max="500", min="30", status=true },
			[11]={ id1="500715", id2="0", id3="0", id4="0", status=true } 
		},
		-- 12 Cicatriz de la garra ISS 490356
		[12] ={
			[5]={ max="100", min="35", status=true },
			[32]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		},
		-- 13 Explosión venenosas 499477
		[13] = {
			[6]={ max="100", min="15", status=true },
			[11]={ id1="502894", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true } 
		},
		-- 14 Infección ponzoñosa 492625
		[14] = {
			[6]={ max="100", min="20", status=true },
			[12]={ id1="502894", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true } 
		},
		-- 15 Tempestad del alma 490345 ISS
		[15] = { [5]={ max="100", min="13", status=true }, [39]={ enable=true, status=true } },
		-- 16 Marca de garra ISS 490144
		[16] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		},
		-- 17 Golpe bajo 1490920
		[17] ={
			[5]={ max="100", min="25", status=true },
			[34]={ id1="620313", id2="0", id3="0", id4="0", status=true },
			[35]={ id1="620314", id2="0", id3="0", id4="0", status=true } 
		},
		-- 18 Cuchillada alevosa 1490919
		[18] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="0", id3="0", id4="0", status=true } 
		},
		-- 19 Torbellino 499481
		[19] = {
			[6]={ max="100", min="15", status=true },
			[11]={ id1="622992", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true } 
		},
		-- 20 Toque de la muerte 491339
		[20] = {
			[6]={ max="100", min="20", status=true },
			[12]={ id1="506222", id2="0", id3="0", id4="0", status=true } 
		},
		-- 21 Tajo 490053
		[21] ={
			[6]={ max="100", min="25", status=true },
			[35]={ id1="500081", id2="0", id3="0", id4="0", status=true } 
		},
		-- 22 Arrojar 490309
		[22] = {},
	}
	local iss = {
		[490314] = true,
		[490345] = true,
		[490144] = true,
		[490356] = true,
	}
	local consumables = {
		[1244064] = true,
		[200173] = true,
		[1244062] = true,
		[1244060] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
