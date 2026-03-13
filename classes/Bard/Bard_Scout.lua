
--Lua BARD/SCOUT BY NEORAXER 04-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_SCOUT()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	

	local foco = UnitMana("player")


	
	--Flecha Sangrienta
	local FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2 = Match_CE(1491333);
	local FLE_SAN_CD = CE_CD(FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2);
	--Runa de arquero
	local RUN_ARQ_SKILL, RUN_ARQ_ID_1, RUN_ARQ_ID_2 = Match_CE(1491125);	
	--Vendaval del alma
	local VEN_ALM_SKILL, VEN_ALM_ID_1, VEN_ALM_ID_2 = Match_CE(1491121);
	local VEN_ALM_CD = CE_CD(VEN_ALM_SKILL, VEN_ALM_ID_1, VEN_ALM_ID_2);	
	--Flechas Mortales
	local FLE_MOR_SKILL, FLE_MOR_ID_1, FLE_MOR_ID_2 = Match_CE(1491119);
	local FLE_MOR_CD = CE_CD(FLE_MOR_SKILL, FLE_MOR_ID_1, FLE_MOR_ID_2);		
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(490423);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Flecha vampírica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);   
	--Tempo
	local TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2 = Match_CE(1491103);	
	local TEMPO_CD = CE_CD(TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2);
	
		
	--BUFFOS--
	
	--BUFFOS OFENSIVOS--
	if FLE_SAN_SKILL and FLE_SAN_CD <= 0.25 and (CE_BuffIdPlayer(1501861) == false) then
		UseSkill(FLE_SAN_ID_1, FLE_SAN_ID_2);
	elseif RUN_ARQ_SKILL and (CE_BuffIdPlayer(1501862) == false) and foco >= 20 then
		UseSkill(RUN_ARQ_ID_1, RUN_ARQ_ID_2);
	end

	--Fast Buffs
	if(_G.C_EngineSettings.FastBuffs) then
		if TEMPO_SKILL and TEMPO_CD <= 0.25 and (CE_isMoving() == false) and foco >= 25 then
			UseSkill(TEMPO_ID_1, TEMPO_ID_2)--Tempo
		elseif CE_ISS_CD(CE_toName(1491345)) and C_EngineSettings.FastBuffs then
			CastSpellByName(CE_toName(1491345));--Amuleto de la suerte
		end
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
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

	--Flechas mortales
	if FLE_MOR_SKILL and FLE_MOR_CD <= 0.25 and foco >=30 and (CE_isMoving() == false) then
		UseSkill(FLE_MOR_ID_1, FLE_MOR_ID_2);
	elseif VEN_ALM_SKILL and VEN_ALM_CD <= 0.25 and _G.C_EngineSettings.AOE and (CE_isMoving() == false) and CE_BuffIdPlayer(1501862) and CE_BuffIdPlayer(1501861) then
		SpellTargetUnit("mouseover");
		UseSkill(VEN_ALM_ID_1, VEN_ALM_ID_2);
    --Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_CD >= 0.25 and foco >= 15 then
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha vampírica
	elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and (CE_DebuffIdTarget(501690) == false) and foco >= 10 then
		UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Tiro
	elseif TIR_SKILL and TIR_CD <= 0.25 then
		UseSkill(TIR_ID_1, TIR_ID_2);
	end

end





