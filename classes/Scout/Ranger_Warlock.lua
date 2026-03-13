
--Lua SCOUT/BARD BY NEORAXER 11-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_WARLOCK()



    --DEFAULT_CHAT_FRAME:AddMessage("Usando EXPLO/BARDO")
	--local hp = UnitHealth("player")
    --local MaxHp = UnitMaxHealth("player")


	local foco = UnitMana("player");

    -- Warp Charge
    local WA_CHA_SKILL, WA_CHA_ID_1, WA_CHA_ID_2 = Match_CE(1490798);
    local WA_CHA_CD = CE_CD(WA_CHA_SKILL, WA_CHA_ID_1, WA_CHA_ID_2);
    -- Weakening Weave Curse
    local WEA_CURSE_SKILL, WEA_CURSE_ID_1, WEA_CURSE_ID_2 = Match_CE(1490797);
    local WEA_CURSE_CD = CE_CD(WEA_CURSE_SKILL, WEA_CURSE_ID_1, WEA_CURSE_ID_2);
    -- Surge of Malice
    local SUR_MA_SKILL, SUR_MA_ID_1, SUR_MA_ID_2 = Match_CE(1490799);
    local SUR_MA_CD = CE_CD(SUR_MA_SKILL, SUR_MA_ID_1, SUR_MA_ID_2);
    -- Snipe
	local SNI_SKILL, SNI_ID_1, SNI_ID_2 = Match_CE(1490792);
	local SNI_CD = CE_CD(SNI_SKILL, SNI_ID_1, SNI_ID_2);
    
    --Disparo Combinado -- Combo Shot
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(1490793);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
    --Golpe a las articulaciones -- Joint Blow
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha vamp�rica -- Vampire Arrows
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(1490788);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    
    --Flecha desgarradora -- Piercing Arrow
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(1490791);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Disparo colateral -- Reflected Shot
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(1490794);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);    
    --Disparo drena-mana
    local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(1492104);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2);   
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(1490790);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);    
    --Tiro -- Shot
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(1490787);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Flecha de escarcha -- Frost Arrow
    local FLE_ESC_SKILL, FLE_ESC_ID_1, FLE_ESC_ID_2 = Match_CE(491163);
    --Detecci�n
    local DET_SKILL, DET_ID_1, DET_ID_2 = Match_CE(1490800);
    --Campo de mira -- Target Area
    local CAM_MIR_SKILL, CAM_MIR_ID_1, CAM_MIR_ID_2 = Match_CE(1490802);
    --Concentraci�n
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_ARR_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);   
    --Flecha sin Sangre -- Blood Arrow
    local FLE_SIN_SKILL, FLE_SIN_ID_1, FLE_SIN_ID_2 = Match_CE(1490786);
    local FLE_SIN_CD = CE_CD(FLE_SIN_SKILL, FLE_SIN_ID_1, FLE_SIN_ID_2);
    --Oleada Venenosa
    local OLEADA_SKILL, OLEADA_ID_1, OLEADA_ID_2 = Match_CE(1490456);
    local OLEADA_CD = CE_CD(OLEADA_SKILL, OLEADA_ID_1, OLEADA_ID_2);
    

	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar Spicy Kale Chips
		elseif (CE_BuffIdPlayer(1500234) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244059) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end

	--BUFFOS OFENSIVOS--

	if(_G.C_EngineSettings.FastBuffs) then
		if OLEADA_CD < 0.25 then
			UseSkill( OLEADA_ID_1, OLEADA_ID_2 );
		end
	end
	
    --Flecha de escarcha 
    if FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) and foco >= 20
        then UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
    --Campo de mira
    elseif CAM_MIR_SKILL and (CE_BuffIdPlayer(1501137) == false)
        then UseSkill(CAM_MIR_ID_1, CAM_MIR_ID_2);
    --Concentraci�n
    --elseif CON_SKILL and CON_ARR_CD <= 0.25 and (CE_BuffIdPlayer(500930) == false) and foco <= 40 
       -- then UseSkill(CON_ID_1, CON_ID_2);
    --Flecha sin Sangre
    elseif FLE_SIN_SKILL and FLE_SIN_CD <= 0.25 and (CE_BuffIdPlayer(1501117) == false)
        then UseSkill(FLE_SIN_ID_1, FLE_SIN_ID_2);        
    --Detecci�n
    elseif DET_SKILL and (CE_BuffIdPlayer(1501133) == false)
        then UseSkill(DET_ID_1, DET_ID_2);        
    end
           

    --ROTACI�N--
	
	--Autoshoot
	CE_NewAutoShoot( 1490789 )

    -- Warp Charge
    if WA_CHA_SKILL and WA_CHA_CD <= 0.25 then
        UseSkill(WA_CHA_ID_1, WA_CHA_ID_2);
    --Tiro de presicion         
    elseif SNI_SKILL and SNI_CD <= 0.25 and CE_TARGET_IS_BOSS() then
         UseSkill(SNI_ID_1, SNI_ID_2);
    --Disparo combinado
    elseif DIS_COM_SKILL and DIS_COM_CD <= 0.25  then
        UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
    -- Surge of Malice
    elseif SUR_MA_SKILL and SUR_MA_CD<=0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
        UseSkill(SUR_MA_ID_1, SUR_MA_ID_2);
    -- Weakening Weave Curse
    elseif WEA_CURSE_SKILL and WEA_CURSE_CD <=0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
        UseSkill(WEA_CURSE_ID_1, WEA_CURSE_ID_2);
    --Disparo colateral 
    elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
        UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);
    --Flecha desgarradora   
    elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
        UseSkill(FLE_DES_ID_1, FLE_DES_ID_2); 
    --Disparo drena-mana
    elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 then
        UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);
    
    --Flecha vampirica
    elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.3 and foco >= 15 then
        UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
      
    
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
    --Tiro
    elseif TIR_SKILL and TIR_CD <= 0.25 and CE_AFE(1502167, 10)
        then UseSkill(TIR_ID_1, TIR_ID_2);    
    end
 
end








