
--Lua BARD/WARRIOR BY NEORAXER 04-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_CHAMPION()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	

	local foco = UnitMana("player")
    local ira = UnitSkill("player")


	-- Poisonous Integration
	local POI_IN_SKILL, POI_IN_ID_1, POI_IN_ID_2 = Match_CE(1491202);
	local POI_IN_CD = CE_CD(POI_IN_SKILL, POI_IN_ID_1, POI_IN_ID_2);
	-- Poison Mist
	local POI_MI_SKILL, POI_MI_ID_1, POI_MI_ID_2 = Match_CE(1491201);
	local POI_MI_CD = CE_CD(POI_MI_SKILL, POI_MI_ID_1, POI_MI_ID_2);
	-- Electric Shock
	local ELE_SHO_SKILL, ELE_SHO_ID_1, ELE_SHO_ID_2 = Match_CE(1491203);
	local ELE_SHO_CD = CE_CD(ELE_SHO_SKILL, ELE_SHO_ID_1, ELE_SHO_ID_2);
	-- Combustion
	local COMBUSTION_SKILL, COMBUSTION_ID_1, COMBUSTION_ID_2 = Match_CE(1491204);
	local COMBUSTION_CD = CE_CD(COMBUSTION_SKILL, COMBUSTION_ID_1, COMBUSTION_ID_2);
	-- Agriculture Rune
	local AGRI_RU_SKILL, AGRI_RU_ID_1, AGRI_RU_ID_2 = Match_CE(1491205);
	local AGRI_RU_CD = CE_CD(AGRI_RU_SKILL, AGRI_RU_ID_1, AGRI_RU_ID_2);
	-- Rhythmic Delusion
	local RHY_DEL_SKILL, RHY_DEL_ID_1, RHY_DEL_ID_2 = Match_CE(1491098);
	local RHY_DEL_CD = CE_CD(RHY_DEL_SKILL, RHY_DEL_ID_1, RHY_DEL_ID_2);
	--Armon�a -- Harmony
	--local ARMONIA_SKILL, ARMONIA_ID_1, ARMONIA_ID_2 = Match_CE(1491102);	
	--local ARMONIA_CD = CE_CD(ARMONIA_SKILL, ARMONIA_ID_1, ARMONIA_ID_2);
	--Cambio de octava -- Octave Shifting
	local CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2 = Match_CE(1491100);	
	local CAM_OCT_CD = CE_CD(CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2);
	--Tempo
	local TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2 = Match_CE(1491103);	
	local TEMPO_CD = CE_CD(TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2);
	-- Lost Sanity
	--local LOS_SA_SKILL, LOS_SA_ID_1, LOS_SA_ID_2 = Match_CE(1491398);
	--local LOS_SA_CD = CE_CD(LOS_SA_SKILL, LOS_SA_ID_1, LOS_SA_ID_2);
	--Ataque
	local ATA_SKILL, ATA_ID_1, ATA_ID_2 = Match_CE(540000);
	local ATA_CD = CE_CD(ATA_SKILL, ATA_ID_1, ATA_ID_2);
	-- Shock Strike
	local SHO_STR_SKILL, SHO_STR_ID_1, SHO_STR_ID_2 = Match_CE(498534);
	local SHO_STR_CD = CE_CD(SHO_STR_SKILL, SHO_STR_ID_1, SHO_STR_ID_2);

	--BUFFOS OFENSIVOS--

	if(_G.C_EngineSettings.FastBuffs) then
		--Amuleto de la suerte
		--if CE_ISS_CD(CE_toName(1491345)) then
			--CastSpellByName(CE_toName(1491345));
		--Tempo
		if TEMPO_CD <= 0.25 and (CE_isMoving() == false) and (foco >= 25) then
			UseSkill(TEMPO_ID_1, TEMPO_ID_2);
		
		end
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if CE_TARGET_IS_BOSS() and foco <= 20 or ira <= 20 and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end
	
	
	--ROTACION--

	--Delirio ritmico
	if RHY_DEL_SKILL and RHY_DEL_CD <= 0.25 and foco >= 17 and (CE_BuffIdPlayer(1503983)== false) then
		UseSkill(RHY_DEL_ID_1, RHY_DEL_ID_2);
		-- Combastion
	elseif COMBUSTION_SKILL and COMBUSTION_CD <=0.25 and ira>=15 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
		UseSkill(COMBUSTION_ID_1, COMBUSTION_ID_2);
	--Electric Shock
	elseif ELE_SHO_SKILL and ELE_SHO_CD <=0.25 and ira>=15 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
		UseSkill(ELE_SHO_ID_1, ELE_SHO_ID_2);
	-- Octave Shift
	elseif CAM_OCT_CD <=0.25 and CAM_OCT_SKILL and foco>=10 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
		UseSkill(CAM_OCT_ID_1, COMBUSTION_ID_2);
	-- Shock Strike
	elseif SHO_STR_CD <=0.25 and SHO_STR_SKILL and ira>=25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
		UseSkill(SHO_STR_ID_1, SHO_STR_ID_2);
	end
	
	--Hoja de ingeniero
	CE_NewAutoShoot( 1491206 );
	
	-- Agriculture Rune
	if not CE_SELF_DEBUFF(1502001) and not CE_SELF_DEBUFF(1502002) and not CE_SELF_DEBUFF(1502003) and not CE_SELF_DEBUFF(1502004) then
		-- Aplica el debuff 101 solo si no tienes ninguno de los tres debuffs
		UseSkill(POI_IN_ID_1, POI_IN_ID_2); 
	elseif CE_SELF_DEBUFF(1502001) and not CE_SELF_DEBUFF(1502002) and not CE_SELF_DEBUFF(1502003) and not CE_SELF_DEBUFF(1502004) then 
		-- Aplica el debuff 102 solo si tienes el 101 y no los otros
		UseSkill(POI_IN_ID_1, POI_IN_ID_2);  
	elseif CE_SELF_DEBUFF(1502002) and not CE_SELF_DEBUFF(1502003) and not CE_SELF_DEBUFF(1502004) then 
		-- Aplica el debuff 103 solo si tienes el 102 y no el 103
		UseSkill(POI_IN_ID_1, POI_IN_ID_2);
	elseif CE_SELF_DEBUFF(1502003) and not CE_SELF_DEBUFF(1502004) then
		-- Aplica el debuff 104 si tienes el 103 y no 104
		UseSkill(POI_IN_ID_1, POI_IN_ID_2);
	elseif CE_SELF_DEBUFF(1502004) then
		UseSkill(AGRI_RU_ID_1, AGRI_RU_ID_2);
	end
	--Ataque
	if ATA_SKILL and ( UnitIsDeadOrGhost("target") == false ) -- Atacar solo cuando el objetivo est� vivo
	then UseSkill(ATA_ID_1, ATA_ID_2);
	end
	
end





