--Lua ROUGE/SCOUT BY NEORAXER 05-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
function CE_ROGUE_SCOUT()
	local energia = UnitMana("player")
	local foco = UnitSkill("player")
	local Hp_Target = UnitHealth("target")
	local HpMaxTarget = UnitMaxHealth("target")
	--Ataque a la herida
	local ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2 = Match_CE(490313);
	local ATA_HER_CD = CE_CD(ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2);
	--Precisión
	local PREC_SKILL, PREC_ID_1, PREC_ID_2 = Match_CE(491528);
	--Sorteo rápido
	local SOR_RAP_SKILL, SOR_RAP_ID_1, SOR_RAP_ID_2 = Match_CE(491532);
	local SOR_RAP_CD = CE_CD(SOR_RAP_SKILL, SOR_RAP_ID_1, SOR_RAP_ID_2);
	--Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(1490979);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
	--Cuchillada alevosa
	local CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2 = Match_CE(490306);
	local CUCH_ALEV_CD = CE_CD(CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);
	--Golpe bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(491534);
	local GOL_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Punto ciego
	local PUN_CIE_SKILL, PUN_CIE_ID_1, PUN_CIE_ID_2 = Match_CE(490311);
	local PUN_CIE_CD = CE_CD(PUN_CIE_SKILL, PUN_CIE_ID_1, PUN_CIE_ID_2);
	--Tiro
	local TIRO_SKILL, TIRO_ID_1, TIRO_ID_2 = Match_CE(491531);
	local TIRO_CD = CE_CD(TIRO_SKILL, TIRO_ID_1, TIRO_ID_2);
	--Manos vigorizadas
	local MAN_VIG_SKILL, MAN_VIG_ID_1, MAN_VIG_ID_2 = Match_CE(490347);
	--Shadow slash
	local SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2 = Match_CE(1493673);
	local SHADOW_SLASH_CD = CE_CD(SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);

	--BUFFOS--
	--Manos vigorizadas
	if MAN_VIG_SKILL and (CE_BuffIdPlayer(500737) == false) then
		UseSkill(MAN_VIG_ID_1, MAN_VIG_ID_2);
	--Tormento venenoso
	elseif (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314)) then
		CastSpellByName(CE_toName(490314));
	end
	--COMIDAS--
	if _G.C_EngineSettings.consumables then
		--Usar poción del enano
		if (energia <= 40 or foco <= 20) and CE_UseItem(1244064) then
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
	--Precisión
	if PREC_SKILL and (CE_BuffIdPlayer(501924) == false) and C_EngineSettings.FastBuffs then
		UseSkill(PREC_ID_1, PREC_ID_2);
	--Perfect Slide
	elseif CE_PERFECT_SLIDE() then
	--Golpe bajo con ira asesina
	elseif GOL_BAJ_SKILL and energia >= 30 and CE_BuffIdPlayer(500960) and CE_SELF_DEBUFF(620313) then
		UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Shadow slash
	elseif SHADOW_SLASH_CD <= 0.25 and energia >= 25 and CE_BuffIdPlayer(1502730) then
		UseSkill(SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);
	--Ataque a la herida
	elseif ATA_HER_SKILL and ATA_HER_CD <= 0.45 and ( CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(620314) ) and energia >= 30 and CE_WEAPON_TYPE("Daga") then
		UseSkill(ATA_HER_ID_1, ATA_HER_ID_2);
	--Cuchillada alevosa
	elseif CE_SELF_DEBUFF(620313) == false and energia >= 15 then
		UseSkill(CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);
	--Tempestad del alma
	elseif energia >= 13 and CE_ISS_CD(CE_toName(490345)) and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() then
		CastSpellByName(CE_toName(490345));
	--Precisión
	elseif PREC_SKILL and foco >= 50 and (CE_BuffIdPlayer(501924) == false) and ( not CE_TARGET_IS_BOSS() and Hp_Target >= HpMaxTarget*30/100 ) or CE_TARGET_IS_BOSS() then
		UseSkill(PREC_ID_1, PREC_ID_2);
	--Sorteo rápido
	elseif SOR_RAP_SKILL and SOR_RAP_CD <= 0.45 and CE_BuffIdPlayer(501924) and energia >= 30 and _G.C_EngineSettings.AOE then
		UseSkill(SOR_RAP_ID_1, SOR_RAP_ID_2);
	--Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_CD <= 0.45 and foco >= 25 then
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
	--Cicatriz de la garra ISS
	elseif (energia >= 35) and (CE_DebuffIdTarget(508530) == true) and (CE_ISS_CD(CE_toName(490356)) == true) and CE_TARGET_IS_BOSS() then
		CastSpellByName(CE_toName(490356));
	--Golpe bajo
	elseif GOL_BAJ_SKILL and GOL_BAJ_CD <= 0.45 and CE_SELF_DEBUFF(620313) or (CE_SELF_DEBUFF(620314) == false) and energia >= 25 then
		UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Ataque a la herida
	elseif HER_GRA_SKILL and HER_GRAV_CD <= 0.45 and CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(620314) and energia >= 30 and CE_WEAPON_TYPE("Daga") then
		UseSkill(HER_GRA_ID_1, HER_GRA_ID_2);
	--Punto ciego
	elseif PUN_CIE_SKILL and PUN_CIE_CD <= 0.45 and energia >= 25 and (CE_DebuffIdTarget(620297) == false) and ( not CE_TARGET_IS_BOSS() and Hp_Target >= HpMaxTarget*50/100 ) or CE_TARGET_IS_BOSS() then
		UseSkill(PUN_CIE_ID_1, PUN_CIE_ID_2);
	--Marca de garra ISS
	elseif (energia >= 20) and (CE_DebuffIdTarget(508530) == false) and (CE_ISS_CD(CE_toName(490144)) == true) and CE_TARGET_IS_BOSS() then
		CastSpellByName(CE_toName(490144));
	--Tiro
	elseif TIRO_SKILL and TIRO_CD <= 0.45 then
		UseSkill(TIRO_ID_1, TIRO_ID_2);
	--Golpe bajo
	elseif GOL_BAJ_SKILL and GOL_BAJ_CD <= 0.45 and energia >= 25 then
		UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	end
end

function CE_ROGUE_SCOUT_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 490314, 490347, 491528, 1491731, 491534, 1493673, 490313, 490306, 490345, 491528, 491532, 1490979, 490356, 491534, 490313, 490311, 490144, 491531 }
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
		[5] = { [12]={ id1="500093", id2="0", id3="0", id4="0", status=true } },
	-- 6 Manos vigorizadas 490347
		[6] = {
			[12]={ id1="500737", id2="0", id3="0", id4="0", status=true } 
		  },
	-- 7 Precisión 491528
		[7] = {
			[3]={ max="500", min="50", status=true },
			[12]={ id1="501924", id2="0", id3="0", id4="0", status=true } 
		  },
	-- 8 Perfect Slide 1491731
		[8] = { [42]={ enable=true, status=true } },
	-- 9 Golpe bajo con ira asesina 491534
		[9] = {
			[5]={ max="100", min="25", status=true },
			[34]={ id1="620313", id2="500960", id3="0", id4="0", status=true } 
		  },
		--Shadow slash 1493673
		[10] = {
			[5]={ max="100", min="24", status=true },
			[11]={ id1="1502730", id2="0", id3="0", id4="0", status=true } 
		  },
	-- 11 Ataque a la herida 490313
		[11] = {
			[5]={ max="100", min="35", status=true },
			[34]={ id1="620313", id2="500704", id3="0", id4="0", status=true },
			[59]={ enable=true, status=true }
		  },
	-- 12 Cuchillada alevosa 490306
		[12] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="0", id3="0", id4="0", status=true } 
		  },
	-- 13 Tempestad del alma 490345
		[13] = { [5]={ max="100", min="13", status=true }, [39]={ enable=true, status=true } },
	-- 14 Precisión 491528
		[14] = {
			[3]={ max="500", min="50", status=true },
			[12]={ id1="501924", id2="0", id3="0", id4="0", status=true } 
		  },
	-- 15 Sorteo rápido 491532
		[15] = {
			[5]={ max="100", min="30", status=true },
			[11]={ id1="501924", id2="0", id3="0", id4="0", status=true },
			[71]={ enable=true, status=true } -- Requires Gun	
		  },
	-- 16 Golpe a las articulaciones 1490979
		[16] = { [3]={ max="500", min="25", status=true } },
	-- 17 Cicatriz de la garra ISS 490356
		[17] = {
			[5]={ max="100", min="35", status=true },
			[32]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
	-- 18 Golpe bajo 491534
		[18] = {
			[5]={ max="100", min="25", status=true },
			[34]={ id1="620313", id2="0", id3="0", id4="0", status=true },
			[35]={ id1="620314", id2="0", id3="0", id4="0", status=true } 
		  },
	-- 19 Ataque a la herida 490313
		[19] = {
			[5]={ max="100", min="35", status=true },
			[34]={ id1="620313", id2="500704", id3="0", id4="0", status=true },
			[59]={ enable=true, status=true }
		  },
	-- 20 Punto ciego 490311
		[20] = {
			[5]={ max="500", min="25", status=true },
			[35]={ id1="620297", id2="0", id3="0", id4="0", status=true } 
		  },
	-- 21 Marca de garra ISS 490144
		[21] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
	-- 22 Tiro 491531
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

