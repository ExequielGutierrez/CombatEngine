--Lua Scout/Warden BY NEORAXER 22-04-2026
--V2.0.1 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_WARDEN()
	
	local foco = UnitMana("player")
	local mana = UnitSkill("player")
    local MaxPm = UnitMaxSkill("player")

	--Flecha de escarcha
	local FLE_ESC_SKILL, FLE_ESC_ID_1, FLE_ESC_ID_2 = Match_CE(491163);
	--Concentración
	local CONC_SKILL, CONC_ID_1, CONC_ID_2 = Match_CE(490460);
	local CONC_CD = CE_CD(CONC_SKILL, CONC_ID_1, CONC_ID_2);
	--Poder feroz
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);
	--Corte cargado
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(494336);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2);
	--Peligro oculto
	local PEL_OCU_SKILL, PEL_OCU_ID_1, PEL_OCU_ID_2 = Match_CE(494620);
	local PEL_OCU_CD = CE_CD(PEL_OCU_SKILL, PEL_OCU_ID_1, PEL_OCU_ID_2);
    --Tiro de precisión
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(499576);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
	--Flecha de espinas
    local FLE_ESP_SKILL, FLE_ESP_ID_1, FLE_ESP_ID_2 = Match_CE(499751);
	local FLE_ESP_CD = CE_CD(FLE_ESP_SKILL, FLE_ESP_ID_1, FLE_ESP_ID_2); 
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(490400);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(490457);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);    
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(494942);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
	--Golpe de grifo
	local GOL_GRI_SKILL, GOL_GRI_ID_1, GOL_GRI_ID_2 = Match_CE(494629);
	local GOL_GRI_CD = CE_CD(GOL_GRI_SKILL, GOL_GRI_ID_1, GOL_GRI_ID_2);
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);   
	--Flecha vampírica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    


   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar Phirius de mana
		elseif mana <= MaxPm/100 * 10 and CE_UseItem(203503) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end


    --ROTACIÓN--
	
    --Tiro de precisión
	if TIR_PRE_SKILL and TIR_PRE_CD <=0.25 and CE_BuffIdPlayer(504588) and ((CE_isMoving() == false) or CE_BuffIdPlayer(1500556)) then
		UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);	
	elseif DIS_COM_SKILL and DIS_COM_CD <= 0.25 and ((CE_isMoving() == false) or CE_BuffIdPlayer(1500556)) then
		UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
	end
	
	CE_NewAutoShoot( 492589 );
	
	--Flecha de escarcha
	if FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) then
		UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
	--Concentración
	elseif CONC_SKILL and CONC_CD <= 0.25 and foco <= 20 and (CE_BuffIdPlayer(500930) == false) then
		UseSkill(CONC_ID_1, CONC_ID_2);
	--Poder feroz
	elseif POD_FER_SKILL and POD_FER_CD <= 0.25 and _G.C_EngineSettings.FastBuffs then
		UseSkill(POD_FER_ID_1, POD_FER_ID_2);
	--Corte cargado
	elseif COR_CAR_SKILL and COR_CAR_CD <= 0.25 then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);
	--Peligro oculto
	elseif PEL_OCU_SKILL and PEL_OCU_CD <= 0.25 and foco >= 30 then
		UseSkill(PEL_OCU_ID_1, PEL_OCU_ID_2);
    --Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_CD <= 0.25 and foco >= 25 then
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
	--Flecha de espinas
	elseif FLE_ESP_SKILL and FLE_ESP_CD <= 0.25 and _G.C_EngineSettings.AOE then 
		UseSkill(FLE_ESP_ID_1, FLE_ESP_ID_2);
    --Flecha desgarradora
	elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and _G.C_EngineSettings.AOE then 
		UseSkill(FLE_DES_ID_1, FLE_DES_ID_2);
    --Disparo colateral 
	elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and _G.C_EngineSettings.AOE then 
		UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);
	--Golpe de grifo
	elseif GOL_GRI_SKILL and GOL_GRI_CD <= 0.25 and pm >= ((MaxPm/100) * 6) and _G.C_EngineSettings.AOE then 
		UseSkill(GOL_GRI_ID_1, GOL_GRI_ID_2);
    --Flecha de viento
	elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
		UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
	--Flecha vampírica
	elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and (CE_DebuffIdTarget(501690) == false) then
		UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
	end
	
end

-- Maketa para importar default presets
function CE_RANGER_WARDEN_IMPORT()
	--                 [1]      [2]     [3]      [4]     [5]    [6]     [7]      [8]     [9]     [10]    [11]    [12]   [13]     [14]    [15]   [16]     [17]   [18]    [19]    [20]    [21]    [22]    [23]    [24]
	local Skills = {1244064, 200173, 1244062, 1244060, 499576, 492589, 491163, 490460, 493406, 494336, 494620, 490420, 499751, 490400, 490457, 494629, 491128, 491292}
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
		-- 5 Tiro de precisión 499576
		[5] = {
			[11]={ id1="504588", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
		},
		-- 6 Autoshoot 492589
		[6] = {
			[44]={ enable=true, status=true }, -- 44 Auto Shoot
		},
		-- 7 Flecha de escarcha 491163
		[7] = {
			[12]={ id1="501530", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
		},
		-- 8 Concentración 490460
		[8] = {
			[5]={ max="20", min="0", status=true }, -- 5 foco
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
		},
		-- 9 Poder feroz 493406
		[9] = {
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
		},
		-- 10 Corte cargado 494336
		[10] = {}, -- No conditions
		-- 11 Peligro oculto 494620
		[11] = {
			[3]={ max="500", min="30", status=true }, -- 3 foco
		},
		-- 12 Golpe a las articulaciones 490420
		[12] = {
			[3]={ max="500", min="25", status=true }, -- 3 foco
		},
		-- 13 Flecha de espinas 499751
		[13] = {
			[39]={ enable=true, status=true }, -- 39 AoE
		},
		-- 14 Flecha desgarradora 490400
		[14] = {
			[39]={ enable=true, status=true }, -- 39 AoE
		},
		-- 15 Disparo colateral 490457
		[15] = {
			[39]={ enable=true, status=true }, -- 39 AoE
		},
		-- 16 Golpe de grifo 494629
		[16] = {
			[39]={ enable=true, status=true }, -- 39 AoE
		},
		-- 17 Flecha de viento 491128
		[17] = {}, -- No conditions
		-- 18 Flecha vampírica 491292
		[18] = {
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