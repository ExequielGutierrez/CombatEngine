--[[Lua ROUGE/WARLOCK BY NEORAXER 20-04-2026
V3.0.1 Autor: NEORAXER
Neoraxer@live.com]]--

--Rotación ya con las skills cargadas y listas para usar.
function CE_ROGUE_WARLOCK()
	local energia = UnitMana("player");
	local foco = UnitSkill("player");
	local maxFoco = UnitMaxSkill("player");

	-- Tempestad del alma
	local TEMP_DEL_ALMA_SKILL, TEMP_DEL_ALMA_ID_1, TEMP_DEL_ALMA_ID_2 = Match_CE(490345);
	local TEMP_DEL_ALMA_CD = CE_CD(TEMP_DEL_ALMA_SKILL, TEMP_DEL_ALMA_ID_1, TEMP_DEL_ALMA_ID_2);
	-- Carga combada
	local CARGA_COMBADA_SKILL, CARGA_COMBADA_ID_1, CARGA_COMBADA_ID_2 = Match_CE(497958);
	local CARGA_COMBADA_CD = CE_CD(CARGA_COMBADA_SKILL, CARGA_COMBADA_ID_1, CARGA_COMBADA_ID_2);
	-- Perfect slide
	--Extractor de almas
	local EXTRACTOR_DE_ALMAS_SKILL, EXTRACTOR_DE_ALMAS_ID_1, EXTRACTOR_DE_ALMAS_ID_2 = Match_CE(1490290);
	local EXTRACTOR_DE_ALMAS_CD = CE_CD(EXTRACTOR_DE_ALMAS_SKILL, EXTRACTOR_DE_ALMAS_ID_1, EXTRACTOR_DE_ALMAS_ID_2);
	--Devorador de vida
	local DEVORADOR_DE_VIDA_SKILL, DEVORADOR_DE_VIDA_ID_1, DEVORADOR_DE_VIDA_ID_2 = Match_CE(1490291);
	local DEVORADOR_DE_VIDA_CD = CE_CD(DEVORADOR_DE_VIDA_SKILL, DEVORADOR_DE_VIDA_ID_1, DEVORADOR_DE_VIDA_ID_2);
	--Corte Sombrío
	local CORTE_SOMBRIO_SKILL, CORTE_SOMBRIO_ID_1, CORTE_SOMBRIO_ID_2 = Match_CE(1493673);
	local CORTE_SOMBRIO_CD = CE_CD(CORTE_SOMBRIO_SKILL, CORTE_SOMBRIO_ID_1, CORTE_SOMBRIO_ID_2);
	--Golpe Bajo
	local GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2 = Match_CE(1490341);
	local GOL_BAJ_CD = CE_CD(GOL_BAJ_SKILL, GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Cuchillada alevosa
	local CUCH_ALE_SKILL, CUCH_ALE_ID_1, CUCH_ALE_ID_2 = Match_CE(1490343);
	local CUCH_ALE_CD = CE_CD(CUCH_ALE_SKILL, CUCH_ALE_ID_1, CUCH_ALE_ID_2);
	--Cicatriz de la garra ISS
	local CIC_GAR_SKILL, CIC_GAR_ID_1, CIC_GAR_ID_2 = Match_CE(490356);
	local CIC_GAR_CD = CE_CD(CIC_GAR_SKILL, CIC_GAR_ID_1, CIC_GAR_ID_2);
	--Marca de garra ISS
	local MAR_GAR_SKILL, MAR_GAR_ID_1, MAR_GAR_ID_2 = Match_CE(490144);
	local MAR_GAR_CD = CE_CD(MAR_GAR_SKILL, MAR_GAR_ID_1, MAR_GAR_ID_2);

	--BUFFOS--
	--Tormento venenoso
	if (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314))
        then CastSpellByName(CE_toName(490314));
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
	-- Carga combada
	if CARGA_COMBADA_CD <= COMBATENGINE_GLOBAL_CD and foco >= 20 and not CE_SELF_DEBUFF(501575) then
		UseSkill(CARGA_COMBADA_ID_1, CARGA_COMBADA_ID_2);
	-- Tempestad del alma
	elseif energia >= 15 and CE_ISS_CD(CE_toName(490345)) and _G.C_EngineSettings.AOE then 
		CastSpellByName(CE_toName(490345));
	-- Perfect slide
	elseif CE_PERFECT_SLIDE() then
	--Extractor de almas
	elseif EXTRACTOR_DE_ALMAS_CD <= COMBATENGINE_GLOBAL_CD and not CE_SELF_DEBUFF(621564) and foco >= maxFoco * 0.15 then
		UseSkill(EXTRACTOR_DE_ALMAS_ID_1, EXTRACTOR_DE_ALMAS_ID_2);
	--Devorador de vida
	elseif DEVORADOR_DE_VIDA_CD <= COMBATENGINE_GLOBAL_CD and CE_SELF_DEBUFF(621564) and foco >= maxFoco * 0.15 then
		UseSkill(DEVORADOR_DE_VIDA_ID_1, DEVORADOR_DE_VIDA_ID_2);
	--Corte Sombrío
	elseif CORTE_SOMBRIO_CD <= COMBATENGINE_GLOBAL_CD and energia >= 35 and _G.C_EngineSettings.AOE and (CE_SELF_DEBUFF(1501783) or CE_SELF_DEBUFF(1502730)) then
		UseSkill(CORTE_SOMBRIO_ID_1, CORTE_SOMBRIO_ID_2);
	--Golpe Bajo
	elseif GOL_BAJ_CD <= COMBATENGINE_GLOBAL_CD and energia >= 30 and CE_DebuffIdTarget(620313) and not CE_DebuffIdTarget(620314) then
		UseSkill(GOL_BAJ_ID_1, GOL_BAJ_ID_2);
	--Cuchillada alevosa
	elseif CUCH_ALE_CD <= COMBATENGINE_GLOBAL_CD and energia >= 20 and not CE_DebuffIdTarget(620313) then
		UseSkill(CUCH_ALE_ID_1, CUCH_ALE_ID_2);
	--Cicatriz de la garra ISS
	elseif energia >= 35 and CE_DebuffIdTarget(508530) and CE_ISS_CD(CE_toName(490356)) then 
		CastSpellByName(CE_toName(490356));
	--Marca de garra ISS      
	elseif energia >= 20 and (CE_DebuffIdTarget(508530) == false) and (CE_ISS_CD(CE_toName(490144)) == true) then 
		CastSpellByName(CE_toName(490144));
	end
end

function CE_ROGUE_HARPSYN_IMPORT()
	--                 [1]      [2]     [3]      [4]     [5]     [6]     [7]      [8]      [9]     [10]      [11]   [12]     [13]     [14]     [15]
	local Skills = {1244064, 200173, 1244062, 1244060, 490314, 497958, 490345, 1491731, 1490290, 1490291, 1493673, 1490341, 1490343, 490356, 490144};
	local conditions = {
		-- Poción de enano 1244064
		[1] = { [5]={ max="40", min="0", status=true }, [40]={ enable=true, status=true }},
		-- Estimulante fuerte 200173
		[2] ={ [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- Agilidad elfica 1244062
		[3] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		-- Filete de costilla 1244060
		[4] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--Tormento venenoso 490314
		[5] = { [12]={ id1="500093", id2="0", id3="0", id4="0", status=true } },
		-- Carga combada 497958
		[6] = {
			[3]={ max="500", min="20", status=true },
			[12]={ id1="501575", id2="0", id3="0", id4="0", status=true } 
		},
		-- Tempestad del alma 490345
		[7] = { [5]={ max="100", min="13", status=true }, [39]={ enable=true, status=true } },
		-- Perfect slide 1491731
		[8] = { [42]={ enable=true, status=true } },
		-- Extractor de almas 1490290
		[9] = { [3]={ max="500", min="15", status=true } },
		-- Devorador de vida 1490291
		[10] = {
			[3]={ max="500", min="15", status=true },
			[5]={ max="0", min="0", status=true },
			[11]={ id1="621564", id2="0", id3="0", id4="0", status=true } 
		},
		-- Corte Sombrío 1493673
		[11] = {
			[5]={ max="100", min="25", status=true },
			[11]={ id1="1502730", id2="0", id3="0", id4="0", status=true } 
		},
		-- Golpe Bajo 1490341
		[12] = {
			[5]={ max="100", min="30", status=true },
			[34]={ id1="620313", id2="", id3="0", id4="0", status=true },
			[35]={ id1="620314", id2="0", id3="0", id4="0", status=true } 
		},
		-- Cuchillada alevosa 1490343
		[13] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="0", id3="0", id4="0", status=true } 
		},
		-- Cicatriz de la garra ISS 490356
		[14] = {
			[5]={ max="100", min="35", status=true },
			[32]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		},
		-- Marca de garra ISS 490144
		[15] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		},
	};

	local iss = {
		[490314] = true,
		[490345] = true,
		[490144] = true,
		[490356] = true,
	}

	local consumables = {
		[1244064] = true,
		[200173] = true,
		[1244062] = true,
		[1244060] = true,
	}
	
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end