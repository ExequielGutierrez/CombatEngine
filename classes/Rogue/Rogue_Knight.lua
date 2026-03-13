--Lua ROGUE/KNIGHT BY NEORAXER 11-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
function CE_ROGUE_KNIGHT()
	local energia = UnitMana("player")
	--Maniobra abandonada
	local MAN_ABA_SKILL, MAN_ABA_ID_1, MAN_ABA_ID_2 = Match_CE(490355)
	--Armadura reforzada
	local ARM_REF_SKILL, ARM_REF_ID_1, ARM_REF_ID_2 = Match_CE(490152)
	--Luz abrasadora
	local LUZ_ABR_SKILL, LUZ_ABR_ID_1, LUZ_ABR_ID_2 = Match_CE(493025)
	--Disciplina de Katana
	local DIS_KAT_SKILL, DIS_KAT_ID_1, DIS_KAT_ID_2 = Match_CE(1492417)
	local DIS_KAT_CD = CE_CD(DIS_KAT_SKILL, DIS_KAT_ID_1, DIS_KAT_ID_2)
	--Protección del león
	local PRO_LEO_SKILL, PRO_LEO_ID_1, PRO_LEO_ID_2 = Match_CE(491552)
	local PRO_LEO_CD = CE_CD(PRO_LEO_SKILL, PRO_LEO_ID_1, PRO_LEO_ID_2)
	--Poder del León
	local POD_LEO_SKILL, POD_LEO_ID_1, POD_LEO_ID_2 = Match_CE(492924)
	local POD_LEO_CD = CE_CD(POD_LEO_SKILL, POD_LEO_ID_1, POD_LEO_ID_2)
	--Castigo
	local CAS_SKILL, CAS_ID_1, CAS_ID_2 = Match_CE(490074)
	local CAS_CD = CE_CD(CAS_SKILL, CAS_ID_1, CAS_ID_2)
	--Golpe divino
	local GOL_DIV_SKILL, GOL_DIV_ID_1, GOL_DIV_ID_2 = Match_CE(490148)
	local GOL_DIV_CD = CE_CD(GOL_DIV_SKILL, GOL_DIV_ID_1, GOL_DIV_ID_2)
	--Golpe de Castigo
	local GOL_CAS_SKILL, GOL_CAS_ID_1, GOL_CAS_ID_2 = Match_CE(490185)
	local GOL_CAS_CD = CE_CD(GOL_CAS_SKILL, GOL_CAS_ID_1, GOL_CAS_ID_2)
	--Desarme
	local DESARME_SKILL, DESARME_ID_1, DESARME_ID_2 = Match_CE(491553)
	local DESARME_CD = CE_CD(DESARME_SKILL, DESARME_ID_1, DESARME_ID_2)
	--Cuchillada alevosa
	local CUC_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2 = Match_CE(490306)
	local CUC_ALE_CD = CE_CD(CUC_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2)
	--Golpe bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(490323)
	local GOL_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2)
	--Arrojar
	local ARR_SKILL, ARR_ID_1, ARR_ID_2 = Match_CE(490309)
	local ARR_CD = CE_CD(ARR_SKILL, ARR_ID_1, ARR_ID_2)
	--Guarda valeroso
	local GUA_VAL_SKILL, GUA_VAL_ID_1, GUA_VAL_ID_2 = Match_CE(492629)
	local GUA_VAL_CD = CE_CD(GUA_VAL_SKILL, GUA_VAL_ID_1, GUA_VAL_ID_2)
	--Shadow slash
	local SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2 = Match_CE(1493673)
	local SHADOW_SLASH_CD = CE_CD(SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2)
	--Ataque a la herida
	local ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2 = Match_CE(1492414);
	local ATA_HER_CD = CE_CD(ATA_HER_SKILL, ATA_HER_ID_1, ATA_HER_ID_2);
	--BUFFOS--
	--Maniobra abandonada
	if MAN_ABA_SKILL and (CE_BuffIdPlayer(500744) == false)
		then UseSkill(MAN_ABA_ID_1, MAN_ABA_ID_2)
	--Tormento venenoso
	elseif CE_BuffIdPlayer(500093) == false and IsSpellUsable(490314)
        then CastSpellByName(CE_toName(490314))
	--Luz abrazadora
	elseif LUZ_ABR_SKILL and CE_BuffIdPlayer(503268) == false and _G.C_EngineSettings.AOE
		then UseSkill(LUZ_ABR_ID_1, LUZ_ABR_ID_2)
	--Armadura reforzada
	elseif ARM_REF_SKILL and (CE_BuffIdPlayer(500141) == false) then
		UseSkill(ARM_REF_ID_1, ARM_REF_ID_2)
	--Diciplina de Katana
	elseif DIS_KAT_SKILL and DIS_KAT_CD <= 0.25 and CE_BuffIdPlayer(1503831) == false and CE_TARGET_IS_BOSS() then
		UseSkill(DIS_KAT_ID_1, DIS_KAT_ID_2)
	--Protección del león
	elseif PRO_LEO_SKILL and PRO_LEO_CD <= 0.25 and CE_BuffIdPlayer(1503806) == false and CE_TARGET_IS_BOSS() then
		UseSkill(PRO_LEO_ID_1, PRO_LEO_ID_2)
	--Poder del león
	elseif POD_LEO_SKILL and POD_LEO_CD <= 0.25 and CE_BuffIdPlayer(503185) == false and CE_TARGET_IS_BOSS() then
		UseSkill(POD_LEO_ID_1, POD_LEO_ID_2)
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
	if C_EngineSettings.FastBuffs then
		--Diciplina de Katana
		if DIS_KAT_SKILL and DIS_KAT_CD <= 0.25 then
			UseSkill(DIS_KAT_ID_1, DIS_KAT_ID_2)
		--Protección del león
		elseif PRO_LEO_SKILL and PRO_LEO_CD <= 0.25 then
			UseSkill(PRO_LEO_ID_1, PRO_LEO_ID_2)
		--Poder del león
		elseif POD_LEO_SKILL and POD_LEO_CD <= 0.25 then
			UseSkill(POD_LEO_ID_1, POD_LEO_ID_2)
		--Guarda valeroso
		elseif GUA_VAL_SKILL and GUA_VAL_CD <= 0.25 then
			UseSkill(GUA_VAL_ID_1, GUA_VAL_ID_2)
		end
	end
	--Perfect Slide
	if CE_PERFECT_SLIDE() then
	--Shadow slash
	elseif SHADOW_SLASH_CD <= 0.25 and energia >= 25 and CE_BuffIdPlayer(1503811) then
		UseSkill(SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2)
	--Ataque a la herida
	elseif ATA_HER_SKILL and ATA_HER_CD <= 0.45 and ( CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(500704) ) and energia >= 30 and CE_WEAPON_TYPE("Daga") then
		UseSkill(ATA_HER_ID_1, ATA_HER_ID_2);
	--Golpe de castigo
	elseif GOL_CAS_SKILL and GOL_CAS_CD <= 0.25 and _G.C_EngineSettings.AOE and CE_TARGET_ON_ME() == false
		then UseSkill(GOL_CAS_ID_1, GOL_CAS_ID_2)
	--Castigo
	elseif CAS_SKILL and CAS_CD <= 0.25 and CE_DebuffIdTarget(500169) and energia >= 35
		then UseSkill(CAS_ID_1, CAS_ID_2)
	--Golpe de castigo
	elseif GOL_CAS_SKILL and GOL_CAS_CD <= 0.25 and _G.C_EngineSettings.AOE
		then UseSkill(GOL_CAS_ID_1, GOL_CAS_ID_2)
	--Desarme
	elseif DESARME_SKILL and DESARME_CD <= 0.25 and _G.C_EngineSettings.AOE
		then UseSkill(DESARME_ID_1, DESARME_ID_2)
	--Cuchillada alevosa
	elseif CUC_ALE_SKILL and CUC_ALE_CD <= 0.25 and CE_SELF_DEBUFF(620313) == false
		then UseSkill(CUC_ALE_ID_1, CUC_ALE_ID_2)
	--Golpe bajo
	elseif GOL_BAJ_SKILL and GOL_BAJ_CD <= 0.25 and CE_SELF_DEBUFF(620313) and (CE_SELF_DEBUFF(620314) == false) and energia >= 25
		then UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2)
	--Tempestad del alma
	elseif energia >= 13 and CE_ISS_CD(CE_toName(490345)) and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS()
		then CastSpellByName(CE_toName(490345))
	--Arrojar
	elseif ARR_SKILL and ARR_CD <= 0.25
		then UseSkill(ARR_ID_1, ARR_ID_2)
	--Golpe divino
	elseif GOL_DIV_SKILL and (CE_DebuffIdTarget(500169) == false) and GOL_DIV_CD <= 0.25
		then UseSkill(GOL_DIV_ID_1, GOL_DIV_ID_2)
	end
end
function CE_ROGUE_KNIGHT_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 490314, 490355, 493025, 490152, 1492417, 491552, 492924, 1491731, 1493673, 1492414, 492629, 490185, 490074, 490185, 491553, 490306, 490323, 490345, 490309, 490148 }
	local conditions = {
		-- 1 poción de enano 1244064
		[1] = { [5]={ max="40", min="0", status=true }, [40]={ enable=true, status=true }},
		-- 2 estimulante fuerte 200173
		[2] = { [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 3 agilidad elfica 1244062
		[3] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 4 filete de costilla 1244060
		[4] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 5 tormento venenoso 490314
		[5] = {
			[5]={ max="500", min="5", status=true },
			[12]={ id1="500093", id2="0", id3="0", id4="0", status=true }
		},
		-- 6 maniobra abandonada 490355
		[6] = { [12]={ id1="500744", id2="0", id3="0", id4="0", status=true } },
		-- 7 Luz abrazadora 493025
		[7] = {
			[2]={ max="100", min="8", status=true },
			[12]={ id1="503268", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 8 Armadura reforzada 490152
		[8] = { [12]={ id1="500141", id2="0", id3="0", id4="0", status=true } },
		-- 9 Diciplina de Katana 1492417
		[9] = {
			[12]={ id1="1503831", id2="0", id3="0", id4="0", status=true },
			[41]={ enable=true, status=true } 
		  },
		-- 10 Protección del león 491552
		[10] = {
			[12]={ id1="1503806", id2="0", id3="0", id4="0", status=true },
			[41]={ enable=true, status=true } 
		  },
		-- 11 Poder del león 492924
		[11] ={ [41]={ enable=true, status=true } },
		-- 12 Perfect Slide	1491731
		[12] = { [42]={ enable=true, status=true } },
		-- 13 Shadow slash 1493673
		[13] = {
			[5]={ max="100", min="24", status=true },
			[11]={ id1="1503811", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 14 Ataque a la herida 1492414
		[14] ={
			[5]={ max="100", min="35", status=true },
			[34]={ id1="620313", id2="620314", id3="0", id4="0", status=true } 
		  },
		-- 15 Guarda valeroso 492629
		[15] = {
			[12]={ id1="502898", id2="0", id3="0", id4="0", status=true },
			[41]={ enable=true, status=true } 
		  },
		-- 16 Golpe de castigo 490185
		[16] = { [39]={ enable=true, status=true } },
		-- 17 Castigo 490074
		[17] = {
			[5]={ max="100", min="35", status=true },
			[32]={ id1="500169", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 18 Golpe de castigo 490185
		[18] = { [39]={ enable=true, status=true } },
		-- 19 Desarme 491553
		[19] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 20 Cuchillada alevosa 490306
		[20] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 21 Golpe bajo 490323
		[21] = {
			[5]={ max="100", min="30", status=true },
			[34]={ id1="620313", id2="", id3="0", id4="0", status=true },
			[35]={ id1="620314", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 22 Tempestad del alma 490345
		[22] =  { [5]={ max="100", min="13", status=true }, [39]={ enable=true, status=true } },
		-- 23 Arrojar 490309
		[23] = {},
		-- 24 Golpe divino 490148
		[24] = {}
	}
	local iss = {
		[490314] = true,
		[490345] = true,
		[490144] = true,
		[490356] = true
	}
	local consumables = {
		[1244064] = true,
		[200173] = true,
		[1244062] = true,
		[1244060] = true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
