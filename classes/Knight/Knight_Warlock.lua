
--Lua KNIGHT/WARLOCK BY NEORAXER 07-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

local Sello_1 = 500140
local Sello_2 = 500146
local Sello_3 = 500168
local Sello_4 = 500169


function CE_KNIGHT_WARLOCK()

--DEFAULT_CHAT_FRAME:AddMessage("Usando Caba/brujo")


    local foco = UnitSkill("player");    
    local hp = UnitHealth("player")
    local MaxHp = UnitMaxHealth("player")
	local pm = UnitMana("player")
	local MaxPm = UnitMaxMana("player")
	
	--Embestida
	local EMB_SKILL, EMB_ID_1, EMB_ID_2 = Match_CE(490150);
	local EMB_CD = CE_CD(EMB_SKILL, EMB_ID_1, EMB_ID_2);
	--Escudo del valor
	local ESC_VAL_SKILL, ESC_VAL_ID_1, ESC_VAL_ID_2 = Match_CE(490468);
	local ESC_VAL_CD = CE_CD(ESC_VAL_SKILL, ESC_VAL_ID_1, ESC_VAL_ID_2);
	--Escudo de diciplina
	local ESC_DIC_SKILL, ESC_DIC_ID_1, ESC_DIC_ID_2 = Match_CE(490192);
	local ESC_DIC_CD = CE_CD(ESC_DIC_SKILL, ESC_DIC_ID_1, ESC_DIC_ID_2);
	--Carga combada
	local CAR_COM_SKILL, CAR_COM_ID_1, CAR_COM_ID_2 = Match_CE(1490844);
	local CAR_COM_CD = CE_CD(CAR_COM_SKILL, CAR_COM_ID_1, CAR_COM_ID_2);
	--Maldicion del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(1490843);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);	
	--Golpe de escudo de la verdad
	local GOL_ESC_SKILL, GOL_ESC_ID_1, GOL_ESC_ID_2 = Match_CE(490186);
	local GOL_ESC_CD = CE_CD(GOL_ESC_SKILL, GOL_ESC_ID_1, GOL_ESC_ID_2);
	--Escudo de torbellino 
	local ESC_TOR_SKILL, ESC_TOR_ID_1, ESC_TOR_ID_2 = Match_CE(1490842);
	local ESC_TOR_CD = CE_CD(ESC_TOR_SKILL, ESC_TOR_ID_1, ESC_TOR_ID_2);		
	--Sacudida
	local SAC_SKILL, SAC_ID_1, SAC_ID_2 = Match_CE(490154);
	local SAC_CD = CE_CD(SAC_SKILL, SAC_ID_1, SAC_ID_2);			
	--Golpe de Castigo
	local GOL_CAS_SKILL, GOL_CAS_ID_1, GOL_CAS_ID_2 = Match_CE(1490840);
	local GOL_CAS_CD = CE_CD(GOL_CAS_SKILL, GOL_CAS_ID_1, GOL_CAS_ID_2);	
	--Sello sagrado
	local SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2 = Match_CE(490149);
	local SELL_SAG_CD = CE_CD(SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2);	
	--Castigo    
	local CAST_SKILL, CAST_ID_1, CAST_ID_2 = Match_CE(1490839);
	local CAST_CD = CE_CD(CAST_SKILL, CAST_ID_1, CAST_ID_2);		
	--Golpe impio
	local GOL_IMP_SKILL, GOL_IMP_ID_1, GOL_IMP_ID_2 = Match_CE(1490838);
	local GOL_IMP_CD = CE_CD(GOL_IMP_SKILL, GOL_IMP_ID_1, GOL_IMP_ID_2);	
	--Explosión del poder sagrado
	local EXP_POD_SKILL, EXP_POD_ID_1, EXP_POD_ID_2 = Match_CE(1490841);
	--Amenaza 
	local AME_SKILL, AME_ID_1, AME_ID_2 = Match_CE(490153);
	--Escudo de oscuridad
	local ESC_OSC_SKILL, ESC_OSC_ID_1, ESC_OSC_ID_2 = Match_CE(1490502);

	
	--Explosión del poder sagrado
    if EXP_POD_SKILL and (CE_BuffIdPlayer(1501210) == false) then
        UseSkill(EXP_POD_ID_1, EXP_POD_ID_2) 
	--Amenaza 
    elseif AME_SKILL and (CE_BuffIdPlayer(500246) == false) then
        UseSkill(AME_ID_1, AME_ID_2) 
	--Escudo de oscuridad
    elseif ESC_OSC_SKILL and (CE_BuffIdPlayer(1501201) == false) and (CE_isShield() == false) then
        UseSkill(ESC_OSC_ID_1, ESC_OSC_ID_2)
    end

	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end




	--ROTACION--
	if ESC_VAL_SKILL and ESC_VAL_CD <= 0.25 and CE_TARGET_IS_BOSS() and (CE_isShield() or CE_BuffIdPlayer(1501201)) then
		UseSkill(ESC_VAL_ID_1, ESC_VAL_ID_2);
	--Escudo de diciplina
	elseif ESC_DIC_SKILL and ESC_DIC_CD <= 0.25 and (hp <= MaxHp/2 or C_EngineSettings.FastBuffs) and (CE_isShield() or CE_BuffIdPlayer(1501201))  then
		UseSkill(ESC_DIC_ID_1, ESC_DIC_ID_2);
	--Huellas de la espada cruzada
	elseif (CE_TARGET_IS_BOSS == false) and pm >= MaxPm/10 and CE_ISS_CD(CE_toName(490241)) and _G.C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490241));
	--Embestida
	elseif EMB_SKILL and EMB_CD <= 0.25 and IsSpellUsable(490150) then 
		UseSkill(EMB_ID_1, EMB_ID_2);
	--Maldicion del tejido debilitante
	elseif MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.25 and foco >= 30 and _G.C_EngineSettings.AOE then
        UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Carga combada
	elseif CAR_COM_SKILL and CAR_COM_CD <= 0.25 and foco >= 20 then
		UseSkill(CAR_COM_ID_1, CAR_COM_ID_2);
	--Sello sagrado
	elseif SELL_SAG_SKILL and SELL_SAG_CD <= 0.25 then
		UseSkill(SELL_SAG_ID_1, SELL_SAG_ID_2);
	--Escudo de torbellino 
	elseif ESC_TOR_SKILL and ESC_TOR_CD <= 0.45 and IsSpellUsable(1490838) and CE_BuffIdPlayer(1501201) or CE_isShield() and _G.C_EngineSettings.AOE then
		UseSkill(ESC_TOR_ID_1, ESC_TOR_ID_2); 
	--Tsunami
    elseif CE_ISS_CD(CE_toName(490359)) and IsSpellUsable(1490838) and _G.C_EngineSettings.AOE then 
        CastSpellByName(CE_toName(490359));
	--Golpe de escudo
    elseif GOL_ESC_SKILL and GOL_ESC_CD <= 0.45 and CE_BuffIdPlayer(1501201) or CE_isShield() then
        UseSkill(GOL_ESC_ID_1, GOL_ESC_ID_2);
	--Golpe de Castigo
	elseif GOL_CAS_SKILL and GOL_CAS_CD <= 0.45 and CE_DebuffIdTarget(1501208) then 
		UseSkill(GOL_CAS_ID_1, GOL_CAS_ID_2);
	--Castigo  
	elseif CAST_SKILL and CAST_CD <= 0.45 and CE_DebuffIdTarget(Sello_4) then
		UseSkill(CAST_ID_1, CAST_ID_2);
	--Sacudida
    elseif SAC_SKILL and SAC_CD <= 0.45 and (CE_DebuffIdTarget(Sello_2) or CE_DebuffIdTarget(Sello_3) or CE_DebuffIdTarget(Sello_4)) then
		UseSkill(SAC_ID_1, SAC_ID_2);
	--Espada escarlata perfecta
	elseif CE_ISS_CD(495564) and CE_TARGET_IS_BOSS() then
		CastSpellByName(CE_toName(495564));	
	--Sello sagrado
	elseif SELL_SAG_SKILL and SELL_SAG_CD <= 0.45 then
		UseSkill(SELL_SAG_ID_1, SELL_SAG_ID_2);
	--Golpe impio
	elseif ESC_TOR_CD > 0 or _G.C_EngineSettings.AOE == false then
		UseSkill(GOL_IMP_ID_1, GOL_IMP_ID_2);
    end	
	
	
end 


function CE_KNIGHT_WARLOCK_IMPORT()
	local Skills = {
		1244064, 1244060, 200173, 1244062, 1490841, 490153, 1490502, 490468,
		490468, 490192, 490192, 490192, 490192, 490241, 490150, 1490843, 1490844, 490149,
		1490842, 1490842, 490359, 490186, 490186, 1490840, 1490839, 490154, 490154, 490154,
		495564, 490149, 1490838,
	}
	local conditions = {
		{ -- 1 Pocion enano 1244064
			[3] = { min="0", max="20", status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 2 Costilla de primera 1244060
			[12] = { id1="1500235", id2="0", id3="0", id4="0", status=true },
			[29] = { enable=true, status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 3 Estimulante fuerte 200173
			[12] = { id1="1500237", id2="0", id3="0", id4="0", status=true },
			[29] = { enable=true, status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 4 Agilidad elfica 1244062
			[12] = { id1="1500237", id2="0", id3="0", id4="0", status=true },
			[17] = { id="501321", status=true, time="0" },
			[29] = { enable=true, status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 5 Explosion del poder sagrado 1490841
			[12] = { id1="1501210", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 6 Amenaza 490153
			[12] = { id1="500246", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 7 Escudo de oscuridad 1490502
			[12] = { id1="1501201", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 8 Escudo del valor (escudo) 490468
			[23] = { enable=true, status=true },
			[29] = { enable=true, status=true },
		},
		{ -- 9 Escudo del valor (buff) 490468
			[9] = { id1="1501201", id2="0", id3="0", id4="0", status=true },
			[29] = { enable=true, status=true },
		},
		{ -- 10 Escudo de disciplina (hp, escudo) 490192
			[1] = { min="0", max="50", status=true },
			[23] = { enable=true, status=true },
		},
		{ -- 11 Escudo de disciplina (hp, buff) 490192
			[1] = { min="0", max="50", status=true },
			[11] = { id1="1501201", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 12 Escudo de disciplina (fast, escudo) 490192
			[23] = { enable=true, status=true },
			[41] = { enable=true, status=true },
		},
		{ -- 13 Escudo de disciplina (fast, buff) 490192
			[11] = { id1="1501201", id2="0", id3="0", id4="0", status=true },
			[41] = { enable=true, status=true },
		},
		{ -- 14 Huellas de la espada cruzada 490241
			[2] = { min="10", max="100", status=true },
			[39] = { enable=true, status=true },
			[45] = { enable=true, status=true },
		},
		{ -- 15 Embestida 490150
		},
		{ -- 16 Maldicion tejido debilitante 1490843
			[3] = { min="30", max="100", status=true },
			[39] = { enable=true, status=true },
		},
		{ -- 17 Carga combada 1490844
			[3] = { min="20", max="100", status=true },
		},
		{ -- 18 Sello sagrado 490149
		},
		{ -- 19 Escudo de torbellino (buff) 1490842
			[11] = { id1="1501201", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 20 Escudo de torbellino (escudo+AOE) 1490842
			[23] = { enable=true, status=true },
			[39] = { enable=true, status=true },
		},
		{ -- 21 Tsunami 490359
			[39] = { enable=true, status=true },
		},
		{ -- 22 Golpe de escudo de la verdad (buff) 490186
			[11] = { id1="1501201", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 23 Golpe de escudo de la verdad (escudo) 490186
			[23] = { enable=true, status=true },
		},
		{ -- 24 Golpe de castigo 1490840
			[32] = { id1="1501208", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 25 Castigo 1490839
			[32] = { id1="500169", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 26 Sacudida (sello 2) 490154
			[32] = { id1="500146", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 27 Sacudida (sello 3) 490154
			[32] = { id1="500168", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 28 Sacudida (sello 4) 490154
			[32] = { id1="500169", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 29 Espada escarlata perfecta 495564
			[29] = { enable=true, status=true },
		},
		{ -- 30 Sello sagrado (2) 490149
		},
		{ -- 31 Golpe impio 1490838
		},
	}
	local iss = {
		[490241] = true,
		[490359] = true,
		[495564] = true,
	}
	local consumables = {
		[1244064] = true,
		[1244060] = true,
		[200173] = true,
		[1244062] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
