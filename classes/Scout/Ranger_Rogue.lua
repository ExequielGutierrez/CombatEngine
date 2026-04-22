--Lua SCOUT/ROGUE BY NEORAXER 22-04-2026
--V2.0.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_ROGUE()


	local foco = UnitMana("player");
	local energia = UnitSkill("player");

    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(493093);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Talón de Aquiles
    local TAL_AQU_SKILL, TAL_AQU_ID_1, TAL_AQU_ID_2 = Match_CE(491493);
	local TAL_AQU_CD = CE_CD(TAL_AQU_SKILL, TAL_AQU_ID_1, TAL_AQU_ID_2); 
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(493008);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Tiro de precisión
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(490450);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2); 
    --Flecha vampírica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);   
    --Mordisco venenoso letal
    local MOR_VEN_SKILL, MOR_VEN_ID_1, MOR_VEN_ID_2 = Match_CE(492621);
	local MOR_VEN_CD = CE_CD(MOR_VEN_SKILL, MOR_VEN_ID_1, MOR_VEN_ID_2);   
    --Flecha debilitadora
    local FLE_DEB_SKILL, FLE_DEB_ID_1, FLE_DEB_ID_2 = Match_CE(491496);
	local FLE_DEB_CD = CE_CD(FLE_DEB_SKILL, FLE_DEB_ID_1, FLE_DEB_ID_2);   
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(493292);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);	
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);  
    --Disparo reflejado
    local DIS_REF_SKILL, DIS_REF_ID_1, DIS_REF_ID_2 = Match_CE(499535);
	local DIS_REF_CD = CE_CD(DIS_REF_SKILL, DIS_REF_ID_1, DIS_REF_ID_2);
    --Concentración
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_ARR_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);



   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 or energia <= 20 and CE_UseItem(1244064) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		--Frasco de espíritu élfico
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500238) == false) and CE_UseItem(1244063) then
		end
		CE_HEALING_ITEM()
	end

	CE_NewAutoShoot( 492589 );

    --Concentración
	if CON_SKILL and CON_ARR_CD <= 0.25 and (CE_BuffIdPlayer(500930) == false) and foco <= 40 then
		UseSkill(CON_ID_1, CON_ID_2);  
    --Tiro
	elseif TIR_SKILL and TIR_CD <= 0.25 and CE_AFE(503169, 11) then
		UseSkill(TIR_ID_1, TIR_ID_2);
    --Talón de Aquiles
	elseif TAL_AQU_SKILL and TAL_AQU_CD <= 0.25 and foco >= 25 then
		UseSkill(TAL_AQU_ID_1, TAL_AQU_ID_2);
    --Tiro de precisión
	elseif TIR_PRE_SKILL and TIR_PRE_CD <= 0.25 and CE_BuffIdPlayer(503169) and CE_BuffIdPlayer(501895) and (CE_isMoving() == false) then
		UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Flecha desgarradora
	elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
		UseSkill(FLE_DES_ID_1, FLE_DES_ID_2);
    --Flecha vampírica  
	elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and (CE_DebuffIdTarget(501690) == false) and foco >= 10 then
		UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Mordisco venenoso letal
	elseif MOR_VEN_SKILL and MOR_VEN_CD <= 0.25 and CE_DebuffIdTarget(501690) and energia >= 20 then
		UseSkill(MOR_VEN_ID_1, MOR_VEN_ID_2);
    --Flecha debilitadora  
	elseif FLE_DEB_SKILL and FLE_DEB_CD <= 0.25 and energia >= 50 then
		UseSkill(FLE_DEB_ID_1, FLE_DEB_ID_2);
    --Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_CD <= 0.25 and foco >= 25 then
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
    --Disparo Combinado
    elseif DIS_COM_SKILL and DIS_COM_CD <= 0.3 and (CE_isMoving() == false or CE_BuffIdPlayer(1500556)) then
        UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
    --Disparo reflejado
    elseif DIS_REF_SKILL and DIS_REF_CD <= 0.3 and _G.C_EngineSettings.AOE then
        UseSkill(DIS_REF_ID_1, DIS_REF_ID_2);
    --Flecha de viento
	elseif FLE_VIE_SKILL and FLE_VIE_CD >= 0.25 then
		UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
	end

end

-- Maketa para importar default presets
function CE_RANGER_THIEF_IMPORT()
	--                 [1]      [2]     [3]      [4]     [5]    [6]     [7]      [8]     [9]     [10]    [11]    [12]   [13]     [14]    [15]   [16]     [17]   [18]    [19]    [20]    [21]    [22]    [23]    [24]
	local Skills = {1244064, 200173, 1244062, 1244060, 492589, 490460, 493093, 491493, 490450, 490400, 491292, 492621, 491496, 490420, 493292, 493292, 1494044, 491128}
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
		-- 5 Autoshoot 492589
		[5] = {
			[44]={ enable=true, status=true }, -- 44 Auto Shoot
		},
		-- 6 Concentración 490460
		[6] = {
			[5]={ max="50", min="0", status=true }, -- 5 foco
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
		},
		-- 7 Tiro 493093
		[7] = {
			[46] = { status = true, id = 503256, time = 3, self = false }, -- 46 After End Effect
		},
		-- 8 Talón de Aquiles 491493
		[8] = {
			[3]={ max="500", min="25", status=true }, -- 3 foco
		},
		-- 9 Tiro de precisión 490450
		[9] = {
			[11]={ id1="503169", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
			[11]={ id1="501895", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
			[19]={ enable=true, status=true }, -- 19 Is Not Moving
		},
		-- 10 Flecha desgarradora 490400
		[10] = {
			[39]={ enable=true, status=true }, -- 39 AoE
			[45]={ enable=true, status=true }, -- 45 No Boss
		},
		-- 11 Flecha vampírica 491292
		[11] = {
			[3]={ max="500", min="10", status=true }, -- 3 foco
			[33]={ id1="501690", id2="0", id3="0", id4="0", status=true}, --33 target not effect
		},
		-- 12 Mordisco venenoso letal 492621
		[12] = {
			[5]={ max="500", min="20", status=true }, -- 5 energía
			[32]={ id1="501690", id2="0", id3="0", id4="0", status=true}, --32 target has effect
		},
		-- 13 Flecha debilitadora 491496
		[13] = {
			[5]={ max="500", min="50", status=true }, -- 5 energía
		},
		-- 14 Golpe a las articulaciones 490420
		[14] = {
			[3]={ max="500", min="25", status=true }, -- 3 foco
		},
        -- 15 Disparo Combinado in Move 493292
        [15] = {
			[11]={ id1="1500556", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
			[29]={ enable=true, status=true }, -- 29 Is Boss
        },
        -- 16 Disparo Combinado no move 493292
        [16] = {
			[12]={ id1="1500556", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
			[29]={ enable=true, status=true }, -- 29 Is Boss
			[19]={ enable=true, status=true }, -- 19 Is Not Moving
        },
		-- 17 Disparo reflejado 1494044
		[17] = {
			[45]={ enable=true, status=true }, -- 45 No Boss
			[39]={ enable=true, status=true }, -- 39 AoE
		},
		-- 18 Flecha de viento 491128
		[18] = {}, -- No conditions
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