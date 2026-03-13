
--Lua Scout/Druid BY NEORAXER 10-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_DRUID()



    --DEFAULT_CHAT_FRAME:AddMessage("Usando EXPLO/DRUIDA")
	--local hp = UnitHealth("player")
    --local MaxHp = UnitMaxHealth("player")

	local mana = UnitSkill("player");
	local foco = UnitMana("player");
    local pm = UnitSkill("player")
    local MaxPm = UnitMaxSkill("player")


    --Tiro de precisi�n
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(1490277);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Veneno de serpiente
    local VEN_SER_SKILL, VEN_SER_ID_1, VEN_SER_ID_2 = Match_CE(499583);
	local VEN_SER_CD = CE_CD(VEN_SER_SKILL, VEN_SER_ID_1, VEN_SER_ID_2);
    --Portador de maldiciones
    local POR_MAL_SKILL, POR_MAL_ID_1, POR_MAL_ID_2 = Match_CE(494040);
	local POR_MAL_CD = CE_CD(POR_MAL_SKILL, POR_MAL_ID_1, POR_MAL_ID_2);
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(499585);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha vamp�rica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(499591);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(499585);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(490457);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);    
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);    
    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(490423);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Flecha de escarcha
    local FLE_ESC_SKILL, FLE_ESC_ID_1, FLE_ESC_ID_2 = Match_CE(491163);
    --Sangre hirviendo
    local SAN_HIR_SKILL, SAN_HIR_ID_1, SAN_HIR_ID_2 = Match_CE(494327);
    --Foco
    local FOC_SKILL, FOC_ID_1, FOC_ID_2 = Match_CE(494529);
    --Campo de mira
    local CAM_MIR_SKILL, CAM_MIR_ID_1, CAM_MIR_ID_2 = Match_CE(490464);
    --Concentraci�n
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_ARR_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);
    --Plegaria de concentraci�n
	local PLE_CON_SKILL, PLE_CON_ID_1, PLE_CON_ID_2 = Match_CE(493530);
    --Bendici�n salvaje
    local BEN_SAL_SKILL, BEN_SAL_ID_1, BEN_SAL_ID_2 = Match_CE(493531);


   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/10 and CE_UseItem(203503) then
		--Estimulante fuerte
        elseif  CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif  CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end




    --Flecha de escarcha 
    if FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) and foco >= 20
        then UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
    --Sangre hirviendo
    elseif SAN_HIR_SKILL and (CE_BuffIdPlayer(504719) == false) and (pm >= MaxPm/10)
        then UseSkill(SAN_HIR_ID_1, SAN_HIR_ID_2);
    --Foco
    elseif FOC_SKILL and (CE_BuffIdPlayer(504908) == false)
        then UseSkill(FOC_ID_1, FOC_ID_2);
    --Campo de mira
    elseif CAM_MIR_SKILL and (CE_BuffIdPlayer(500934) == false) and CE_TARGET_IS_BOSS() and foco >= 10
        then UseSkill(CAM_MIR_ID_1, CAM_MIR_ID_2);
    --Concentraci�n
    elseif CON_SKILL and CON_ARR_CD <= 0.25 and (CE_BuffIdPlayer(500930) == false) and foco <= 40 
        then UseSkill(CON_ID_1, CON_ID_2);   
    --Plegaria de concentraci�n
    elseif PLE_CON_SKILL and (CE_BuffIdPlayer(503799) == false) and (pm > MaxPm/20) and not UnitInParty( "player" )
        then UseSkill(PLE_CON_ID_1, PLE_CON_ID_2);
    --Bendici�n salvaje
    elseif BEN_SAL_SKILL and(CE_BuffIdPlayer(620454) == false) and (pm > MaxPm/20) and not UnitInParty( "player" )
        then UseSkill(BEN_SAL_ID_1, BEN_SAL_ID_2);
	end

	--ROTACI�N--
	
   CE_NewAutoShoot( 492589 );
	
    --Tiro de presicion         
    if TIR_PRE_SKILL and TIR_PRE_CD <= 0.25 then
         UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Disparo combinado
    elseif DIS_COM_CD <= 0.3 and (CE_isMoving() == false or CE_BuffIdPlayer(1500556)) and CE_TARGET_IS_BOSS() then
        UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
	--Flecha desgarradora   
    elseif FLE_DES_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(FLE_DES_ID_1, FLE_DES_ID_2); 
	--Disparo colateral 
    elseif DIS_COL_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(DIS_COL_ID_1, DIS_COL_ID_2); 
	--Portador de maldiciones
    elseif POR_MAL_CD <= 0.25 and CE_DebuffIdTarget(504590) then
         UseSkill(POR_MAL_ID_1, POR_MAL_ID_2);
		--Veneno de serpiente
    --elseif VEN_SER_SKILL and VEN_SER_CD <= 0.25 and _G.C_EngineSettings.AOE then
        -- SpellTargetUnit("mouseover");
		-- UseSkill(VEN_SER_ID_1, VEN_SER_ID_2);
    --Golpe a las articulaciones
    elseif GOL_ART_SKILL and  GOL_ART_CD <= 0.25 and foco >= 15 then
         UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 and CE_TARGET_IS_BOSS() then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
	--Flecha desgarradora   
    elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(FLE_DES_ID_1, FLE_DES_ID_2); 
	--Disparo colateral 
    elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(DIS_COL_ID_1, DIS_COL_ID_2); 
    --Flecha vampirica
    elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.3 and CE_DebuffIdTarget(501690) == false and foco >= 10 then
        UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2); 
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
    --Tiro
    elseif TIR_SKILL and TIR_CD <= 0.25 then
         UseSkill(TIR_ID_1, TIR_ID_2);
    end

end








