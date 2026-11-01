--Lua RANGER/PRIEST BY NEORAXER 22-04-2026
--V2.0.1 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_PRIEST()

local foco = UnitMana("player");

    -- Disparo bendito 491513
    local DIS_BEN_SKILL, DIS_BEN_ID_1, DIS_BEN_ID_2 = Match_CE(491513);
    local DIS_BEN_CD = CE_CD(DIS_BEN_SKILL, DIS_BEN_ID_1, DIS_BEN_ID_2);
    --Ataque de Pantalla 499555
    local ATA_PAN_SKILL, ATA_PAN_ID_1, ATA_PAN_ID_2 = Match_CE(499555);
    local ATA_PAN_CD = CE_CD(ATA_PAN_SKILL, ATA_PAN_ID_1, ATA_PAN_ID_2);
    --Flecha sangrienta
    local FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2 = Match_CE(490434);
    local FLE_SAN_CD = CE_CD(FLE_SAN_SKILL, FLE_SAN_ID_1, FLE_SAN_ID_2);
    --Flecha de escarcha
    local FLE_ESC_SKILL, FLE_ESC_ID_1, FLE_ESC_ID_2 = Match_CE(491163);
    --Gracia vital
    local GRA_VIT_SKILL, GRA_VIT_ID_1, GRA_VIT_ID_2 = Match_CE(490290);
    --Agua bendita de manantial
    local AGU_BEN_SKILL, AGU_BEN_ID_1, AGU_BEN_ID_2 = Match_CE(490298);
    --Ataque amplificado
    local ATA_AMP_SKILL, ATA_AMP_ID_1, ATA_AMP_ID_2 = Match_CE(490491);
    --Barrera mágica
    local BAR_MAG_SKILL, BAR_MAG_ID_1, BAR_MAG_ID_2 = Match_CE(491166);
    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(499580);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);  
    --Flecha vampírica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(492649);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);   
    --Líder espiritual
	local LID_ESP_SKILL, LID_ESP_ID_1, LID_ESP_ID_2 = Match_CE(491335);
	local LID_ESP_CD = CE_CD(LID_ESP_SKILL, LID_ESP_ID_1, LID_ESP_ID_2);
    --Disparo drena-mana
    local DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2 = Match_CE(490443);
	local DIS_DRE_CD = CE_CD(DIS_DRE_SKILL, DIS_DRE_ID_1, DIS_DRE_ID_2); 
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
    --Flecha desgarradora
    local FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2 = Match_CE(490400);
	local FLE_DES_CD = CE_CD(FLE_DES_SKILL, FLE_DES_ID_1, FLE_DES_ID_2);    
    --Disparo colateral
    local DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2 = Match_CE(490457);
	local DIS_COL_CD = CE_CD(DIS_COL_SKILL, DIS_COL_ID_1, DIS_COL_ID_2);    
    --Disparo Combinado
    local DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2 = Match_CE(490424);
	local DIS_COM_CD = CE_CD(DIS_COM_SKILL, DIS_COM_ID_1, DIS_COM_ID_2);	
    --Flecha de viento
    local FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2 = Match_CE(491128);
	local FLE_VIE_CD = CE_CD(FLE_VIE_SKILL, FLE_VIE_ID_1, FLE_VIE_ID_2);   
    --Campo de mira
    local CAM_MIR_SKILL, CAM_MIR_ID_1, CAM_MIR_ID_2 = Match_CE(490464);
    --Concentración
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(490460);
	local CON_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2);

    if _G.C_EngineSettings.Consumables then
		--Estimulante fuerte
        if CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
        end
		CE_HEALING_ITEM()
    end


    --Flecha de escarcha 
    if FLE_ESC_SKILL and (CE_BuffIdPlayer(501530) == false) and foco >= 20
        then UseSkill(FLE_ESC_ID_1, FLE_ESC_ID_2);
	--Líder espiritual
    elseif LID_ESP_SKILL and LID_ESP_CD <= 0.25 and _G.C_EngineSettings.FastBuffs then
        UseSkill(LID_ESP_ID_1, LID_ESP_ID_2);     
    --Gracia vital
    elseif GRA_VIT_SKILL and (CE_BuffIdPlayer(500517) == false) and not UnitInParty( "player" )
        then UseSkill(GRA_VIT_ID_1, GRA_VIT_ID_2); 
    --Agua bendita de manantial
    elseif AGU_BEN_SKILL and (CE_BuffIdPlayer(500536) == false) and not UnitInParty( "player" )
        then UseSkill(AGU_BEN_ID_1, AGU_BEN_ID_2); 
    --Ataque amplificado
    elseif ATA_AMP_SKILL and (CE_BuffIdPlayer(500940) == false) and not UnitInParty( "player" )
        then UseSkill(ATA_AMP_ID_1, ATA_AMP_ID_2); 
    --Barrera mágica
    elseif BAR_MAG_SKILL and (CE_BuffIdPlayer(500548) == false) and not UnitInParty( "player" )
        then UseSkill(BAR_MAG_ID_1, BAR_MAG_ID_2); 
    --Concentración
    elseif CON_SKILL and CON_CD <= 0.25 and (CE_BuffIdPlayer(500930) == false) and foco <= 40 
        then UseSkill(CON_ID_1, CON_ID_2);
    --Flecha sangrienta
    elseif FLE_SAN_SKILL and FLE_SAN_CD <= 0.25 and (CE_BuffIdPlayer(500871) == false)
        then UseSkill(FLE_SAN_ID_1, FLE_SAN_ID_2);              
  


    --ROTACIÓN--

	CE_NewAutoShoot( 492589 );

    --Disparo bendito
    elseif DIS_BEN_SKILL and DIS_BEN_CD <= 0.25 then
        UseSkill(DIS_BEN_ID_1, DIS_BEN_ID_2);
    --Ataque de Pantalla
    elseif ATA_PAN_SKILL and ATA_PAN_CD <= 0.25  and _G.C_EngineSettings.FastBuffs then
        UseSkill(ATA_PAN_ID_1, ATA_PAN_ID_2);
    --Tiro
    elseif TIR_SKILL and TIR_CD <= 0.25 and (CE_BuffIdPlayer(503258) == false)
        then UseSkill(TIR_ID_1, TIR_ID_2);
    --Flecha vampirica
    elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and (CE_BuffIdPlayer(620197) == false) then
        UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
    --Disparo drena-mana
    elseif DIS_DRE_SKILL and DIS_DRE_CD <= 0.25 
        then UseSkill(DIS_DRE_ID_1, DIS_DRE_ID_2);
    --Golpe a las articulaciones
    elseif GOL_ART_SKILL and  GOL_ART_CD <= 0.25 and foco >= 25 then
         UseSkill(GOL_ART_ID_1, GOL_ART_ID_2); 
    --Flecha desgarradora   
    elseif FLE_DES_SKILL and FLE_DES_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(FLE_DES_ID_1, FLE_DES_ID_2); 
    --Disparo colateral 
    elseif DIS_COL_SKILL and DIS_COL_CD <= 0.25 and not CE_TARGET_IS_BOSS() and _G.C_EngineSettings.AOE then
         UseSkill(DIS_COL_ID_1, DIS_COL_ID_2);  
    --Disparo Combinado
    elseif DIS_COM_SKILL and DIS_COM_CD <= 0.3 and (CE_isMoving() == false or CE_BuffIdPlayer(1500556)) then
        UseSkill(DIS_COM_ID_1, DIS_COM_ID_2);
    --Flecha de viento
    elseif FLE_VIE_SKILL and FLE_VIE_CD <= 0.25 then
         UseSkill(FLE_VIE_ID_1, FLE_VIE_ID_2);    
    end
 
end

-- Maketa para importar default presets
function CE_RANGER_AUGUR_IMPORT()
	--                 [1]      [2]     [3]      [4]     [5]    [6]     [7]      [8]     [9]     [10]    [11]    [12]   [13]     [14]    [15]   [16]     [17]   [18]    [19]    [20]    [21]    [22]    [23]    [24]
	local Skills = {1244064, 200173, 1244062, 1244060, 491163, 491335, 490290, 490298, 490491, 491166, 491513, 499555, 490460, 490434, 492589, 493011, 492649, 490443, 490420, 490400, 490457, 490424, 490424, 491128}
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
        -- 6 Líder espiritual 491335
        [6] = {
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
        },
        -- 7 Gracia vital 490290
        [7] = {
            [12]={ id1="500517", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 8 Agua bendita de manantial 490298
        [8] = {
            [12]={ id1="500536", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 9 Ataque amplificado 490491
        [9] = {
            [12]={ id1="500940", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 10 Barrera mágica 491166
        [10] = {
            [12]={ id1="500548", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 11 Disparo bendito 491513
        [11] = {
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
        },
        -- 12 Ataque de Pantalla 499555
        [12] = {
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
        },
        -- 13 Concentración 490460
        [13] = {
            [41]={ enable=true, status=true }, -- 41 Fast Buffs
            [3]={ max="50", min="0", status=true }, -- 3 foco
        },
        -- 14 Flecha sangrienta 490434
        [14] = {
            [12]={ id1="500871", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 15 Autoshoot 492589
        [15] = {
            [44]={ enable=true, status=true }, -- 44 Auto Shoot
        },
        -- 16 Tiro 493011
        [16] = {
            [12]={ id1="503258", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        },
        -- 17 Flecha vampirica 492649
        [17] = {
            [12]={ id1="620197", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
        }, -- No conditions
        -- 18 Disparo drena-mana 490443
        [18] = {},
        -- 19 Golpe a las articulaciones 490420
        [19] = {
            [3]={ max="500", min="25", status=true }, -- 3 foco
        },
        -- 20 Flecha desgarradora 490400
        [20] = {
            [45]={ enable=true, status=true }, -- 45 No Boss
            [39]={ enable=true, status=true }, -- 39 AoE
        },
        -- 21 Disparo colateral 490457
        [21] = {
            [45]={ enable=true, status=true }, -- 45 No Boss
            [39]={ enable=true, status=true }, -- 39 AoE
        },
        -- 22 Disparo Combinado in Move 490424
        [22] = {
			[11]={ id1="1500556", id2="0", id3="0", id4="0", status=true }, -- 11 player has effect
			[29]={ enable=true, status=true }, -- 29 Is Boss
        },
        -- 23 Disparo Combinado no move 490424
        [23] = {
			[12]={ id1="1500556", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
			[29]={ enable=true, status=true }, -- 29 Is Boss
			[19]={ enable=true, status=true }, -- 19 Is Not Moving
        },
        -- 24 Flecha de viento 491128
        [24] = {}, -- No conditions

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