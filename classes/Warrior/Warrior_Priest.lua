
--Lua WARRIOR/WARDEN BY NEORAXER 25-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_WARRIOR_PRIEST()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando GUERRERO/ MAGO")
	local ira = UnitMana("player")
	local mana = UnitSkill("player")
	
	--Rugido del defensor
	local RUGIDO_SKILL, RUGIDO_ID_1, RUGIDO_ID_2 = Match_CE(491466);
	--Grito de guerra
	local GRITO_SKILL, GRITO_ID_1, GRITO_ID_2 = Match_CE(493249);
	--Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(492999);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
	--Sed de Sangre
	local SED_SKILL, SED_ID_1, SED_ID_2 = Match_CE(499992);
	--Ataque sorpresa
	local ATA_SOR_SKILL, ATA_SOR_ID_1, ATA_SOR_ID_2 = Match_CE(490129);	
	local ATA_SOR_CD = CE_CD(ATA_SOR_SKILL, ATA_SOR_ID_1, ATA_SOR_ID_2);
	--Morale slash
	local MOR_SLA_SKILL, MOR_SLA_ID_1, MOR_SLA_ID_2 = Match_CE(1491760);	
	local MOR_SLA_CD = CE_CD(MOR_SLA_SKILL, MOR_SLA_ID_1, MOR_SLA_ID_2);
	--Escisión lunar
	local ESC_LUN_SKILL, ESC_LUN_ID_1, ESC_LUN_ID_2 = Match_CE(490121);
	local ESC_LUN_CD = CE_CD(ESC_LUN_SKILL, ESC_LUN_ID_1, ESC_LUN_ID_2);	
	--Ciclón devastador
	local CICLON_SKILL, CICLON_ID_1, CICLON_ID_2 = Match_CE(490147);
	local CICLON_CD = CE_CD(CICLON_SKILL, CICLON_ID_1, CICLON_ID_2);
	--Torbellino
	local TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2 = Match_CE(490133);
	local TORBELLINO_CD = CE_CD(TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2);
	--Interrupción
	local INT_SKILL, INT_ID_1, INT_ID_2 = Match_CE(491469);
	local INT_CD = CE_CD(INT_SKILL, INT_ID_1, INT_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(490053);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Ataque Táctico
	local ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2 = Match_CE(491142);	
	local ATA_TAC_CD = CE_CD(ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2);
	--Oportunidad
	local OPOR_SKILL, OPOR_ID_1, OPOR_ID_2 = Match_CE(492617);	
	local OPOR_CD = CE_CD(OPOR_SKILL, OPOR_ID_1, OPOR_ID_2);
	--Flanco abierto
	local FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2 = Match_CE(491136);	
	local FLA_ABI_CD = CE_CD(FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Ataque Sagaz
	local ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2 = Match_CE(491133);	
	local ATA_SAG_CD = CE_CD(ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2);	
	
	
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

	--Rugido del defensor
	if RUGIDO_SKILL and (CE_BuffIdPlayer(501872) == false )
		then UseSkill(RUGIDO_ID_1, RUGIDO_ID_2);
	--Grito de guerras
	elseif GRITO_SKILL and (CE_BuffIdPlayer(1500853) == false)
		then UseSkill(GRITO_ID_1, GRITO_ID_2);
	end
	
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		--Fiera
		if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		--Furioso
		elseif FUR_SKILL and FUR_CD <= 0.25 and ira <= 40 then
			UseSkill(FUR_ID_1, FUR_ID_2)
		--Sed de sangre
		elseif SED_SKILL and CE_BuffIdPlayer(503162) == false then
			UseSkill(SED_ID_1, SED_ID_2)
		end	
	end


		--AOE
	if _G.C_EngineSettings.AOE then
		--Moral Slash
		if MOR_SLA_SKILL and MOR_SLA_CD <= 0.25 then
			UseSkill(MOR_SLA_ID_1, MOR_SLA_ID_2);
		--Torbellino
		elseif TORBELLINO_SKILL and TORBELLINO_CD <= 0.25 and ira >= 30 then
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
	--Oportunidad
	elseif OPOR_SKILL and OPOR_CD <= 0.25 and CE_SELF_DEBUFF(501503) and ira >= 15 then
		UseSkill(OPOR_ID_1, OPOR_ID_2);
	--Ataque Táctico
	elseif ATA_TAC_SKILL and ATA_TAC_CD <= 0.25 and ira >=25 and (CE_SELF_DEBUFF(500081) == true) then
		UseSkill(ATA_TAC_ID_1, ATA_TAC_ID_2);
	--Tajo
	elseif TAJO_SKILL and TAJO_CD <= 0.25 and ira >= 15 and (CE_SELF_DEBUFF(500081) == false) and CE_SELF_DEBUFF(1500551) == true then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	--Interrupción
	elseif INT_SKILL and INT_CD <= 0.25 and ira >= 20 and (CE_SELF_DEBUFF(1500551) == false) then
		UseSkill(INT_ID_1, INT_ID_2);
	--Flanco abierto
	elseif FLA_ABI_SKILL and FLA_ABI_CD <= 0.25 and CE_SELF_DEBUFF(501502) and CE_SELF_DEBUFF(501503) == false and ira >= 10 then
		UseSkill(FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Ataque Sagaz	
	elseif ATA_SAG_SKILL and ATA_SAG_CD <= 0.25 and ira >= 25 and CE_SELF_DEBUFF(500081) and (CE_SELF_DEBUFF(501502) == false )then
		UseSkill(ATA_SAG_ID_1, ATA_SAG_ID_2);
	end
	
end
	
	
	
function CE_WARRIOR_PRIEST_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 491466, 493249, 492999, 490492, 499992, 1491760, 490133, 490121, 490147, 490129, 492617, 491142, 490053, 491469, 491136, 491133 }
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
		-- 5 rugido del defensor 491466
		[5] = {
			[12]={ id1="501872", id2="0", id3="0", id4="0", status=true }
		},
		-- 6 grito de guerra 493249
		[6] = {
			[12]={ id1="1500853", id2="0", id3="0", id4="0", status=true }
		},
		-- 7 fiera 492999
		[7] = {
			[41]={ enable=true, status=true },
			[6]={ min="25", max="100", status=true }
		},
		-- 8 furioso 490492
		[8] = {
			[41]={ enable=true, status=true },
			[6]={ min="0", max="40", status=true }
		},
		-- 9 sed de sangre 499992
		[9] = {
			[41]={ enable=true, status=true },
			[12]={ id1="503162", id2="0", id3="0", id4="0", status=true }
		},
		-- 10 moral slash 1491760
		[10] = {
			[39]={ enable=true, status=true }
		},
		-- 11 torbellino 490133
		[11] = {
			[39]={ enable=true, status=true },
			[6]={ min="30", max="100", status=true }
		},
		-- 12 escision lunar 490121
		[12] = {
			[39]={ enable=true, status=true },
			[6]={ min="50", max="100", status=true }
		},
		-- 13 ciclon devastador 490147
		[13] = {
			[39]={ enable=true, status=true },
			[6]={ min="35", max="100", status=true }
		},
		-- 14 ataque sorpresa 490129
		[14] = {},
		-- 15 oportunidad 492617
		[15] = {
			[34]={ id1="501503", id2="0", id3="0", id4="0", status=true },
			[6]={ min="15", max="100", status=true }
		},
		-- 16 ataque tactico 491142
		[16] = {
			[6]={ min="25", max="100", status=true },
			[34]={ id1="500081", id2="0", id3="0", id4="0", status=true }
		},
		-- 17 tajo 490053
		[17] = {
			[6]={ min="15", max="100", status=true },
			[35]={ id1="500081", id2="0", id3="0", id4="0", status=true },
			[34]={ id1="1500551", id2="0", id3="0", id4="0", status=true }
		},
		-- 18 interrupcion 491469
		[18] = {
			[6]={ min="20", max="100", status=true },
			[35]={ id1="1500551", id2="0", id3="0", id4="0", status=true }
		},
		-- 19 flanco abierto 491136
		[19] = {
			[34]={ id1="501502", id2="0", id3="0", id4="0", status=true },
			[35]={ id1="501503", id2="0", id3="0", id4="0", status=true },
			[6]={ min="10", max="100", status=true }
		},
		-- 20 ataque sagaz 491133
		[20] = {
			[6]={ min="25", max="100", status=true },
			[34]={ id1="500081", id2="0", id3="0", id4="0", status=true },
			[35]={ id1="501502", id2="0", id3="0", id4="0", status=true }
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
