
--Lua PRIEST/WARRIOR BY NEORAXER 02-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_PRIEST_WARRIOR()


    --DEFAULT_CHAT_FRAME:AddMessage("Usando MAGO/PICA")
	local pm = UnitMana("player")
    local MaxPm = UnitMaxMana("player")	
	local ira = UnitSkill("player")

	
    ----------------SKILLS------------------
	--Agua bendita de manantial
	local AGU_BEN_SKILL, AGU_BEN_ID_1, AGU_BEN_ID_2 = Match_CE(490298);	
	--Gracia vital
	local GRA_VIT_SKILL, GRA_VIT_ID_1, GRA_VIT_ID_2 = Match_CE(490290);	
	--Agua bendita de manantial
	local AGU_BEN_SKILL, AGU_BEN_ID_1, AGU_BEN_ID_2 = Match_CE(490298);	
	--Ataque amplificado
	local ATA_AMP_SKILL, ATA_AMP_ID_1, ATA_AMP_ID_2 = Match_CE(490491);	
	--Barrera mágica
	local BAR_MAG_SKILL, BAR_MAG_ID_1, BAR_MAG_ID_2 = Match_CE(491166);	
	--Vacío sagrado
	local VAC_SAG_SKILL, VAC_SAG_ID_1, VAC_SAG_ID_2 = Match_CE(490276);	
	local VAC_SAG_CD = CE_CD(VAC_SAG_SKILL, VAC_SAG_ID_1, VAC_SAG_ID_2);
	--Explosión de espíritu luchador
	local EXP_ESP_SKILL, EXP_ESP_ID_1, EXP_ESP_ID_2 = Match_CE(495294);	
	local EXP_ESP_CD = CE_CD(EXP_ESP_SKILL, EXP_ESP_ID_1, EXP_ESP_ID_2);
	--Combinación de espíritu
	local COM_ESP_SKILL, COM_ESP_ID_1, COM_ESP_ID_2 = Match_CE(499983);	
	local COM_ESP_CD = CE_CD(COM_ESP_SKILL, COM_ESP_ID_1, COM_ESP_ID_2);
	--Golpe de dragón ascendente
	local GOL_DRA_SKILL, GOL_DRA_ID_1, GOL_DRA_ID_2 = Match_CE(499981);	
	local GOL_DRA_CD = CE_CD(GOL_DRA_SKILL, GOL_DRA_ID_1, GOL_DRA_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(1490365);	
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Torbellino
	local TORB_SKILL, TORB_ID_1, TORB_ID_2 = Match_CE(1490366);	
	local TORB_CD = CE_CD(TORB_SKILL, TORB_ID_1, TORB_ID_2);
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);	
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
	--Fiera
	local FIE_SKILL, FIE_ID_1, FIE_ID_2 = Match_CE(1490348);	
	local FIE_CD = CE_CD(FIE_SKILL, FIE_ID_1, FIE_ID_2);
	
	
	
    ----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		if UnitLevel("player") >= 104 then
			--Usar poción del enano
			if ira <= 20 and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then				
			--Usar Frasco de agilidad elfica
			elseif CE_TARGET_IS_BOSS() and (CE_BuffTimeLeftById(501321) == true) and  CE_UseItem(1244062) and CE_BuffIdPlayer(1500237) == false then
			--Usar costilla de primera
			elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then	
			end
		else
			--Usar estimulante fuerte
			if CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(501321) == false and  CE_UseItem(200173) and CE_BuffIdPlayer(1500237) == false then	
			--Usar Phirius de mana
			elseif pm <= MaxPm/3 and CE_UseItem(203503) then
			end
		end
		CE_HEALING_ITEM()
	end
			
				
    ----------------BUFFS------------------
	
	
	
	--ROTACION------------------
	
	--Area
	if C_EngineSettings.AOE and TORB_SKILL and TORB_CD <= 0.25 and ira >= 50 then
		UseSkill(TORB_ID_1, TORB_ID_2);
	end
		

	--Fiera
	if FIE_SKILL and FIE_CD <= 0.25 and (CE_TARGET_IS_BOSS() or C_EngineSettings.FastBuffs) and ira >= 25 then
		UseSkill(FIE_ID_1, FIE_ID_2);
	--Furioso
	elseif FUR_SKILL and FUR_CD <= 0.25 and ira <= 20 and (CE_TARGET_IS_BOSS() or C_EngineSettings.FastBuffs) then
		UseSkill(FUR_ID_1, FUR_ID_2);
	--Vacío sagrado
	elseif VAC_SAG_SKILL and VAC_SAG_CD <= 0.25 and pm >= MaxPm/10 then
		UseSkill(VAC_SAG_ID_1, VAC_SAG_ID_2);
	--Explosión de espíritu luchador
	elseif EXP_ESP_SKILL and EXP_ESP_CD <= 0.25 then
		UseSkill(EXP_ESP_ID_1, EXP_ESP_ID_2);
	--Combinación de espíritu
	elseif COM_ESP_SKILL and COM_ESP_CD <= 0.25 then
		UseSkill(COM_ESP_ID_1, COM_ESP_ID_2);
	--Golpe de dragón ascendente
	elseif GOL_DRA_SKILL and GOL_DRA_CD <= 0.25 and ira >= 45 and CE_DebuffIdTarget(1500804) then
		UseSkill(GOL_DRA_ID_1, GOL_DRA_ID_2);
	--Tajo
	elseif TAJO_SKILL and TAJO_CD <= 0.25 then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	end

	
end
	
	
	

function CE_PRIEST_WARRIOR_IMPORT()
	local Skills = {
		1244064, 1244062, 1244060, 200173, 1490366, 1490348, 1490348, 490492,
		490492, 490276, 495294, 499983, 499981, 1490365,
	}
	local conditions = {
		{ -- 1 Pocion enano 1244064
			[6] = { min="0", max="20", status=true },
			[12] = { id1="1500239", id2="0", id3="0", id4="0", status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 2 Agilidad elfica 1244062
			[12] = { id1="1500237", id2="0", id3="0", id4="0", status=true },
			[17] = { id="501321", status=true, time="0" },
			[29] = { enable=true, status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 3 Costilla de primera 1244060
			[12] = { id1="1500235", id2="0", id3="0", id4="0", status=true },
			[29] = { enable=true, status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 4 Estimulante fuerte 200173
			[12] = { id1="501321", id2="0", id3="0", id4="0", status=true },
			[29] = { enable=true, status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 5 Torbellino 1490366
			[6] = { min="50", max="100", status=true },
			[39] = { enable=true, status=true },
		},
		{ -- 6 Fiera (boss) 1490348
			[6] = { min="25", max="100", status=true },
			[29] = { enable=true, status=true },
		},
		{ -- 7 Fiera (fast buffs) 1490348
			[6] = { min="25", max="100", status=true },
			[41] = { enable=true, status=true },
		},
		{ -- 8 Furioso (boss) 490492
			[6] = { min="0", max="20", status=true },
			[29] = { enable=true, status=true },
		},
		{ -- 9 Furioso (fast buffs) 490492
			[6] = { min="0", max="20", status=true },
			[41] = { enable=true, status=true },
		},
		{ -- 10 Vacio sagrado 490276
			[2] = { min="10", max="100", status=true },
		},
		{ -- 11 Explosion de espiritu luchador 495294
		},
		{ -- 12 Combinacion de espiritu 499983
		},
		{ -- 13 Golpe de dragon ascendente 499981
			[6] = { min="45", max="100", status=true },
			[32] = { id1="1500804", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 14 Tajo 1490365
		},
	}
	local iss = {}
	local consumables = {
		[1244064] = true,
		[1244062] = true,
		[1244060] = true,
		[200173] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
