
--Lua WARDEN/CHAMPION BY NEORAXER 20-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

	local warning = false
function CE_WARDEN_CAMPION()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	
	local pm = UnitMana("player")
	local ira = UnitSkill("player")
    local MaxPm = UnitMaxMana("player")
    local hp = UnitHealth("player")
    local MaxHp = UnitMaxHealth("player")
	
	--Guardian castigador
	local GUA_CAS_SKILL, GUA_CAS_ID_1, GUA_CAS_ID_2 = Match_CE(1490520);
	--Maestro del agro
	local MAE_AGR_SKILL, MAE_AGR_ID_1, MAE_AGR_ID_2 = Match_CE(1490525);
	--Protección de la naturaleza
	local PRO_NAT_SKILL, PRO_NAT_ID_1, PRO_NAT_ID_2 = Match_CE(1490846);		
	--Formación de blindaje -> 30seg def cd 60s
	local FOR_BLI_SKILL, FOR_BLI_ID_1, FOR_BLI_ID_2 = Match_CE(1490522);
	local FOR_BLI_CD = CE_CD(FOR_BLI_SKILL, FOR_BLI_ID_1, FOR_BLI_ID_2);
	--Bendición del guardían -> reduce daño 30seg cd 60s
	local BEN_GUA_SKILL, BEN_GUA_ID_1, BEN_GUA_ID_2 = Match_CE(1490528);
	local BEN_GUA_CD = CE_CD(BEN_GUA_SKILL, BEN_GUA_ID_1, BEN_GUA_ID_2);
	--Corazón del roble -> res 2 golpes
	local COR_ROB_SKILL, COR_ROB_ID_1, COR_ROB_ID_2 = Match_CE(491668);
	local COR_ROB_CD = CE_CD(COR_ROB_SKILL, COR_ROB_ID_1, COR_ROB_ID_2);	
	--Guia elfica -> restore pm
	local GUI_ELF_SKILL, GUI_ELF_ID_1, GUI_ELF_ID_2 = Match_CE(493405);
	local GUI_ELF_CD = CE_CD(GUI_ELF_SKILL, GUI_ELF_ID_1, GUI_ELF_ID_2);				
	--Poder feroz -> + daño
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);			
	--Absorción de energia
	local ABS_ENE_SKILL, ABS_ENE_ID_1, ABS_ENE_ID_2 = Match_CE(493644);
	local ABS_ENE_CD = CE_CD(ABS_ENE_SKILL, ABS_ENE_ID_1, ABS_ENE_ID_2);	
	--Corte Cruzado
	local COR_CRU_SKILL, COR_CRU_ID_1, COR_CRU_ID_2 = Match_CE(493394);
	local COR_CRU_CD = CE_CD(COR_CRU_SKILL, COR_CRU_ID_1, COR_CRU_ID_2);	
	--Rugido    
	local RUG_SKILL, RUG_ID_1, RUG_ID_2 = Match_CE(1490526);
	local RUG_CD = CE_CD(RUG_SKILL, RUG_ID_1, RUG_ID_2);
	--Zarzas Freneticas
	local ZAR_FRE_SKILL, ZAR_FRE_ID_1, ZAR_FRE_ID_2 = Match_CE(1490847);
	local ZAR_FRE_CD = CE_CD(ZAR_FRE_SKILL, RUG_ID_1, ZAR_FRE_ID_1);
	--Golpe de descarga
	local GOL_DES_SKILL, GOL_DES_ID_1, GOL_DES_ID_2 = Match_CE(498534);
	local GOL_DES_CD = CE_CD(GOL_DES_SKILL, GOL_DES_ID_1, GOL_DES_ID_2);
	--Poder del espiritu del bosque
	local POD_ESP_BOS_SKILL, POD_ESP_BOS_ID_1, POD_ESP_BOS_ID_2 = Match_CE(493392);
	local POD_ESP_BOS_CD = CE_CD(POD_ESP_BOS_SKILL, POD_ESP_BOS_ID_1, POD_ESP_BOS_ID_2);
	--Golpe de canalizacion de energia
	local GOL_CAN_SKILL, GOL_CAN_ID_1, GOL_CAN_ID_2 = Match_CE(498526);
	local GOL_CAN_CD = CE_CD(GOL_CAN_SKILL, GOL_CAN_ID_1, GOL_CAN_ID_2);
	--Electrocusión
	local ELEC_SKILL, ELEC_ID_1, ELEC_ID_2 = Match_CE(498522);
	local ELEC_CD = CE_CD(ELEC_SKILL, ELEC_ID_1, ELEC_ID_2);
	--Corte cargado
	local COR_CARG_SKILL, COR_CARG_ID_1, COR_CARG_ID_2 = Match_CE(493395);
	local COR_CARG_CD = CE_CD(COR_CARG_SKILL, COR_CARG_ID_1, COR_CARG_ID_2);
	--Embestida brutal
	local EMB_BRUT_SKILL, EMB_BRUT_ID_1, EMB_BRUT_ID_2 = Match_CE(1490855);
	local EMB_BRUT_CD = CE_CD(EMB_BRUT_SKILL, EMB_BRUT_ID_1, EMB_BRUT_ID_2);
	--Ataque
	local ATA_SKILL, ATA_ID_1, ATA_ID_2 = Match_CE(540000);
	--Oración élfica
	local ORA_ELF_SKILL, ORA_ELF_ID_1, ORA_ELF_ID_2 = Match_CE(493398);
	local ORA_ELF_CD = CE_CD(ORA_ELF_SKILL, ORA_ELF_ID_1, ORA_ELF_ID_2);
	--Naturaleza rúnica
	local NAT_RUN_SKILL, NAT_RUN_ID_1, NAT_RUN_ID_2 = Match_CE(1490519);
	local NAT_RUN_CD = CE_CD(NAT_RUN_SKILL, NAT_RUN_ID_1, NAT_RUN_ID_2);

	
		
	--BUFFOS--

	--Guardian castigador
	if GUA_CAS_SKILL and (CE_BuffIdPlayer(1501223) == false) and (CE_READ_PET(139346) == false) then
		UseSkill(GUA_CAS_ID_1, GUA_CAS_ID_2);
	--Maestro del agro
	elseif MAE_AGR_SKILL and (CE_BuffIdPlayer(1501239) == false) and CE_BuffIdPlayer(1501223) then
		UseSkill(MAE_AGR_ID_1, MAE_AGR_ID_2);
	--Protección de la naturaleza
	elseif PRO_NAT_SKILL and (CE_BuffIdPlayer(503581) == false) then
		UseSkill(PRO_NAT_ID_1, PRO_NAT_ID_2);
	--Remove zarzas en AoE off
	elseif (_G.C_EngineSettings.AOE == false) and (warning == false) and CE_BuffIdPlayer(503958) then
		CancelPlayerBuff(CE_GET_INDEX_BUFF(503958));
		DEFAULT_CHAT_FRAME:AddMessage("|cffffd700Combat Engine: Clean |cff80ff00"..CE_toName(503958));
		warning = true
	elseif _G.C_EngineSettings.AOE or (CE_BuffIdPlayer(503958) == false) then
		warning = false
	end
	
	
	--BUFFOS CORTOS DEFENSIVOS--
	
	--Bendición de Guardian
	if BEN_GUA_SKILL and BEN_GUA_CD <= 0.1 and (CE_BuffIdPlayer(1501245) == false) and (CE_BuffIdPlayer(1501233) == false) and CE_READ_PET(139346) then
		UseSkill(BEN_GUA_ID_1, BEN_GUA_ID_2);
	--Formación de blindaje
	elseif FOR_BLI_SKILL and FOR_BLI_CD <= 0.1 and (CE_BuffIdPlayer(1501233) == false) and CE_BuffTimeLeftById(1501245) and CE_READ_PET(139346) then
		UseSkill(FOR_BLI_ID_1, FOR_BLI_ID_2);
	--Oracion elfica
	elseif CE_READ_PET(139346) and ORA_ELF_SKILL and ORA_ELF_CD <= 0.1 and UnitHealth("pet") <= UnitMaxHealth("pet")/2 and CE_READ_PET(139346) then
		UseSkill(ORA_ELF_ID_1, ORA_ELF_ID_2);
	end

	--BUFFOS CORTOS OFENSIVOS--

	--Poder feroz
	if POD_FER_SKILL and POD_FER_CD <= 0.1 then
		UseSkill(POD_FER_ID_1, POD_FER_ID_2);	
	end

	
	-- HABILIDADES DE RESTAURACIÓN
	
	--Guia elfica
	if GUI_ELF_SKILL and GUI_ELF_CD <= 0.1 and pm <= MaxPm/3 then
		UseSkill(GUI_ELF_ID_1, GUI_ELF_ID_2);
	--Corazón del roble
	elseif COR_ROB_SKILL and COR_ROB_CD <= 0.1 and hp <= MaxHp/4 then
		UseSkill(COR_ROB_ID_1, COR_ROB_ID_2);
	--Naturaleza rúnica
	elseif NAT_RUN_SKILL and NAT_RUN_CD <= 0.1 and ira <= 50 then
		UseSkill(NAT_RUN_ID_1, NAT_RUN_ID_2);	
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if (ira <= 20 ) and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/3 and CE_UseItem(203503) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end
	
	--Rugido
    if RUG_SKILL and RUG_CD <= 0.1 and pm > 0 and ira >= 5 and _G.C_EngineSettings.AOE then
        UseSkill(RUG_ID_1, RUG_ID_2)  
	--Embestida brutal
	elseif EMB_BRUT_SKILL and EMB_BRUT_CD <= 0.1 and pm > 1000 and ira <= 65 and _G.C_EngineSettings.AOE and IsSpellUsable(1490855) then
		UseSkill(EMB_BRUT_ID_1, EMB_BRUT_ID_2);
	--Absorción de energia
    elseif ABS_ENE_SKILL and ABS_ENE_CD <= 0.1 and CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(504137) == false) then
        UseSkill(ABS_ENE_ID_1, ABS_ENE_ID_2);   
	--Corte Cruzado
    elseif COR_CRU_SKILL and COR_CRU_CD <= 0.1 and (CE_CHECK_STUN() or CE_TARGET_IS_BOSS())  and _G.C_EngineSettings.AOE then
        UseSkill(COR_CRU_ID_1, COR_CRU_ID_2)	
	--Castigo de la bestia
	elseif (IsSpellUsable(850154)) and pm >= MaxPm/20 and (CE_CHECK_STUN() or CE_TARGET_IS_BOSS())  and _G.C_EngineSettings.AOE then
        CastSpellByName(CE_toName(850154)); 
	--Golpe de descarga
    elseif (IsSpellUsable(493395)) and ira >= 25 and (CE_CHECK_STUN() or (CE_TARGET_IS_BOSS() == false))  and _G.C_EngineSettings.AOE then
        UseSkill(GOL_DES_ID_1, GOL_DES_ID_2);
	--Ataque del espiritu animal
	elseif CE_ISS_CD(CE_toName(490324)) and CE_TARGET_IS_BOSS() then
		CastSpellByName(CE_toName(490324)); 
	--Zarzas Freneticas
	elseif ZAR_FRE_SKILL and ZAR_FRE_CD <= 0 and pm > 1000 and (CE_TARGET_IS_BOSS() == false) and _G.C_EngineSettings.AOE then
		UseSkill(ZAR_FRE_ID_1, ZAR_FRE_ID_2);
	--Embestida brutal
	elseif EMB_BRUT_SKILL and EMB_BRUT_CD <= 0.1 and pm > 1000 and (CE_DEBUFF_STACK(621164, 3) == false) and _G.C_EngineSettings.AOE then
		UseSkill(EMB_BRUT_ID_1, EMB_BRUT_ID_2);
	--Golpe de canalizacion de energia
	elseif GOL_CAN_SKILL and GOL_CAN_CD <= 0.1 and ira >=25 and (CE_DebuffIdTarget(621166) == true) then
		UseSkill(GOL_CAN_ID_1, GOL_CAN_ID_2);
	--Electrocusión
	elseif ELEC_SKILL and ELEC_CD <= 0.1 and ira >= 20 then
		UseSkill(ELEC_ID_1, ELEC_ID_2);
	--Poder del espiritu del bosque
	elseif POD_ESP_BOS_SKILL and POD_ESP_BOS_CD <= 0.45 and pm > 1000 and _G.C_EngineSettings.AOE then
		UseSkill(POD_ESP_BOS_ID_1, POD_ESP_BOS_ID_2);
	--Corte cargado
	elseif COR_CARG_SKILL and COR_CARG_CD <= 0.1 and pm > 1000 then
		UseSkill(COR_CARG_ID_1, COR_CARG_ID_2);
	--Ataque
	elseif ATA_SKILL and (UnitIsDeadOrGhost("target") == false) and CE_READ_PET(139346) then
	UseSkill(ATA_ID_1, ATA_ID_2);

	end
	
end


function CE_CHECK_STUN()

	local derribo = 500382
	local aturdimiento = 507789
	local descarga = 621207
	local aturd_castigo = 502570


	if CE_DebuffIdTarget(derribo) or CE_DebuffIdTarget(aturdimiento) or CE_DebuffIdTarget(descarga) or CE_DebuffIdTarget(aturd_castigo) then
		return false
	else
		return true
	end
	
end







function CE_WARDEN_CHAMPION_IMPORT()
	--Consumables first, then rotation in Lua order (pet conditions and pet actions cannot be expressed)
	local Skills = { 1244064, 1244060, 203503, 200173, 1244062, 1490520, 1490525, 1490846, 1490528, 1490522, 493406, 493405, 491668, 1490519, 1490526, 1490855, 493644, 493394, 850154, 498534, 490324, 1490847, 1490855, 498526, 498522, 493392, 493395, 540000 }
	local conditions = {
		-- 1 pocion del enano 1244064
		[1] = { [6]={ max="20", min="0", status=true }, [40]={ enable=true, status=true } },
		-- 2 costilla 1244060
		[2] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 3 Phirius 203503
		[3] = { [2]={ max="33", min="0", status=true }, [40]={ enable=true, status=true } },
		-- 4 estimulante fuerte 200173
		[4] = { [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 5 agilidad elfica 1244062
		[5] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 6 Guardian castigador 1490520
		[6] = { [12]={ id1="1501223", id2="0", id3="0", id4="0", status=true } },
		-- 7 Maestro del agro 1490525
		[7] = {
			[11]={ id1="1501223", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="1501239", id2="0", id3="0", id4="0", status=true }
		},
		-- 8 Proteccion de la naturaleza 1490846
		[8] = { [12]={ id1="503581", id2="0", id3="0", id4="0", status=true } },
		-- 9 Bendicion del guardian 1490528
		[9] = { [12]={ id1="1501245", id2="0", id3="0", id4="0", status=true } },
		-- 10 Formacion de blindaje 1490522
		[10] = {
			[11]={ id1="1501245", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="1501233", id2="0", id3="0", id4="0", status=true }
		},
		-- 11 Poder feroz 493406
		[11] = {},
		-- 12 Guia elfica 493405
		[12] = { [2]={ max="33", min="0", status=true } },
		-- 13 Corazon del roble 491668
		[13] = { [1]={ max="25", min="0", status=true } },
		-- 14 Naturaleza runica 1490519
		[14] = { [6]={ max="50", min="0", status=true } },
		-- 15 Rugido 1490526
		[15] = { [2]={ max="100", min="1", status=true }, [6]={ max="100", min="5", status=true }, [39]={ enable=true, status=true } },
		-- 16 Embestida brutal 1490855
		[16] = { [2]={ max="100", min="10", status=true }, [6]={ max="65", min="0", status=true }, [39]={ enable=true, status=true } },
		-- 17 Absorcion de energia 493644
		[17] = { [12]={ id1="504137", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true } },
		-- 18 Corte cruzado 493394
		[18] = { [33]={ id1="500382", id2="0", id3="0", id4="0", status=true }, [39]={ enable=true, status=true } },
		-- 19 Castigo de la bestia 850154
		[19] = { [2]={ max="100", min="5", status=true }, [33]={ id1="500382", id2="0", id3="0", id4="0", status=true }, [39]={ enable=true, status=true } },
		-- 20 Golpe de descarga 498534
		[20] = { [6]={ max="100", min="25", status=true }, [33]={ id1="500382", id2="0", id3="0", id4="0", status=true }, [39]={ enable=true, status=true } },
		-- 21 Ataque del espiritu animal 490324
		[21] = { [29]={ enable=true, status=true } },
		-- 22 Zarzas freneticas 1490847
		[22] = { [2]={ max="100", min="10", status=true }, [39]={ enable=true, status=true }, [45]={ enable=true, status=true } },
		-- 23 Embestida brutal 1490855
		[23] = { [2]={ max="100", min="10", status=true }, [37]={ id="621164", stack="3", orMore=true, self=false, status=true }, [39]={ enable=true, status=true } },
		-- 24 Golpe de canalizacion de energia 498526
		[24] = { [6]={ max="100", min="25", status=true }, [32]={ id1="621166", id2="0", id3="0", id4="0", status=true } },
		-- 25 Electrocusion 498522
		[25] = { [6]={ max="100", min="20", status=true } },
		-- 26 Poder del espiritu del bosque 493392
		[26] = { [2]={ max="100", min="10", status=true }, [39]={ enable=true, status=true } },
		-- 27 Corte cargado 493395
		[27] = { [2]={ max="100", min="10", status=true } },
		-- 28 Ataque 540000
		[28] = {}
	}
	local iss = {
		[850154] = true,
		[490324] = true
	}
	local consumables = {
		[1244064] = true,
		[200173] = true,
		[1244062] = true,
		[1244060] = true,
		[203503] = true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
