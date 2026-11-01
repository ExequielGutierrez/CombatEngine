
--Lua BARD/DRUID BY NEORAXER 08-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_DRUID()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	

	local foco = UnitMana("player")
    local mana = UnitSkill("player")
	local MaxPm = UnitMaxSkill("player")
	
	--Bendici�n salvaje
	local BEN_SAL_SKILL, BEN_SAL_ID_1, BEN_SAL_ID_2 = Match_CE(493531);	
	--Plegaria de concentraci�n
	local PLE_CON_SKILL, PLE_CON_ID_1, PLE_CON_ID_2 = Match_CE(493530);	
	--Tormenta de rocas
	local TOR_ROC_SKILL, TOR_ROC_ID_1, TOR_ROC_ID_2 = Match_CE(1491186);	
	local TOR_ROC_CD = CE_CD(TOR_ROC_SKILL, TOR_ROC_ID_1, TOR_ROC_ID_2);
	--Cambio de octava
	local CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2 = Match_CE(1491388);	
	local CAM_OCT_CD = CE_CD(CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2);
	--Latido de la tierra
	local LAT_TIE_SKILL, LAT_TIE_ID_1, LAT_TIE_ID_2 = Match_CE(493540);	
	local LAT_TIE_CD = CE_CD(LAT_TIE_SKILL, LAT_TIE_ID_1, LAT_TIE_ID_2);
	--Invoncaci�n de rocas
	local INV_ROC_SKILL, INV_ROC_ID_1, INV_ROC_ID_2 = Match_CE(1491183);	
	local INV_ROC_CD = CE_CD(INV_ROC_SKILL, INV_ROC_ID_1, INV_ROC_ID_2);
	--Disparo r�pido de piedras
	local DIS_RAP_SKILL, DIS_RAP_ID_1, DIS_RAP_ID_2 = Match_CE(1491184);	
	local DIS_RAP_CD = CE_CD(DIS_RAP_SKILL, DIS_RAP_ID_1, DIS_RAP_ID_2);
	--Delirio ritmico
	local DEL_RIT_SKILL, DEL_RIT_ID_1, DEL_RIT_ID_2 = Match_CE(1491387);	
	local DEL_RIT_CD = CE_CD(DEL_RIT_SKILL, DEL_RIT_ID_1, DEL_RIT_ID_2);
	--Armon�a
	local ARMONIA_SKILL, ARMONIA_ID_1, ARMONIA_ID_2 = Match_CE(1491389);	
	local ARMONIA_CD = CE_CD(ARMONIA_SKILL, ARMONIA_ID_1, ARMONIA_ID_2);

	if(_G.C_EngineSettings.FastBuffs) then		
		--Amuleto de la suerte
		if CE_ISS_CD(CE_toName(1491345)) and C_EngineSettings.FastBuffs then
			CastSpellByName(CE_toName(1491345));
		end
	end
	
	--Bendici�n salvaje
	if BEN_SAL_SKILL and CE_BuffIdPlayer(620454) == false and not UnitInParty( "player" ) then
		UseSkill(BEN_SAL_ID_1, BEN_SAL_ID_2);
	--Plegaria de concentraci�n
	elseif PLE_CON_SKILL and CE_BuffIdPlayer(503799) == false and not UnitInParty( "player" ) then
		UseSkill(PLE_CON_ID_1, PLE_CON_ID_2);
	end
	
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del esp�ritu �lfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los esp�ritus de anta�o
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		--Usar Phirius tipo E
		elseif mana < 10000 and CE_UseItem(203503) then		
		end
		CE_HEALING_ITEM()
	end
	
	
	--ROTACION--

	--Tormenta de rocas
	if TOR_ROC_SKILL and TOR_ROC_CD <= 0.25 and _G.C_EngineSettings.AOE then
		UseSkill(TOR_ROC_ID_1, TOR_ROC_ID_2);
	--Cambio de octava
	elseif CAM_OCT_SKILL and CAM_OCT_CD <= 0.25 and foco >= 15 and _G.C_EngineSettings.AOE then
		UseSkill(CAM_OCT_ID_1, CAM_OCT_ID_2);
	--Latido de la tierra
	elseif LAT_TIE_SKILL and LAT_TIE_CD <= 0.25 and mana >= 700 and _G.C_EngineSettings.AOE then
		UseSkill(LAT_TIE_ID_1, LAT_TIE_ID_2);
	--Invoncaci�n de rocas
	elseif INV_ROC_SKILL and INV_ROC_CD <= 0.25 and mana >= MaxPm/20 and _G.C_EngineSettings.AOE then
		UseSkill(INV_ROC_ID_1, INV_ROC_ID_2);
	--Disparo r�pido de piedras
	elseif DIS_RAP_SKILL and DIS_RAP_CD <= 0.25 and _G.C_EngineSettings.AOE then
		UseSkill(DIS_RAP_ID_1, DIS_RAP_ID_2);
	--Delirio ritmico
	elseif DEL_RIT_SKILL and DEL_RIT_CD <= 0.25 and foco >= 25 then
		UseSkill(DEL_RIT_ID_1, DEL_RIT_ID_2);
	--Armon�a
	elseif ARMONIA_SKILL and ARMONIA_CD <= 0.25 and CE_isMoving() == false then
		UseSkill(ARMONIA_ID_1, ARMONIA_ID_2);
	end


end



function CE_BARD_DRUID_IMPORT()
	local Skills = { 1244064, 1244059, 1244063, 200192, 203503, 1491345, 493531, 493530, 1491186, 1491388, 493540, 1491183, 1491184, 1491387, 1491389}
	local conditions = {
		-- 1 Pocion del enano 1244064
		[1] = { [3]={ min="0", max="20", status=true }, [40]={ enable=true, status=true } },
		-- 2 papas de col rizada 1244059
		[2] = { [12]={ id1="1500234", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 3 frasco del espiritu elfico 1244063
		[3] = { [12]={ id1="1500238", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 4 agua de los espiritus de antano 200192
		[4] = { [12]={ id1="500112", id2="0", id3="0", id4="0", status=true }, [17]={ id="1500238", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 5 Phirius tipo E 203503
		[5] = { [2]={ min="0", max="10", status=true }, [40]={ enable=true, status=true } },
		-- 6 Amuleto de la suerte ISS 1491345
		[6] = { [41]={ enable=true, status=true } },
		-- 7 Bendicion salvaje 493531
		[7] = { [12]={ id1="620454", id2="0", id3="0", id4="0", status=true } },
		-- 8 Plegaria de concentracion 493530
		[8] = { [12]={ id1="503799", id2="0", id3="0", id4="0", status=true } },
		-- 9 Tormenta de rocas 1491186
		[9] = { [39]={ enable=true, status=true } },
		-- 10 Cambio de octava 1491388
		[10] = { [3]={ min="15", max="100", status=true }, [39]={ enable=true, status=true } },
		-- 11 Latido de la tierra 493540
		[11] = { [2]={ min="7", max="100", status=true }, [39]={ enable=true, status=true } },
		-- 12 Invocacion de rocas 1491183
		[12] = { [2]={ min="5", max="100", status=true }, [39]={ enable=true, status=true } },
		-- 13 Disparo rapido de piedras 1491184
		[13] = { [39]={ enable=true, status=true } },
		-- 14 Delirio ritmico 1491387
		[14] = { [3]={ min="25", max="100", status=true } },
		-- 15 Armonia 1491389
		[15] = { [19]={ enable=true, status=true } },
	}
	local iss = {
		[1491345] = true
	}
	local consumables = {
		[1244064] = true,
		[1244059] = true,
		[1244063] = true,
		[200192] = true,
		[203503] = true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
