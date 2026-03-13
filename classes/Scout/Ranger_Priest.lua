
--Lua SCOUT/PRIEST BY NEORAXER 11-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_PRIEST()

local foco = UnitMana("player");

    --Flecha sangrienta
    local FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2 = Match_CE(490434);
    local FLE_SAN_CD = CE_CD(FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2);
    --Flecha de escarcha
    local FLE_ESC_SKILL, FLE_ESC_ID_1, FLE_ESC_ID_2 = Match_CE(491163);
    --Gracia vital
    local GRA_VIT_SKILL, GRA_VIT_ID_1, GRA_VIT_ID_2 = Match_CE(490290);
    --Agua bendita de manantial
    local AGU_BEN_SKILL, AGU_BEN_ID_1, AGU_BEN_ID_2 = Match_CE(490298);
    --Ataque amplificado
    local ATA_AMP_SKILL, ATA_AMP_ID_1, ATA_AMP_ID_2 = Match_CE(490491);
    --Barrera m�gica
    local BAR_MAG_SKILL, BAR_MAG_ID_1, BAR_MAG_ID_2 = Match_CE(491166);
    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(499580);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Flecha vamp�rica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(492649);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);   
    --L�der espiritual
	local LID_ESP_SKILL, LID_ESP_ID_1, LID_ESP_ID_2 = Match_CE(491335);
	local LID_ESP_CD = CE_CD(LID_ESP_SKILL, LID_ESP_ID_1, LID_ESP_ID_2);
    --Disparo drena-mana
    local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(490443);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2);   
    --Disparo de bendici�n del explorador
    local DIS_BEN_SKILL, DIS_BEN_ID_1, DIS_BEN_ID_2 = Match_CE(490443);
	local DIS_BEN_CD = CE_CD(DIS_BEN_SKILL, DIS_BEN_ID_1, DIS_BEN_ID_2);   
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(490400);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(490457);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);    
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(490424);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);	
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);   
    --Campo de mira
    local CAM_MIR_SKILL, CAM_MIR_ID_1, CAM_MIR_ID_2 = Match_CE(490464);
    --Concentraci�n
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);

    if _G.C_EngineSettings.Consumables then
		--Estimulante fuerte
        if CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
        end
		CE_HEALING_ITEM()
    end


    --Flecha de escarcha 
    if FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) and foco >= 20
        then UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
	--L�der espiritual
    elseif LID_ESP_SKILL and LID_ESP_CD <= 0.25 and _G.C_EngineSettings.FastBuffs then
        UseSkill(LID_ESP_ID_1, LID_ESP_ID_2);     
    --Gracia vital
    elseif GRA_VIT_SKILL and (CE_BuffIdPlayer(500517) == false) and not UnitInParty( "player" )
        then UseSkill(GRA_VIT_ID_1, GRA_VIT_ID_2); 
    --Agua bendita de manantial
    elseif AGU_BEN_SKILL and (CE_BuffIdPlayer(500536) == false) and not UnitInParty( "player" )
        then UseSkill(AGU_BEN_ID_1, AGU_BEN_ID_2); 
    --Ataque amplificado
    elseif ATA_AMP_SKILL and (CE_BuffIdPlayer(500940) == false) and not UnitInParty( "player" )
        then UseSkill(ATA_AMP_ID_1, ATA_AMP_ID_2); 
    --Barrera m�gica
    elseif BAR_MAG_SKILL and (CE_BuffIdPlayer(500548) == false) and not UnitInParty( "player" )
        then UseSkill(BAR_MAG_ID_1, BAR_MAG_ID_2); 
    --Concentraci�n
    elseif CON_SKILL and CON_CD <= 0.25 and (CE_BuffIdPlayer(500930) == false) and foco <= 40 
        then UseSkill(CON_ID_1, CON_ID_2);
    --Flecha sangrienta
    elseif FLE_SAN_SKILL and FLE_SAN_CD <= 0.25 and (CE_BuffIdPlayer(500871) == false)
        then UseSkill(FLE_SAN_ID_1, FLE_SAN_ID_2);              
  


    --ROTACI�N--

	CE_NewAutoShoot( 492589 );

    --Tiro
    elseif TIR_SKILL and TIR_CD <= 0.25 and (CE_BuffIdPlayer(503258) == false)
        then UseSkill(TIR_ID_1, TIR_ID_2);
    --Flecha vampirica
    elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and (CE_BuffIdPlayer(620197) == false) then
        UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Disparo drena-mana
    elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 
        then UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Disparo de bendici�n del explorador
    elseif DIS_BEN_SKILL and DIS_BEN_CD <= 0.25 
        then UseSkill(DIS_BEN_ID_1, DIS_BEN_ID_2);
    --Golpe a las articulaciones
    elseif GOL_ART_SKILL and  GOL_ART_CD <= 0.25 and foco >= 15 then
         UseSkill(GOL_ART_ID_1, GOL_ART_ID_2); 
    --Flecha desgarradora   
    elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(FLE_DES_ID_1, FLE_DES_ID_2); 
    --Disparo colateral 
    elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);  
    --Disparo Combinado
    elseif DIS_COM_SKILL and DIS_COM_CD <= 0.3 and (CE_isMoving() == false or CE_BuffIdPlayer(1500556)) then
        UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);    
    end
 
end








