--Lua ROGUE/DRUID BY NEORAXER 11-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_ROGUE_DRUID()
	--DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/DRUIDA")
	local energia = UnitMana("player");
	local mana = UnitSkill("player");
	
	--Maniobra abandonada
	local MAN_ABA_SKILL, MAN_ABA_ID_1, MAN_ABA_ID_2 = Match_CE(490355);
	--Manos venenosas
	local MAN_VEN_SKILL, MAN_VEN_ID_1, MAN_VEN_ID_2 = Match_CE(498025);
	--Venganza histrica
	local VEN_HIS_SKILL, VEN_HIS_ID_1, VEN_HIS_ID_2 = Match_CE(494046);
	--Plegaria de conenctración
	local PLEG_CON_SKILL, PLEG_CON_ID_1, PLEG_CON_ID_2 = Match_CE(493530);
	--Bendición salvaje
	local BEN_SAL_SKILL, BEN_SAL_ID_1, BEN_SAL_ID_2 = Match_CE(493531);	
	--Tiempo de matar
	local TIE_MAT_SKILL, TIE_MAT_ID_1, TIE_MAT_ID_2 = Match_CE(499567);
	local TIE_MAT_CD = CE_CD(TIE_MAT_SKILL, TIE_MAT_ID_1, TIE_MAT_ID_2);
	--Injuria
	local INJU_MAT_SKILL, INJU_ID_1, INJU_ID_2 = Match_CE(494548);
	local INJU_CD = CE_CD(INJU_MAT_SKILL, INJU_ID_1, INJU_ID_2);
	--Cuchillada alevosa
	local CUC_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2 = Match_CE(1490378);
	local CUC_ALE_CD = CE_CD(CUC_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2);
	--Ataque a la herida
	local ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2 = Match_CE(1490374);
	local ATA_HER_CD = CE_CD(ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2);
	--Mortaja venenosa
	local MOR_VEN_SKILL, MOR_VEN_ID_1, MOR_VEN_ID_2 = Match_CE(499569);
	local MOR_VEN_CD = CE_CD(MOR_VEN_SKILL, MOR_VEN_ID_1, MOR_VEN_ID_2);	
	--Punto ciego
	local PUN_CIE_SKILL, PUN_CIE_ID_1, PUN_CIE_ID_2 = Match_CE(1490375);
	local PUN_CIE_CD = CE_CD(PUN_CIE_SKILL, PUN_CIE_ID_1, PUN_CIE_ID_2);
	--Golpe bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(1490373);
	local GOL_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2);	
	--Latido de la tierra
	local LAT_TIE_SKILL, LAT_TIE_ID_1, LAT_TIE_ID_2 = Match_CE(1490287);
	local LAT_TIE_CD = CE_CD(LAT_TIE_SKILL, LAT_TIE_ID_1, LAT_TIE_ID_2);		
	--Arrojar
	local ARR_SKILL, ARR_ID_1, ARR_ID_2 = Match_CE(1490379);
	local ARR_CD = CE_CD(ARR_SKILL, ARR_ID_1, ARR_ID_2);	
	--Shadow slash
	local SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2 = Match_CE(1493673);
	local SHADOW_SLASH_CD = CE_CD(SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);
	
	--BUFFOS--
	
	--Maniobra abandonada
	if MAN_ABA_SKILL and (CE_BuffIdPlayer(500744) == false) then
		UseSkill(MAN_ABA_ID_1, MAN_ABA_ID_2);
	--Tormento venenoso
	elseif (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314))
		then CastSpellByName(CE_toName(490314));
	--Manos venenosas
	elseif MAN_VEN_SKILL and (CE_BuffIdPlayer(620320) == false) and CE_isMoving() == false  then
		UseSkill(MAN_VEN_ID_1, MAN_VEN_ID_2);
	--Venganza histérica
	elseif VEN_HIS_SKILL and CE_BuffIdPlayer(504555) == false then
		UseSkill(VEN_HIS_ID_1, VEN_HIS_ID_2);
	--Plegaria de conenctración
	elseif PLEG_CON_SKILL and CE_BuffIdPlayer(503799) == false and not UnitInParty( "player" ) then
		UseSkill(PLEG_CON_ID_1, PLEG_CON_ID_2);
	--Bendición Salvaje
	elseif BEN_SAL_SKILL and CE_BuffIdPlayer(503799) == false and not UnitInParty( "player" ) then
		UseSkill(BEN_SAL_ID_1, BEN_SAL_ID_2);
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

	--Tiempo de matar
	if TIE_MAT_SKILL and TIE_MAT_CD <= 0.25 and energia >= 15 and CE_DebuffIdTarget(623101) == false and C_EngineSettings.FastBuffs
		then UseSkill(TIE_MAT_ID_1, TIE_MAT_ID_2);
	--Injuria
	elseif INJU_MAT_SKILL and INJU_CD <= 0.25 and C_EngineSettings.FastBuffs then
		UseSkill(INJU_ID_1, INJU_ID_2);
	--Perfect Slide	
	elseif CE_PERFECT_SLIDE() then	
	--Mortaja venenosa
	elseif MOR_VEN_SKILL and MOR_VEN_CD <= 0.25 and _G.C_EngineSettings.AOE and mana >= 1000 then
		SpellTargetUnit("mouseover");
		UseSkill(MOR_VEN_ID_1, MOR_VEN_ID_2);	
	--Tempestad del alma
	elseif energia >= 13 and CE_ISS_CD(CE_toName(490345)) and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() then 
		CastSpellByName(CE_toName(490345));	
	--Latido de la tierra 
	elseif LAT_TIE_SKILL and  LAT_TIE_CD <= 0.25 and _G.C_EngineSettings.AOE and mana > 500
		then UseSkill(LAT_TIE_ID_1, LAT_TIE_ID_2);
	--Cuchillada alevosa
	elseif CUC_ALE_SKILL and CUC_ALE_CD <= 0.25 and energia >= 20 and CE_SELF_DEBUFF(620313) == false
		then UseSkill(CUC_ALE_ID_1, CUC_ALE_ID_2);
	--Shadow slash
	elseif SHADOW_SLASH_CD <= 0.25 and energia >= 25 and CE_BuffIdPlayer(1502730) then
		UseSkill(SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);
	--Ataque a la herida
	elseif ATA_HER_SKILL and ATA_HER_CD <= 0.45 and ( CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(620314) ) and energia >= 30 and CE_WEAPON_TYPE("Daga") then
		UseSkill(ATA_HER_ID_1, ATA_HER_ID_2);		
	--Punto ciego
	elseif PUN_CIE_SKILL and PUN_CIE_CD <= 0.25 and energia >= 15
		then UseSkill(PUN_CIE_ID_1, PUN_CIE_ID_2);			
	--Golpe bajo
	elseif GOL_BAJ_SKILL and GOL_BAJ_CD <= 0.45 and CE_SELF_DEBUFF(620313) and (CE_SELF_DEBUFF(620314) == false) and energia >= 25
		then UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Cicatriz de la garra ISS
	elseif (energia >= 35) and (CE_DebuffIdTarget(508530) == true) and (CE_ISS_CD(CE_toName(490356)) == true) then 
		CastSpellByName(CE_toName(490356));
	--Marca de garra ISS      
	elseif energia >= 20 and (CE_DebuffIdTarget(508530) == false) and (CE_ISS_CD(CE_toName(490144)) == true) then 
		CastSpellByName(CE_toName(490144));	
	--Arrojar
	elseif ARR_SKILL and ARR_CD <= 0.25
		then UseSkill(ARR_ID_1, ARR_ID_2);		
	end
end

function CE_ROGUE_DRUID_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 490314, 490355, 498025, 494046, 493530, 493531, 499567, 494548, 1491731, 494961, 490345, 1490287, 1490378, 1493673, 1490374, 1490375, 1490373, 490356, 490144, 1490379};
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
			[12]={ id1="620320", id2="0", id3="0", id4="0", status=true },
			[19]={ enable=true, status=true } 
		  },
		--venganza histórica
		[8] = { [12]={ id1="504555", id2="0", id3="0", id4="0", status=true } },
		--plegaria de conenctración
		[9] = { [12]={ id1="503799", id2="0", id3="0", id4="0", status=true } },
		--bendición salvaje
		[10] = { [12]={ id1="503799", id2="0", id3="0", id4="0", status=true } },
		--tiempo de matar
		[11] = {
			[5]={ max="100", min="15", status=true },
			[35]={ id1="623101", id2="0", id3="0", id4="0", status=true },
			[41]={ enable=true, status=true } 
		  },
		--injuria
		[12] ={ [41]={ enable=true, status=true } },
		--perfect slide
		[13] = { [42]={ enable=true, status=true } },
		--mortaja venenosa
		[14] = {
			[2]={ max="200", min="1", status=true },
			[39]={ enable=true, status=true },
			[43]={ enable=true, status=true } 
		  },
		--tempestad del alma
		[15] ={
			[5]={ max="100", min="13", status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true } 
		  },
		--latido de la tierra
		[16] = { [2]={ max="200", min="2", status=true }, [39]={ enable=true, status=true } },
		--cuchillada alevosa
		[17] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="0", id3="0", id4="0", status=true } 
		  },
		--ataque a la herida
		[18] = {
			[5]={ max="100", min="25", status=true },
			[11]={ id1="1502730", id2="0", id3="0", id4="0", status=true } 
		  },
		[19] = {
			[5]={ max="100", min="30", status=true },
			[34]={ id1="620314", id2="0", id3="0", id4="620313", status=true } 
		  },
		--punto ciego
		[20] = { [5]={ max="100", min="13", status=true } },
		--golpe bajo
		[21] = {
			[5]={ max="100", min="25", status=true },
			[34]={ id1="620313", id2="0", id3="0", id4="0", status=true },
			[35]={ id1="620314", id2="0", id3="0", id4="0", status=true } 
		  },
		--cicatriz de la garra ISS
		[22] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
		--marca de garra ISS
		[23] = {
			[5]={ max="100", min="35", status=true },
			[32]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
		--arrojar
		[24] = {},

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
	
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
