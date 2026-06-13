--Lua KNIGHT/DRUID BY NEORAXER 13-06-2026
--V1.0 Alta calidad para Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_KNIGHT_DRUID()
	local pm = UnitMana("player")
	local MaxPm = UnitMaxMana("player")

	--Escudo de disciplina
	local ESC_DIC_SKILL, ESC_DIC_ID_1, ESC_DIC_ID_2 = Match_CE(490192)
	local ESC_DIC_CD = CE_CD(ESC_DIC_SKILL, ESC_DIC_ID_1, ESC_DIC_ID_2)
	--Protección terrenal
	local PRO_TER_SKILL, PRO_TER_ID_1, PRO_TER_ID_2 = Match_CE(1490509)
	--Explosión de Poder sagrado
	local EXP_POD_SKILL, EXP_POD_ID_1, EXP_POD_ID_2 = Match_CE(490172)
	local EXP_POD_CD = CE_CD(EXP_POD_SKILL, EXP_POD_ID_1, EXP_POD_ID_2)
	--Amenaza
	local AME_SKILL, AME_ID_1, AME_ID_2 = Match_CE(490153)
	--Bendición potente
	local BEN_POT_SKILL, BEN_POT_ID_1, BEN_POT_ID_2 = Match_CE(1490516)
	--Fuerza divina
	local FUE_DIV_SKILL, FUE_DIV_ID_1, FUE_DIV_ID_2 = Match_CE(491321)
	local FUE_DIV_CD = CE_CD(FUE_DIV_SKILL, FUE_DIV_ID_1, FUE_DIV_ID_2)
	--Escudo del valor
	local ESC_VAL_SKILL, ESC_VAL_ID_1, ESC_VAL_ID_2 = Match_CE(490468)
	local ESC_VAL_CD = CE_CD(ESC_VAL_SKILL, ESC_VAL_ID_1, ESC_VAL_ID_2)
	--Panteón de los héroes
	local PAN_HER_SKILL, PAN_HER_ID_1, PAN_HER_ID_2 = Match_CE(495724)
	local PAN_HER_CD = CE_CD(PAN_HER_SKILL, PAN_HER_ID_1, PAN_HER_ID_2)
	--Embestida
	local EMB_SKILL, EMB_ID_1, EMB_ID_2 = Match_CE(490150)
	local EMB_CD = CE_CD(EMB_SKILL, EMB_ID_1, EMB_ID_2)
	--Golpe de escudo de la verdad
	local GOL_ESC_SKILL, GOL_ESC_ID_1, GOL_ESC_ID_2 = Match_CE(1490810)
	local GOL_ESC_CD = CE_CD(GOL_ESC_SKILL, GOL_ESC_ID_1, GOL_ESC_ID_2)
	--Escudo Torbellino
	local ESC_TOR_SKILL, ESC_TOR_ID_1, ESC_TOR_ID_2 = Match_CE(490175)
	local ESC_TOR_CD = CE_CD(ESC_TOR_SKILL, ESC_TOR_ID_1, ESC_TOR_ID_2)
	--Determinación
	local DET_SKILL, DET_ID_1, DET_ID_2 = Match_CE(490168)
	local DET_CD = CE_CD(DET_SKILL, DET_ID_1, DET_ID_2)
	--Escudo del Esplendor
	local ESC_ESP_SKILL, ESC_ESP_ID_1, ESC_ESP_ID_2 = Match_CE(1494028)
	local ESC_ESP_CD = CE_CD(ESC_ESP_SKILL, ESC_ESP_ID_1, ESC_ESP_ID_2)
	--Sello sagrado
	local SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2 = Match_CE(490149)
	local SELL_SAG_CD = CE_CD(SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2)
	--Golpe de castigo
	local GOL_CAS_SKILL, GOL_CAS_ID_1, GOL_CAS_ID_2 = Match_CE(490179)
	local GOL_CAS_CD = CE_CD(GOL_CAS_SKILL, GOL_CAS_ID_1, GOL_CAS_ID_2)
	--Desarme
	local DES_SKILL, DES_ID_1, DES_ID_2 = Match_CE(490159)
	local DES_CD = CE_CD(DES_SKILL, DES_ID_1, DES_ID_2)
	--Castigo
	local CAST_SKILL, CAST_ID_1, CAST_ID_2 = Match_CE(490151)
	local CAST_CD = CE_CD(CAST_SKILL, CAST_ID_1, CAST_ID_2)
	--Grilletes de luz
	local GRI_LUZ_SKILL, GRI_LUZ_ID_1, GRI_LUZ_ID_2 = Match_CE(1490817)
	local GRI_LUZ_CD = CE_CD(GRI_LUZ_SKILL, GRI_LUZ_ID_1, GRI_LUZ_ID_2)
	--Hendidura de tierra
	local HEN_TIE_SKILL, HEN_TIE_ID_1, HEN_TIE_ID_2 = Match_CE(1490515)
	local HEN_TIE_CD = CE_CD(HEN_TIE_SKILL, HEN_TIE_ID_1, HEN_TIE_ID_2)
	--Golpe divino
	local GOL_DIV_SKILL, GOL_DIV_ID_1, GOL_DIV_ID_2 = Match_CE(490148)
	local GOL_DIV_CD = CE_CD(GOL_DIV_SKILL, GOL_DIV_ID_1, GOL_DIV_ID_2)

	--BUFFOS--
	if PRO_TER_SKILL and CE_BuffIdPlayer(1501159) == false then
		UseSkill(PRO_TER_ID_1, PRO_TER_ID_2)
	elseif EXP_POD_SKILL and CE_BuffIdPlayer(501827) == false then
		UseSkill(EXP_POD_ID_1, EXP_POD_ID_2)
	elseif AME_SKILL and CE_BuffIdPlayer(500246) == false then
		UseSkill(AME_ID_1, AME_ID_2)
	elseif BEN_POT_SKILL and CE_BuffIdPlayer(1501174) == false then
		UseSkill(BEN_POT_ID_1, BEN_POT_ID_2)
	end

	if _G.C_EngineSettings.Consumables then
		CE_HEALING_ITEM()
	end

	if _G.C_EngineSettings.FastBuffs then
		if ESC_DIC_SKILL and ESC_DIC_CD <= COMBATENGINE_GLOBAL_CD then
			UseSkill(ESC_DIC_ID_1, ESC_DIC_ID_2)
		elseif FUE_DIV_SKILL and FUE_DIV_CD <= COMBATENGINE_GLOBAL_CD and CE_TARGET_IS_BOSS() then
			UseSkill(FUE_DIV_ID_1, FUE_DIV_ID_2)
		elseif ESC_VAL_SKILL and ESC_VAL_CD <= COMBATENGINE_GLOBAL_CD and CE_TARGET_IS_BOSS() then
			UseSkill(ESC_VAL_ID_1, ESC_VAL_ID_2)
		elseif PAN_HER_SKILL and PAN_HER_CD <= COMBATENGINE_GLOBAL_CD and CE_TARGET_IS_BOSS() then
			UseSkill(PAN_HER_ID_1, PAN_HER_ID_2)
		elseif DET_SKILL and DET_CD <= COMBATENGINE_GLOBAL_CD and CE_TARGET_IS_BOSS() then
			UseSkill(DET_ID_1, DET_ID_2)
		end
	end

	--ROTACION--
	if EMB_SKILL and EMB_CD <= COMBATENGINE_GLOBAL_CD and CE_DebuffIdTarget(500169, 4, true) then
		UseSkill(EMB_ID_1, EMB_ID_2)
	elseif GOL_ESC_SKILL and GOL_ESC_CD <= COMBATENGINE_GLOBAL_CD and CE_BuffIdPlayer(501827) and CE_isShield() then
		UseSkill(GOL_ESC_ID_1, GOL_ESC_ID_2)
	elseif ESC_TOR_SKILL and ESC_TOR_CD <= COMBATENGINE_GLOBAL_CD and CE_DebuffIdTarget(1505924) and _G.C_EngineSettings.AOE then
		UseSkill(ESC_TOR_ID_1, ESC_TOR_ID_2)
	elseif ESC_ESP_SKILL and ESC_ESP_CD <= COMBATENGINE_GLOBAL_CD and pm >= MaxPm * 50 / 100 and pm <= MaxPm and CE_BuffIdPlayer(1503928) == false then
		UseSkill(ESC_ESP_ID_1, ESC_ESP_ID_2)
	elseif SELL_SAG_SKILL and SELL_SAG_CD <= COMBATENGINE_GLOBAL_CD then
		UseSkill(SELL_SAG_ID_1, SELL_SAG_ID_2)
	elseif GOL_CAS_SKILL and GOL_CAS_CD <= COMBATENGINE_GLOBAL_CD and CE_DebuffIdTarget(1502554) then
		UseSkill(GOL_CAS_ID_1, GOL_CAS_ID_2)
	elseif DES_SKILL and DES_CD <= COMBATENGINE_GLOBAL_CD and CE_DebuffIdTarget(500157) then
		UseSkill(DES_ID_1, DES_ID_2)
	elseif CAST_SKILL and CAST_CD <= COMBATENGINE_GLOBAL_CD and CE_DebuffIdTarget(500169, 4, false) then
		UseSkill(CAST_ID_1, CAST_ID_2)
	elseif GRI_LUZ_SKILL and GRI_LUZ_CD <= COMBATENGINE_GLOBAL_CD and _G.C_EngineSettings.AOE then
		UseSkill(GRI_LUZ_ID_1, GRI_LUZ_ID_2)
	elseif HEN_TIE_SKILL and HEN_TIE_CD <= COMBATENGINE_GLOBAL_CD and CE_DebuffIdTarget(500195) and _G.C_EngineSettings.AOE then
		UseSkill(HEN_TIE_ID_1, HEN_TIE_ID_2)
	elseif GOL_DIV_SKILL and GOL_DIV_CD <= COMBATENGINE_GLOBAL_CD and not CE_DebuffIdTarget(500140, 4, false) then
		UseSkill(GOL_DIV_ID_1, GOL_DIV_ID_2)
	end
end

function CE_KNIGHT_DRUID_IMPORT()
	local Skills = {
		490192, 1490509, 490172, 490153, 1490516, 491321, 490468, 495724, 490150, 1490810,
		490175, 490168, 1494028, 490149, 490179, 490159, 490151, 1490817, 1490515, 490148,
	}
	local conditions = {
		{ -- 1 Escudo de disciplina 490192
			[41] = { enable = true, status = true },
		},
		{ -- 2 Protección terrenal 1490509
			[12] = { id1 = "1501159", id2 = "0", id3 = "0", id4 = "0", status = true },
		},
		{ -- 3 Explosión de Poder sagrado 490172
			[12] = { id1 = "501827", id2 = "0", id3 = "0", id4 = "0", status = true },
		},
		{ -- 4 Amenaza 490153
			[12] = { id1 = "500246", id2 = "0", id3 = "0", id4 = "0", status = true },
		},
		{ -- 5 Bendición potente 1490516
			[12] = { id1 = "1501174", id2 = "0", id3 = "0", id4 = "0", status = true },
		},
		{ -- 6 Fuerza divina 491321
			[29] = { enable = true, status = true },
			[41] = { enable = true, status = true },
		},
		{ -- 7 Escudo del valor 490468
			[29] = { enable = true, status = true },
			[41] = { enable = true, status = true },
		},
		{ -- 8 Panteón de los héroes 495724
			[29] = { enable = true, status = true },
			[41] = { enable = true, status = true },
		},
		{ -- 9 Embestida 490150
			[16] = { self = false, orMore = true, status = true, stack = "4", id = "500169" },
		},
		{ -- 10 Golpe de escudo de la verdad 1490810
			[11] = { id1 = "501827", id2 = "0", id3 = "0", id4 = "0", status = true },
			[23] = { enable = true, status = true },
		},
		{ -- 11 Escudo Torbellino 490175
			[33] = { id1 = "1505924", id2 = "0", id3 = "0", id4 = "0", status = true },
			[39] = { enable = true, status = true },
		},
		{ -- 12 Determinación 490168
			[29] = { enable = true, status = true },
			[41] = { enable = true, status = true },
		},
		{ -- 13 Escudo del Esplendor 1494028
			[2] = { min = "50", max = "100", status = true },
			[12] = { id1 = "1503928", id2 = "0", id3 = "0", id4 = "0", status = true },
		},
		{ -- 14 Sello sagrado 490149
		},
		{ -- 15 Golpe de castigo 490179
			[33] = { id1 = "1502554", id2 = "0", id3 = "0", id4 = "0", status = true },
		},
		{ -- 16 Desarme 490159
			[33] = { id1 = "500157", id2 = "0", id3 = "0", id4 = "0", status = true },
		},
		{ -- 17 Castigo 490151
			[36] = { self = false, orMore = false, status = true, stack = "4", id = "500169" },
		},
		{ -- 18 Grilletes de luz 1490817
			[39] = { enable = true, status = true },
		},
		{ -- 19 Hendidura de tierra 1490515
			[32] = { id1 = "500195", id2 = "0", id3 = "0", id4 = "0", status = true },
			[39] = { enable = true, status = true },
		},
		{ -- 20 Golpe divino 490148
			[37] = { self = false, orMore = false, status = true, stack = "4", id = "500140" },
		},
	}
	local iss = {}
	local consumables = {}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
