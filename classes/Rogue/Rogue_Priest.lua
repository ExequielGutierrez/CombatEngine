--Lua ROUGE/PRIEST BY NEORAXER 05-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_ROGUE_PRIEST()
	local energia = UnitMana("player")
	local mana = UnitSkill("player")
	local MaxPm = UnitMaxSkill("player")
	
	--Paciencia y salvación
	local PAC_SAL_SKILL, PAC_SAL_ID_1, PAC_SAL_ID_2 = Match_CE(492921);
	local PAC_SAL_CD = CE_CD(PAC_SAL_SKILL, PAC_SAL_ID_1, PAC_SAL_ID_2);
	--Golpe bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(1490384);
	local GOL_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Ataque a la herida
	local ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2 = Match_CE(1490385);
	local ATA_HER_CD = CE_CD(ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2);
	--Cuchillada alevosa
	local CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2 = Match_CE(1490389);
	local CUCH_ALEV_CD = CE_CD(CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);
	--Niebla perturbadora
	local NIE_PER_SKILL, NIE_PER_ID_1, NIE_PER_ID_2 = Match_CE(493260);
	local NIE_PER_CD = CE_CD(NIE_PER_SKILL, NIE_PER_ID_1, NIE_PER_ID_2);
	--Patada
	local PAT_SKILL, PAT_ID_1, PAT_ID_2 = Match_CE(492627);
	local PAT_CD = CE_CD(PAT_SKILL, PAT_ID_1, PAT_ID_2);
	--Arrojar
	local ARR_SKILL, ARR_ID_1, ARR_ID_2 = Match_CE(1490390);
	local ARR_CD = CE_CD(ARR_SKILL, ARR_ID_1, ARR_ID_2);
	
	--Sin miedo
	local SIN_MIE_SKILL, SIN_MIE_ID_1, SIN_MIE_ID_2 = Match_CE(491540);
	--Maniobra abandonada
	local MAN_ABA_SKILL, MAN_ABA_ID_1, MAN_ABA_ID_2 = Match_CE(490355);
	--Manos venenosas
	local MAN_VEN_SKILL, MAN_VEN_ID_1, MAN_VEN_ID_2 = Match_CE(498025);
	--Ataque amplificado
	local ATA_AMP_SKILL, ATA_AMP_ID_1, ATA_AMP_ID_2 = Match_CE(490491);
	--Gracia vital
	local GRA_VIT_SKILL, GRA_VIT_ID_1, GRA_VIT_ID_2 = Match_CE(490290);
	--Agua bendita
	local AGU_BEN_SKILL, AGU_BEN_ID_1, AGU_BEN_ID_2 = Match_CE(490298);
	--Metodos siniestros
	local MET_SIN_SKILL, MET_SIN_ID_1, MET_SIN_ID_2 = Match_CE(493020);
	--Despertar del monje
	local DES_MON_SKILL, DES_MON_ID_1, DES_MON_ID_2 = Match_CE(491536);
	local DES_MON_CD = CE_CD(DES_MON_SKILL, DES_MON_ID_1, DES_MON_ID_2);
	--Shadow slash
	local SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2 = Match_CE(1493673);
	local SHADOW_SLASH_CD = CE_CD(SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);

	--BUFFOS--
	--Tormento venenoso
	if (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314)) then
		CastSpellByName(CE_toName(490314));
	--Maniobra abandonada
	elseif MAN_ABA_SKILL and (CE_BuffIdPlayer(500744) == false) then
		UseSkill(MAN_ABA_ID_1, MAN_ABA_ID_2);
	--Manos venenosas
	elseif MAN_VEN_SKILL and (CE_BuffIdPlayer(500715) == false) and CE_isMoving() == false then
		UseSkill(MAN_VEN_ID_1, MAN_VEN_ID_2);
	--Sin Miedo
	elseif SIN_MIE_SKILL and (CE_BuffIdPlayer(501933) == false) then
		UseSkill(SIN_MIE_ID_1, SIN_MIE_ID_2);
	--Ataque amplificado
	elseif ATA_AMP_SKILL and (CE_BuffIdPlayer(500940) == false) and not UnitInParty("player") then
		UseSkill(ATA_AMP_ID_1, ATA_AMP_ID_2);
	--Gracia vital
	elseif GRA_VIT_SKILL and (CE_BuffIdPlayer(500517) == false) and not UnitInParty("player") then
		UseSkill(GRA_VIT_ID_1, GRA_VIT_ID_2);
	--Agua bendita
	elseif AGU_BEN_SKILL and (CE_BuffIdPlayer(500536) == false) and not UnitInParty("player") then
		UseSkill(AGU_BEN_ID_1, AGU_BEN_ID_2);
	--Metodos siniestros
	elseif CE_BuffIdPlayer(503265) == false then
		UseSkill(MET_SIN_ID_1, MET_SIN_ID_2);
	--Despertar del monje
	elseif DES_MON_CD <= 0.25 and _G.C_EngineSettings.FastBuffs then
		UseSkill(DES_MON_ID_1, DES_MON_ID_2);
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if (energia <= 40) and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		-- Phirius Tipo E ID 203503
		elseif mana <= (MaxPm/100 * 20) and CE_UseItem(203503) then
		--Estimulante fuerte
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end
	
	--ROTACION--
	--Paciencia y salvación
	if PAC_SAL_SKILL and (CE_BuffIdPlayer(1500595) == false) and C_EngineSettings.FastBuffs then
		UseSkill(PAC_SAL_ID_1,PAC_SAL_ID_2);
	--Perfect Slide
	elseif CE_PERFECT_SLIDE() then
	--Tempestad del alma
	elseif (energia>=13) and (CE_ISS_CD(CE_toName(490345)) == true) and _G.C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490345));
	--Shadow slash
	elseif SHADOW_SLASH_CD <= 0.25 and energia >= 25 and CE_BuffIdPlayer(1502730) then
		UseSkill(SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);
	--Ataque a la herida
	elseif ATA_HER_SKILL and ATA_HER_CD <= 0.45 and ( CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(500704) ) and energia >= 30 and CE_WEAPON_TYPE("Daga") then
		UseSkill(ATA_HER_ID_1, ATA_HER_ID_2);
	--Niebla perturbadora
	elseif NIE_PER_SKILL and NIE_PER_CD <= 0.45 and _G.C_EngineSettings.AOE and mana > MaxPm/20 then
		UseSkill(NIE_PER_ID_1,NIE_PER_ID_2);
	--Golpe bajo
	elseif GOL_BAJ_SKILL and GOL_BAJ_CD <= 0.45 and (CE_BuffIdPlayer(500704)==false) and energia >= 26 then
		UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Cicatriz de la garra ISS
	elseif (energia >= 35) and (CE_DebuffIdTarget(508530) == true) and (CE_ISS_CD(CE_toName(490356)) == true) then
		CastSpellByName(CE_toName(490356));
	--Marca de garra ISS
	elseif (energia >= 20) and (CE_DebuffIdTarget(508530) == false) and (CE_ISS_CD(CE_toName(490144)) == true) then
		CastSpellByName(CE_toName(490144));
	--Cuchillada alevosa
	elseif CUCH_ALEV_SKILL and CUCH_ALEV_CD <= 0.45 and (CE_SELF_DEBUFF(620313) == false) and energia >= 20 then
		UseSkill(CUCH_ALEV_ID_1,CUCH_ALEV_ID_2);
	--Patada
	elseif PAT_SKILL and PAT_CD <= 0.45 and (CE_DebuffIdTarget(502896) == false) then
		UseSkill(PAT_ID_1,PAT_ID_2);
	--Arrojar
	elseif ARR_SKILL and ARR_CD <= 0.45 then
		UseSkill(ARR_ID_1,ARR_ID_2);
	end
end

function CE_ROGUE_PRIEST_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 490314, 490355, 498025, 491540, 490491, 490290, 490298, 493020, 491536, 492921, 1491731, 490345, 1493673, 1490385, 493260, 1490384, 490356, 490144, 1490389, 492627, 1490390 }
	local conditions = {
		--poción de enano
		[1] = { [5]={ max="40", min="0", status=true }, [40]={ enable=true, status=true }},
		--estimulante fuerte
		[2] ={ [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--agilidad elfica
		[3] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--filete de costilla
		[4] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--tormento venenoso
		[5] = { [12]={ id1="500093", id2="0", id3="0", id4="0", status=true } },
		--maniobra abandonada
		[6] = { [12]={ id1="500744", id2="0", id3="0", id4="0", status=true } },
		--manos venenosas
		[7] = {
			[12]={ id1="500715", id2="0", id3="0", id4="0", status=true },
			[19]={ enable=true, status=true } 
		  },
		--Sin Miedo 491540
		[8] = { [12]={ id1="501933", id2="0", id3="0", id4="0", status=true } },
		--Ataque amplificado 490491
		[9] = { [12]={ id1="500940", id2="0", id3="0", id4="0", status=true } },
		--Gracia vital 490290
		[10] = { [12]={ id1="500517", id2="0", id3="0", id4="0", status=true } },
		--Agua bendita 490298
		[11] = { [12]={ id1="500536", id2="0", id3="0", id4="0", status=true } },
		--Metodos siniestros 493020
		[12] = { [12]={ id1="503265", id2="0", id3="0", id4="0", status=true } },
		--Despertar del monje 491536
		[13] = { [2]={ max="200", min="15", status=true }, [41]={ enable=true, status=true } },
		--Paciencia y salvación 492921
		[14] = { [12]={ id1="1500595", id2="0", id3="0", id4="0", status=true } },
		--Perfect Slide	1491731
		[15] =  { [42]={ enable=true, status=true } },
		--Tempestad del alma 490345
		[16] =  { [5]={ max="100", min="13", status=true }, [39]={ enable=true, status=true } },
		--Shadow slash 1493673
		[17] = {
			[5]={ max="100", min="24", status=true },
			[11]={ id1="1502730", id2="0", id3="0", id4="0", status=true } 
		  },
		--Ataque a la herida 1490385
		[18] = {
			[5]={ max="100", min="35", status=true },
			[34]={ id1="620313", id2="500704", id3="0", id4="0", status=true } 
		  },
		--Niebla perturbadora 493260
		[19] = { [2]={ max="200", min="5", status=true }, [39]={ enable=true, status=true } },
		--Golpe bajo 1490384
		[20] = {
			[5]={ max="100", min="30", status=true },
			[34]={ id1="620313", id2="", id3="0", id4="0", status=true },
			[35]={ id1="500704", id2="0", id3="0", id4="0", status=true } 
		  },
		--Cicatriz de la garra ISS 490356
		[21] = {
			[5]={ max="100", min="35", status=true },
			[32]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
		--Marca de garra ISS 490144
		[22] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
		--Cuchillada alevosa 1490389
		[23] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="0", id3="0", id4="0", status=true } 
		  },
		--Patada 492627
		[24] = { [2]={ max="100", min="2", status=true } },
		--Arrojar 1490390
		[25] = {},
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
