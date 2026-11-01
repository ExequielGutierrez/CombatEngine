
--Lua BARD/MAGE BY NEORAXER 08-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_MAGE()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	

	local foco = UnitMana("player")
    local mana = UnitSkill("player")

	--Nova de fuego
	local NOV_FUE_SKILL, NOV_FUE_ID_1, NOV_FUE_ID_2 = Match_CE(1491144);	
	local NOV_FUE_CD = CE_CD(NOV_FUE_SKILL, NOV_FUE_ID_1, NOV_FUE_ID_2);
	--Lluvia de bolas de fuego
	local LLU_BOL_SKILL, LLU_BOL_ID_1, LLU_BOL_ID_2 = Match_CE(1491141);	
	local LLU_BOL_CD = CE_CD(LLU_BOL_SKILL, LLU_BOL_ID_1, LLU_BOL_ID_2);
	--bola de fuego
	local BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2 = Match_CE(1491340);	
	local BOL_FUE_CD = CE_CD(BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2);
	--Delirio ritmico
	local DEL_RIT_SKILL, DEL_RIT_ID_1, DEL_RIT_ID_2 = Match_CE(1491098);	
	local DEL_RIT_CD = CE_CD(DEL_RIT_SKILL, DEL_RIT_ID_1, DEL_RIT_ID_2);
	--Magia ardiente
	local MAG_ARD_SKILL, MAG_ARD_ID_1, MAG_ARD_ID_2 = Match_CE(1491139);	
	local MAG_ARD_CD = CE_CD(MAG_ARD_SKILL, MAG_ARD_ID_1, MAG_ARD_ID_2);
	--Tempo
	local TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2 = Match_CE(1491103);	
	local TEMPO_CD = CE_CD(TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2);

	--BUFFOS OFENSIVOS--
	
	--Amuleto de la suerte

	
	
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
	
	if(_G.C_EngineSettings.FastBuffs) then		
		if TEMPO_SKILL and TEMPO_CD <= 0.25 and (CE_isMoving() == false) and foco >= 25 then
			UseSkill(TEMPO_ID_1, TEMPO_ID_2)
		elseif CE_ISS_CD(CE_toName(1491345)) and C_EngineSettings.FastBuffs then
			CastSpellByName(CE_toName(1491345));
		end
	end
	
	--ROTACION--



	--Lluvia de bolas de fuego
	if LLU_BOL_SKILL and LLU_BOL_CD <= 0.25 and _G.C_EngineSettings.AOE then
		UseSkill(LLU_BOL_ID_1, LLU_BOL_ID_2);
	--Nova de fuego
	elseif NOV_FUE_SKILL and NOV_FUE_CD <= 0.25 and foco >= 30 and _G.C_EngineSettings.AOE and CE_isMoving() == false and CE_BuffIdPlayer(1501895) then
		SpellTargetUnit("mouseover");
		UseSkill(NOV_FUE_ID_1, NOV_FUE_ID_2);
	--bola de fuego
	elseif BOL_FUE_SKILL and BOL_FUE_CD <= 0.25 and mana > 300 and _G.C_EngineSettings.AOE then
		UseSkill(BOL_FUE_ID_1, BOL_FUE_ID_2);
	--Delirio ritmico
	elseif DEL_RIT_SKILL and DEL_RIT_CD <= 0.25 and foco >= 25 then
		UseSkill(DEL_RIT_ID_1, DEL_RIT_ID_2);
	--Magia ardiente
	elseif MAG_ARD_SKILL and MAG_ARD_CD <= 0.25 and mana > 1500 and CE_isMoving() == false then
		UseSkill(MAG_ARD_ID_1, MAG_ARD_ID_2);
	end


end



function CE_BARD_MAGE_IMPORT()
	local Skills = { 1244064, 1244059, 1244063, 200192, 203503, 1491103, 1491345, 1491141, 1491144, 1491340, 1491098, 1491139 }
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
		-- 6 Tempo 1491103
		[6] = { [3]={ min="25", max="100", status=true }, [19]={ enable=true, status=true }, [41]={ enable=true, status=true } },
		-- 7 Amuleto de la suerte ISS 1491345
		[7] = { [41]={ enable=true, status=true } },
		-- 8 Lluvia de bolas de fuego 1491141
		[8] = { [39]={ enable=true, status=true } },
		-- 9 Nova de fuego 1491144
		[9] = { [3]={ min="30", max="100", status=true }, [11]={ id1="1501895", id2="0", id3="0", id4="0", status=true }, [19]={ enable=true, status=true }, [39]={ enable=true, status=true } },
		-- 10 Bola de fuego 1491340
		[10] = { [2]={ min="3", max="100", status=true }, [39]={ enable=true, status=true } },
		-- 11 Delirio ritmico 1491098
		[11] = { [3]={ min="25", max="100", status=true } },
		-- 12 Magia ardiente 1491139
		[12] = { [2]={ min="15", max="100", status=true }, [19]={ enable=true, status=true } }
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
