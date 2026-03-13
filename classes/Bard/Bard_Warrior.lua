
--Lua BARD/WARRIOR BY NEORAXER 04-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_WARRIOR()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	

	local foco = UnitMana("player")
    local ira = UnitSkill("player")


	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
	--Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(490095);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);
	--Exterminio absoluto
	local EXT_ABS_SKILL, EXT_ABS_ID_1, EXT_ABS_ID_2 = Match_CE(1491111);
	local EXT_ABS_CD = CE_CD(EXT_ABS_SKILL, EXT_ABS_ID_1, EXT_ABS_ID_2)
	--Tremendo crack
	local TRE_CRA_SKILL, TRE_CRA_ID_1, TRE_CRA_ID_2 = Match_CE(1491109);
	local TRE_CRA_CD = CE_CD(TRE_CRA_SKILL, TRE_CRA_ID_1, TRE_CRA_ID_2)
	--Mente más cercana
	local MEN_MAS_SKILL, MEN_MAS_ID_1, MEN_MAS_ID_2 = Match_CE(1491113);
	local MEN_MAS_CD = CE_CD(MEN_MAS_SKILL, MEN_MAS_ID_1, MEN_MAS_ID_2)
	--Cortar y tajar
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(1491110);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2)
	--Cordura perdida
	local COR_PER_SKILL, COR_PER_ID_1, COR_PER_ID_2 = Match_CE(1491094);
	local COR_PER_CD = CE_CD(COR_PER_SKILL, COR_PER_ID_1, COR_PER_ID_2)
	--Grito de guerra
	local GRITO_SKILL, GRITO_ID_1, GRITO_ID_2 = Match_CE(1491117);
	local GRITO_CD = CE_CD(GRITO_SKILL, GRITO_ID_1, GRITO_ID_2);
	--Tempo
	local TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2 = Match_CE(1491103);	
	local TEMPO_CD = CE_CD(TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2);

	--BUFFOS OFENSIVOS--

	if(_G.C_EngineSettings.FastBuffs) then
		--Amuleto de la suerte
		if CE_ISS_CD(CE_toName(1491345)) then
			CastSpellByName(CE_toName(1491345));
		--Tempo
		elseif TEMPO_CD <= 0.25 and (CE_isMoving() == false) and (foco >= 25) then
			UseSkill(TEMPO_ID_1, TEMPO_ID_2);
		--Grito de guerra
		elseif ira >= 20 and (CE_BuffIdPlayer(1501830) == false) then
			UseSkill(GRITO_ID_1, GRITO_ID_2);
		--Fiera
		elseif FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2);
		--Furioso
		elseif FUR_SKILL and FUR_CD <= 0.25 and ira < 20 then
			UseSkill(FUR_ID_1, FUR_ID_2);
		end
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 or ira <= 20 and CE_UseItem(1244064) then
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

	--Exterminio absoluto
	if EXT_ABS_SKILL and EXT_ABS_CD <= 0.25 and _G.C_EngineSettings.AOE and ira >= 25 and (CE_isMoving() == false) then
		UseSkill(EXT_ABS_ID_1, EXT_ABS_ID_2);
	--Mente más cercana
	elseif MEN_MAS_SKILL and MEN_MAS_CD <= 0.25 and CE_DebuffIdTarget(1501815) and ira >= 15 then
		UseSkill(MEN_MAS_ID_1, MEN_MAS_ID_2);
	--Tremendo crack
	elseif TRE_CRA_SKILL and TRE_CRA_CD <= 0.25 and ira >= 15 and foco >= 10 and (CE_DebuffIdTarget(1501815) == false) then
		UseSkill(TRE_CRA_ID_1, TRE_CRA_ID_2);
	--Cortar y tajar
	elseif COR_CAR_SKILL and COR_CAR_CD <= 0.25 and ira >= 10 then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);		
	--Cordura perdida
	elseif COR_PER_SKILL and COR_PER_CD <= 0.25 and foco >= 10 then
		UseSkill(COR_PER_ID_1, COR_PER_ID_2);
	end
end





