
--Lua SCOUT/BARD BY NEORAXER 21-04-2026
--V2.0.1 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_BARD()

	local foco = UnitMana("player");

    --Tiro de precisión
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(490450);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Disparo vital
	local DIS_VIT_SKILL, DIS_VIT_ID_1, DIS_VIT_ID_2 = Match_CE(1491222);
	local DIS_VIT_CD = CE_CD(DIS_VIT_SKILL, DIS_VIT_ID_1, DIS_VIT_ID_2);
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(490424);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha vampírica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(490400);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(1491472);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);    
    --Disparo drena-mana
    local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(490441);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2);   
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);    
    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(1491470);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Flecha de escarcha
    local FLE_ESC_SKILL, FLE_ESC_ID_1, FLE_ESC_ID_2 = Match_CE(491163);
    --Detección
    local DET_SKILL, DET_ID_1, DET_ID_2 = Match_CE(490463);
    --Campo de mira
    local CAM_MIR_SKILL, CAM_MIR_ID_1, CAM_MIR_ID_2 = Match_CE(490464);
    --Concentración
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_ARR_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);
    --Ganaremos
	local GAN_SKILL, GAN_ID_1, GAN_ID_2 = Match_CE(1491220);
	local GAN_CD = CE_CD(GAN_SKILL, GAN_ID_1, GAN_ID_2);
    --Flecha sin Sangre
    local FLE_SIN_SKILL, FLE_SIN_ID_1, FLE_SIN_ID_2 = Match_CE(1491473);
    local FLE_SIN_CD = CE_CD(FLE_SIN_SKILL, FLE_SIN_ID_1, FLE_SIN_ID_2);


	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Estimulante fuerte
        elseif  CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif  CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end


	CE_NewAutoShoot( 492589 );

    --Flecha de escarcha 
    if FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) and foco >= 20
        then UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
    --Campo de mira
    elseif CAM_MIR_SKILL and (CE_BuffIdPlayer(500934) == false) and CE_TARGET_IS_BOSS() and foco >= 10
        then UseSkill(CAM_MIR_ID_1, CAM_MIR_ID_2);
    --Concentración
    elseif CON_SKILL and CON_ARR_CD <= 0.25 and (CE_BuffIdPlayer(500930) == false) and foco <= 40 
        then UseSkill(CON_ID_1, CON_ID_2);
    --Flecha sin Sangre
    elseif FLE_SIN_SKILL and FLE_SIN_CD <= 0.25 and (CE_BuffIdPlayer(1502174) == false)
        then UseSkill(FLE_SIN_ID_1, FLE_SIN_ID_2);        
    --Detección
    elseif DET_SKILL and (CE_BuffIdPlayer(1502170) == false)
        then UseSkill(DET_ID_1, DET_ID_2);        
    --Ganaremos
    elseif GAN_SKILL and GAN_CD <= 0.25 and (CE_TARGET_IS_BOSS() or C_EngineSettings.FastBuffs)
        then UseSkill(GAN_ID_1, GAN_ID_2);       

    --ROTACIÓN--

    --Tiro
    elseif TIR_SKILL and TIR_CD <= 0.25 and CE_AFE(1502167, 10)
        then UseSkill(TIR_ID_1, TIR_ID_2);
    --Tiro de presicion         
    elseif TIR_PRE_SKILL and TIR_PRE_CD <= 0.25 and CE_BuffIdPlayer(500939) then
         UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Disparo combinado
    elseif DIS_COM_SKILL and DIS_COM_CD <= 0.3  then
        UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
    --Disparo vital
    elseif DIS_VIT_SKILL and DIS_VIT_CD <= 0.25 and foco >= 20
        then UseSkill(DIS_VIT_ID_1, DIS_VIT_ID_2);
    --Golpe a las articulaciones
    elseif GOL_ART_SKILL and  GOL_ART_CD <= 0.25 and foco >= 15 then
         UseSkill(GOL_ART_ID_1, GOL_ART_ID_2); 
    --Flecha vampirica
    elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.3 and CE_DebuffIdTarget(501690) == false and foco >= 10 then
        UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Flecha desgarradora   
    elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(FLE_DES_ID_1, FLE_DES_ID_2); 
    --Disparo colateral 
    elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);  
    --Disparo drena-mana
    elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 and CE_TARGET_IS_BOSS()
        then UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);    
    end
 
end

-- Maketa para importar default presets
function CE_RANGER_BARD_IMPORT()
	--                 [1]      [2]     [3]      [4]     [5]     [6]     [7]      [8]      [9]     [10]   [11]    [12]     [13]     [14]    [15]    [16]   [17]     [18]    [19]    [20]
	local Skills = {1244064, 200173, 1244062, 1244060, 491163, 490464, 490460, 1491473, 490463, 1491220, 492589, 1491470, 490450, 490424, 490420, 491292, 490400, 1491472, 490441, 491128};
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
        -- 5 Flecha de escarcha 491163
        [5] = {
            [12]={ id1="501530", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 6 Campo de mira 490464
        [6] = {
            [12]={ id1="500934", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
        },
        -- 7 Concentración 490460
        [7] = {
            [12]={ id1="500930", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
            [3]={ max="50", min="0", status=true }, -- 3 foco
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
        },
        -- 8 Flecha sin Sangre 1491473
        [8] = {
            [12]={ id1="1502174", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 9 Detección 490463
        [9] = {
            [12]={ id1="1502170", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
            [3]={ max="500", min="50", status=true }, -- 3 foco
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
         },
        -- 10 Ganaremos 1491220
        [10] = { [12]={ id1="1502169", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
            [3]={ max="500", min="30", status=true }, -- 3 foco
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
         },
        -- 11 Autoshoot 492589
        [11] = {
            [44]={ enable=true, status=true }, -- 44 Auto Shoot
        },
        -- 12 Tiro 1491470
        [12] = {},
        -- 13 Tiro de presicion 490450
        [13] = {
            [11]={ id1="500939", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
        },
        -- 14 Disparo combinado 490424
        [14] = {}, -- No conditions
        -- 15 Golpe a las articulaciones 490420
        [15] = {
            [3]={ max="500", min="20", status=true }, -- 3 foco
        },
        -- 16 Flecha vampirica 491292
        [16] = {
            [3]={ max="500", min="10", status=true }, -- 3 foco
            [33]={ id1="501690", id2="0", id3="0", id4="0", status=true}, --33 target not effect
        },
        -- 17 Flecha desgarradora 490400
        [17] = {
            [45]={ enable=true, status=true }, -- 45 No Boss
            [3]={ max="500", min="10", status=true }, -- 3 foco
            [39]={ enable=true, status=true }, -- 39 AoE
        },
        -- 18 Disparo reflejado 1491472
        [18] = {
            [45]={ enable=true, status=true }, -- 45 No Boss
            [39]={ enable=true, status=true }, -- 39 AoE
        },
        -- 19 Disparo drena-mana 490441
        [19] = {
            [29]={ enable=true, status=true }, -- 29 Is Boss
        },
        -- 20 Flecha de viento 491128
        [20] = {}, -- No conditions
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





