--Lua Scout/KNIGHT BY NEORAXER 22-04-2026
--V2.0.1 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_KNIGHT()



    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Mago")
	local foco = UnitMana("player");
	local mana = UnitSkill("player");
	
    --Flecha sangrienta
    local FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2 = Match_CE(490434);
    local FLE_SAN_CD = CE_CD(FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2);
	--Flecha de escarcha
    local FLE_ESCA, FLE_ESCA_ID_1, FLE_ESCA_ID_2 = Match_CE(491163);
	--Disparo curativo
    local DIS_CUR_SKILL, DIS_CUR_ID_1, DIS_CUR_ID_2 = Match_CE(499558);
	local DIS_COL_CD = CE_CD(DIS_CUR_SKILL, DIS_CUR_ID_1, DIS_CUR_ID_2);    
	--Huida sagaz
    local HUI_SAG_SKILL, HUI_SAG_ID_1, HUI_SAG_ID_2 = Match_CE(493016);
	local HUI_SAG_CD = CE_CD(HUI_SAG_SKILL, HUI_SAG_ID_1, HUI_SAG_ID_2);  
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(493318);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);
    --Disparo despedazadora
    local FLE_DEZP_SKILL, FLE_DEZP_ID_1, FLE_DEZP_ID_2 = Match_CE(490431);
	local FLE_DEZP_CD = CE_CD(FLE_DEZP_SKILL, FLE_DEZP_ID_1, FLE_DEZP_ID_2);
    --Disparo drena-mana
    local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(490443);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
	--Flecha de rechazo
    local DIS_REZ_SKILL, DIS_REZ_ID_1, DIS_REZ_ID_2 = Match_CE(491516);
	local DIS_REZ_CD = CE_CD(DIS_REZ_SKILL, DIS_REZ_ID_1, DIS_REZ_ID_2);
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2); 

    --ROTACION--

   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Estimulante fuerte
        elseif  CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif  CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end
	
	--Fast Buffs	
	if _G.C_EngineSettings.FastBuffs then
		if HUI_SAG_SKILL and HUI_SAG_CD <= 0.25 and foco >= 20 then
			UseSkill(HUI_SAG_ID_1, HUI_SAG_ID_2);
		end	
	end
	
	--Buffs
    --Flecha sangrienta
    if FLE_SAN_SKILL and FLE_SAN_CD <= 0.25 and (CE_BuffIdPlayer(500871) == false)
        then UseSkill(FLE_SAN_ID_1, FLE_SAN_ID_2);    
    --Flecha de escarcha 
    elseif FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) and foco >= 20
        then UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
	end
		
	--Rota
	
	--Autoshoot
	CE_NewAutoShoot( 492589 )
	
	--Disparo curativo
    if DIS_CUR_SKILL and DIS_COL_CD <= 0.3 and foco >= 10 then
        UseSkill(DIS_CUR_ID_1, DIS_CUR_ID_2);
	end
    --Disparo colateral 
    if DIS_COL_CD <= 0.25 and _G.C_EngineSettings.AOE then
		UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);
	--Flecha despedazadora
	elseif FLE_DEZP_SKILL and FLE_DEZP_CD <= 0.3 and foco >= 10 and _G.C_EngineSettings.AOE and CE_isMoving() == false then
		SpellTargetUnit("mouseover");
		UseSkill(FLE_DEZP_ID_1, FLE_DEZP_ID_2);	
    --Disparo drena-mana
    elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 
        then UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Flecha de rechazo
    elseif DIS_REZ_SKILL and  DIS_REZ_CD <= 0.25 and IsSpellUsable(490428) and _G.C_EngineSettings.AOE then
         UseSkill(DIS_REZ_ID_1, DIS_REZ_ID_2);
    --Golpe a las articulaciones
    elseif GOL_ART_SKILL and  GOL_ART_CD <= 0.25 and foco >= 25 then
         UseSkill(GOL_ART_ID_1, GOL_ART_ID_2); 
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);    
    end
	
end

-- Maketa para importar default presets
function CE_RANGER_KNIGHT_IMPORT()
	--                 [1]      [2]     [3]      [4]      [5]    [6]    [7]      [8]     [9]    [10]    [11]     [12]    [13]    [14]   [15]    [16]    [17]    [18]    [19]    [20]    [21]    [22]    [23]    [24]
	local Skills = {1244064, 200173, 1244062, 1244060, 493016, 490434, 491163, 492589, 499558, 493318, 490431, 490441, 491516, 490420, 491128}
	local conditions = {
		-- 1 Poción de enano 1244064
		[1] = {
			[3]={ max="20", min="0", status=true }, -- 3 foco
			[40]={ enable=true, status=true } -- 40 Consumables
		},
		-- 2 Estimulante fuerte 200173
		[2] = {
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
        -- 5 Huida sagaz 493016
        [5] = {
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
            [3]={ max="500", min="20", status=true }, -- 3 foco
        },
        -- 6 Flecha sangrienta 490434
        [6] = {
            [12]={ id1="500871", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 7 Flecha de escarcha 491163
        [7] = {
            [12]={ id1="501530", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 8 Autoshoot 492589
        [8] = {
            [44]={ enable=true, status=true }, -- 44 Auto Shoot
        },
        -- 9 Disparo curativo 499558
        [9] = {
            [3]={ max="500", min="10", status=true }, -- 3 foco
        },
        -- 10 Disparo colateral 493318
        [10] = {
            [39]={ enable=true, status=true }, -- 39 AoE
        },
        -- 11 Flecha despedazadora 490431
        [11] = {
            [39]={ enable=true, status=true }, -- 39 AoE
            [3]={ max="500", min="10", status=true }, -- 3 foco
            [43]={ enable=true, status=true }, -- 43 Auto Aoe
        },
        -- 12 Disparo drena-mana 490441
        [12] = {}, -- No conditions
        -- 13 Flecha de rechazo 491516
        [13] = {
            [39]={ enable=true, status=true }, -- 39 AoE
        },
        -- 14 Golpe a las articulaciones 490420
        [14] = {
            [3]={ max="500", min="25", status=true }, -- 3 foco
        },
        -- 15 Flecha de viento 491128
        [15] = {}, -- No conditions

	}

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

