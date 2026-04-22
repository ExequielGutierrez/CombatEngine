--Lua SCOUT/WARLOCK BY NEORAXER 22-04-2026
--V2.0.1 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_WARLOCK()

	local foco = UnitMana("player");

    --Tiro de Precisión venenoso 1490792
    local TIR_PRE_VEN_SKILL, TIR_PRE_VEN_ID_1, TIR_PRE_VEN_ID_2 = Match_CE(1490458);
    local TIR_PRE_VEN_CD = CE_CD(TIR_PRE_VEN_SKILL, TIR_PRE_VEN_ID_1, TIR_PRE_VEN_ID_2);
    -- Carga Combada
    local CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2 = Match_CE(1490798);
    local CARG_COMB_CD = CE_CD(CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2);
    -- Weakening Weave Curse
    local WEA_CURSE_SKILL, WEA_CURSE_ID_1, WEA_CURSE_ID_2 = Match_CE(1490797);
    local WEA_CURSE_CD = CE_CD(WEA_CURSE_SKILL, WEA_CURSE_ID_1, WEA_CURSE_ID_2);
    -- Surge of Malice
    local SUR_MA_SKILL, SUR_MA_ID_1, SUR_MA_ID_2 = Match_CE(1490799);
    local SUR_MA_CD = CE_CD(SUR_MA_SKILL, SUR_MA_ID_1, SUR_MA_ID_2);
    -- Snipe
	local SNI_SKILL, SNI_ID_1, SNI_ID_2 = Match_CE(1490792);
	local SNI_CD = CE_CD(SNI_SKILL, SNI_ID_1, SNI_ID_2);
    
    --Disparo Combinado -- Combo Shot
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(1490793);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
    --Golpe a las articulaciones -- Joint Blow
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha vampírica -- Vampire Arrows
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(1490788);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    
    --Flecha desgarradora -- Piercing Arrow
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(1490791);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Disparo colateral -- Reflected Shot
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(1490794);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);    
    --Disparo drena-mana
    local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(1492104);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2);   
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(1490790);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);    
    --Tiro -- Shot
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(1490787);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Flecha de escarcha -- Frost Arrow
    local FLE_ESC_SKILL, FLE_ESC_ID_1, FLE_ESC_ID_2 = Match_CE(491163);
    --Detección
    local DET_SKILL, DET_ID_1, DET_ID_2 = Match_CE(1490800);
    --Campo de mira -- Target Area
    local CAM_MIR_SKILL, CAM_MIR_ID_1, CAM_MIR_ID_2 = Match_CE(1490802);
    --Concentración
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_ARR_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);
    --Oleada Venenosa
    local OLEADA_SKILL, OLEADA_ID_1, OLEADA_ID_2 = Match_CE(1490456);
    local OLEADA_CD = CE_CD(OLEADA_SKILL, OLEADA_ID_1, OLEADA_ID_2);
    

	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar Spicy Kale Chips
		elseif (CE_BuffIdPlayer(1500234) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244059) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end

	--BUFFOS OFENSIVOS--

	if CARG_COMB_SKILL and CARG_COMB_CD <= 0.25 and not CE_BuffIdPlayer(501575) and _G.C_EngineSettings.FastBuffs then
		UseSkill(CARG_COMB_ID_1, CARG_COMB_ID_2);
	elseif TIR_PRE_VEN_SKILL and TIR_PRE_VEN_CD <= 0.25 and CE_TARGET_IS_BOSS() and not CE_BuffIdPlayer(1501140) and _G.C_EngineSettings.FastBuffs then
		UseSkill(TIR_PRE_VEN_ID_1, TIR_PRE_VEN_ID_2);
    elseif OLEADA_SKILL and OLEADA_CD <= 0.25 and _G.C_EngineSettings.FastBuffs then
        UseSkill(OLEADA_ID_1, OLEADA_ID_2);
    end
	
    --Flecha de escarcha 
    if FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) and foco >= 20
        then UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
    --Campo de mira
    elseif CAM_MIR_SKILL and (CE_BuffIdPlayer(1501137) == false)
        then UseSkill(CAM_MIR_ID_1, CAM_MIR_ID_2);    
    --Detección
    elseif DET_SKILL and (CE_BuffIdPlayer(1501133) == false)
        then UseSkill(DET_ID_1, DET_ID_2);        
    end
           

    --ROTACIÓN--
	
	--Autoshoot
	CE_NewAutoShoot( 1490789 )

    --Tiro de presicion         
    if SNI_SKILL and SNI_CD <= 0.25 and CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1501140) then
         UseSkill(SNI_ID_1, SNI_ID_2);
    --Disparo combinado
    elseif DIS_COM_SKILL and DIS_COM_CD <= 0.25  then
        UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
    -- Oleada de malicia
    elseif SUR_MA_SKILL and SUR_MA_CD<=0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
        UseSkill(SUR_MA_ID_1, SUR_MA_ID_2);
    -- Maldicion del tejido debilitante
    elseif WEA_CURSE_SKILL and WEA_CURSE_CD <=0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
        UseSkill(WEA_CURSE_ID_1, WEA_CURSE_ID_2);
    --Disparo colateral 
    elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
        UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);
    --Flecha desgarradora   
    elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE and foco >= 15 then
        UseSkill(FLE_DES_ID_1, FLE_DES_ID_2); 
    --Disparo drena-mana
    elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 and foco >= 15 then
        UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);    
    --Flecha vampirica
    elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.3 and foco >= 15 then
        UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
    --Tiro
    elseif TIR_SKILL and TIR_CD <= 0.25 then
        UseSkill(TIR_ID_1, TIR_ID_2);    
    end
 
end

-- Maketa para importar default presets
function CE_RANGER_WARLOCK_IMPORT()
	--                 [1]      [2]     [3]      [4]     [5]      [6]      [7]      [8]     [9]     [10]      [11]     [12]     [13]     [14]     [15]     [16]      [17]    [18]    [19]    [20]    [21]    [22]    [23]    [24]
	local Skills = {1244064, 200173, 1244062, 1244060, 1490798, 491163, 1490802, 1490800, 1490456, 1490789, 1490458, 1490792, 1490793, 1490799, 1490797, 1490794, 1490791, 1492104, 1490788, 1490790, 1490787}
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
        -- 5 Carga Combada 1490798
        [5] = {
            [12]={ id1="501575", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 6 Flecha de escarcha 491163
        [6] = {
            [12]={ id1="501530", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 7 Campo de mira 1490802
        [7] = {
            [12]={ id1="1501137", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
            [3]={ max="500", min="20", status=true }, -- 3 foco
        },
        -- 8 Detección 1490800
        [8] = {
            [12]={ id1="1501133", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 9 Oleada venenosa 1490456
        [9] = {
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
        },
        -- 10 Autoshoot 1490789
        [10] = {
            [44]={ enable=true, status=true }, -- 44 Auto Shoot
        },
        -- 11 Tiro de precisión venenoso 1490458
        [11] = {
            [12]={ id1="1501140", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
            [29]={ enable=true, status=true }, -- 29 Is Boss
        },
        -- 12 Tiro de presicion 1490792
        [12] = {
            [11]={ id1="1501140", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
            [29]={ enable=true, status=true }, -- 29 Is Boss
        },            
        -- 13 Disparo combinado 1490793
        [13] = {}, -- No conditions
        -- 14 Oleada de malicia 1490799
        [14] = {
            [39]={ enable=true, status=true }, -- 39 AoE
            [45]={ enable=true, status=true }, -- 45 No Boss
        },
        -- 15 Malcidicón del tejido 1490797
        [15] = {
            [33]={ id1="501577", id2="0", id3="0", id4="0", status=true}, --33 target not effect
            [39]={ enable=true, status=true }, -- 39 AoE
            [45]={ enable=true, status=true }, -- 45 No Boss
        },
        -- 16 Disparo colateral 1490794
        [16] = {
            [39]={ enable=true, status=true }, -- 39 AoE
            [45]={ enable=true, status=true }, -- 45 No Boss
        },
        -- 17 Flecha desgarradora 1490791
        [17] = {
            [39]={ enable=true, status=true }, -- 39 AoE
            [45]={ enable=true, status=true }, -- 45 No Boss
            [3]={ max="500", min="15", status=true }, -- 3 foco
        },
        -- 18 Disparo drena-mana 1492104
        [18] = {
           [3]={ max="500", min="15", status=true }, -- 3 foco
        },
        -- 19 Flecha vampirica 1490788
        [19] = {
            [3]={ max="500", min="15", status=true }, -- 3 foco
            [33]={ id1="1501120", id2="0", id3="0", id4="0", status=true}, --33 target not effect
        },
        -- 20 Flecha de viento 1490790
        [20] = {}, -- No conditions
        -- 21 Tiro 1490787
        [21] = {}, -- No conditions
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
