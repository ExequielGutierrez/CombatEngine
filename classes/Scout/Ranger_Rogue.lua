
--Lua SCOUT/ROGUE BY NEORAXER 20-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_ROGUE()


	local foco = UnitMana("player");
	local energia = UnitSkill("player");

    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(493093);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Tal�n de Aquiles
    local TAL_AQU_SKILL, TAL_AQU_ID_1, TAL_AQU_ID_2 = Match_CE(491493);
	local TAL_AQU_CD = CE_CD(TAL_AQU_SKILL, TAL_AQU_ID_1, TAL_AQU_ID_2); 
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(493008);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Tiro de precisi�n
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(490450);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2); 
    --Flecha vamp�rica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);   
    --Mordisco venenoso letal
    local MOR_VEN_SKILL, MOR_VEN_ID_1, MOR_VEN_ID_2 = Match_CE(492621);
	local MOR_VEN_CD = CE_CD(MOR_VEN_SKILL, MOR_VEN_ID_1, MOR_VEN_ID_2);   
    --Flecha debilitadora
    local FLE_DEB_SKILL, FLE_DEB_ID_1, FLE_DEB_ID_2 = Match_CE(491496);
	local FLE_DEB_CD = CE_CD(FLE_DEB_SKILL, FLE_DEB_ID_1, FLE_DEB_ID_2);   
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(493292);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);	
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);  
    --Disparo reflejado
    local DIS_REF_SKILL, DIS_REF_ID_1, DIS_REF_ID_2 = Match_CE(499535);
	local DIS_REF_CD = CE_CD(DIS_REF_SKILL, DIS_REF_ID_1, DIS_REF_ID_2);
    --Concentraci�n
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_ARR_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);



   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if foco <= 20 or energia <= 20 and CE_UseItem(1244064) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		--Frasco de esp�ritu �lfico
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500238) == false) and CE_UseItem(1244063) then
		end
		CE_HEALING_ITEM()
	end

	CE_NewAutoShoot( 492589 );

    --Concentraci�n
	if CON_SKILL and CON_ARR_CD <= 0.25 and (CE_BuffIdPlayer(500930) == false) and foco <= 40 then
		UseSkill(CON_ID_1, CON_ID_2);  
    --Tiro
	elseif TIR_SKILL and TIR_CD <= 0.25 and CE_AFE(503169, 11) then
		UseSkill(TIR_ID_1, TIR_ID_2);
    --Tal�n de Aquiles
	elseif TAL_AQU_SKILL and TAL_AQU_CD <= 0.25 and foco >= 20 then
		UseSkill(TAL_AQU_ID_1, TAL_AQU_ID_2);
    --Tiro de precisi�n
	elseif TIR_PRE_SKILL and TIR_PRE_CD <= 0.25 and CE_BuffIdPlayer(503169) and CE_BuffIdPlayer(501895) and (CE_isMoving() == false) then
		UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Flecha desgarradora
	elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and CE_AFE_2(503256, 21) and _G.C_EngineSettings.AOE then
		UseSkill(FLE_DES_ID_1, FLE_DES_ID_2);
    --Flecha vamp�rica  
	elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and (CE_DebuffIdTarget(501690) == false) and foco >= 10 then
		UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Mordisco venenoso letal
	elseif MOR_VEN_SKILL and MOR_VEN_CD <= 0.25 and CE_DebuffIdTarget(501690) and energia >= 20 then
		UseSkill(MOR_VEN_ID_1, MOR_VEN_ID_2);
    --Flecha debilitadora  
	elseif FLE_DEB_SKILL and FLE_DEB_CD <= 0.25 and energia >= 20 then
		UseSkill(FLE_DEB_ID_1, FLE_DEB_ID_2);
    --Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_CD <= 0.25 and foco >= 15 then
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
    --Disparo Combinado
    elseif DIS_COM_SKILL and DIS_COM_CD <= 0.3 and (CE_isMoving() == false or CE_BuffIdPlayer(1500556)) then
        UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
    --Disparo reflejado
    elseif DIS_REF_SKILL and DIS_REF_CD <= 0.3 and _G.C_EngineSettings.AOE then
        UseSkill(DIS_REF_ID_1, DIS_REF_ID_2);
    --Flecha de viento
	elseif FLE_VIE_SKILL and FLE_VIE_CD >= 0.25 then
		UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
	end

end








