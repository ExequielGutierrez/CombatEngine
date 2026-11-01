
--Lua WARRIOR/WARDEN BY NEORAXER 25-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_WARRIOR_ROGUE()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando GUERRERO/ MAGO")
	local ira = UnitMana("player")
	local energia = UnitSkill("player")
	
	--Ataque sorpresa
	local ATA_SOR_SKILL, ATA_SOR_ID_1, ATA_SOR_ID_2 = Match_CE(490129);	
	local ATA_SOR_CD = CE_CD(ATA_SOR_SKILL, ATA_SOR_ID_1, ATA_SOR_ID_2);
	--Escisión lunar
	local ESC_LUN_SKILL, ESC_LUN_ID_1, ESC_LUN_ID_2 = Match_CE(1490425);
	local ESC_LUN_CD = CE_CD(ESC_LUN_SKILL, ESC_LUN_ID_1, ESC_LUN_ID_2);	
	--Ciclón devastador
	local CICLON_SKILL, CICLON_ID_1, CICLON_ID_2 = Match_CE(490147);
	local CICLON_CD = CE_CD(CICLON_SKILL, CICLON_ID_1, CICLON_ID_2);
	--Torbellino
	local TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2 = Match_CE(493282);
	local TORBELLINO_CD = CE_CD(TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(490053);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);	
	--Ataque Sagaz
	local ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2 = Match_CE(493283);	
	local ATA_SAG_CD = CE_CD(ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2);	
	--Flanco abierto
	local FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2 = Match_CE(491136);	
	local FLA_ABI_CD = CE_CD(FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Trueno
	local TRUENO_SKILL, TRUENO_ID_1, TRUENO_ID_2 = Match_CE(491139);	
	local TRUENO_CD = CE_CD(TRUENO_SKILL, TRUENO_ID_1, TRUENO_ID_2);
	--Ataque agudo
	local ATA_AGU_SKILL, ATA_AGU_ID_1, ATA_AGU_ID_2 = Match_CE(492619);	
	local ATA_AGU_CD = CE_CD(ATA_AGU_SKILL, ATA_AGU_ID_1, ATA_AGU_ID_2);
	--Danza Sangrienta
	local DAN_SANG_SKILL, DAN_SANG_ID_1, DAN_SANG_ID_2 = Match_CE(491329);	
	local DAN_SANG_CD = CE_CD(DAN_SANG_SKILL, DAN_SANG_ID_1, DAN_SANG_ID_2);
	--Crisis de ira
	local CRISIS_SKILL, CRISIS_ID_1, CRISIS_ID_2 = Match_CE(492911);	
	local CRISIS_CD = CE_CD(CRISIS_SKILL, CRISIS_ID_1, CRISIS_ID_2);
	--Cuchillada alevosa
	local CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2 = Match_CE(491459);
	local CUCH_ALEV_CD = CE_CD(CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);	
	
	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if ira <= 20 and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then	
		--Usar estimulante fuerte
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(501321) == false and  CE_UseItem(200173) and CE_BuffIdPlayer(1500237) == false then
		--Usar Frasco de agilidad elfica
		elseif CE_TARGET_IS_BOSS() and (CE_BuffTimeLeftById(501321) == true) and  CE_UseItem(1244062) and CE_BuffIdPlayer(1500237) == false then
		--Usar costilla de primera
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end
				
    --------------------------------------------------------------------------------------------------------------------------------------------
	--BUFFOS BASE
	


	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		--Furioso
		if FUR_SKILL and FUR_CD <= 0.25 and ira <= 40 then
			UseSkill(FUR_ID_1, FUR_ID_2)
		end	
	end

		--AOE
	if _G.C_EngineSettings.AOE then
		--Torbellino
		if TORBELLINO_SKILL and TORBELLINO_CD <= 0.25 and ira >= 30 then
			UseSkill(TORBELLINO_ID_1, TORBELLINO_ID_2);
		--Escisión lunar
		elseif ESC_LUN_SKILL and ESC_LUN_CD <= 0.25 and ira >= 50 then
			UseSkill(ESC_LUN_ID_1, ESC_LUN_ID_2);
		--Ciclón
		elseif CICLON_SKILL and CICLON_CD <= 0.25 and ira >= 35 then
			UseSkill(CICLON_ID_1, CICLON_ID_2);
		end
	end
	
	--ROTACION--
	
	--Ataque sorpresa
	if ATA_SOR_CD <= 0.25 then
		UseSkill(ATA_SOR_ID_1, ATA_SOR_ID_2);
	--Tajo
	elseif TAJO_SKILL and TAJO_CD <= 0.25 and ira >=25 and (CE_SELF_DEBUFF(500081) == false) then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	--Trueno
	elseif TRUENO_SKILL and TRUENO_CD <= 0.25 and CE_SELF_DEBUFF(501503) and ira >= 15 then
		UseSkill(TRUENO_ID_1, TRUENO_ID_2);
	--Ataque agudo
	elseif ATA_AGU_SKILL and ATA_AGU_CD <= 0.25 and CE_SELF_DEBUFF(501503) and energia >= 20 then
		UseSkill(ATA_AGU_ID_1, ATA_AGU_ID_2);
	--Flanco abierto
	elseif FLA_ABI_SKILL and FLA_ABI_CD <= 0.25 and CE_SELF_DEBUFF(501502) and CE_SELF_DEBUFF(501503) == false and ira >= 10 then
		UseSkill(FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Ataque Sagaz	
	elseif ATA_SAG_SKILL and ATA_SAG_CD <= 0.25 and ira >= 25 and CE_SELF_DEBUFF(500081) and (CE_SELF_DEBUFF(501502) == false )then
		UseSkill(ATA_SAG_ID_1, ATA_SAG_ID_2);
	--Danza Sangrienta
	elseif DAN_SANG_SKILL and DAN_SANG_CD <= 0.25 then
		UseSkill(DAN_SANG_ID_1, DAN_SANG_ID_2);
	--Crisis de ira
	elseif CRISIS_SKILL and CRISIS_CD <= 0.25 and ira >= 15 then
		UseSkill(CRISIS_ID_1, CRISIS_ID_2);
	--Cuchillada alevosa
	elseif CUCH_ALEV_SKILL and CUCH_ALEV_CD <= 0.25 and energia >= 20 then
		UseSkill(CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);
	end
	
end
	
	
	
function CE_WARRIOR_ROGUE_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 490492, 493282, 1490425, 490147, 490129, 490053, 491139, 492619, 491136, 493283, 491329, 492911, 491459 }
	local conditions = {
		-- 1 dwarf potion 1244064
		[1] = {
			[6]={ min="0", max="20", status=true },
			[12]={ id1="1500239", id2="0", id3="0", id4="0", status=true },
			[40]={ enable=true, status=true }
		},
		-- 2 strong stimulant 200173
		[2] = {
			[12]={ id1="1500237", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true },
			[40]={ enable=true, status=true }
		},
		-- 3 elven agility flask 1244062
		[3] = {
			[12]={ id1="501321", id2="0", id3="0", id4="0", status=true },
			[17]={ id="501321", time="0", status=true },
			[29]={ enable=true, status=true },
			[40]={ enable=true, status=true }
		},
		-- 4 prime rib 1244060
		[4] = {
			[12]={ id1="1500235", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true },
			[40]={ enable=true, status=true }
		},
		-- 5 furioso 490492
		[5] = {
			[41]={ enable=true, status=true },
			[6]={ min="0", max="40", status=true }
		},
		-- 6 torbellino 493282
		[6] = {
			[39]={ enable=true, status=true },
			[6]={ min="30", max="100", status=true }
		},
		-- 7 escision lunar 1490425
		[7] = {
			[39]={ enable=true, status=true },
			[6]={ min="50", max="100", status=true }
		},
		-- 8 ciclon devastador 490147
		[8] = {
			[39]={ enable=true, status=true },
			[6]={ min="35", max="100", status=true }
		},
		-- 9 ataque sorpresa 490129
		[9] = {},
		-- 10 tajo 490053
		[10] = {
			[6]={ min="25", max="100", status=true },
			[35]={ id1="500081", id2="0", id3="0", id4="0", status=true }
		},
		-- 11 trueno 491139
		[11] = {
			[34]={ id1="501503", id2="0", id3="0", id4="0", status=true },
			[6]={ min="15", max="100", status=true }
		},
		-- 12 ataque agudo 492619
		[12] = {
			[34]={ id1="501503", id2="0", id3="0", id4="0", status=true },
			[5]={ min="20", max="100", status=true }
		},
		-- 13 flanco abierto 491136
		[13] = {
			[34]={ id1="501502", id2="0", id3="0", id4="0", status=true },
			[35]={ id1="501503", id2="0", id3="0", id4="0", status=true },
			[6]={ min="10", max="100", status=true }
		},
		-- 14 ataque sagaz 493283
		[14] = {
			[6]={ min="25", max="100", status=true },
			[34]={ id1="500081", id2="0", id3="0", id4="0", status=true },
			[35]={ id1="501502", id2="0", id3="0", id4="0", status=true }
		},
		-- 15 danza sangrienta 491329
		[15] = {},
		-- 16 crisis de ira 492911
		[16] = {
			[6]={ min="15", max="100", status=true }
		},
		-- 17 cuchillada alevosa 491459
		[17] = {
			[5]={ min="20", max="100", status=true }
		}
	}
	local iss = {}
	local consumables = {
		[1244064] = true,
		[200173] = true,
		[1244062] = true,
		[1244060] = true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
