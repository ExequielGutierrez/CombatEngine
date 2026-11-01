
--Lua BARD/WARDEN BY NEORAXER 04-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_WARDEN()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	
	local pm = UnitSkill("player")
	local foco = UnitMana("player")
    local MaxPm = UnitMaxSkill("player")

	
	--Amuleto de la suerte
	
	--Poder feroz -> + daño
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);
	
	--Disidente
	local DISI_SKILL, DISI_ID_1, DISI_ID_2 = Match_CE(1491173);
	local DISI_CD = CE_CD(DISI_SKILL, DISI_ID_1, DISI_ID_2);
	--Cólera
	local COLERA_SKILL, COLERA_ID_1, COLERA_ID_2 = Match_CE(1491170);
	local COLERA_CD = CE_CD(COLERA_SKILL, COLERA_ID_1, COLERA_ID_2)
	--Cambio de octava
	local CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2 = Match_CE(1491100);
	local CAM_OCT_CD = CE_CD(CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2)
	--Poder del espiritu del roble
	local POD_ESP_SKILL, POD_ESP_ID_1, POD_ESP_ID_2 = Match_CE(1491384);
	local POD_ESP_CD = CE_CD(POD_ESP_SKILL, POD_ESP_ID_1, POD_ESP_ID_2)
	
	--Corte cargado
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(1491383);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2)
	--Cordura perdida
	local COR_PER_SKILL, COR_PER_ID_1, COR_PER_ID_2 = Match_CE(1491527);
	local COR_PER_CD = CE_CD(COR_PER_SKILL, COR_PER_ID_1, COR_PER_ID_2)
	--Tempo
	local TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2 = Match_CE(1491103);	
	local TEMPO_CD = CE_CD(TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2);
	
	
		
	--BUFFOS--
	
	
	--Fast Buffs
	if(_G.C_EngineSettings.FastBuffs) then
		if TEMPO_SKILL and TEMPO_CD <= 0.25 and (CE_isMoving() == false) and foco >= 25 then
			UseSkill(TEMPO_ID_1, TEMPO_ID_2)--Tempo
		elseif CE_ISS_CD(CE_toName(1491345)) and C_EngineSettings.FastBuffs then
			CastSpellByName(CE_toName(1491345));--Amuleto de la suerte
		elseif POD_FER_SKILL and POD_FER_CD <= 0.25 and C_EngineSettings.FastBuffs then
			UseSkill(POD_FER_ID_1, POD_FER_ID_2);--Poder feroz
		end
	end

	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/3 and CE_UseItem(203503) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end
	
	
	--ROTACION--
	if _G.C_EngineSettings.AOE then
		--Disidente
		if DISI_SKILL and DISI_CD <= 0.25 and pm > 1200 then
			UseSkill(DISI_ID_1, DISI_ID_2);
		--Cólera
		elseif COLERA_SKILL and COLERA_CD <= 0.25 then
			UseSkill(COLERA_ID_1, COLERA_ID_2);
		--Cambio de octava
		elseif CAM_OCT_SKILL and CAM_OCT_CD <= 0.25 and foco >= 15 then
			UseSkill(CAM_OCT_ID_1, CAM_OCT_ID_2);
		--Poder del espiritu del roble
		elseif POD_ESP_SKILL and POD_ESP_CD <= 0.25 and pm > 300 and (CE_TARGET_IS_BOSS() == false) then
			UseSkill(POD_ESP_ID_1, POD_ESP_ID_2);
		end
	end
	--Corte cargado
	if COR_CAR_SKILL and COR_CAR_CD <= 0.25 and pm > 350 then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);
	--Cordura perdida
	elseif COR_PER_SKILL and COR_PER_CD <= 0.25 and foco >= 20 then
		UnitSkill(COR_PER_ID_1, COR_PER_ID_2);
	end

	

end






function CE_BARD_WARDEN_IMPORT()
	local Skills = { 1244064, 200173, 1244062, 1244060, 203503, 1491103, 1491345, 493406, 1491173, 1491170, 1491100, 1491384, 1491383, 1491527 }
	local conditions = {
		-- 1 dwarf potion 1244064
		[1] = { [3]={ max="20", min="0", status=true }, [40]={ enable=true, status=true }},
		-- 2 strong stimulant 200173
		[2] = { [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 3 elven agility 1244062
		[3] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 4 prime rib 1244060
		[4] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- 5 Phirius mana 203503
		[5] = { [2]={ max="33", min="0", status=true }, [40]={ enable=true, status=true } },
		-- 7 Tempo 1491103 (fast buffs)
		[6] = { [3]={ max="100", min="25", status=true }, [19]={ enable=true, status=true }, [41]={ enable=true, status=true } },
		-- 8 Amuleto de la suerte 1491345 (fast buffs)
		[7] = { [41]={ enable=true, status=true } },
		-- 9 Poder feroz 493406 (fast buffs)
		[8] = { [41]={ enable=true, status=true } },
		-- 11 Disidente 1491173 (Lua: pm > 1200 raw, approximated)
		[9] = { [2]={ max="100", min="25", status=true }, [39]={ enable=true, status=true } },
		-- 10 Colera 1491170
		[10] = { [39]={ enable=true, status=true } },
		-- 11 Cambio de octava 1491100
		[11] = { [3]={ max="100", min="15", status=true }, [39]={ enable=true, status=true } },
		-- 14 Poder del espiritu del roble 1491384 (Lua: pm > 300 raw, approximated)
		[12] = { [2]={ max="100", min="6", status=true }, [39]={ enable=true, status=true }, [45]={ enable=true, status=true } },
		-- 15 Corte cargado 1491383 (Lua: pm > 350 raw, approximated)
		[13] = { [2]={ max="100", min="7", status=true } },
		-- 14 Cordura perdida 1491527
		[14] = { [3]={ max="100", min="20", status=true } }
	}
	local iss = {
		[1491345] = true
	}
	local consumables = {
		[1244064] = true,
		[200173] = true,
		[1244062] = true,
		[1244060] = true,
		[203503] = true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
