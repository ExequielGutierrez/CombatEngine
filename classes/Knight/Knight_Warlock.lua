
--Lua KNIGHT/WARLOCK BY NEORAXER 07-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

local Sello_1 = 500140
local Sello_2 = 500146
local Sello_3 = 500168
local Sello_4 = 500169


function CE_KNIGHT_WARLOCK()

--DEFAULT_CHAT_FRAME:AddMessage("Usando Caba/brujo")


    local foco = UnitSkill("player");    
    local hp = UnitHealth("player")
    local MaxHp = UnitMaxHealth("player")
	local pm = UnitMana("player")
	local MaxPm = UnitMaxMana("player")
	
	--Embestida
	local EMB_SKILL, EMB_ID_1, EMB_ID_2 = Match_CE(490150);
	local EMB_CD = CE_CD(EMB_SKILL, EMB_ID_1, EMB_ID_2);
	--Escudo del valor
	local ESC_VAL_SKILL, ESC_VAL_ID_1, ESC_VAL_ID_2 = Match_CE(490468);
	local ESC_VAL_CD = CE_CD(ESC_VAL_SKILL, ESC_VAL_ID_1, ESC_VAL_ID_2);
	--Escudo de diciplina
	local ESC_DIC_SKILL, ESC_DIC_ID_1, ESC_DIC_ID_2 = Match_CE(490192);
	local ESC_DIC_CD = CE_CD(ESC_DIC_SKILL, ESC_DIC_ID_1, ESC_DIC_ID_2);
	--Carga combada
	local CAR_COM_SKILL, CAR_COM_ID_1, CAR_COM_ID_2 = Match_CE(1490844);
	local CAR_COM_CD = CE_CD(CAR_COM_SKILL, CAR_COM_ID_1, CAR_COM_ID_2);
	--Maldicion del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(1490843);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);	
	--Golpe de escudo de la verdad
	local GOL_ESC_SKILL, GOL_ESC_ID_1, GOL_ESC_ID_2 = Match_CE(490186);
	local GOL_ESC_CD = CE_CD(GOL_ESC_SKILL, GOL_ESC_ID_1, GOL_ESC_ID_2);
	--Escudo de torbellino 
	local ESC_TOR_SKILL, ESC_TOR_ID_1, ESC_TOR_ID_2 = Match_CE(1490842);
	local ESC_TOR_CD = CE_CD(ESC_TOR_SKILL, ESC_TOR_ID_1, ESC_TOR_ID_2);		
	--Sacudida
	local SAC_SKILL, SAC_ID_1, SAC_ID_2 = Match_CE(490154);
	local SAC_CD = CE_CD(SAC_SKILL, SAC_ID_1, SAC_ID_2);			
	--Golpe de Castigo
	local GOL_CAS_SKILL, GOL_CAS_ID_1, GOL_CAS_ID_2 = Match_CE(1490840);
	local GOL_CAS_CD = CE_CD(GOL_CAS_SKILL, GOL_CAS_ID_1, GOL_CAS_ID_2);	
	--Sello sagrado
	local SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2 = Match_CE(490149);
	local SELL_SAG_CD = CE_CD(SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2);	
	--Castigo    
	local CAST_SKILL, CAST_ID_1, CAST_ID_2 = Match_CE(1490839);
	local CAST_CD = CE_CD(CAST_SKILL, CAST_ID_1, CAST_ID_2);		
	--Golpe impio
	local GOL_IMP_SKILL, GOL_IMP_ID_1, GOL_IMP_ID_2 = Match_CE(1490838);
	local GOL_IMP_CD = CE_CD(GOL_IMP_SKILL, GOL_IMP_ID_1, GOL_IMP_ID_2);	
	--Armadura reforzada
	local ARM_REF_SKILL, ARM_REF_ID_1, ARM_REF_ID_2 = Match_CE(490152);
	--Explosión del poder sagrado
	local EXP_POD_SKILL, EXP_POD_ID_1, EXP_POD_ID_2 = Match_CE(1490841);
	--Amenaza 
	local AME_SKILL, AME_ID_1, AME_ID_2 = Match_CE(490153);
	--Escudo de oscuridad
	local ESC_OSC_SKILL, ESC_OSC_ID_1, ESC_OSC_ID_2 = Match_CE(1490502);
	--Maestria de oscuridad y luz
	local MAE_OSC_SKILL, MAE_OSC_ID_1, MAE_OSC_ID_2 = Match_CE(1490508);
	local MAE_OSC_CD = CE_CD(MAE_OSC_SKILL, MAE_OSC_ID_1, MAE_OSC_ID_2);	

	
	--Armadura reforzada
    if ARM_REF_SKILL and (CE_BuffIdPlayer(500141) == false) then
        UseSkill(ARM_REF_ID_1, ARM_REF_ID_2) 
	--Explosión del poder sagrado
    elseif EXP_POD_SKILL and (CE_BuffIdPlayer(1501210) == false) then
        UseSkill(EXP_POD_ID_1, EXP_POD_ID_2) 
	--Amenaza 
    elseif AME_SKILL and (CE_BuffIdPlayer(500246) == false) then
        UseSkill(AME_ID_1, AME_ID_2) 
	--Escudo de oscuridad
    elseif ESC_OSC_SKILL and (CE_BuffIdPlayer(1501201) == false) and (CE_isShield() == false) then
        UseSkill(ESC_OSC_ID_1, ESC_OSC_ID_2)
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
	--Maestria de oscuridad y Luz
	if MAE_OSC_SKILL and MAE_OSC_CD <= 0.25 and pm > MaxPm/20 and foco >= 10 and C_EngineSettings.FastBuffs then
		UseSkill(MAE_OSC_ID_1, MAE_OSC_ID_2);
	elseif ESC_VAL_SKILL and ESC_VAL_CD <= 0.25 and CE_TARGET_IS_BOSS() and (CE_isShield() or CE_BuffIdPlayer(1501201)) then
		UseSkill(ESC_VAL_ID_1, ESC_VAL_ID_2);
	--Escudo de diciplina
	elseif ESC_DIC_SKILL and ESC_DIC_CD <= 0.25 and (hp <= MaxHp/2 or C_EngineSettings.FastBuffs) and (CE_isShield() or CE_BuffIdPlayer(1501201))  then
		UseSkill(ESC_DIC_ID_1, ESC_DIC_ID_2);
	--Huellas de la espada cruzada
	elseif (CE_TARGET_IS_BOSS == false) and pm >= MaxPm/10 and CE_ISS_CD(CE_toName(490241)) and _G.C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490241));
	--Embestida
	elseif EMB_SKILL and EMB_CD <= 0.25 and IsSpellUsable(490150) then 
		UseSkill(EMB_ID_1, EMB_ID_2);
	--Maldicion del tejido debilitante
	elseif MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.25 and foco >= 30 and _G.C_EngineSettings.AOE then
        UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Carga combada
	elseif CAR_COM_SKILL and CAR_COM_CD <= 0.25 and foco >= 20 then
		UseSkill(CAR_COM_ID_1, CAR_COM_ID_2);
	--Sello sagrado
	elseif SELL_SAG_SKILL and SELL_SAG_CD <= 0.25 then
		UseSkill(SELL_SAG_ID_1, SELL_SAG_ID_2);
	--Escudo de torbellino 
	elseif ESC_TOR_SKILL and ESC_TOR_CD <= 0.45 and IsSpellUsable(1490838) and CE_BuffIdPlayer(1501201) or CE_isShield() and _G.C_EngineSettings.AOE then
		UseSkill(ESC_TOR_ID_1, ESC_TOR_ID_2); 
	--Tsunami
    elseif CE_ISS_CD(CE_toName(490359)) and IsSpellUsable(1490838) and _G.C_EngineSettings.AOE then 
        CastSpellByName(CE_toName(490359));
	--Golpe de escudo
    elseif GOL_ESC_SKILL and GOL_ESC_CD <= 0.45 and CE_BuffIdPlayer(1501201) or CE_isShield() then
        UseSkill(GOL_ESC_ID_1, GOL_ESC_ID_2);
	--Golpe de Castigo
	elseif GOL_CAS_SKILL and GOL_CAS_CD <= 0.45 and CE_DebuffIdTarget(1501208) then 
		UseSkill(GOL_CAS_ID_1, GOL_CAS_ID_2);
	--Castigo  
	elseif CAST_SKILL and CAST_CD <= 0.45 and CE_DebuffIdTarget(Sello_4) then
		UseSkill(CAST_ID_1, CAST_ID_2);
	--Sacudida
    elseif SAC_SKILL and SAC_CD <= 0.45 and (CE_DebuffIdTarget(Sello_2) or CE_DebuffIdTarget(Sello_3) or CE_DebuffIdTarget(Sello_4)) then
		UseSkill(SAC_ID_1, SAC_ID_2);
	--Espada escarlata perfecta
	elseif CE_ISS_CD(495564) and CE_TARGET_IS_BOSS() then
		CastSpellByName(CE_toName(495564));	
	--Sello sagrado
	elseif SELL_SAG_SKILL and SELL_SAG_CD <= 0.45 then
		UseSkill(SELL_SAG_ID_1, SELL_SAG_ID_2);
	--Golpe impio
	elseif ESC_TOR_CD > 0 or _G.C_EngineSettings.AOE == false then
		UseSkill(GOL_IMP_ID_1, GOL_IMP_ID_2);
    end	
	
	
end 

