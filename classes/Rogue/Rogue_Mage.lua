--Lua Rouge/Mage BY NEORAXER 06-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_ROGUE_MAGE()
	local energia = UnitMana("player");
	
	--Premeditación
	local PRE_SKILL, PRE_ID_1, PRE_ID_2 = Match_CE(491182);
	local PRE_CD = CE_CD(PRE_SKILL, PRE_ID_1, PRE_ID_2);
	--Cuchillas de infierno
	local CUCH_INF_SKILL, CUCH_INF_ID_1, CUCH_INF_ID_2 = Match_CE(497205);
	local CUCH_INF_CD = CE_CD(CUCH_INF_SKILL, CUCH_INF_ID_1, CUCH_INF_ID_2);
	--Espada de Tártaro
	local ESP_TAR_SKILL, ESP_TAR_ID_1, ESP_TAR_ID_2 = Match_CE(491186);
	local ESP_TAR_CD = CE_CD(ESP_TAR_SKILL, ESP_TAR_ID_1, ESP_TAR_ID_2);
	--Ráfaga de lluvia de Cuchillas
	local RAF_LLU_SKILL, RAF_LLU_ID_1, RAF_LLU_ID_2 = Match_CE(491183);
	local RAF_LLU_CD = CE_CD(RAF_LLU_SKILL, RAF_LLU_ID_1, RAF_LLU_ID_2);
	--Ataque a la herida
	local ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2 = Match_CE(1490432);
	local ATA_HER_CD = CE_CD(ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2);		
	--Golpe bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(1490431);
	local GOL_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2);	
	--Cuchillada alevosa
	local CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2 = Match_CE(1490430);
	local CUCH_ALEV_CD = CE_CD(CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);	
	--Filo vivo
	local FIL_VIV_SKILL, FIL_VIV_ID_1, FIL_VIV_ID_2 = Match_CE(491180);
	local FIL_VIV_CD = CE_CD(FIL_VIV_SKILL, FIL_VIV_ID_1, FIL_VIV_ID_2);
	--Arrojar
	local ARR_SKILL, ARR_ID_1, ARR_ID_2 = Match_CE(490309);
	local ARR_CD = CE_CD(ARR_SKILL, ARR_ID_1, ARR_ID_2);	
	--Maniobra abandonada
	local MAN_ABA_SKILL, MAN_ABA_ID_1, MAN_ABA_ID_2 = Match_CE(490355);
	--Daga del caos
	local DAG_CAOS_SKILL, DAG_CAOS_ID_1, DAG_CAOS_ID_2 = Match_CE(491178);
	--Shadow slash
	local SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2 = Match_CE(1493673);
	local SHADOW_SLASH_CD = CE_CD(SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);
	
	--BUFFOS--
	if MAN_ABA_SKILL and (CE_BuffIdPlayer(500744) == false) then
		UseSkill(MAN_ABA_ID_1, MAN_ABA_ID_2); --Maniobra abandonada
	elseif DAG_CAOS_SKILL and (CE_BuffIdPlayer(501274) == false) then
		UseSkill(DAG_CAOS_ID_1, DAG_CAOS_ID_2); --Daga del caos
	elseif (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314))
		then CastSpellByName(CE_toName(490314)); --Tormento venenoso
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if (energia <= 40 ) and CE_UseItem(1244064) then
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
	--Premeditación
	if PRE_SKILL and PRE_CD <= 0.45 and energia >= 15
		then UseSkill(PRE_ID_1, PRE_ID_2);
	--Perfect Slide	
	elseif CE_PERFECT_SLIDE() then	
	--Golpe bajo con ira asesina
	elseif GOL_BAJ_SKILL and energia >= 30 and CE_BuffIdPlayer(500960) and CE_SELF_DEBUFF(620313)
		then UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Cuchillas de infierno
	elseif CUCH_INF_SKILL and CUCH_INF_CD <= 0.45 and _G.C_EngineSettings.AOE
		then UseSkill(CUCH_INF_ID_1, CUCH_INF_ID_2);
	--Espada de Tártaro
	elseif ESP_TAR_SKILL and ESP_TAR_CD <= 0.45
		then UseSkill(ESP_TAR_ID_1, ESP_TAR_ID_2);
	--Cuchillada alevosa
	elseif CUCH_ALEV_SKILL and CUCH_ALEV_CD <= 0.45 and (CE_SELF_DEBUFF(620313) == false) and energia >= 15
		then UseSkill(CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);
	--Golpe bajo
	elseif GOL_BAJ_SKILL and GOL_BAJ_CD <= 0.45 and CE_SELF_DEBUFF(620313) and (CE_SELF_DEBUFF(620314) == false) and energia >= 25
		then UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Shadow slash
	elseif SHADOW_SLASH_CD <= 0.25 and energia >= 25 and CE_BuffIdPlayer(1502730) then
		UseSkill(SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);
	--Ataque a la herida
	elseif ATA_HER_SKILL and ATA_HER_CD <= 0.45 and ( CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(620314) ) and energia >= 30 and CE_WEAPON_TYPE("Daga") then
		UseSkill(ATA_HER_ID_1, ATA_HER_ID_2);
	--Ráfaga de lluvia de Cuchillas
	elseif RAF_LLU_SKILL and RAF_LLU_CD <= 0.45 and _G.C_EngineSettings.AOE
		then UseSkill(RAF_LLU_ID_1, RAF_LLU_ID_2);	
	--Tempestad del alma
	elseif energia >= 13 and CE_ISS_CD(CE_toName(490345)) and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() then 
		CastSpellByName(CE_toName(490345));
	--Marca de garra ISS      
	elseif energia >= 20 and (CE_DebuffIdTarget(508530) == false) and (CE_ISS_CD(CE_toName(490144)) == true) then 
		CastSpellByName(CE_toName(490144));
	--Cicatriz de la garra ISS
	elseif (energia >= 35) and (CE_DebuffIdTarget(508530) == true) and (CE_ISS_CD(CE_toName(490356)) == true) then 
		CastSpellByName(CE_toName(490356));		
	--Filo vivo
	elseif FIL_VIV_SKILL and FIL_VIV_CD <= 0.25 and _G.C_EngineSettings.AOE then
		SpellTargetUnit("mouseover");
		UseSkill(FIL_VIV_ID_1, FIL_VIV_ID_2);
	--Arrojar
	elseif ARR_SKILL and ARR_CD <= 0.45
		then UseSkill(ARR_ID_1, ARR_ID_2);
	end	
end

function CE_ROGUE_MAGE_IMPORT()	
	local Skills = { 490355, 491178, 490314, 1244064, 200173, 1244062, 1244060, 491182, 1491731, 1490431, 497205, 491186, 1490430, 1490431, 1490432, 491183, 490345, 490144, 490356, 491180, 490309};
	local conditions = {
		[1] = { [12]={ id1="500744", id2="0", id3="0", id4="0", status=true }},
		[2] = { [12]={ id1="501274", id2="0", id3="0", id4="0", status=true }},
		[3] = { [12]={ id1="500093", id2="0", id3="0", id4="0", status=true }},
		--poción de enano
		[4] = { [5]={ max="40", min="0", status=true }, [40]={ enable=true, status=true }},
		--estimulante fuerte
		[5] = { [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--agilidad elfica
		[6] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--filete de costilla
		[7] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		[8] = { [5]={ max="100", min="15", status=true }},
		[9] = { [42]={ enable=true, status=true }},
		[10] = { [5]={ max="100", min="30", status=true }, [11]={ id1="500960", id2="0", id3="0", id4="0", status=true }, [34]={ id1="620313", id2="0", id3="0", id4="0", status=true }},
		[11] = { [39]={ enable=true, status=true }},
		[12] = {},
		[13] = { [5]={ max="100", min="15", status=true }, [35]={ id1="620313", id2="0", id3="0", id4="0", status=true }},
		[14] = { [5]={ max="100", min="25", status=true }, [34]={ id1="620313", id2="0", id3="0", id4="0", status=true }, [35]={ id1="620314", id2="0", id3="0", id4="0", status=true }},
		[15] = { [5]={ max="100", min="30", status=true }, [34]={ id1="620313", id2="620314", id3="0", id4="0", status=true } },
		[16] = { [39]={ enable=true, status=true }},
		[17] = { [39]={ enable=true, status=true }, [45]={ enable=true, status=true }},
		[18] = { [5]={ max="100", min="20", status=true }, [33]={ id1="508530", id2="0", id3="0", id4="0", status=true }},
		[19] = { [5]={ max="100", min="35", status=true }, [32]={ id1="508530", id2="0", id3="0", id4="0", status=true }},
		[20] = { [39]={ enable=true, status=true }, [43]={ enable=true, status=true }},
		[21] = {},
	};

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
	
	return CE_Import_MakeExport( Skills, iss, consumables, conditions )

end