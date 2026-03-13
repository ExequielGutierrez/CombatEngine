
--Lua Scout/KNIGHT BY NEORAXER 31-08-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_KNIGHT()



    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Mago")
	local foco = UnitMana("player");
	local mana = UnitSkill("player");
	
	--Armadura reforzada
	local ARM_REF_SKILL, ARM_REF_ID_1, ARM_REF_ID_2 = Match_CE(490152);
    --Flecha sangrienta
    local FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2 = Match_CE(490434);
    local FLE_SAN_CD = CE_CD(FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2);
	--Flecha de escarcha
    local FLE_ESCA, FLE_ESCA_ID_1, FLE_ESCA_ID_2 = Match_CE(491163);
	--Disparo curativo
    local DIS_CUR_SKILL, DIS_CUR_ID_1, DIS_CUR_ID_2 = Match_CE(499558);
	local DIS_COL_CD = CE_CD(DIS_CUR_SKILL, DIS_CUR_ID_1, DIS_CUR_ID_2);    
	--Huida sagaz
    local HUI_SAG_SKILL, HUI_SAG_ID_1, HUI_SAG_ID_2 = Match_CE(493016);
	local HUI_SAG_CD = CE_CD(HUI_SAG_SKILL, HUI_SAG_ID_1, HUI_SAG_ID_2);  
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(493318);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);
    --Disparo despedazadora
    local FLE_DEZP_SKILL, FLE_DEZP_ID_1, FLE_DEZP_ID_2 = Match_CE(490431);
	local FLE_DEZP_CD = CE_CD(FLE_DEZP_SKILL, FLE_DEZP_ID_1, FLE_DEZP_ID_2);
    --Disparo drena-mana
    local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(490443);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
	--Flecha de rechazo
    local DIS_REZ_SKILL, DIS_REZ_ID_1, DIS_REZ_ID_2 = Match_CE(491516);
	local DIS_REZ_CD = CE_CD(DIS_REZ_SKILL, DIS_REZ_ID_1, DIS_REZ_ID_2);
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2); 

    --ROTACION--

   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Estimulante fuerte
        elseif  CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif  CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end
	
	--Fast Buffs	
	if _G.C_EngineSettings.FastBuffs then
		if HUI_SAG_SKILL and HUI_SAG_CD <= 0.25 and foco >= 20 then
			UseSkill(HUI_SAG_ID_1, HUI_SAG_ID_2);
		end	
	end
	
	--Buffs
	--Armadura reforzada
    if ARM_REF_SKILL and (CE_BuffIdPlayer(500141) == false) then
        UseSkill(ARM_REF_ID_1, ARM_REF_ID_2) 
    --Flecha sangrienta
    elseif FLE_SAN_SKILL and FLE_SAN_CD <= 0.25 and (CE_BuffIdPlayer(500871) == false)
        then UseSkill(FLE_SAN_ID_1, FLE_SAN_ID_2);    
    --Flecha de escarcha 
    elseif FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) and foco >= 20
        then UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
	end
		
	--Rota
	
	--Autoshoot
	CE_NewAutoShoot( 492589 )
	
	--Disparo curativo
    if DIS_CUR_SKILL and DIS_COL_CD <= 0.3 and foco >= 20 then
        UseSkill(DIS_CUR_ID_1, DIS_CUR_ID_2);
	end
    --Disparo colateral 
    if DIS_COL_CD <= 0.25 and _G.C_EngineSettings.AOE then
		UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);
	--Flecha despedazadora
	elseif FLE_DEZP_SKILL and FLE_DEZP_CD <= 0.3 and foco >= 10 and _G.C_EngineSettings.AOE and CE_isMoving() == false then
		SpellTargetUnit("mouseover");
		UseSkill(FLE_DEZP_ID_1, FLE_DEZP_ID_2);	
    --Disparo drena-mana
    elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 
        then UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Flecha de rechazo
    elseif DIS_REZ_SKILL and  DIS_REZ_CD <= 0.25 and IsSpellUsable(490428) and _G.C_EngineSettings.AOE then
         UseSkill(DIS_REZ_ID_1, DIS_REZ_ID_2);
    --Golpe a las articulaciones
    elseif GOL_ART_SKILL and  GOL_ART_CD <= 0.25 and foco >= 15 then
         UseSkill(GOL_ART_ID_1, GOL_ART_ID_2); 
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);    
    end
	
end

