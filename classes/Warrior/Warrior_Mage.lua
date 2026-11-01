
--Lua WARRIOR/MAGE BY NEORAXER 15-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_WARRIOR_MAGE()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando GUERRERO/ MAGO")
	local ira = UnitMana("player")
	local mana = UnitSkill("player")	
	
	
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


function CE_WARRIOR_MAGE_IMPORT()
	--Consumables first, then rotation in Lua order
	local Skills = { 1244064, 1244059, 200173, 1244062, 1490350, 1492543, 1492543, 1490346, 497844, 1490322, 497845, 493001, 540000 }
	local conditions = {
		-- 1 pocion del enano 1244064
		[1] = { [6]={ max="20", min="0", status=true }, [12]={ id1="1500239", id2="0", id3="0", id4="0", status=true }, [40]={ enable=true, status=true } },
		-- 2 papas de col rizada 1244059
		[2] = { [12]={ id1="1500234", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 3 estimulante fuerte 200173
		[3] = { [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 4 agilidad elfica 1244062
		[4] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 5 Fiera 1490350
		[5] = { [6]={ max="100", min="25", status=true }, [41]={ enable=true, status=true } },
		-- 6 Furioso 1492543 (fast buffs)
		[6] = { [6]={ max="40", min="0", status=true }, [41]={ enable=true, status=true } },
		-- 7 Furioso 1492543 (rage <= 20, always)
		[7] = { [6]={ max="20", min="0", status=true } },
		-- 8 Ciclon devastador 1490346
		[8] = { [2]={ max="100", min="10", status=true }, [39]={ enable=true, status=true } },
		-- 9 Espada de trueno 497844
		[9] = {},
		-- 10 Torbellino 1490322
		[10] = { [2]={ max="100", min="10", status=true }, [39]={ enable=true, status=true } },
		-- 11 Toque de relampago 497845
		[11] = {},
		-- 12 Ataque electrico 493001
		[12] = {},
		-- 13 Ataque 540000
		[13] = {}
	}
	local iss = {}
	local consumables = {
		[1244064] = true,
		[1244059] = true,
		[200173] = true,
		[1244062] = true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
