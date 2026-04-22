--Lua Scout/Warrior BY NEORAXER 22-04-2026
--V2.0.1 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_WARRIOR()
	
	local foco = UnitMana("player");
	local ira = UnitSkill("player");

	--Objetivo fijo
	local OBJ_FIJ_SKILL, OBJ_FIJ_ID_1, OBJ_FIJ_ID_2 = Match_CE(492620);
	--Campo de mira
	local CAM_MIR_SKILL, CAM_MIR_ID_1, CAM_MIR_ID_2 = Match_CE(490464);
	--Concentración
	local CONC_SKILL, CONC_ID_1, CONC_ID_2 = Match_CE(490460);
	local CONC_CD = CE_CD(CONC_SKILL, CONC_ID_1, CONC_ID_2);
	--Tiro
	local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(493089);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);	
	--Disparo drena mana
	local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(490441);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Tiro de precisión
	local TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2 = Match_CE(1490338);
	local TIR_PRE_CD = CE_CD(TIR_PRE_SKILL, TIR_PRE_ID_1, TIR_PRE_ID_2);
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(492947);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(493289);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);  
	--Flecha vampírica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2); 
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(499512);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);   
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2); 
    --Fiera
    local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(490095);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2); 
	--Furiosos
    local FURIOSO_SKILL, FURIOSO_ID_1, FURIOSO_ID_2 = Match_CE(490492);
	local FURIOSO_CD = CE_CD(FURIOSO_SKILL, FURIOSO_ID_1, FURIOSO_ID_2); 






   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
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
	
	
	--Flecha de viento
	if FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
		UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
	end
	
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		elseif FURIOSO_SKILL and FURIOSO_CD <= 0.25 and ira <= 40 then
			UseSkill(FURIOSO_ID_1, FURIOSO_ID_2)
		end	
	end
	
	CE_NewAutoShoot( 492589 );
	
	--Objetivo fijo
	if OBJ_FIJ_SKILL and (CE_BuffIdPlayer(502920) == false) then
		UseSkill(OBJ_FIJ_ID_1, OBJ_FIJ_ID_2);
	--Campo de mira
	elseif CAM_MIR_SKILL and (CE_BuffIdPlayer(500934) == false) then
		UseSkill(CAM_MIR_ID_1, CAM_MIR_ID_2);
	--Concentración
	elseif CONC_SKILL and CONC_CD <= 0.25 and foco <= 20 and (CE_BuffIdPlayer(500930) == false) then
		UseSkill(CONC_ID_1, CONC_ID_2);	
	--Tiro	
	elseif TIR_SKILL and TIR_CD <= 0.25 and CE_AFE(503255, 11) then
		UseSkill(TIR_ID_1, TIR_ID_2);
	--Disparo drena mana
	elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 and (CE_DebuffIdTarget(507226) == false) and CE_TARGET_IS_BOSS() then
		UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Tiro de precisión
	elseif TIR_PRE_SKILL and TIR_PRE_CD <= 0.25 and CE_TARGET_IS_BOSS() then
		UseSkill(TIR_PRE_ID_1, TIR_PRE_ID_2);
	--Disparo Combinado
	elseif DIS_COM_SKILL and DIS_COM_CD <= 0.25 then
		UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);	
    --Golpe a las articulaciones
	elseif GOL_ART_SKILL and GOL_ART_CD <= 0.25 and foco >= 25 then
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2)
    --Flecha desgarradora
	elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and _G.C_EngineSettings.AOE then 
		UseSkill(FLE_DES_ID_1, FLE_DES_ID_2);
	--Flecha vampírica
	elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and (CE_DebuffIdTarget(501690) == false) then
		UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Disparo colateral 
	elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and _G.C_EngineSettings.AOE then 
		UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);
    --Flecha de viento
	elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
		UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);
	end
	
end

-- Maketa para importar default presets
function CE_RANGER_WARRIOR_IMPORT()
	--                 [1]      [2]     [3]      [4]     [5]      [6]     [7]    [8]     [9]     [10]    [11]   [12]     [13]    [14]    [15]    [16]     [17]   [18]    [19]    [20]    [21]    [22]    [23]    [24]
	local Skills = {1244064, 200173, 1244062, 1244060, 490095, 490492, 492589, 492620, 490464, 490460, 493089, 490441, 1490338, 492947, 492947, 490420, 493289, 491292, 499512, 491128}
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
		-- 5 Fiera 490095
		[5] = {
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
			[6]={ max="500", min="25", status=true }, -- 6 Ira
		},
		-- 6 Furioso 490492
		[6] = {
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
			[6]={ max="40", min="0", status=true }, -- 6 Ira
		},
		-- 7 Auto Shoot 492589
		[7] = {
			[44]={ enable=true, status=true }, -- 44 Auto Shoot
		},
		-- 8 Objetivo fijo 492620
		[8] = {
			[12]={ id1="502920", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
		},
		-- 9 Campo de mira 490464
		[9] = {
			[12]={ id1="500934", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
		},
		-- 10 Concentración 490460
		[10] = {
			[12]={ id1="500930", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
			[5]={ max="20", min="0", status=true }, -- 5 foco
		},
		-- 11 Tiro 493089
		[11] = {
			[12]={ id1="503255", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
		},
		-- 12 Disparo drena mana 490441
		[12] = {
			[33] = { id1="507226", id2="0", id3="0", id4="0", status=true }, -- 33 target not effect
		},
		-- 13 Tiro de precisión 1490338
		[13] = {
			[29]={ enable=true, status=true }, -- 29 Is Boss
		},
		-- 14 Disparo combinado en movimiento 499585
		[14] = {
			[11]={ id1="1500556", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
		},
		-- 15 Disparo combinado sin movimiento 499585
		[15] = {
			[12]={ id1="1500556", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
			[19]={ enable=true, status=true }, -- 19 Is Not Moving
		},
		-- 16 Golpe a las articulaciones 490420
		[16] = {
			[3]={ max="500", min="25", status=true }, -- 3 foco
		},
		-- 17 Flecha desgarradora 493289
		[17] = {
			[45]={ enable=true, status=true }, -- 45 No Boss
			[39]={ enable=true, status=true }, -- 39 AoE
		},
		-- 18 Flecha vampírica 491292
		[18] = {
			[3]={ max="500", min="10", status=true }, -- 3 foco
			[33]={ id1="501690", id2="0", id3="0", id4="0", status=true}, --33 target not effect
		},
		-- 19 Disparo colateral 499512
		[19] = {
			[39]={ enable=true, status=true }, -- 39 AoE
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
