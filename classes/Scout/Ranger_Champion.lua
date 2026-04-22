--Lua Scout/Champion BY NEORAXER 21-04-2026
--V2.0.1 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_CHAMPION()
	local foco = UnitMana("player");
	local ira = UnitSkill("player");

	--Bloody Shot
	local BLO_SHO_SKILL, BLO_SHO_SKILL_ID_1, BLO_SHO_SKILL_ID_2 = Match_CE(1490784);
	local BLO_SHO_CD = CE_CD(BLO_SHO_SKILL, BLO_SHO_SKILL_ID_1, BLO_SHO_SKILL_ID_2);
	--Frost Shot
	local FRO_SHO_SKILL, FRO_SHO_ID_1, FRO_SHO_ID_2 = Match_CE(1490776);
	local FRO_SHO_CD = CE_CD(FRO_SHO_SKILL, FRO_SHO_ID_1, FRO_SHO_ID_2);
	--Pistol Shot
	local PIS_SHO_SKILL, PIS_SHO_ID_1, PIS_SHO_ID_2 = Match_CE(1492406);
	local PIS_SHO_CD = CE_CD(PIS_SHO_SKILL, PIS_SHO_ID_1, PIS_SHO_ID_2);
	
	--Concentración
	local CONC_SKILL, CONC_ID_1, CONC_ID_2 = Match_CE(490460);
	local CONC_CD = CE_CD(CONC_SKILL, CONC_ID_1, CONC_ID_2);
	--Tiro
	local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(1490770);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);	
    --Snipe
	local SNI_SKILL, SNI_ID_1, SNI_ID_2 = Match_CE(1490782);
	local SNI_CD = CE_CD(SNI_SKILL, SNI_ID_1, SNI_ID_2);
    --Combo Shot
    local COM_SHO_SKILL, COM_SHO_ID_1, COM_SHO_ID_2 = Match_CE(1490774);
	local COM_SHO_CD = CE_CD(COM_SHO_SKILL, COM_SHO_ID_1, COM_SHO_ID_2);
    --Joint Blow 490420
	local JOI_BLO_SKILL, JOI_BLO_ID_1, JOI_BLO_ID_2 = Match_CE(490420);
	local JOI_BLO_CD = CE_CD(JOI_BLO_SKILL, JOI_BLO_ID_1, JOI_BLO_ID_2);
    --Piercing Arrow
    local PI_ARR_SKILL, PI_ARR_ID_1, PI_ARR_ID_2 = Match_CE(490400);
	local PI_ARR_CD = CE_CD(PI_ARR_SKILL, PI_ARR_ID_1, PI_ARR_ID_2);  
	--Vampire Arrow
    local VAM_ARR_SKILL, VAM_ARR_ID_1, VAM_ARR_ID_2 = Match_CE(491292);
	local VAM_ARR_CD = CE_CD(VAM_ARR_SKILL, VAM_ARR_ID_1, VAM_ARR_ID_2); 
    --Reflected Shot
    local RE_SHO_SKILL, RE_SHO_ID_1, RE_SHO_ID_2 = Match_CE(1490772);
	local RE_SHO_CD = CE_CD(RE_SHO_SKILL, RE_SHO_ID_1, RE_SHO_ID_2);   
    --Wind Shot
    local WIN_SHO_SKILL, WIN_SHO_ID_1, WIN_SHO_ID_2 = Match_CE(1490777);
	local WIN_SHO_CD = CE_CD(WIN_SHO_SKILL, WIN_SHO_ID_1, WIN_SHO_ID_2); 
    --Rain of Vengeance
	local RAI_VEN_SKILL, RAI_VEN_CD_1, RAI_VEN_CD_2 = Match_CE(1490445);
	local RAI_VEN_CD = CE_CD(RAI_VEN_SKILL, RAI_VEN_CD_1, RAI_VEN_CD_2);


   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if CE_TARGET_IS_BOSS() and foco <= 10 and CE_UseItem(1244064) then
		--Estimulante fuerte
        elseif  CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif  CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end

	--Buffs
	-- Disparo congelado
	if not CE_BuffIdPlayer(1501108) then
		UseSkill(FRO_SHO_ID_1, FRO_SHO_ID_2);
	-- Disparo sangriento
	elseif not CE_BuffIdPlayer(1501112) then
		UseSkill(BLO_SHO_SKILL_ID_1, BLO_SHO_SKILL_ID_2);
	end
	
	--Fast Buffs
	--Pistolero
	if CE_TARGET_IS_BOSS() and _G.C_EngineSettings.FastBuffs and PIS_SHO_SKILL and PIS_SHO_CD <= 0.25 and not CE_BuffIdPlayer(1503796) then
		UseSkill(PIS_SHO_ID_1, PIS_SHO_ID_2);
	end


    --ROTACIÓN--
	
	--Autoshoot
	CE_NewAutoShoot( 1490917 )
	
	--Snipe
	if SNI_SKILL and SNI_CD <=0.25 and (CE_BUFF_PLAYER_STACK(1501097, 4) == true) and CE_WEAPON_TYPE("Gun") then
		UseSkill(SNI_ID_1, SNI_ID_2);
	--shot
	elseif TIR_SKILL and TIR_CD<=0.25 and CE_WEAPON_TYPE("Gun") then
		UseSkill(TIR_ID_1, TIR_ID_2);
	--Combo Shot
	elseif COM_SHO_SKILL and COM_SHO_CD<=0.25 and CE_WEAPON_TYPE("Gun") then
		UseSkill(COM_SHO_ID_1, COM_SHO_ID_2);
	-- Rain Vengeance
	elseif RAI_VEN_SKILL and RAI_VEN_CD<=0.25 and not CE_TARGET_IS_BOSS() and C_EngineSettings.AOE and CE_WEAPON_TYPE("Gun") then
		SpellTargetUnit("mouseover");
		UseSkill(RAI_VEN_CD_1, RAI_VEN_CD_2);
	-- Reflected Shot
	elseif RE_SHO_SKILL and RE_SHO_CD<=0.25 and not CE_TARGET_IS_BOSS() and C_EngineSettings.AOE and CE_WEAPON_TYPE("Gun") then
		UseSkill(RE_SHO_ID_1, RE_SHO_ID_2);
	-- Piercing Arrow 490400
	elseif PI_ARR_SKILL and PI_ARR_CD<=0.25 and not CE_TARGET_IS_BOSS() and C_EngineSettings.AOE then
		UseSkill(PI_ARR_ID_1, PI_ARR_ID_2);
	--Joint Blow 490420
	elseif JOI_BLO_SKILL and JOI_BLO_CD <= 0.25 and foco >= 15 then
		UseSkill(JOI_BLO_ID_1, JOI_BLO_ID_2);    
    --Wind Arrow
	elseif WIN_SHO_SKILL and WIN_SHO_CD<=0.25 and CE_WEAPON_TYPE("Gun") then
		UseSkill(WIN_SHO_ID_1, WIN_SHO_ID_2);
	end
	
end

-- Maketa para importar default presets
function CE_RANGER_PSYRON_IMPORT()
	--                 [1]      [2]     [3]      [4]      [5]      [6]      [7]     [8]       [9]      [10]    [11]     [12]     [13]     [14]    [15]    [16] 
	local Skills = {1244064, 200173, 1244062, 1244060, 1490776, 1490784, 1492406, 1490917, 1490782, 1490770, 1490774, 1490445, 1490772, 490400, 490420, 1490777};
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
		-- 5 Disparo congelado 1490776
		[5] = {
			[12]={ id1="1501108", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
		},
		-- 6 Disparo sangriento 1490784
		[6] = {
			[12]={ id1="1501112", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
		},
		-- 7 Pistolero 1492406
		[7] = {
			[12]={ id1="1503796", id2="0", id3="0", id4="0", status=true }, -- 12 player not effect
			[41]={ enable=true, status=true }, -- 41 Fast Buffs
		},
		-- 8 Autoshoot 1490917
		[8] = {
			[44]={ enable=true, status=true }, -- 44 Auto Shoot
		},
		-- 9 Snipe 1490782
		[9] = {
			[15]={ id="1501097", orMore=true, self=false, stack="4", status=true }, -- 15 Buff Stack Player
			[71]={ enable=true, status=true }, -- 71 Gun
 			},
		-- 10 Shot 1490770
		[10] = { [71]={ enable=true, status=true }},
		-- 11 Combo Shot 1490774
		[11] = { [71]={ enable=true, status=true }},
		-- 12 Rain Vengeance 1490445
		[12] = {
			[71]={ enable=true, status=true }, -- 71 is Gun
			[45]={ enable=true, status=true }, -- 45 No Boss
			[39]={ enable=true, status=true }, -- 39 AoE
			[43]={ enable=true, status=true } -- 43 Auto Aoe
		},
		-- 13 Reflected Shot 1490772
		[13] = {
			[71]={ enable=true, status=true }, -- 71 is Gun
			[45]={ enable=true, status=true }, -- 45 No Boss
			[39]={ enable=true, status=true }, -- 39 AoE
		},
		-- 14 Piercing Arrow 490400
		[14] = {
			[45]={ enable=true, status=true }, -- 45 No Boss
			[39]={ enable=true, status=true }, -- 39 AoE
		},
		-- 15 Joint Blow 490420 (Golpe a las articulaciones)
		[15] = {
			[3]={ max="500", min="15", status=true }, -- 3 foco
		},
		-- 16 Wind Arrow 1490777
		[16] = {
			[71]={ enable=true, status=true }, -- 71 is Gun
		},
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








