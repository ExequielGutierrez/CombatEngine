--Lua Scout/Mage BY NEORAXER 22-04-2026
--V2.0.1 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

COMBAT_ENGINE_INCINERATION = false;

function incineration_Delay()
	COMBAT_ENGINE_INCINERATION = false;	
end


function CE_SCOUT_MAGE()

	local foco = UnitMana("player");

	--Tiro de precisión
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(1491043);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2);
	--Aceite arriba
	local ACE_ARR_SKILL, ACE_ARR_ID_1, ACE_ARR_ID_2 = Match_CE(491510);
	local ACE_ARR_CD = CE_CD(ACE_ARR_SKILL, ACE_ARR_ID_1, ACE_ARR_ID_2);
	--Concentración
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_ARR_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);
	--Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(1491040);
	local GOL_ART_ARR_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
	--El infierno
	local EL_INF_SKILL, EL_INF_ID_1, EL_INF_ID_2 = Match_CE(491509);
	local EL_INF_CD = CE_CD(EL_INF_SKILL, EL_INF_ID_1, EL_INF_ID_2);
	--Disparo reflejado
	local DIS_REF_SKILL, DIS_REF_ID_1, DIS_REF_ID_2 = Match_CE(1491045);
	local DIS_REF_CD = CE_CD(DIS_REF_SKILL, DIS_REF_ID_1, DIS_REF_ID_2);
	--Flecha Punzante
	local FLE_PUN_SKILL, FLE_PUN_ID_1, FLE_PUN_ID_2 = Match_CE(1491042);
	local FLE_PUN_CD = CE_CD(FLE_PUN_SKILL, FLE_PUN_ID_1, FLE_PUN_ID_2);
	--Disparo Combinado
	local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(1491044);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
	--Flecha de llama
	local FLE_LLA_SKILL, FLE_LLA_ID_1, FLE_LLA_ID_2 = Match_CE(1491041);
	local FLE_LLA_CD = CE_CD(FLE_LLA_SKILL, FLE_LLA_ID_1, FLE_LLA_ID_2);    
	--Flecha vampírica
	local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(1491039);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    
	--Dsparo de fuego
	local DIS_FUE_SKILL, DIS_FUE_ID_1, DIS_FUE_ID_2 = Match_CE(1491038);
	local DIS_FUE_CD = CE_CD(DIS_FUE_SKILL, DIS_FUE_ID_1, DIS_FUE_ID_2);    
	--Incineración 
	local INC_SKILL, INC_ID_1, INC_ID_2 = Match_CE(1491046);

	--ROTACION--


	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Estimulante fuerte
		elseif  CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
		elseif  CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end

	--Incineración
	if _G.C_EngineSettings.AOE and not CE_BuffIdPlayer( 1501678 ) then

		if COMBAT_ENGINE_INCINERATION == true then return end;

		if not TimerQueue["IncineracionDelay"] and COMBAT_ENGINE_INCINERATION == false then
			TimerQueue["IncineracionDelay"] = { GetTime() + 1, incineration_Delay };
			CE_NewAutoShoot( 1491046 );
			COMBAT_ENGINE_INCINERATION = true;
		end

	end

	if GOL_ART_SKILL and GOL_ART_ARR_CD <= 0.3 and foco >= 15 then 
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
		return;
	end

	--Tiro de precisión
	if TIR_PRE_SKILL and TIR_PRE_CD <= 0.3 and CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(500939) and CE_BuffIdPlayer(502880) then 
		UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);
		return;
	--Aceite arriba
	elseif ACE_ARR_SKILL and ACE_ARR_CD <= 0.3 and C_EngineSettings.FastBuffs then
		UseSkill(ACE_ARR_ID_1, ACE_ARR_ID_2);
		return;
	--Concentración
	elseif CON_SKILL and CON_ARR_CD <= 0.3 and foco <= 50 then
		UseSkill(CON_ID_1, CON_ID_2);
		return;
	--Flecha Punzante
    elseif FLE_PUN_SKILL and FLE_PUN_CD <= 0.3 and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() then
        UseSkill(FLE_PUN_ID_1, FLE_PUN_ID_2);
        return;
	--Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_ARR_CD <= 0.3 and foco >= 25 then 
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
		return;
	--El infierno
	elseif EL_INF_SKILL and EL_INF_CD <= 0.3 and _G.C_EngineSettings.AOE and CE_isMoving() == false and not COMBATENGINE_CASTING and not CE_TARGET_IS_BOSS() then
		SpellTargetUnit("mouseover");
		UseSkill(EL_INF_ID_1, EL_INF_ID_2);
		return;
	--Disparo Combinado
	elseif DIS_COM_SKILL and DIS_COM_CD <= 0.3 and (CE_isMoving() == false or CE_BuffIdPlayer(1500556)) then
		UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
		return;
	--Flecha de llama
	elseif FLE_LLA_CD <= 0.25 then
		UseSkill(FLE_LLA_ID_1, FLE_LLA_ID_2);
		return;
	--Disparo de fuego
	elseif DIS_FUE_SKILL and DIS_FUE_CD <= 0.3 then
		UseSkill(DIS_FUE_ID_1, DIS_FUE_ID_2);
		return;
	--Flecha Sangrienta
	elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.3 and CE_DebuffIdTarget(501690) == false and foco >= 10 then
		UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
		return;
	end
end

-- Maketa para importar default presets
function CE_RANGER_MAGE_IMPORT()
	--                 [1]      [2]     [3]      [4]     [5]       [6]     [7]      [8]     [9]     [10]    [11]     [12]     [13]     [14]    [15]     [16]     [17]     [18]    [19]    [20]
	local Skills = {1244064, 200173, 1244062, 1244060, 1491046, 1491043, 491510, 490460, 1491042, 1491040, 491509, 491509, 1491044, 1491044, 1491041, 1491038, 1491039}
	local conditions = {
		-- 1 Poción de enano 1244064
		[1] = {
            [3]={ max="20", min="0", status=true }, -- 3 foco
            [40]={ enable=true, status=true } -- 40 Consumables
        },
		-- 2 Estimulante fuerte 200173
		[2] ={
            [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
            [29]={ enable=true, status=true }, -- 29 Is Boss
            [40]={ enable=true, status=true } -- 40 Consumables
        },
		-- 3 Agilidad elfica 1244062
		[3] = {
            [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
            [17]={ id="501321", status=true, time="0" }, -- 17 End time and Buff Player
            [29]={ enable=true, status=true }, -- 29 Is Boss
            [40]={ enable=true, status=true } -- 40 Consumables
        },
		-- 4 Filete de costilla 1244060
		[4] = {
            [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
            [29]={ enable=true, status=true }, -- 29 Is Boss
            [40]={ enable=true, status=true } -- 40 Consumables
        },
		-- 5 Incineración 1491046
		[5] = {
			[39]={ enable=true, status=true }, -- 39 AoE
            [12]={ id1="1501678", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
		},
		-- 6 Tiro de precisión 1491043
		[6] = {
			[11]={ id1="500939", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
			[11]={ id1="502880", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
			[29]={ enable=true, status=true }, -- 29 Is Boss
		},
		-- 7 Aceite arriba 491510
		[7] = {
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
		},
		-- 8 Concentración 490460
		[8] = {
			[5]={ max="50", min="0", status=true }, -- 5 foco
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
		},
		-- 9 Flecha Punzante 1491042
		[9] = {
			[39]={ enable=true, status=true }, -- 39 AoE
			[45]={ enable=true, status=true }, -- 45 No Boss
		},
		-- 10 Golpe a las articulaciones 1491040
		[10] = {
			[3]={ max="500", min="25", status=true }, -- 3 foco
		},
		-- 11 El infierno 491509 no Move
		[11] = {
			[39]={ enable=true, status=true }, -- 39 AoE
			[45]={ enable=true, status=true }, -- 45 No Boss
			[19]={ enable=true, status=true }, -- 19 Is Not Moving
			[43]={ enable=true, status=true }, -- 43 Auto Aoe
		},
		-- 12 El infierno 491509 Move
		[12] = {
			[11]={ id1="1500556", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
			[39]={ enable=true, status=true }, -- 39 AoE
			[45]={ enable=true, status=true }, -- 45 No Boss
			[43]={ enable=true, status=true }, -- 43 Auto Aoe
		},
		-- 13 Disparo Combinado in Move 1491044
		[13] = {
			[11]={ id1="1500556", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
			[29]={ enable=true, status=true }, -- 29 Is Boss
		},
		-- 14 Disparo Combinado no move but buff 1491044
		[14] = {
			[12]={ id1="1500556", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
			[29]={ enable=true, status=true }, -- 29 Is Boss
			[19]={ enable=true, status=true }, -- 19 Is Not Moving
		},
		-- 15 Flecha de llama 1491041
		[15] = {}, -- No conditions
		-- 16 Disparo de fuego 1491038
		[16] = {}, -- No conditions
		-- 17 Flecha vampirica 1491039
		[17] = {
			[3]={ max="500", min="10", status=true }, -- 3 foco
			[33]={ id1="501690", id2="0", id3="0", id4="0", status=true}, --33 target not effect
		},
	};


	local iss = {
		[494609] = true,
		[494970] = true,
		[495725] = true,
		[494968] = true,
        [495560] = true,
        [850145] = true,
        [495714] = true,
	}

	local consumables = {
		[1244064] = true,
		[200173] = true,
		[1244062] = true,
		[1244060] = true,
	}
	
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end