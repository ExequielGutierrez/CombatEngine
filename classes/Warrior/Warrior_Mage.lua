
--Lua WARRIOR/MAGE BY NEORAXER 15-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_WARRIOR_MAGE()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando GUERRERO/ MAGO")
	local ira = UnitMana("player")
	local mana = UnitSkill("player")	
	
	
	--Ira Electrica
	local IRA_ELE_SKILL, IRA_ELE_ID_1, IRA_ELE_ID_2 = Match_CE(499994);
	local IRA_ELE_CD = CE_CD(IRA_ELE_SKILL, IRA_ELE_ID_1, IRA_ELE_ID_2);
	--Espada de trueno
	local ESP_TRU_SKILL, ESP_TRU_ID_1, ESP_TRU_ID_2 = Match_CE(497844);		
	local ESP_TRU_CD = CE_CD(ESP_TRU_SKILL, ESP_TRU_ID_1, ESP_TRU_ID_2);
	--Toque de relampago
	local TOQ_REL_SKILL, TOQ_REL_ID_1, TOQ_REL_ID_2 = Match_CE(497845);	
	local TOQ_REL_CD = CE_CD(TOQ_REL_SKILL, TOQ_REL_ID_1, TOQ_REL_ID_2);
	--Ataque
	local ATA_SKILL, ATA_ID_1, ATA_ID_2 = Match_CE(540000);
	local ATA_CD = CE_CD(ATA_SKILL, ATA_ID_1, ATA_ID_2);
	--Ataque electrico
	local ATA_ELEC_SKILL, ATA_ELEC_1, ATA_ELEC_2 = Match_CE(493001);
	local ATA_ELEC_CD = CE_CD(ATA_ELEC_SKILL, ATA_ELEC_1, ATA_ELEC_2);
	--Torbellino
	local TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2 = Match_CE(1490322);
	local TORBELLINO_CD = CE_CD(TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2);
	--Ciclón devastador
	local CICLON_SKILL, CICLON_ID_1, CICLON_ID_2 = Match_CE(1490346);
	local CICLON_CD = CE_CD(CICLON_SKILL, CICLON_ID_1, CICLON_ID_2);
	--Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(1490350);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(1492543);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);

	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if ira <= 20 and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar estimulante fuerte
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(501321) == false and  CE_UseItem(200173) and CE_BuffIdPlayer(1500237) == false then
		--Usar Frasco de agilidad elfica
		elseif CE_TARGET_IS_BOSS() and (CE_BuffTimeLeftById(501321) == true) and  CE_UseItem(1244062) and CE_BuffIdPlayer(1500237) == false then
		end		
		CE_HEALING_ITEM()
	end
				
    --------------------------------------------------------------------------------------------------------------------------------------------
	
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		elseif FUR_SKILL and FUR_CD <= 0.25 and ira <= 40 then
			UseSkill(FUR_ID_1, FUR_ID_2)
		end	
	end

	
	
	--Checar buffo Arma de quemadura por rayo ID 500162
    if ARM_QUE_SKILL and CE_BuffIdPlayer(500162) == false
        then UseSkill(ARM_QUE_ID_1, ARM_QUE_ID_2);--Arma de quemadura por rayo
	elseif ira <= 20 and FUR_SKILL and FUR_CD <= 0.25 then
		UseSkill(FUR_ID_1, FUR_ID_2);



       
			                                --   ROTACIÓN  --											
        	
    elseif not CE_BuffIdPlayer( 501880 )
        then UseSkill(IRA_ELE_ID_1, IRA_ELE_ID_2); -- estaquear ira electrica hasta 3	
	--Ciclón devastador
	elseif C_EngineSettings.AOE and CICLON_SKILL and CICLON_CD <= 0.25 and mana >= 3000 and IsSpellUsable(490130)
		then UseSkill(CICLON_ID_1, CICLON_ID_2);
    --Espada del trueno    
    elseif ESP_TRU_SKILL and ESP_TRU_CD <= 0.25
		then UseSkill(ESP_TRU_ID_1, ESP_TRU_ID_2); --Usar espada del trueno
	--Torbellino
	elseif C_EngineSettings.AOE and TORBELLINO_SKILL and TORBELLINO_CD <= 0.25 and mana >= 3000 and IsSpellUsable(490130)
		then UseSkill(TORBELLINO_ID_1, TORBELLINO_ID_2);
	--Toque de relampago
	elseif TOQ_REL_SKILL and TOQ_REL_CD <= 0.25
		then UseSkill(TOQ_REL_ID_1, TOQ_REL_ID_2); --Usar toque de relampago
	--Ataque electrico
	elseif ATA_ELEC_SKILL and ATA_ELEC_CD <= 0.25
		then UseSkill(ATA_ELEC_1, ATA_ELEC_2); --Usar Ataque electrico
			
     --Ataque
	elseif ATA_SKILL and ( UnitIsDeadOrGhost("target") == false ) -- Atacar solo cuando el objetivo está vivo
       then UseSkill(ATA_ID_1, ATA_ID_2);
      
	end


end


