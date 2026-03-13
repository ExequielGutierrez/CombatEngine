
--Lua KNIGHT/WARLOCK BY NEORAXER 07-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_KNIGHT_WARDEN()

--DEFAULT_CHAT_FRAME:AddMessage("Usando Caba/brujo")


    local hp = UnitHealth("player")
    local MaxHp = UnitMaxHealth("player")
	local pm = UnitMana("player")
	local MaxPm = UnitMaxMana("player")
	
	-----SKILLS----
	--Sello sagrado
	local SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2 = Match_CE(490149);
	local SELL_SAG_CD = CE_CD(SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2);	
	--Corte cargado
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(1490823);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2);	
	--Aplastamiento frenético
	local APL_FRE_SKILL, APL_FRE_ID_1, APL_FRE_ID_2 = Match_CE(1490494);
	local APL_FRE_CD = CE_CD(APL_FRE_SKILL, APL_FRE_ID_1, APL_FRE_ID_2);	
	--Castigo    
	local CAST_SKILL, CAST_ID_1, CAST_ID_2 = Match_CE(490151);
	local CAST_CD = CE_CD(CAST_SKILL, CAST_ID_1, CAST_ID_2);
	--Golpe divino
	local GOL_DIV_SKILL, GOL_DIV_ID_1, GOL_DIV_ID_2 = Match_CE(490148);
	local GOL_DIV_CD = CE_CD(GOL_DIV_SKILL, GOL_DIV_ID_1, GOL_DIV_ID_2);		
	
	---FAST BUFFS---
	--Poder feroz
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);
	
	----BUFFS---
	--Escudo de zarzas
	local ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2 = Match_CE(493642);
	local ESC_ZAR_CD = CE_CD(ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2);
	--Amenaza 
	local AME_SKILL, AME_ID_1, AME_ID_2 = Match_CE(490153);
	--Explosión del poder sagrado
	local EXP_POD_SKILL, EXP_POD_ID_1, EXP_POD_ID_2 = Match_CE(1490829);	
	--Armadura reforzada
	local ARM_REF_SKILL, ARM_REF_ID_1, ARM_REF_ID_2 = Match_CE(490152);


	
	--Armadura reforzada
    if ARM_REF_SKILL and (CE_BuffIdPlayer(500141) == false) then
        UseSkill(ARM_REF_ID_1, ARM_REF_ID_2) 
	--Explosión del poder sagrado
    elseif EXP_POD_SKILL and (CE_BuffIdPlayer(1501194) == false) then
        UseSkill(EXP_POD_ID_1, EXP_POD_ID_2) 
	--Amenaza 
    elseif AME_SKILL and (CE_BuffIdPlayer(500246) == false) then
        UseSkill(AME_ID_1, AME_ID_2) 
	--Escudo de zarzas
    elseif ESC_ZAR_SKILL and (CE_BuffIdPlayer(503958) == false) and _G.C_EngineSettings.AOE then
        UseSkill(ESC_ZAR_ID_1, ESC_ZAR_ID_2)
    end

	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar costilla de primera
		if (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/3 and CE_UseItem(203503) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end


	if _G.C_EngineSettings.FastBuffs then
		if POD_FER_SKILL and POD_FER_CD <= 0.25 then
			UseSkill(POD_FER_ID_1, POD_FER_ID_2);
		end
	
	end


	--Huellas de la espada cruzada
	if pm >= MaxPm/10 and CE_ISS_CD(CE_toName(490241)) and _G.C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490241));
	end
	--ROTACION--
	--Sello sagrado
	if SELL_SAG_SKILL and SELL_SAG_CD <= 0.25 and pm > 600 then
		UseSkill(SELL_SAG_ID_1, SELL_SAG_ID_2);
	--Aplastamiento frenético
	elseif APL_FRE_SKILL and APL_FRE_CD <= 0.25 and pm > 800 and (CE_DebuffIdTarget(500169) or CE_DebuffIdTarget(500140) or CE_DebuffIdTarget(5001460) or CE_DebuffIdTarget(500168)) then
		UseSkill(APL_FRE_ID_1, APL_FRE_ID_2);
	--Castigo    
	elseif CAST_SKILL and CAST_CD <= 0.25 and pm > 350 and (CE_DebuffIdTarget(500169) or CE_DebuffIdTarget(500140) or CE_DebuffIdTarget(5001460) or CE_DebuffIdTarget(500168)) then
		UseSkill(CAST_ID_1, CAST_ID_2);
	--Corte cargado
	elseif COR_CAR_SKILL and COR_CAR_CD <= 0.25 and pm > 340 then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);
	--Golpe divino
	elseif GOL_DIV_SKILL and GOL_DIV_CD <= 0.25 and pm > 800 then
		UseSkill(GOL_DIV_ID_1, GOL_DIV_ID_2);
	end 

	
end 

