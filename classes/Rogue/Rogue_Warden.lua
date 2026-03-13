--Lua Rouge/Warden BY NEORAXER 06-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_ROGUE_WARDEN()
	local energia = UnitMana("player")
	local pm = UnitSkill("player")
	local MaxPm = UnitMaxMana("player")
	
	--Cuchilla fantasma
	local CUCH_FAN_SKILL, CUCH_FAN_ID_1, CUCH_FAN_ID_2 = Match_CE(494922);
	local CUCH_FAN_CD = CE_CD(CUCH_FAN_SKILL, CUCH_FAN_ID_1, CUCH_FAN_ID_2);
	--Poder del espiritu del bosque
	local POD_ESP_SKILL, POD_ESP_ID_1, POD_ESP_ID_2 = Match_CE(494571);
	local POD_ESP_CD = CE_CD(POD_ESP_SKILL, POD_ESP_ID_1, POD_ESP_ID_2);
	--Espada sedienta de sangre
	local ESP_SED_SKILL, ESP_SED_ID_1, ESP_SED_ID_2 = Match_CE(494045);
	local ESP_SED_CD = CE_CD(ESP_SED_SKILL, ESP_SED_ID_1, ESP_SED_ID_2);
	--Sabueso de sangre
	local SAB_SAN_SKILL, SAB_SAN_ID_1, SAB_SAN_ID_2 = Match_CE(494043);
	local SAB_SAN_CD = CE_CD(SAB_SAN_SKILL, SAB_SAN_ID_1, SAB_SAN_ID_2);
	--Ataque a la herida
	local HER_GRA_SKILL, HER_GRA_ID_1, HER_GRA_ID_2 = Match_CE(1490355);
	local HER_GRAV_CD = CE_CD(HER_GRA_SKILL, HER_GRA_ID_1, HER_GRA_ID_2);	
	--Golpe bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(1490354);
	local GOL_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2);	
	--Cuchillada alevosa
	local CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2 = Match_CE(1490353);
	local CUCH_ALEV_CD = CE_CD(CUCH_ALEV_SKILL, CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);	
	--Corte cargado
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(1490351);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2);
	--Arrojar
	local ARR_SKILL, ARR_ID_1, ARR_ID_2 = Match_CE(490309);
	local ARR_CD = CE_CD(ARR_SKILL, ARR_ID_1, ARR_ID_2);	
	--Maniobra abandonada
	local MAN_ABA_SKILL, MAN_ABA_ID_1, MAN_ABA_ID_2 = Match_CE(490355);
	--Escudo de zarzas
	local ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2 = Match_CE(493642);
	--Parche de herida
	local PAR_HER_SKILL, PAR_HER_ID_1, PAR_HER_ID_2 = Match_CE(494921);
	--Shadow slash
	local SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2 = Match_CE(1493673);
	local SHADOW_SLASH_CD = CE_CD(SHADOW_SLASH_SKILL, SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);
	
	--BUFFOS--
	--Maniobra abandonada
	if MAN_ABA_SKILL and (CE_BuffIdPlayer(500744) == false) then
		UseSkill(MAN_ABA_ID_1, MAN_ABA_ID_2); 
	--Escudo de zarzas
	elseif ESC_ZAR_SKILL and (CE_BuffIdPlayer(503958) == false) then
		UseSkill(ESC_ZAR_ID_1, ESC_ZAR_ID_2); 
	--Parche de herida
	elseif PAR_HER_SKILL and (CE_BuffIdPlayer(505685) == false) then
		UseSkill(PAR_HER_ID_1, PAR_HER_ID_2); 
	--Tormento venenoso
	elseif (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314)) and energia >= 5 then 
		CastSpellByName(CE_toName(490314)); 
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if (energia <= 40 ) and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/100 * 10 and CE_UseItem(203503) then
		--Estimulante fuerte
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end
	
	--ROTACION--
	--Cuchilla fantasma
	if CUCH_FAN_SKILL and CUCH_FAN_CD <= 0.45 then 
		UseSkill(CUCH_FAN_ID_1, CUCH_FAN_ID_2);
	--Shadow slash
	elseif SHADOW_SLASH_CD <= 0.25 and energia >= 25 and CE_BuffIdPlayer(1502730) then
		UseSkill(SHADOW_SLASH_ID_1, SHADOW_SLASH_ID_2);
	--Perfect Slide	
	elseif CE_PERFECT_SLIDE() then	
	--Poder del espiritu del bosque
	elseif POD_ESP_SKILL and POD_ESP_CD <= 0.45 and CE_AFE_2(504910, 15) and _G.C_EngineSettings.AOE then 
		UseSkill(POD_ESP_ID_1, POD_ESP_ID_2);
	--Espada sedienta de sangre
	elseif ESP_SED_SKILL and ESP_SED_CD <= 0.45 and (CE_BuffIdPlayer(504595) == false) and pm >= MaxPm/100 * 5 then
		UseSkill(ESP_SED_ID_1, ESP_SED_ID_2);	
	--Sabueso de sangre
	elseif SAB_SAN_SKILL and SAB_SAN_CD <= 0.45 and CE_DebuffIdTarget(1502391) then
		UseSkill(SAB_SAN_ID_1, SAB_SAN_ID_2);
	--Tempestad del alma
	elseif energia >= 15 and CE_ISS_CD(CE_toName(490345)) and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() then 
		CastSpellByName(CE_toName(490345));		
	--Cuchillada alevosa
	elseif CUCH_ALEV_SKILL and CUCH_ALEV_CD <= 0.45 and (CE_SELF_DEBUFF(620313) == false) and energia >= 20 then
		UseSkill(CUCH_ALEV_ID_1, CUCH_ALEV_ID_2);
	--Golpe bajo
	elseif GOL_BAJ_SKILL and GOL_BAJ_CD <= 0.45 and CE_SELF_DEBUFF(620313) and (CE_SELF_DEBUFF(620314) == false) and energia >= 25 then
		UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Ataque a la herida
	elseif HER_GRA_SKILL and HER_GRAV_CD <= 0.45 and CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(620314) and energia >= 30 and CE_WEAPON_TYPE("Daga") then
		UseSkill(HER_GRA_ID_1, HER_GRA_ID_2);	
	--Corte cargado
	elseif COR_CAR_SKILL and COR_CAR_CD <= 0.45 then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);	
	--Arrojar
	elseif ARR_SKILL and ARR_CD <= 0.45 then
		UseSkill(ARR_ID_1, ARR_ID_2);
	end	
end

function CE_ROGUE_WARDEN_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 490314, 490355, 490329, 493642, 494921, 494922, 1493673, 1491731, 494571, 494045, 494043, 490345, 1490353, 1490354, 1490355, 1490351, 490309 }
	local conditions = {
		-- 1 poción de enano 1244064
		[1] = { [5]={ max="40", min="0", status=true }, [40]={ enable=true, status=true }},
		-- 2 estimulante fuerte 200173
		[2] = { [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 3 agilidad elfica 1244062
		[3] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 4 filete de costilla 1244060
		[4] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 5 tormento venenoso 490314
		[5] = {
			[5]={ max="500", min="5", status=true },
			[12]={ id1="500093", id2="0", id3="0", id4="0", status=true } 
		},
		-- 6 maniobra abandonada 490355
		[6] = { [12]={ id1="500744", id2="0", id3="0", id4="0", status=true } },
		-- 7 manos venenosas 490329
		[7] = {
			[12]={ id1="500715", id2="0", id3="0", id4="0", status=true },
			[19]={ enable=true, status=true } 
		},
		-- 8 Escudo de zarzas 493642
		[8] = { [12]={ id1="503958", id2="0", id3="0", id4="0", status=true } },
		-- 9 Parche de herida 494921
		[9] = {
			[5]={ max="500", min="50", status=true },
			[12]={ id1="505685", id2="0", id3="0", id4="0", status=true } 
		},
		-- 10 Cuchilla fantasma 494922
		[10] = { [5]={ max="100", min="3", status=true }, [6]={ max="200", min="3", status=true } },
		--Shadow slash 1493673
		[11] = {
			[5]={ max="100", min="24", status=true },
			[11]={ id1="1502730", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 11 Perfect Slide	1491731
		[12] = { [42]={ enable=true, status=true } },
		-- 12 Poder del espiritu del bosque 494571
		[13] = {
			[38]={ id="504910", self=false, status=true, time="15" },
			[39]={ enable=true, status=true } 
		},
		-- 13 Espada sedienta de sangre 494045
		[14] = {
			[2]={ max="100", min="3", status=true },
			[12]={ id1="504595", id2="0", id3="0", id4="0", status=true } 
		},
		-- 14 Sabueso de sangre 494043
		[15] = { [32]={ id1="1502391", id2="0", id3="0", id4="0", status=true } },
		-- 15 Tempestad del alma 490345
		[16] = { [5]={ max="100", min="13", status=true }, [39]={ enable=true, status=true } },
		-- 16 Cuchillada alevosa 1490353
		[17] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="0", id3="0", id4="0", status=true } 
		},	
		-- 17 Golpe bajo 1490354
		[18] = {
			[5]={ max="100", min="25", status=true },
			[34]={ id1="620313", id2="0", id3="0", id4="0", status=true },
			[35]={ id1="620314", id2="0", id3="0", id4="0", status=true } 
		},
		-- 18 Ataque a la herida 1490355
		[19] = {
			[5]={ max="100", min="35", status=true },
			[34]={ id1="620313", id2="620314", id3="0", id4="0", status=true } 
		},
		-- 19 Corte cargado 1490351
		[20] = {},
		-- 20 Arrojar 490309
		[21] = {}
	}
	local iss = {
		[490314] = true,
		[490345] = true,
		[490144] = true,
		[490356] = true
	}
	local consumables = {
		[1244064] = true,
		[200173] = true,
		[1244062] = true,
		[1244060] = true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end