
--Lua Scout/Druid BY NEORAXER 10-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_WARDEN()



    --DEFAULT_CHAT_FRAME:AddMessage("Usando EXPLO/DRUIDA")
	--local hp = UnitHealth("player")
    --local MaxHp = UnitMaxHealth("player")
	
	local foco = UnitMana("player")
	local mana = UnitSkill("player")
    local MaxPm = UnitMaxSkill("player")


	--Escudo de zarzas
	local ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2 = Match_CE(499573);
	--Flecha de escarcha
	local FLE_ESC_SKILL, FLE_ESC_ID_1, FLE_ESC_ID_2 = Match_CE(491163);
	--Ofrenda del peque�o ent
	local OFR_ENT_SKILL, OFR_ENT_ID_1, OFR_ENT_ID_2 = Match_CE(494038);
	--Concentraci�n
	local CONC_SKILL, CONC_ID_1, CONC_ID_2 = Match_CE(490460);
	local CONC_CD = CE_CD(CONC_SKILL, CONC_ID_1, CONC_ID_2);
	--Poder feroz
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);
	--Corte cargado
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(494336);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2);
	--Peligro oculto
	local PEL_OCU_SKILL, PEL_OCU_ID_1, PEL_OCU_ID_2 = Match_CE(494620);
	local PEL_OCU_CD = CE_CD(PEL_OCU_SKILL, PEL_OCU_ID_1, PEL_OCU_ID_2);
    --Tiro de precisi�n
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(499576);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
	--Flecha de espinas
    local FLE_ESP_SKILL, FLE_ESP_ID_1, FLE_ESP_ID_2 = Match_CE(499751);
	local FLE_ESP_CD = CE_CD(FLE_ESP_SKILL, FLE_ESP_ID_1, FLE_ESP_ID_2); 
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(490400);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(490457);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);    
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(494942);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
	--Golpe de grifo
	local GOL_GRI_SKILL, GOL_GRI_ID_1, GOL_GRI_ID_2 = Match_CE(494629);
	local GOL_GRI_CD = CE_CD(GOL_GRI_SKILL, GOL_GRI_ID_1, GOL_GRI_ID_2);
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);   
	--Flecha vamp�rica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    


   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar Phirius de mana
		elseif mana <= MaxPm/100 * 10 and CE_UseItem(203503) then
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
	
    --Tiro de precisi�n
	if TIR_PRE_SKILL and TIR_PRE_CD <=0.25 and CE_BuffIdPlayer(504588) and ((CE_isMoving() == false) or CE_BuffIdPlayer(1500556)) then
		UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);	
	elseif DIS_COM_SKILL and DIS_COM_CD <= 0.25 and ((CE_isMoving() == false) or CE_BuffIdPlayer(1500556)) then
		UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
	end
	
	CE_NewAutoShoot( 492589 );
	
	--Escudo de zarzas
	if ESC_ZAR_SKILL and (CE_BuffIdPlayer(623113) == false) then
		UseSkill(ESC_ZAR_ID_1, ESC_ZAR_ID_2);
	--Flecha de escarcha
	elseif FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) then
		UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
	--Concentraci�n
	elseif CONC_SKILL and CONC_CD <= 0.25 and foco <= 20 and (CE_BuffIdPlayer(500930) == false) then
		UseSkill(CONC_ID_1, CONC_ID_2);
	--Poder feroz
	elseif POD_FER_SKILL and POD_FER_CD <= 0.25 and _G.C_EngineSettings.FastBuffs then
		UseSkill(POD_FER_ID_1, POD_FER_ID_2);
	--Ofrenda del peque�o ent
	elseif OFR_ENT_SKILL and (CE_BuffIdPlayer(504547) == false) then
		UseSkill(OFR_ENT_ID_1, OFR_ENT_ID_2);
	--Corte cargado
	elseif COR_CAR_SKILL and COR_CAR_CD <= 0.25 then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);
	--Peligro oculto
	elseif PEL_OCU_SKILL and PEL_OCU_CD <= 0.25 and foco >= 30 then
		UseSkill(PEL_OCU_ID_1, PEL_OCU_ID_2);
    --Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_CD <= 0.25 and foco >= 15 then
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
	--Flecha de espinas
	elseif FLE_ESP_SKILL and FLE_ESP_CD <= 0.25 and CE_BuffIdPlayer(623113) and _G.C_EngineSettings.AOE then 
		UseSkill(FLE_ESP_ID_1, FLE_ESP_ID_2);
    --Flecha desgarradora
	elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and _G.C_EngineSettings.AOE then 
		UseSkill(FLE_DES_ID_1, FLE_DES_ID_2);
    --Disparo colateral 
	elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and _G.C_EngineSettings.AOE then 
		UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);
	--Golpe de grifo
	elseif GOL_GRI_SKILL and GOL_GRI_CD <= 0.25 and pm >= ((MaxPm/100) * 6) and _G.C_EngineSettings.AOE then 
		UseSkill(GOL_GRI_ID_1, GOL_GRI_ID_2);
    --Flecha de viento
	elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
		UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
	--Flecha vamp�rica
	elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and (CE_DebuffIdTarget(501690) == false) then
		UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
	end
	
end








