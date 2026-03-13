--Lua ROGUE/BARD BY NEORAXER 11-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_ROGUE_BARD()
	local energia = UnitMana("player");
	local foco = UnitSkill("player");
	
	--Maniobra abandonada
	local MAN_ABA_SKILL, MAN_ABA_ID_1, MAN_ABA_ID_2 = Match_CE(490355);
	--Manos vigorizadas
	local MAN_VIG_SKILL, MAN_VIG_ID_1, MAN_VIG_ID_2 = Match_CE(490347);
	--Presión del aire
	local PRE_AIR_SKILL, PRE_AIR_ID_1, PRE_AIR_ID_2 = Match_CE(1491234);
	local PRE_AIR_CD = CE_CD(PRE_AIR_SKILL, PRE_AIR_ID_1, PRE_AIR_ID_2);		
	--lanzamiento combinado
	local LAN_COM_SKILL, LAN_COM_ID_1, LAN_COM_ID_2 = Match_CE(1491476);
	local LAN_COM_CD = CE_CD(LAN_COM_SKILL, LAN_COM_ID_1, LAN_COM_ID_2);		
	--Ataque a la herida
	local HER_GRA_SKILL, HER_GRA_ID_1, HER_GRA_ID_2 = Match_CE(1491481);
	local HER_GRAV_CD = CE_CD(HER_GRA_SKILL, HER_GRA_ID_1, HER_GRA_ID_2);
	--Golpe bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(1491480);
	local GOL_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2);	
	--Tiro
	local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(1491479);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);		
	--Puñalada de sombras
	local PUN_SOM_SKILL, PUN_SOM_ID_1, PUN_SOM_ID_2 = Match_CE(1491478);
	local PUN_SOM_CD = CE_CD(PUN_SOM_SKILL, PUN_SOM_ID_1, PUN_SOM_ID_2);	
	--Canción de la tormenta
	local CAN_TOR_SKILL, CAN_TOR_ID_1, CAN_TOR_ID_2 = Match_CE(1491231);
	local CAN_TOR_CD = CE_CD(CAN_TOR_SKILL, CAN_TOR_ID_1, CAN_TOR_ID_2);
	--Ira atronadora
	local IRA_ATR_SKILL, IRA_ATR_ID_1, IRA_ATR_ID_2 = Match_CE(1491237);
	local IRA_ATR_CD = CE_CD(IRA_ATR_SKILL, IRA_ATR_ID_1, IRA_ATR_ID_2);	
	
	--BUFFOS--
	--Maniobra abandonada
	if MAN_ABA_SKILL and (CE_BuffIdPlayer(500744) == false) then
		UseSkill(MAN_ABA_ID_1, MAN_ABA_ID_2);
	--Tormento venenoso
	elseif (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314))
        then CastSpellByName(CE_toName(490314));
	--Manos vigorizadas
	elseif MAN_VIG_SKILL and (CE_BuffIdPlayer(500737) == false) and CE_isMoving() == false  then
		UseSkill(MAN_VIG_ID_1, MAN_VIG_ID_2);
	--Ira atronadora
	elseif IRA_ATR_SKILL and IRA_ATR_CD <= 0.25 and foco >= 20 and energia >= 20 and C_EngineSettings.FastBuffs then
		UseSkill(IRA_ATR_ID_1, IRA_ATR_ID_2);	
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if (energia <= 40 ) and CE_UseItem(1244064) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end
	
	--ROTACION--
	--lanzamiento combinado	
	if IsSpellUsable(1491476) then
		CastSpellByName(CE_toName(1491476));
	--Cicatriz de la garra ISS
   	elseif energia >= 35 and CE_DebuffIdTarget(508530) and CE_ISS_CD(CE_toName(490356)) then 
		CastSpellByName(CE_toName(490356));
	--Tiro
	elseif IsSpellUsable(1491479) then
		CastSpellByName(CE_toName(1491479));
	--Canción de la tormenta
	elseif energia >= 20 and _G.C_EngineSettings.AOE then
		UseSkill(CAN_TOR_ID_1, CAN_TOR_ID_2);
	--Presión del aire
	elseif PRE_AIR_SKILL and PRE_AIR_CD <= 0.25 and foco >= 40 then
		UseSkill(PRE_AIR_ID_1, PRE_AIR_ID_2);
	--Tempestad del alma
	elseif energia >= 13 and CE_ISS_CD(CE_toName(490345)) and _G.C_EngineSettings.AOE then 
		CastSpellByName(CE_toName(490345));	
	--Marca de garra ISS      
	elseif energia >= 20 and (CE_DebuffIdTarget(508530) == false) and (CE_ISS_CD(CE_toName(490144)) == true) then 
		CastSpellByName(CE_toName(490144));
	--Golpe bajo
	elseif GOL_BAJ_SKILL and GOL_BAJ_CD <= 0.45 and energia >= 30 then
		UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);		
	end
end

function CE_ROGUE_BARD_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060,  490314, 490355, 490347,  1491476, 490356, 1491479, 1491231, 1491234, 490345, 490144, 1491480 }
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
		-- 7 manos vigorizadas 490347
		[7] = {
			[12]={ id1="500737", id2="0", id3="0", id4="0", status=true },
			[19]={ enable=true, status=true } 
		},
		-- 8 lanzamiento combinado 1491476
		[8] = {},
		-- 9 Cicatriz de la garra ISS 490356
		[9] = {
			[5]={ max="100", min="35", status=true },
			[32]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 10 Tiro 1491479
		[10] = {},
		-- 11 Canción de la tormenta 1491231
		[11] ={ [5]={ max="100", min="20", status=true } },
		-- 12 Presión del aire 1491234
		[12] = { [3]={ max="200", min="40", status=true } },
		-- 13 Tempestad del alma 490345
		[13] = { [5]={ max="100", min="20", status=true } },
		-- 14 Marca de garra ISS 490144
		[14] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
		-- 15 Golpe bajo 1491480
		[15] = { [5]={ max="100", min="30", status=true } },
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
