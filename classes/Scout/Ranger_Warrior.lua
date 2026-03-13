
--Lua Scout/Warrior BY NEORAXER 19-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_WARRIOR()



    --DEFAULT_CHAT_FRAME:AddMessage("Usando EXPLO/DRUIDA")
	--local hp = UnitHealth("player")
    --local MaxHp = UnitMaxHealth("player")
	
	local foco = UnitMana("player");
	local ira = UnitSkill("player");

	--Mente clara
	local MEN_CLA_SKILL, MEN_CLA_ID_1, MEN_CLA_ID_2 = Match_CE(491491);
	--Objetivo fijo
	local OBJ_FIJ_SKILL, OBJ_FIJ_ID_1, OBJ_FIJ_ID_2 = Match_CE(492620);
	--Campo de mira
	local CAM_MIR_SKILL, CAM_MIR_ID_1, CAM_MIR_ID_2 = Match_CE(490464);
	--Concentraci�n
	local CONC_SKILL, CONC_ID_1, CONC_ID_2 = Match_CE(490460);
	local CONC_CD = CE_CD(CONC_SKILL, CONC_ID_1, CONC_ID_2);
	--Tiro
	local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(493089);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);	
	--Disparo drena mana
	local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(490441);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Tiro de precisi�n
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(1490338);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(492947);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(493289);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);  
	--Flecha vamp�rica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2); 
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(499512);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);   
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2); 
    --Instinto de batalla
    local INS_BAT_SKILL, INS_BAT_ID_1, INS_BAT_ID_2 = Match_CE(491337);
	local INS_BAT_CD = CE_CD(INS_BAT_SKILL, INS_BAT_ID_1, INS_BAT_ID_2); 
    --Fiera
    local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(490095);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2); 
	--Furiosos
    local FURIOSO_SKILL, FURIOSO_ID_1, FURIOSO_ID_2 = Match_CE(490492);
	local FURIOSO_CD = CE_CD(FURIOSO_SKILL, FURIOSO_ID_1, FURIOSO_ID_2); 






   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end


    --ROTACI�N--
	
	
	--Flecha de viento
	if FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
		UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
	end
	
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		elseif FURIOSO_SKILL and FURIOSO_CD <= 0.25 and ira <= 40 then
			UseSkill(FURIOSO_ID_1, FURIOSO_ID_2)
		end	
	end
	
	CE_NewAutoShoot( 492589 );
	
	--Mente clara
	if MEN_CLA_SKILL and (CE_BuffIdPlayer(501892) == false) then
		UseSkill(MEN_CLA_ID_1, MEN_CLA_ID_2);
	--Instinto de batalla
	elseif INS_BAT_SKILL and (CE_BuffIdPlayer(501821) == false) then
		UseSkill(INS_BAT_ID_1, INS_BAT_ID_2);
	--Objetivo fijo
	elseif OBJ_FIJ_SKILL and (CE_BuffIdPlayer(502920) == false) then
		UseSkill(OBJ_FIJ_ID_1, OBJ_FIJ_ID_2);
	--Campo de mira
	elseif CAM_MIR_SKILL and (CE_BuffIdPlayer(500934) == false) then
		UseSkill(CAM_MIR_ID_1, CAM_MIR_ID_2);
	--Concentraci�n
	elseif CONC_SKILL and CONC_CD <= 0.25 and foco <= 20 and (CE_BuffIdPlayer(500930) == false) then
		UseSkill(CONC_ID_1, CONC_ID_2);	
	--Tiro	
	elseif TIR_SKILL and TIR_CD <= 0.25 and CE_AFE(503255, 11) then
		UseSkill(TIR_ID_1, TIR_ID_2);
	--Disparo drena mana
	elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 and (CE_DebuffIdTarget(507226) == false) and CE_TARGET_IS_BOSS() then
		UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Tiro de precisi�n
	elseif TIR_PRE_SKILL and TIR_PRE_CD <= 0.25 and CE_DebuffIdTarget(507226) and CE_TARGET_IS_BOSS() then
		UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);
	--Disparo Combinado
	elseif DIS_COM_SKILL and DIS_COM_CD <= 0.25 then
		UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);	
    --Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_CD <= 0.25 and foco >= 15 then
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2)
    --Flecha desgarradora
	elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and _G.C_EngineSettings.AOE then 
		UseSkill(FLE_DES_ID_1, FLE_DES_ID_2);
	--Flecha vamp�rica
	elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and (CE_DebuffIdTarget(501690) == false) then
		UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Disparo colateral 
	elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and _G.C_EngineSettings.AOE then 
		UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);
    --Flecha de viento
	elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
		UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
	end
	
end








