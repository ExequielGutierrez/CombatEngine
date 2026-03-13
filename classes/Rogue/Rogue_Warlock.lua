--[[Lua ROUGE/WARLOCK BY NEORAXER 16-04-2024
V2.0 High quality for Combat Engine -> Autor: NEORAXER
Neoraxer@live.com

Este script lee y guarda las skills en la memoria ram cuando se cambia de clase o cuando se carga el juego, esto reduce el impacto
en el rendimiento y asegura una respuesta ms rápida, la carga se hace 3 segundos despues del cambio de clase, ya que el script es más rápido que el cambio.
]]--

--Create skills table <<Verifica si la tabla existe, si no, la crea, esto asegura que no haya error en los datos>>.
if not _G.CE_RW_SKILL then
	_G.CE_RW_SKILL = {}
end

--Map skills to cache <<busca las skills por ids, para que el idioma del juego no afecte la rotación, y las almacena dentro de la tabla >>.
function CE_ROGUE_WARLOCK_MAP_TO_CACHE()
	--Ventaja Focal
	CE_RW_SKILL.VENT_FOC_SKILL, CE_RW_SKILL.VENT_FOC_ID_1, CE_RW_SKILL.VENT_FOC_ID_2 = Match_CE(498807);
	--Maniobra abandonada
	CE_RW_SKILL.MAN_ABA_SKILL, CE_RW_SKILL.MAN_ABA_ID_1, CE_RW_SKILL.MAN_ABA_ID_2 = Match_CE(490355);		
	--Fundición de alma oscura
	CE_RW_SKILL.UN_ALM_SKILL, CE_RW_SKILL.FUN_ALM_ID_1, CE_RW_SKILL.FUN_ALM_ID_2 = Match_CE(498808);	
	--Carga combada
	CE_RW_SKILL.CARG_COMB_SKILL, CE_RW_SKILL.CARG_COMB_ID_1, CE_RW_SKILL.CARG_COMB_ID_2 = Match_CE(497958);
	--Extractor de almas
	CE_RW_SKILL.EXT_ALM_SKILL, CE_RW_SKILL.EXT_ALMB_ID_1, CE_RW_SKILL.EXT_ALM_ID_2 = Match_CE(1490290);
	--Devorar vida
	CE_RW_SKILL.DEV_VID_SKILL, CE_RW_SKILL.DEV_VID_ID_1, CE_RW_SKILL.DEV_VID_ID_2 = Match_CE(1490291);
	--Cuchillada Alevosa
	CE_RW_SKILL.CUCH_ALE_SKILL, CE_RW_SKILL.CUC_ALE_ID_1, CE_RW_SKILL.CUC_ALE_ID_2 = Match_CE(1490343);
	--Golpe bajo
	CE_RW_SKILL.GOL_BAJ_SKILL, CE_RW_SKILL.GOL_BAJ_ID_1, CE_RW_SKILL.GOL_BAJ_ID_2 = Match_CE(1490341);
	--Herida grave
	CE_RW_SKILL.HER_GRA_SKILL, CE_RW_SKILL.HER_GRA_ID_1, CE_RW_SKILL.HER_GRA_ID_2 = Match_CE(1490342);
	--Arrojar
	CE_RW_SKILL.ARR_SKILL, CE_RW_SKILL.ARR_ID_1, CE_RW_SKILL.ARR_ID_2 = Match_CE(490309);
	--Shadow slash
	CE_RW_SKILL.SHADOW_SLASH_SKILL, CE_RW_SKILL.SHADOW_SLASH_ID_1, CE_RW_SKILL.SHADOW_SLASH_ID_2 = Match_CE(1493673);
end

-- LLama a la función que llena la tabla de habilidades
local function InitializeSkillsTable()
	-- Llena la tabla de habilidades
	CE_ROGUE_WARLOCK_MAP_TO_CACHE()

	if GetLanguage() == "ES" then
		DEFAULT_CHAT_FRAME:AddMessage("|cff0099ffCE: Skills cargadas!")
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cff0099ffCE: Loaded skills!")
	end
end

-- Nombre para el temporizador
local timerName = "InitializeSkillsTimer"
-- Verifica si el temporizador ya está activo
if not TimerQueue[timerName] then
	-- Crea un temporizador para ejecutar InitializeSkillsTable después de 3 segundos
	TimerQueue[timerName] = { GetTime() + 3, InitializeSkillsTable }
end

--Rotación ya con las skills cargadas y listas para usar.
function CE_ROGUE_WARLOCK()
	local energia = UnitMana("player")
	local foco = UnitSkill("player")	
	
	--------CD--------
	--Carga combada
	local CARG_COMB_CD = CE_CD(CE_RW_SKILL.CARG_COMB_SKILL, CE_RW_SKILL.CARG_COMB_ID_1, CE_RW_SKILL.CARG_COMB_ID_2);
	--Extractor de almas
	local EXT_ALM_CD = CE_CD(CE_RW_SKILL.EXT_ALM_SKILL, CE_RW_SKILL.EXT_ALMB_ID_1, CE_RW_SKILL.EXT_ALM_ID_2);
	--Devorar vida
	local DEV_VID_CD = CE_CD(CE_RW_SKILL.DEV_VID_SKILL, CE_RW_SKILL.DEV_VID_ID_1, CE_RW_SKILL.DEV_VID_ID_2);
	--Cuchillada Alevosa
	local CUCH_ALE_CD = CE_CD(CE_RW_SKILL.CUCH_ALE_SKILL, CE_RW_SKILL.CUC_ALE_ID_1, CE_RW_SKILL.CUC_ALE_ID_2);
	--Shadow slash
	local SHADOW_SLASH_CD = CE_CD(CE_RW_SKILL.SHADOW_SLASH_SKILL, CE_RW_SKILL.SHADOW_SLASH_ID_1, CE_RW_SKILL.SHADOW_SLASH_ID_2);
	--Golpe bajo
	local GOP_BAJ_CD = CE_CD(CE_RW_SKILL.GOL_BAJ_SKILL, CE_RW_SKILL.GOL_BAJ_ID_1, CE_RW_SKILL.GOL_BAJ_ID_2);
	--Herida grave
	local ATA_HER_CD = CE_CD(CE_RW_SKILL.HER_GRA_SKILL, CE_RW_SKILL.HER_GRA_ID_1, CE_RW_SKILL.HER_GRA_ID_2);
	--Arrojar
	local ARR_CD = CE_CD(CE_RW_SKILL.ARR_SKILL, CE_RW_SKILL.ARR_ID_1, CE_RW_SKILL.ARR_ID_2);

	if C_EngineSettings.Consumables then
		-- Poción del enano
		if (energia < 40) and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then
		--Estimulante fuerte
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end
	
	--Ventaja focal
	if CE_RW_SKILL.VENT_FOC_SKILL and (CE_BuffIdPlayer(621568) == false) then
		UseSkill(CE_RW_SKILL.VENT_FOC_ID_1, CE_RW_SKILL.VENT_FOC_ID_2)
	--Maniobra abandonada
	elseif CE_RW_SKILL.MAN_ABA_SKILL and (CE_BuffIdPlayer(500744) == false) then
		UseSkill(CE_RW_SKILL.MAN_ABA_ID_1, CE_RW_SKILL.MAN_ABA_ID_2);
	--Fundición de alma oscura
	elseif (CE_BuffIdPlayer(1500600) == false) then
		UseSkill(CE_RW_SKILL.FUN_ALM_ID_1, CE_RW_SKILL.FUN_ALM_ID_2) 
	--Tormento venenoso
	elseif (CE_BuffIdPlayer(500093) == false) and (IsSpellUsable(490314)) then
		CastSpellByName(CE_toName(490314));	
	end 

	--ROTACION--
	--Tempestad del alma
	if _G.C_EngineSettings.AOE then
		if (energia>=13) and CE_ISS_CD(CE_toName(490345)) then
			CastSpellByName(CE_toName(490345));
		end 
	end
   
	--Perfect Slide	
	if CE_PERFECT_SLIDE() then
	--Carga combada
	elseif CE_RW_SKILL.CARG_COMB_SKILL and (CARG_COMB_CD <= 0.25) and (CE_BuffIdPlayer(501575) == false) and foco >= 20 then
		UseSkill(CE_RW_SKILL.CARG_COMB_ID_1, CE_RW_SKILL.CARG_COMB_ID_2)
	--Shadow slash
	elseif SHADOW_SLASH_CD <= 0.25 and energia >= 25 and CE_BuffIdPlayer(1502730) then
		UseSkill(CE_RW_SKILL.SHADOW_SLASH_ID_1, CE_RW_SKILL.SHADOW_SLASH_ID_2);
	--Ataque a la herida
	elseif CE_RW_SKILL.HER_GRA_SKILL and ATA_HER_CD <= 0.45 and ( CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(620314) ) and energia >= 30 and CE_WEAPON_TYPE("Daga") then
		UseSkill(CE_RW_SKILL.HER_GRA_ID_1, CE_RW_SKILL.HER_GRA_ID_2);
	--Golpe bajo
	elseif energia >= 30 and CE_SELF_DEBUFF(620313) and CE_SELF_DEBUFF(620314) == false then
		UseSkill(CE_RW_SKILL.GOL_BAJ_ID_1, CE_RW_SKILL.GOL_BAJ_ID_2);
	--Cuchillada alevosa
	elseif CE_SELF_DEBUFF(620313) == false and energia >= 20 then
		UseSkill(CE_RW_SKILL.CUC_ALE_ID_1, CE_RW_SKILL.CUC_ALE_ID_2);
	end
	
	--Extractor de almas
	if EXT_ALM_CD <= 0.25 and foco >= 15 then
		UseSkill(CE_RW_SKILL.EXT_ALMB_ID_1, CE_RW_SKILL.EXT_ALM_ID_2);
	--Devorador de vida
	elseif DEV_VID_CD <= 0.25 and foco >= 15 and CE_BuffIdPlayer(621564) then
		UseSkill(CE_RW_SKILL.DEV_VID_ID_1, CE_RW_SKILL.DEV_VID_ID_2);
	--Marca de garra ISS      
	elseif energia >= 20 and (CE_DebuffIdTarget(508530) == false) and CE_ISS_CD(CE_toName(490144)) then
		CastSpellByName(CE_toName(490144));
	--Cicatriz de la garra ISS
	elseif (energia >= 35) and (CE_DebuffIdTarget(508530) == true) and (CE_ISS_CD(CE_toName(490356)) == true) then
		CastSpellByName(CE_toName(490356));
	--Arrojar
	elseif CE_RW_SKILL.ARR_SKILL and ARR_CD <= 0.25 then
		UseSkill(CE_RW_SKILL.ARR_ID_1, CE_RW_SKILL.ARR_ID_2);  
	end
end

function CE_ROGUE_HARPSYN_IMPORT()	
	local Skills = { 1244064, 200173, 1244062, 1244060, 498807, 490355, 498808, 490314, 490345, 1491731, 497958, 1493673, 1490342, 1490341, 1490343, 1490290, 1490291, 490144, 490356, 490309};
	local conditions = {
		--poción de enano
		[1] = { [5]={ max="40", min="0", status=true }, [40]={ enable=true, status=true }},
		--estimulante fuerte
		[2] ={ [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--agilidad elfica
		[3] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},
		--filete de costilla
		[4] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true }},

		--ventaja focal
		[5] ={ [12]={ id1="621568", id2="0", id3="0", id4="0", status=true } },
		--maniobra abandonada
		[6] = { [12]={ id1="500744", id2="0", id3="0", id4="0", status=true } },
		--fundición de alma oscura
		[7] = { [12]={ id1="1500600", id2="0", id3="0", id4="0", status=true } },
		--tormento venenoso
		[8] = { [12]={ id1="500093", id2="0", id3="0", id4="0", status=true } },
		--tempestad del alma
		[9] = { [5]={ max="100", min="13", status=true }, [39]={ enable=true, status=true } },
		--perfect slide
		[10] = { [42]={ enable=true, status=true } },
		--carga combada
		[11] = {
			[3]={ max="500", min="20", status=true },
			[12]={ id1="501575", id2="0", id3="0", id4="0", status=true } 
		  },
		--Shadow slash
		[12] = {
			[5]={ max="100", min="25", status=true },
			[11]={ id1="1502730", id2="0", id3="0", id4="0", status=true } 
		  },
		--ataque a la herida
		[13] ={
			[5]={ max="100", min="35", status=true },
			[34]={ id1="620313", id2="0", id3="0", id4="620314", status=true } 
		  },
		--golpe bajo
		[14] = {
			[5]={ max="100", min="30", status=true },
			[34]={ id1="620313", id2="", id3="0", id4="0", status=true },
			[35]={ id1="620314", id2="0", id3="0", id4="0", status=true } 
		  },
		--cuchillada alevosa
		[15] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="620313", id2="0", id3="0", id4="0", status=true } 
		  },
		--extractor de almas
		[16] = { [3]={ max="500", min="15", status=true } },
		--devorador de vida
		[17] = {
			[3]={ max="500", min="15", status=true },
			[5]={ max="0", min="0", status=true },
			[11]={ id1="621564", id2="0", id3="0", id4="0", status=true } 
		  },
		--marca de garra ISS
		[18] = {
			[5]={ max="100", min="20", status=true },
			[33]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
		--cicatriz de la garra ISS
		[19] = {
			[5]={ max="100", min="35", status=true },
			[32]={ id1="508530", id2="0", id3="0", id4="0", status=true } 
		  },
		--arrojar
		[20] = {},
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