
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
	--Escudo de zarzas
	local ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2 = Match_CE(493642);	
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
	--Escudo de zarzas
	elseif ESC_ZAR_SKILL and (CE_READ_BUFF_FAST(503958) == false) and _G.C_EngineSettings.AOE then
		UseSkill(ESC_ZAR_ID_1, ESC_ZAR_ID_2);
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







