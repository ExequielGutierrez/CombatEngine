--Lua Rouge/Champion BY NEORAXER 05-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_ROGUE_CHAMPION()
	local ira = UnitSkill("player");
	local energia = UnitMana("player");
	
	--Mecanismo de entrenamiento
	local MEC_ENT_SKILL, MEC_ENT_ID_1, MEC_ENT_ID_2 = Match_CE(498837);
	local MEC_ENT_CD = CE_CD(MEC_ENT_SKILL, MEC_ENT_ID_1, MEC_ENT_ID_2);
	--Bomba silenciosa
	local BOM_SIL_SKILL, BOM_SIL_ID_1, BOM_SIL_ID_2 = Match_CE(498833);
	local BOM_SIL_CD = CE_CD(BOM_SIL_SKILL, BOM_SIL_ID_1, BOM_SIL_ID_2);
	--Bomba de pulso
	local BOM_PUL_SKILL, BOM_PUL_ID_1, BOM_PUL_ID_2 = Match_CE(498834);
	local BOM_PUL_CD = CE_CD(BOM_PUL_SKILL, BOM_PUL_ID_1, BOM_PUL_ID_2);
	--Canalización de energía
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(1490401);
	local CAN_ENE_CD = CE_CD(CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2);
	--Ataque a la herida
	local ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2 = Match_CE(1490328);
	local ATA_HER_CD = CE_CD(ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2);
	--Electrocusión
	local ELEC_SKILL, ELEC_ID_1, ELEC_ID_2 = Match_CE(1490327);
	local ELEC_CD = CE_CD(ELEC_SKILL, ELEC_ID_1, ELEC_ID_2);
	--Cuchillada alevosa
	local CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2 = Match_CE(1490392);
	local CUCH_ALEV_CD = CE_CD(CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);
	--Arrojar
	local ARR_SKILL, ARR_ID_1, ARR_ID_2 = Match_CE(1490393);
	local ARR_CD = CE_CD(ARR_SKILL, ARR_ID_1, ARR_ID_2);
	--Embestida brutal
	local EMB_BRU_SKILL, EMB_BRU_ID_1, EMB_BRU_ID_2 = Match_CE(1490400);
	local EMB_BRU_CD = CE_CD(EMB_BRU_SKILL, EMB_BRU_ID_1, EMB_BRU_ID_2);
	--Maniobra abandonada
	local MAN_ABA_SKILL, MAN_ABA_ID_1, MAN_ABA_ID_2 = Match_CE(490355);
	--Sombra desarticulada
	local SOM_DES_SKILL, SOM_DES_ID_1, SOM_DES_ID_2 = Match_CE(499816);
	--Mecanismo de poder
	local MEC_POD_SKILL, MEC_POD_ID_1, MEC_POD_ID_2 = Match_CE(498828);
	local MEC_POD_CD = CE_CD(MEC_POD_SKILL, MEC_POD_ID_1, MEC_POD_ID_2);
	--Manos venenosas
	local MAN_VEN_SKILL, MAN_VEN_ID_1, MAN_VEN_ID_2 = Match_CE(490329);
	--Golpe bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(1490395);
	local GOL_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	
	--BUFFOS--
	--Maniobra abandonada
	if MAN_ABA_SKILL and (CE_BuffIdPlayer(500744) == false) then
		UseSkill(MAN_ABA_ID_1, MAN_ABA_ID_2);
	--Sombra desarticulada
	elseif SOM_DES_SKILL and (CE_BuffIdPlayer(623470) == false) then
		UseSkill(SOM_DES_ID_1, SOM_DES_ID_2);
	--Mecanismo de poder
	elseif MEC_POD_SKILL and (CE_BuffIdPlayer(1503291) == false) and C_EngineSettings.FastBuffs then
		UseSkill(MAN_VEN_ID_1, MAN_VEN_ID_2);
	--Tormento venenoso
	elseif (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314))
		then CastSpellByName(CE_toName(490314));
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if (energia <= 40 or ira <= 20) and CE_UseItem(1244064) then
		--Estimulante fuerte
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end
	
	--ROTACION--
	--Ataque a la herida
	if ATA_HER_SKILL and ATA_HER_CD <= 0.45 and ( CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(620314) ) and energia >= 30 then
		UseSkill(ATA_HER_ID_1, ATA_HER_ID_2);
	--Mecanismo de entrenamiento
	elseif MEC_ENT_SKILL and MEC_ENT_CD <= 0.45 and (energia >= 20) then
		UseSkill(MEC_ENT_ID_1, MEC_ENT_ID_2);
	--Mecanismo de poder
	elseif MEC_POD_SKILL and MEC_POD_CD <= 0.45 and (CE_BuffIdPlayer(1500690) == false) and C_EngineSettings.FastBuffs then
		UseSkill(MEC_POD_ID_1, MEC_POD_ID_2);
	--Cicatriz de la garra ISS
	elseif (energia >= 35) and (CE_DebuffIdTarget(508530) == true) and (CE_ISS_CD(CE_toName(490356)) == true) then
		CastSpellByName(CE_toName(490356));
	--Bomba de pulso rúnico
	elseif BOM_PUL_SKILL and BOM_PUL_CD <= 0.45 and ira >= 30 and CE_DebuffIdTarget(621610) and _G.C_EngineSettings.AOE then
		SpellTargetUnit("mouseover");
		UseSkill(BOM_PUL_ID_1, BOM_PUL_ID_2);
	--Bomba silenciosa
	elseif BOM_SIL_SKILL and BOM_SIL_CD <= 0.45 and ira >= 20 and (CE_DebuffIdTarget(621610) == false) and _G.C_EngineSettings.AOE then
		SpellTargetUnit("mouseover");
		UseSkill(BOM_SIL_ID_1, BOM_SIL_ID_2);
	--Golpe bajo
	elseif GOL_BAJ_SKILL and GOL_BAJ_CD <= 0.45 and CE_SELF_DEBUFF(620313) and (CE_SELF_DEBUFF(620314) == false) and energia >= 25 then
		UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Cuchillada alevosa
	elseif CUCH_ALEV_SKILL and CUCH_ALEV_CD <= 0.45 and (CE_SELF_DEBUFF(620313) == false) and energia >= 20 then
		UseSkill(CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);
	--Canalización de energía
	elseif CAN_ENE_SKILL and CAN_ENE_CD <= 0.45 and (CE_DebuffIdTarget(621166) == true) and ira >= 25 then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2);
	--Marca de garra ISS
	elseif energia >= 20 and (CE_DebuffIdTarget(508530) == false) and (CE_ISS_CD(CE_toName(490144)) == true) then
		CastSpellByName(CE_toName(490144));
	--Electrocusión
	elseif ELEC_SKILL and ELEC_CD <= 0.45 and energia > 35 then
		UseSkill(ELEC_ID_1, ELEC_ID_2);
	--Arrojar
	elseif ARR_SKILL and ARR_CD <= 0.45 then
		UseSkill(ARR_ID_1, ARR_ID_2);
	--Embestida brutal
	elseif EMB_BRU_SKILL and EMB_BRU_CD <= 0.45 and ira >= 20 then
		UseSkill(EMB_BRU_ID_1, EMB_BRU_ID_2);
	end
end

function CE_ROGUE_CHAMPION_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 490314, 490355, 498025, 499816, 1490328, 498837, 498828, 490356, 498833, 498834, 1490395, 1490392, 1490401, 490144, 1490327, 1490393, 1490400 };
	local conditions = {
		--poción de enano 1244064
		[1] = { [5]={ max="40", min="0", status=true }, [40]={ enable=true, status=true }},
		--estimulante fuerte 200173
		[2] = { [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--agilidad elfica 1244062
		[3] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--filete de costilla 1244060
		[4] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--tormento venenoso 490314
		[5] = { [12]={ id1="500093", id2="0", id3="0", id4="0", status=true }},
		--maniobra abandonada 490355
		[6] = { [12]={ id1="500744", id2="0", id3="0", id4="0", status=true }},
		--manos venenosas 498025
		[7] = { [12]={ id1="1503291", id2="0", id3="0", id4="0", status=true }},
		--sombra desarticulada 499816
		[8] = { [12]={ id1="623470", id2="0", id3="0", id4="0", status=true }},
		-- Ataque a la herida 1490328
		[9] = {
			[5]={ max="100", min="35", status=true },
			[34]={ id1="620313", id2="0", id3="0", id4="620314", status=true }
		},
		-- Mecanismo de entrenamiento 498837
		[10] = {},
		-- Mecanismo de poder (498828)
		[11] = { [6]={ max="100", min="10", status=true }},
		-- Cicatriz de la garra ISS 490356
		[12] = {
			[5]={ max="100", min="35", status=true },
			[32]={ id1="508530", id2="0", id3="0", id4="0", status=true }
		},
		-- Bomba silenciosa 498833
		[13] = {
			[6]={ max="100", min="30", status=true },
			[33]={ id1="621610", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true },
			[43]={ enable=true, status=true } 
		},
		-- Bomba de pulso rúnico 498834
		[14] = {
			[6]={ max="100", min="20", status=true },
			[32]={ id1="621610", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true },
			[43]={ enable=true, status=true } 
		},
		-- Golpe bajo 1490395
		[15] = {
			[5]={ max="100", min="30", status=true },
			[34]={ id1="620313", id2="", id3="0", id4="0", status=true },
			[35]={ id1="620314", id2="0", id3="0", id4="0", status=true }
		},
		-- Cuchillada alevosa 1490392
		[16] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="6203134", id3="0", id4="0", status=true }
		},
		-- Canalización de energía 1490401
		[17] = {
			[6]={ max="100", min="25", status=true },
			[32]={ id1="621166", id2="0", id3="0", id4="0", status=true }
		},
		-- Marca de garra ISS 490144
		[18] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="508530", id2="0", id3="0", id4="0", status=true }
		},
		-- Electrocusión 1490327
		[19] = { [5]={ max="100", min="35", status=true }},
		-- Arrojar 1490393
		[20] = {},
		-- Embestida brutal 1490400
		[21] = { [6]={ max="100", min="20", status=true }}
	};
	local iss = {
		[490314] = true,
		[490345] = true,
		[490144] = true,
		[490356] = true
	};
	local consumables = {
		[1244064] = true,
		[200173] = true,
		[1244062] = true,
		[1244060] = true
	};
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
