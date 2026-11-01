--Lua WARRIOR/WARLOCK BY NEORAXER 15-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


local Storm = "Storm_string"


--Temporizador en cero
local function PauseStorm()
	--DEFAULT_CHAT_FRAME:AddMessage("Slide_1");
	TimerQueue[Storm] = nil

end





function CE_WARRIOR_WARLOCK()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando GUERRERO/ MAGO")
	local ira = UnitMana("player")
	local foco = UnitSkill("player")	
	
	
	--Carga combada
	local CAR_COM_SKILL, CAR_COM_ID_1, CAR_COM_ID_2 = Match_CE(497958);
	local CAR_COM_CD = CE_CD(CAR_COM_SKILL, CAR_COM_ID_1, CAR_COM_ID_2);
	--Remolino psiquico
	local REM_PSI_SKILL, REM_PSI_ID_1, REM_PSI_ID_2 = Match_CE(498707);
	local REM_PSI_CD = CE_CD(REM_PSI_SKILL, REM_PSI_ID_1, REM_PSI_ID_2);
	--Tormenta de espada espiritual
	local TOR_ESP_SKILL, TOR_ESP_ID_1, TOR_ESP_ID_2 = Match_CE(498742);
	local TOR_ESP_CD = CE_CD(TOR_ESP_SKILL, TOR_ESP_ID_1, TOR_ESP_ID_2);
	--Golpe rompe espiritus
	local GOL_ROM_SKILL, GOL_ROM_ID_1, GOL_ROM_ID_2 = Match_CE(498740);
	local GOL_ROM_CD = CE_CD(GOL_ROM_SKILL, GOL_ROM_ID_1, GOL_ROM_ID_2);
	--Hechizo del rayo
	local HECH_RAY_SKILL, HECH_RAY_ID_1, HECH_RAY_ID_2 = Match_CE(498741);
	local HECH_RAY_CD = CE_CD(HECH_RAY_SKILL, HECH_RAY_ID_1, HECH_RAY_ID_2);
	--Maldicion del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(497959);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Golpe de ira
	local GOL_IRA_SKILL, GOL_IRA_ID_1, GOL_IRA_ID_2 = Match_CE(498706);
	local GOL_IRA_CD = CE_CD(GOL_IRA_SKILL, GOL_IRA_ID_1, GOL_IRA_ID_2);
	--Ciclon devastador
	local CIC_DEV_SKILL, CIC_DEV_ID_1, CIC_DEV_ID_2 = Match_CE(490147);
	local CIC_DEV_CD = CE_CD(CIC_DEV_SKILL, CIC_DEV_ID_1, CIC_DEV_ID_2);
	--Ataque sagaz
	local ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2 = Match_CE(491133);
	local ATA_SAG_CD = CE_CD(ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2);
	--Paso Fantasmal psíquico
	local PAS_FAN_SKILL, PAS_FAN_ID_1, PAS_FAN_ID_2 = Match_CE(498739);
	local PAS_FAN_CD = CE_CD(PAS_FAN_SKILL, PAS_FAN_ID_1, PAS_FAN_ID_2);
	--Ataque táctico
	local ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2 = Match_CE(491142);
	local ATA_TAC_CD = CE_CD(ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(499828);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490095);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
    --Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(490492);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);


	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if ira <= 20 or foco <= 20 and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then	
		--Usar estimulante fuerte
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(501321) == false and  CE_UseItem(200173) and CE_BuffIdPlayer(1500237) == false then
		--Usar Frasco de agilidad elfica
		elseif CE_TARGET_IS_BOSS() and (CE_BuffTimeLeftById(501321) == true) and  CE_UseItem(1244062) and CE_BuffIdPlayer(1500237) == false then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end
				
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		--Fiera
		if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		--Furioso
		elseif FUR_SKILL and FUR_CD <= 0.25 and ira <= 40 then
			UseSkill(FUR_ID_1, FUR_ID_2)
		end	
	end	
				
    --------------------------------------------------------------------------------------------------------------------------------------------
	
	--Carga combada
	if CAR_COM_SKILL and CAR_COM_CD <= 0.25 and foco >= 20 and (CE_BuffIdPlayer(501575) == false) 
		then UseSkill(CAR_COM_ID_1, CAR_COM_ID_2);    
	--Remolino psiquico
	elseif REM_PSI_SKILL and REM_PSI_CD <= 0.25 and ira >= 25 and CE_DebuffIdTarget(501577) and _G.C_EngineSettings.AOE then
		UseSkill(REM_PSI_ID_1, REM_PSI_ID_2);
	--Tormenta de espada espiritual
	elseif TOR_ESP_SKILL and foco >= 5 and (CE_BuffIdPlayer(621496) == false) and _G.C_EngineSettings.AOE and CE_WEAPON_TYPE("Sword-2H") then
		UseSkill(TOR_ESP_ID_1, TOR_ESP_ID_2);		
	--Golpe rompe espíritus
	elseif GOL_ROM_SKILL and GOL_ROM_CD <= 0.25 and foco >= 20 and CE_WEAPON_TYPE("Sword-2H")
		then UseSkill(GOL_ROM_ID_1, GOL_ROM_ID_2);	
	--Hechizo del rayo
	elseif HECH_RAY_SKILL and HECH_RAY_CD <= 0.25 and ira >= 20 and (CE_BuffIdPlayer(621491) == false) and _G.C_EngineSettings.AOE
		then UseSkill(HECH_RAY_ID_1, HECH_RAY_ID_2);	
	--Maldición del tejido debilitante
	elseif MAL_TEJ_SKILL and  (CE_isMoving() == false) and MAL_TEJ_CD <= 0.25 and foco >= 20 and (CE_DebuffIdTarget(501577) == false) and _G.C_EngineSettings.AOE
		then UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);	
	--Golpe de ira
	elseif GOL_IRA_SKILL and GOL_IRA_CD <= 0.25 and foco >= 35
		then UseSkill(GOL_IRA_ID_1, GOL_IRA_ID_2);	
	--Ciclón devastador
	elseif CIC_DEV_SKILL and  CIC_DEV_CD <= 0.25 and ira >= 35 and IsSpellUsable(490130) and _G.C_EngineSettings.AOE
		then UseSkill(CIC_DEV_ID_1, CIC_DEV_ID_2);	
	--Ataque sagaz
	elseif ATA_SAG_SKILL and ATA_SAG_CD <= 0.25 and ira >= 20 and CE_SELF_DEBUFF(500081)
		then UseSkill(ATA_SAG_ID_1, ATA_SAG_ID_2);		
	--Paso Fantasmal psíquico
	elseif PAS_FAN_SKILL and PAS_FAN_CD <= 0.25 and ira >= 15 and _G.C_EngineSettings.AOE
		then UseSkill(PAS_FAN_ID_1, PAS_FAN_ID_2);		
	--Ataque táctico
	elseif ATA_TAC_SKILL and ATA_TAC_CD <= 0.25 and ira >= 15 and CE_SELF_DEBUFF(500081)
		then UseSkill(ATA_TAC_ID_1, ATA_TAC_ID_2);		
	--Tajo
	elseif TAJO_SKILL and ira >= 15 and (CE_SELF_DEBUFF(500081) == false) and _G.C_EngineSettings.AOE
		then UseSkill(TAJO_ID_1, TAJO_ID_2);
			
     end
	
	
end
	
	
	
function CE_WARRIOR_WARLOCK_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 490492, 490095, 497958, 498707, 498742, 498740, 498741, 497959, 498706, 490147, 491133, 498739, 491142, 499828 }
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
		-- 5 fiera 490492
		[5] = {
			[41]={ enable=true, status=true },
			[6]={ min="25", max="100", status=true }
		},
		-- 6 furioso 490095
		[6] = {
			[41]={ enable=true, status=true },
			[6]={ min="0", max="40", status=true }
		},
		-- 7 carga combada 497958
		[7] = {
			[3]={ min="20", max="100", status=true },
			[12]={ id1="501575", id2="0", id3="0", id4="0", status=true }
		},
		-- 8 remolino psiquico 498707
		[8] = {
			[6]={ min="25", max="100", status=true },
			[32]={ id1="501577", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 9 tormenta de espada espiritual 498742
		[9] = {
			[3]={ min="5", max="100", status=true },
			[12]={ id1="621496", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true },
			[63]={ enable=true, status=true }
		},
		-- 10 golpe rompe espiritus 498740
		[10] = {
			[3]={ min="20", max="100", status=true },
			[63]={ enable=true, status=true }
		},
		-- 11 hechizo del rayo 498741
		[11] = {
			[6]={ min="20", max="100", status=true },
			[12]={ id1="621491", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 12 maldicion del tejido debilitante 497959
		[12] = {
			[19]={ enable=true, status=true },
			[3]={ min="20", max="100", status=true },
			[33]={ id1="501577", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 13 golpe de ira 498706
		[13] = {
			[3]={ min="35", max="100", status=true }
		},
		-- 14 ciclon devastador 490147
		[14] = {
			[6]={ min="35", max="100", status=true },
			[39]={ enable=true, status=true }
		},
		-- 15 ataque sagaz 491133
		[15] = {
			[6]={ min="20", max="100", status=true },
			[34]={ id1="500081", id2="0", id3="0", id4="0", status=true }
		},
		-- 16 paso fantasmal psiquico 498739
		[16] = {
			[6]={ min="15", max="100", status=true },
			[39]={ enable=true, status=true }
		},
		-- 17 ataque tactico 491142
		[17] = {
			[6]={ min="15", max="100", status=true },
			[34]={ id1="500081", id2="0", id3="0", id4="0", status=true }
		},
		-- 18 tajo 499828
		[18] = {
			[6]={ min="15", max="100", status=true },
			[35]={ id1="500081", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
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
