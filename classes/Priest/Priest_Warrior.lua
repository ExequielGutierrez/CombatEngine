
--Lua PRIEST/WARRIOR BY NEORAXER 02-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_PRIEST_WARRIOR()


    --DEFAULT_CHAT_FRAME:AddMessage("Usando MAGO/PICA")
	local pm = UnitMana("player")
    local MaxPm = UnitMaxMana("player")	
	local ira = UnitSkill("player")

	
    ----------------SKILLS------------------
	--Postura de monje de guerra
	local POS_MON_SKILL, POS_MON_ID_1, POS_MON_ID_2 = Match_CE(491600);	
	--Fuerza acumulada
	local FUE_ACU_SKILL, FUE_ACU_ID_1, FUE_ACU_ID_2 = Match_CE(492635);	
	--Agua bendita de manantial
	local AGU_BEN_SKILL, AGU_BEN_ID_1, AGU_BEN_ID_2 = Match_CE(490298);	
	--Gracia vital
	local GRA_VIT_SKILL, GRA_VIT_ID_1, GRA_VIT_ID_2 = Match_CE(490290);	
	--Agua bendita de manantial
	local AGU_BEN_SKILL, AGU_BEN_ID_1, AGU_BEN_ID_2 = Match_CE(490298);	
	--Ataque amplificado
	local ATA_AMP_SKILL, ATA_AMP_ID_1, ATA_AMP_ID_2 = Match_CE(490491);	
	--Barrera mágica
	local BAR_MAG_SKILL, BAR_MAG_ID_1, BAR_MAG_ID_2 = Match_CE(491166);	
	--Vacío sagrado
	local VAC_SAG_SKILL, VAC_SAG_ID_1, VAC_SAG_ID_2 = Match_CE(490276);	
	local VAC_SAG_CD = CE_CD(VAC_SAG_SKILL, VAC_SAG_ID_1, VAC_SAG_ID_2);
	--Explosión de espíritu luchador
	local EXP_ESP_SKILL, EXP_ESP_ID_1, EXP_ESP_ID_2 = Match_CE(495294);	
	local EXP_ESP_CD = CE_CD(EXP_ESP_SKILL, EXP_ESP_ID_1, EXP_ESP_ID_2);
	--Combinación de espíritu
	local COM_ESP_SKILL, COM_ESP_ID_1, COM_ESP_ID_2 = Match_CE(499983);	
	local COM_ESP_CD = CE_CD(COM_ESP_SKILL, COM_ESP_ID_1, COM_ESP_ID_2);
	--Golpe de dragón ascendente
	local GOL_DRA_SKILL, GOL_DRA_ID_1, GOL_DRA_ID_2 = Match_CE(499981);	
	local GOL_DRA_CD = CE_CD(GOL_DRA_SKILL, GOL_DRA_ID_1, GOL_DRA_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(1490365);	
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Torbellino
	local TORB_SKILL, TORB_ID_1, TORB_ID_2 = Match_CE(1490366);	
	local TORB_CD = CE_CD(TORB_SKILL, TORB_ID_1, TORB_ID_2);
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);	
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
	--Fiera
	local FIE_SKILL, FIE_ID_1, FIE_ID_2 = Match_CE(1490348);	
	local FIE_CD = CE_CD(FIE_SKILL, FIE_ID_1, FIE_ID_2);
	
	
	
    ----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		if UnitLevel("player") >= 104 then
			--Usar poción del enano
			if ira <= 20 and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then				
			--Usar Frasco de agilidad elfica
			elseif CE_TARGET_IS_BOSS() and (CE_BuffTimeLeftById(501321) == true) and  CE_UseItem(1244062) and CE_BuffIdPlayer(1500237) == false then
			--Usar costilla de primera
			elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then	
			end
		else
			--Usar estimulante fuerte
			if CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(501321) == false and  CE_UseItem(200173) and CE_BuffIdPlayer(1500237) == false then	
			--Usar Phirius de mana
			elseif pm <= MaxPm/3 and CE_UseItem(203503) then
			end
		end
		CE_HEALING_ITEM()
	end
			
				
    ----------------BUFFS------------------
	
	--Postura de monje
	if POS_MON_SKILL and CE_BuffIdPlayer(501977) == false then
		UseSkill(POS_MON_ID_1, POS_MON_ID_2);
	--Fuerza acumulada
	elseif FUE_ACU_SKILL and CE_BuffIdPlayer(502904) == false then
		UseSkill(FUE_ACU_ID_1, FUE_ACU_ID_2);
	end
	
	
	--ROTACION------------------
	
	--Area
	if C_EngineSettings.AOE and TORB_SKILL and TORB_CD <= 0.25 and ira >= 50 then
		UseSkill(TORB_ID_1, TORB_ID_2);
	end
		

	--Fiera
	if FIE_SKILL and FIE_CD <= 0.25 and (CE_TARGET_IS_BOSS() or C_EngineSettings.FastBuffs) and ira >= 25 then
		UseSkill(FIE_ID_1, FIE_ID_2);
	--Furioso
	elseif FUR_SKILL and FUR_CD <= 0.25 and ira <= 20 and (CE_TARGET_IS_BOSS() or C_EngineSettings.FastBuffs) then
		UseSkill(FUR_ID_1, FUR_ID_2);
	--Vacío sagrado
	elseif VAC_SAG_SKILL and VAC_SAG_CD <= 0.25 and pm >= MaxPm/10 then
		UseSkill(VAC_SAG_ID_1, VAC_SAG_ID_2);
	--Explosión de espíritu luchador
	elseif EXP_ESP_SKILL and EXP_ESP_CD <= 0.25 then
		UseSkill(EXP_ESP_ID_1, EXP_ESP_ID_2);
	--Combinación de espíritu
	elseif COM_ESP_SKILL and COM_ESP_CD <= 0.25 then
		UseSkill(COM_ESP_ID_1, COM_ESP_ID_2);
	--Golpe de dragón ascendente
	elseif GOL_DRA_SKILL and GOL_DRA_CD <= 0.25 and ira >= 45 and CE_DebuffIdTarget(1500804) then
		UseSkill(GOL_DRA_ID_1, GOL_DRA_ID_2);
	--Tajo
	elseif TAJO_SKILL and TAJO_CD <= 0.25 then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	end

	
end
	
	
	