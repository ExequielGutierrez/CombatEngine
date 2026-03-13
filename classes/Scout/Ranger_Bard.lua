
--Lua SCOUT/BARD BY NEORAXER 11-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_BARD()



    --DEFAULT_CHAT_FRAME:AddMessage("Usando EXPLO/BARDO")
	--local hp = UnitHealth("player")
    --local MaxHp = UnitMaxHealth("player")


	local foco = UnitMana("player");


    --Tiro de precisi�n
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(490450);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Disparo vital
	local DIS_VIT_SKILL, DIS_VIT_ID_1, DIS_VIT_ID_2 = Match_CE(1491222);
	local DIS_VIT_CD = CE_CD(DIS_VIT_SKILL, DIS_VIT_ID_1, DIS_VIT_ID_2);
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(490424);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha vamp�rica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(490400);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(1491472);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);    
    --Disparo drena-mana
    local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(490441);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2);   
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);    
    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(1491470);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Flecha de escarcha
    local FLE_ESC_SKILL, FLE_ESC_ID_1, FLE_ESC_ID_2 = Match_CE(491163);
    --Detecci�n
    local DET_SKILL, DET_ID_1, DET_ID_2 = Match_CE(490463);
    --Campo de mira
    local CAM_MIR_SKILL, CAM_MIR_ID_1, CAM_MIR_ID_2 = Match_CE(490464);
    --Concentraci�n
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_ARR_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);
    --Ganaremos
	local GAN_SKILL, GAN_ID_1, GAN_ID_2 = Match_CE(1491220);
	local GAN_CD = CE_CD(GAN_SKILL, GAN_ID_1, GAN_ID_2);
    --Flecha sin Sangre
    local FLE_SIN_SKILL, FLE_SIN_ID_1, FLE_SIN_ID_2 = Match_CE(1491473);
    local FLE_SIN_CD = CE_CD(FLE_SIN_SKILL, FLE_SIN_ID_1, FLE_SIN_ID_2);


	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Estimulante fuerte
        elseif  CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif  CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end


	CE_NewAutoShoot( 492589 );

    --Flecha de escarcha 
    if FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) and foco >= 20
        then UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
    --Campo de mira
    elseif CAM_MIR_SKILL and (CE_BuffIdPlayer(500934) == false) and CE_TARGET_IS_BOSS() and foco >= 10
        then UseSkill(CAM_MIR_ID_1, CAM_MIR_ID_2);
    --Concentraci�n
    elseif CON_SKILL and CON_ARR_CD <= 0.25 and (CE_BuffIdPlayer(500930) == false) and foco <= 40 
        then UseSkill(CON_ID_1, CON_ID_2);
    --Flecha sin Sangre
    elseif FLE_SIN_SKILL and FLE_SIN_CD <= 0.25 and (CE_BuffIdPlayer(1502174) == false)
        then UseSkill(FLE_SIN_ID_1, FLE_SIN_ID_2);        
    --Detecci�n
    elseif DET_SKILL and (CE_BuffIdPlayer(1502170) == false)
        then UseSkill(DET_ID_1, DET_ID_2);        
    --Ganaremos
    elseif GAN_SKILL and GAN_CD <= 0.25 and (CE_TARGET_IS_BOSS() or C_EngineSettings.FastBuffs)
        then UseSkill(GAN_ID_1, GAN_ID_2);       

    --ROTACI�N--

    --Tiro
    elseif TIR_SKILL and TIR_CD <= 0.25 and CE_AFE(1502167, 10)
        then UseSkill(TIR_ID_1, TIR_ID_2);
    --Tiro de presicion         
    elseif TIR_PRE_SKILL and TIR_PRE_CD <= 0.25 and CE_BuffIdPlayer(500939) then
         UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Disparo combinado
    elseif DIS_COM_SKILL and DIS_COM_CD <= 0.3  then
        UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
    --Disparo vital
    elseif DIS_VIT_SKILL and DIS_VIT_CD <= 0.25 and foco >= 20
        then UseSkill(DIS_VIT_ID_1, DIS_VIT_ID_2);
    --Golpe a las articulaciones
    elseif GOL_ART_SKILL and  GOL_ART_CD <= 0.25 and foco >= 15 then
         UseSkill(GOL_ART_ID_1, GOL_ART_ID_2); 
    --Flecha vampirica
    elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.3 and CE_DebuffIdTarget(501690) == false and foco >= 10 then
        UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Flecha desgarradora   
    elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(FLE_DES_ID_1, FLE_DES_ID_2); 
    --Disparo colateral 
    elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);  
    --Disparo drena-mana
    elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 and CE_TARGET_IS_BOSS()
        then UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);    
    end
 
end








