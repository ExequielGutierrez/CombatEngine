
--Lua BARD/WARDEN BY NEORAXER 04-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_WARDEN()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	
	local pm = UnitSkill("player")
	local foco = UnitMana("player")
    local MaxPm = UnitMaxSkill("player")

	
	--Amuleto de la suerte
	
	--Poder feroz -> + daño
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);
	--Runa terrenal
	local RUN_TER_SKILL, RUN_TER_ID_1, RUN_TER_ID_2 = Match_CE(1491175);
	local RUN_TER_CD = CE_CD(RUN_TER_SKILL, RUN_TER_ID_1, RUN_TER_ID_2);
	--Escudo de zarzas
	local ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2 = Match_CE(493642);	
	
	--Disidente
	local DISI_SKILL, DISI_ID_1, DISI_ID_2 = Match_CE(1491173);
	local DISI_CD = CE_CD(DISI_SKILL, DISI_ID_1, DISI_ID_2);
	--Cólera
	local COLERA_SKILL, COLERA_ID_1, COLERA_ID_2 = Match_CE(1491170);
	local COLERA_CD = CE_CD(COLERA_SKILL, COLERA_ID_1, COLERA_ID_2)
	--Cambio de octava
	local CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2 = Match_CE(1491100);
	local CAM_OCT_CD = CE_CD(CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2)
	--Poder del espiritu del roble
	local POD_ESP_SKILL, POD_ESP_ID_1, POD_ESP_ID_2 = Match_CE(1491384);
	local POD_ESP_CD = CE_CD(POD_ESP_SKILL, POD_ESP_ID_1, POD_ESP_ID_2)
	
	--Corte cargado
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(1491383);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2)
	--Cordura perdida
	local COR_PER_SKILL, COR_PER_ID_1, COR_PER_ID_2 = Match_CE(1491527);
	local COR_PER_CD = CE_CD(COR_PER_SKILL, COR_PER_ID_1, COR_PER_ID_2)
	--Tempo
	local TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2 = Match_CE(1491103);	
	local TEMPO_CD = CE_CD(TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2);
	
	
		
	--BUFFOS--
	
	--Escudo de zarzas
	if ESC_ZAR_SKILL and (CE_BuffIdPlayer(503958) == false) then
		UseSkill(ESC_ZAR_ID_1, ESC_ZAR_ID_2);	
	end
	
	--Fast Buffs
	if(_G.C_EngineSettings.FastBuffs) then
		if TEMPO_SKILL and TEMPO_CD <= 0.25 and (CE_isMoving() == false) and foco >= 25 then
			UseSkill(TEMPO_ID_1, TEMPO_ID_2)--Tempo
		elseif CE_ISS_CD(CE_toName(1491345)) and C_EngineSettings.FastBuffs then
			CastSpellByName(CE_toName(1491345));--Amuleto de la suerte
		elseif POD_FER_SKILL and POD_FER_CD <= 0.25 and C_EngineSettings.FastBuffs then
			UseSkill(POD_FER_ID_1, POD_FER_ID_2);--Poder feroz
		elseif RUN_TER_SKILL and RUN_TER_CD <= 0.25 and C_EngineSettings.FastBuffs then
			UseSkill(RUN_TER_ID_1, RUN_TER_ID_2);--Runa terrenal
		end
	end

	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/3 and CE_UseItem(203503) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end
	
	
	--ROTACION--
	if _G.C_EngineSettings.AOE then
		--Disidente
		if DISI_SKILL and DISI_CD <= 0.25 and pm > 1200 then
			UseSkill(DISI_ID_1, DISI_ID_2);
		--Cólera
		elseif COLERA_SKILL and COLERA_CD <= 0.25 then
			UseSkill(COLERA_ID_1, COLERA_ID_2);
		--Cambio de octava
		elseif CAM_OCT_SKILL and CAM_OCT_CD <= 0.25 and foco >= 15 then
			UseSkill(CAM_OCT_ID_1, CAM_OCT_ID_2);
		--Poder del espiritu del roble
		elseif POD_ESP_SKILL and POD_ESP_CD <= 0.25 and pm > 300 and (CE_TARGET_IS_BOSS() == false) then
			UseSkill(POD_ESP_ID_1, POD_ESP_ID_2);
		end
	end
	--Corte cargado
	if COR_CAR_SKILL and COR_CAR_CD <= 0.25 and pm > 350 then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);
	--Cordura perdida
	elseif COR_PER_SKILL and COR_PER_CD <= 0.25 and foco >= 20 then
		UnitSkill(COR_PER_ID_1, COR_PER_ID_2);
	end

	

end





