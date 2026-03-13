
--Lua BARD/ROGUE BY NEORAXER 04-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_ROGUE()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	

	local foco = UnitMana("player")
	local energia = UnitSkill("player")

	
	
	--Runa Oscura
	local RUN_OSC_SKILL, RUN_OSC_ID_1, RUN_OSC_ID_2 = Match_CE(1491135);
	local RUN_OSC_CD = CE_CD(RUN_OSC_SKILL, RUN_OSC_ID_1, RUN_OSC_ID_2);
	--Succionador de almas
	local SUC_ALM_SKILL, SUC_ALM_ID_1, SUC_ALM_ID_2 = Match_CE(1491132);
	local SUC_ALM_CD = CE_CD(SUC_ALM_SKILL, SUC_ALM_ID_1, SUC_ALM_ID_2);
	--Destrucción masiva
	local DES_MAS_SKILL, DES_MAS_ID_1, DES_MAS_ID_2 = Match_CE(1491134);
	local DES_MAS_CD = CE_CD(DES_MAS_SKILL, DES_MAS_ID_1, DES_MAS_ID_2);
	--Cambio de octava
	local CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2 = Match_CE(1491338);
	local CAM_OCT_CD = CE_CD(CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2)	
	--El devorador
	local EL_DEV_SKILL, EL_DEV_ID_1, EL_DEV_ID_2 = Match_CE(1491130);
	local EL_DEV_CD = CE_CD(EL_DEV_SKILL, EL_DEV_ID_1, EL_DEV_ID_2)
	--Colapso inevitable
	local COL_INE_SKILL, COL_INE_ID_1, COL_INE_ID_2 = Match_CE(1491133);
	local COL_INE_CD = CE_CD(COL_INE_SKILL, COL_INE_ID_1, COL_INE_ID_2)
	--Magia mortal
	local MAG_MOR_SKILL, MAG_MOR_ID_1, MAG_MOR_ID_2 = Match_CE(1491129);
	local MAG_MOR_CD = CE_CD(MAG_MOR_SKILL, MAG_MOR_ID_1, MAG_MOR_ID_2)
	--Cuchillada alevosa
	local CUC_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2 = Match_CE(490306);
	local CUC_ALE_CD = CE_CD(CUC_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2)
	--Tempo
	local TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2 = Match_CE(1491103);	
	local TEMPO_CD = CE_CD(TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2);
	
	
	--Fast Buffs
	if(_G.C_EngineSettings.FastBuffs) then
		if TEMPO_SKILL and TEMPO_CD <= 0.25 and (CE_isMoving() == false) and foco >= 25 then
			UseSkill(TEMPO_ID_1, TEMPO_ID_2)--Tempo
		elseif CE_ISS_CD(CE_toName(1491345)) and C_EngineSettings.FastBuffs then
			CastSpellByName(CE_toName(1491345));--Amuleto de la suerte
		elseif RUN_OSC_SKILL and RUN_OSC_CD <= 0.25 and _G.C_EngineSettings.AOE and C_EngineSettings.FastBuffs then
			UseSkill(RUN_OSC_ID_1, RUN_OSC_ID_2);--Runa Oscura
		end
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 or energia <= 20 and CE_UseItem(1244064) then
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
	
	--Succionador de almas
	if SUC_ALM_SKILL and SUC_ALM_CD <= 0.25 and energia >= 20 and foco >= 20 then
		UseSkill(SUC_ALM_ID_1, SUC_ALM_ID_2);
	--Destrucción masiva
	elseif DES_MAS_SKILL and DES_MAS_CD <= 0.25 and energia >= 40 and foco >= 30 and (CE_isMoving() == false) and CE_DebuffIdTarget(1501880) and _G.C_EngineSettings.AOE then
		UseSkill(DES_MAS_ID_1, DES_MAS_ID_2);
	--Cambio de octava
	elseif CAM_OCT_SKILL and CAM_OCT_CD <= 0.25 and foco >= 15 and _G.C_EngineSettings.AOE then
		UseSkill(CAM_OCT_ID_1, CAM_OCT_ID_2);
	--El devorador
	elseif EL_DEV_SKILL and EL_DEV_CD <= 0.25 then
		UseSkill(EL_DEV_ID_1, EL_DEV_ID_2);
	--Colapso inevitable
	elseif COL_INE_SKILL and COL_INE_CD <= 0.25 and foco >= 30 and _G.C_EngineSettings.AOE then
		UseSkill(COL_INE_ID_1, COL_INE_ID_2);
	--Magia mortal
	elseif MAG_MOR_SKILL and MAG_MOR_CD <= 0.25 and energia >= 10 then
		UseSkill(MAG_MOR_ID_1, MAG_MOR_ID_2);
	--Cuchillada alevosa
	elseif CUC_ALE_SKILL and CUC_ALE_CD <= 0.25 and energia >= 20 then
		UseSkill(CUC_ALE_ID_1, CUC_ALE_ID_2);
	end
	

end





