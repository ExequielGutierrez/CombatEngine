
--Lua Scout/Mage BY NEORAXER 09-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

COMBAT_ENGINE_INCINERATION = false;

function incineration_Delay()
	COMBAT_ENGINE_INCINERATION = false;	
end


function CE_SCOUT_MAGE()



	--DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Mago")
	local foco = UnitMana("player");

	--Tiro de precisi�n
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(1491043);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2);
	--Aceite arriba
	local ACE_ARR_SKILL, ACE_ARR_ID_1, ACE_ARR_ID_2 = Match_CE(491510);
	local ACE_ARR_CD = CE_CD(ACE_ARR_SKILL, ACE_ARR_ID_1, ACE_ARR_ID_2);
	--Concentraci�n
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_ARR_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);
	--Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(1491040);
	local GOL_ART_ARR_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
	--El infierno
	local EL_INF_SKILL, EL_INF_ID_1, EL_INF_ID_2 = Match_CE(491509);
	local EL_INF_CD = CE_CD(EL_INF_SKILL, EL_INF_ID_1, EL_INF_ID_2);
	--Disparo reflejado
	local DIS_REF_SKILL, DIS_REF_ID_1, DIS_REF_ID_2 = Match_CE(1491045);
	local DIS_REF_CD = CE_CD(DIS_REF_SKILL, DIS_REF_ID_1, DIS_REF_ID_2);
	--Flecha Punzante
	local FLE_PUN_SKILL, FLE_PUN_ID_1, FLE_PUN_ID_2 = Match_CE(1491042);
	local FLE_PUN_CD = CE_CD(FLE_PUN_SKILL, FLE_PUN_ID_1, FLE_PUN_ID_2);
	--Disparo Combinado
	local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(1491044);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
	--Flecha de llama
	local FLE_LLA_SKILL, FLE_LLA_ID_1, FLE_LLA_ID_2 = Match_CE(1491041);
	local FLE_LLA_CD = CE_CD(FLE_LLA_SKILL, FLE_LLA_ID_1, FLE_LLA_ID_2);    
	--Flecha vamp�rica
	local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(1491039);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    
	--D�sparo de fuego
	local DIS_FUE_SKILL, DIS_FUE_ID_1, DIS_FUE_ID_2 = Match_CE(1491038);
	local DIS_FUE_CD = CE_CD(DIS_FUE_SKILL, DIS_FUE_ID_1, DIS_FUE_ID_2);    
	--Incineraci�n 
	local INC_SKILL, INC_ID_1, INC_ID_2 = Match_CE(1491046);

	--ROTACION--


	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
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

	--Incineraci�n
	if _G.C_EngineSettings.AOE and not CE_BuffIdPlayer( 1501678 ) then

		if COMBAT_ENGINE_INCINERATION == true then return end;

		if not TimerQueue["IncineracionDelay"] and COMBAT_ENGINE_INCINERATION == false then
			TimerQueue["IncineracionDelay"] = { GetTime() + 1, incineration_Delay };
			CE_NewAutoShoot( 1491046 );
			COMBAT_ENGINE_INCINERATION = true;
		end

	end

	if GOL_ART_SKILL and GOL_ART_ARR_CD <= 0.3 and foco >= 15 then 
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
		return;
	end

	--Tiro de precisi�n
	if TIR_PRE_SKILL and TIR_PRE_CD <= 0.3 and CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(500939) and CE_BuffIdPlayer(502880) then 
		UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);
		return;
	--Aceite arriba
	elseif ACE_ARR_SKILL and ACE_ARR_CD <= 0.3 and C_EngineSettings.FastBuffs then
		UseSkill(ACE_ARR_ID_1, ACE_ARR_ID_2);
		return;
	--Concentraci�n
	elseif CON_SKILL and CON_ARR_CD <= 0.3 and foco <= 50 then
		UseSkill(CON_ID_1, CON_ID_2);
		return;
	--Flecha Punzante
    elseif FLE_PUN_SKILL and FLE_PUN_CD <= 0.3 and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() then
        UseSkill(FLE_PUN_ID_1, FLE_PUN_ID_2);
        return;
	--Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_ARR_CD <= 0.3 and foco >= 15 then 
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
		return;
	--El infierno
	elseif EL_INF_SKILL and EL_INF_CD <= 0.3 and _G.C_EngineSettings.AOE and CE_isMoving() == false and not COMBATENGINE_CASTING and not CE_TARGET_IS_BOSS() then
		SpellTargetUnit("mouseover");
		UseSkill(EL_INF_ID_1, EL_INF_ID_2);
		return;
	--Disparo reflejado
	--elseif DIS_REF_SKILL and DIS_REF_CD <= 0.3 and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() then
	--	UseSkill(DIS_REF_ID_1, DIS_REF_ID_2);
	--	return;
	--Disparo Combinado
	elseif DIS_COM_SKILL and DIS_COM_CD <= 0.3 and (CE_isMoving() == false or CE_BuffIdPlayer(1500556)) then
		UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
		return;
	--Flecha de llama
	elseif FLE_LLA_CD <= 0.25 then
		UseSkill(FLE_LLA_ID_1, FLE_LLA_ID_2);
		return;
	--Disparo de fuego
	elseif DIS_FUE_SKILL and DIS_FUE_CD <= 0.3 then
		UseSkill(DIS_FUE_ID_1, DIS_FUE_ID_2);
		return;
	--Flecha Sangrienta
	elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.3 and CE_DebuffIdTarget(501690) == false and foco >= 10 then
		UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
		return;
	end


end







