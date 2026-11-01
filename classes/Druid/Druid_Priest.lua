--Lua DRUID/PRIEST BY NEORAXER
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
--Healing rotation. Skills use the current target, so AutoTarget is disabled by default for this combination.


function CE_DRUID_PRIEST()

	--Curacion urgente
	local CUR_URG_SKILL, CUR_URG_ID_1, CUR_URG_ID_2 = Match_CE(1490753);
	local CUR_URG_CD = CE_CD(CUR_URG_SKILL, CUR_URG_ID_1, CUR_URG_ID_2);
	--Restaurar vida
	local RES_VID_SKILL, RES_VID_ID_1, RES_VID_ID_2 = Match_CE(493526);
	local RES_VID_CD = CE_CD(RES_VID_SKILL, RES_VID_ID_1, RES_VID_ID_2);
	--Ensenanzas sagradas
	local ENS_SAG_SKILL, ENS_SAG_ID_1, ENS_SAG_ID_2 = Match_CE(1490652);
	local ENS_SAG_CD = CE_CD(ENS_SAG_SKILL, ENS_SAG_ID_1, ENS_SAG_ID_2);
	--Regeneracion (1)
	local REG_1_SKILL, REG_1_ID_1, REG_1_ID_2 = Match_CE(1490657);
	local REG_1_CD = CE_CD(REG_1_SKILL, REG_1_ID_1, REG_1_ID_2);
	--Regeneracion (2)
	local REG_2_SKILL, REG_2_ID_1, REG_2_ID_2 = Match_CE(490269);
	local REG_2_CD = CE_CD(REG_2_SKILL, REG_2_ID_1, REG_2_ID_2);
	--Fuente de la Madre Tierra
	local FUE_MAD_SKILL, FUE_MAD_ID_1, FUE_MAD_ID_2 = Match_CE(493529);
	local FUE_MAD_CD = CE_CD(FUE_MAD_SKILL, FUE_MAD_ID_1, FUE_MAD_ID_2);
	--Florecer de la vida
	local FLO_VID_SKILL, FLO_VID_ID_1, FLO_VID_ID_2 = Match_CE(1490757);
	local FLO_VID_CD = CE_CD(FLO_VID_SKILL, FLO_VID_ID_1, FLO_VID_ID_2);
	--Salvador de la Luz
	local SAL_LUZ_SKILL, SAL_LUZ_ID_1, SAL_LUZ_ID_2 = Match_CE(1490658);
	local SAL_LUZ_CD = CE_CD(SAL_LUZ_SKILL, SAL_LUZ_ID_1, SAL_LUZ_ID_2);
	--Ola de curas
	local OLA_CUR_SKILL, OLA_CUR_ID_1, OLA_CUR_ID_2 = Match_CE(1490655);
	local OLA_CUR_CD = CE_CD(OLA_CUR_SKILL, OLA_CUR_ID_1, OLA_CUR_ID_2);
	--Lluvia de Luz
	local LLU_LUZ_SKILL, LLU_LUZ_ID_1, LLU_LUZ_ID_2 = Match_CE(1490650);
	local LLU_LUZ_CD = CE_CD(LLU_LUZ_SKILL, LLU_LUZ_ID_1, LLU_LUZ_ID_2);

	--Target health percent
	local tHp = 100
	if UnitExists("target") and UnitMaxHealth("target") > 0 then
		tHp = UnitHealth("target") / UnitMaxHealth("target") * 100
	end

	--ROTACION (misma prioridad que el preset custom DRUIDAUGUR)
	--Curacion urgente
	if CUR_URG_SKILL and CUR_URG_CD <= 0.25 and tHp <= 60 then
		UseSkill(CUR_URG_ID_1, CUR_URG_ID_2);
	--Restaurar vida (con efecto 500112)
	elseif RES_VID_SKILL and RES_VID_CD <= 0.25 and CE_BuffIdPlayer(500112) and tHp <= 40 then
		UseSkill(RES_VID_ID_1, RES_VID_ID_2);
	--Ensenanzas sagradas
	elseif ENS_SAG_SKILL and ENS_SAG_CD <= 0.25 and CE_BuffIdPlayer(1501068) == false then
		UseSkill(ENS_SAG_ID_1, ENS_SAG_ID_2);
	--Regeneracion
	elseif REG_1_SKILL and REG_1_CD <= 0.25 and CE_BuffIdPlayer(1490657) == false then
		UseSkill(REG_1_ID_1, REG_1_ID_2);
	--Regeneracion (efecto 500469)
	elseif REG_2_SKILL and REG_2_CD <= 0.25 and CE_BuffIdPlayer(500469) == false and CE_DebuffIdTarget(500469) == false then
		UseSkill(REG_2_ID_1, REG_2_ID_2);
	--Fuente de la Madre Tierra
	elseif FUE_MAD_SKILL and FUE_MAD_CD <= 0.25 then
		UseSkill(FUE_MAD_ID_1, FUE_MAD_ID_2);
	--Florecer de la vida
	elseif FLO_VID_SKILL and FLO_VID_CD <= 0.25 and CE_DebuffIdTarget(503795) == false then
		UseSkill(FLO_VID_ID_1, FLO_VID_ID_2);
	--Salvador de la Luz (5 cargas o mas de 503827)
	elseif SAL_LUZ_SKILL and SAL_LUZ_CD <= 0.25 and CE_BuffIdPlayer(503827, 5, true) then
		UseSkill(SAL_LUZ_ID_1, SAL_LUZ_ID_2);
	--Ola de curas
	elseif OLA_CUR_SKILL and OLA_CUR_CD <= 0.25 then
		UseSkill(OLA_CUR_ID_1, OLA_CUR_ID_2);
	--Lluvia de Luz (area en el suelo)
	elseif LLU_LUZ_SKILL and LLU_LUZ_CD <= 0.25 then
		UseSkill(LLU_LUZ_ID_1, LLU_LUZ_ID_2);
		if not TimerQueue["castAoe"] then
			TimerQueue["castAoe"] = { GetTime() + 0.1, function() SpellTargetUnit("mouseover") end };
		end
	--Restaurar vida
	elseif RES_VID_SKILL and RES_VID_CD <= 0.25 then
		UseSkill(RES_VID_ID_1, RES_VID_ID_2);
	end

end

function CE_DRUID_PRIEST_IMPORT()
	--Skills          [1]      [2]     [3]      [4]      [5]     [6]     [7]      [8]      [9]      [10]     [11]
	local Skills = { 1490753, 493526, 1490652, 1490657, 490269, 493529, 1490757, 1490658, 1490655, 1490650, 493526 }
	local conditions = {
		-- 1 Curacion urgente 1490753
		[1] = { [27]={ max="60", min="0", status=true } },
		-- 2 Restaurar vida 493526
		[2] = {
			[11]={ id1="500112", id2="0", id3="0", id4="0", status=true },
			[27]={ max="40", min="0", status=true }
		},
		-- 3 Ensenanzas sagradas 1490652
		[3] = { [12]={ id1="1501068", id2="0", id3="0", id4="0", status=true } },
		-- 4 Regeneracion 1490657
		[4] = { [12]={ id1="1490657", id2="0", id3="0", id4="0", status=true } },
		-- 5 Regeneracion 490269
		[5] = {
			[12]={ id1="500469", id2="0", id3="0", id4="0", status=true },
			[33]={ id1="500469", id2="0", id3="0", id4="0", status=true }
		},
		-- 6 Fuente de la Madre Tierra 493529
		[6] = {},
		-- 7 Florecer de la vida 1490757
		[7] = { [33]={ id1="503795", id2="0", id3="0", id4="0", status=true } },
		-- 8 Salvador de la Luz 1490658
		[8] = { [15]={ id="503827", orMore=true, self=false, stack="5", status=true } },
		-- 9 Ola de curas 1490655
		[9] = {},
		-- 10 Lluvia de Luz 1490650
		[10] = { [43]={ enable=true, status=true } },
		-- 11 Restaurar vida 493526
		[11] = {}
	}
	local iss = {}
	local consumables = {}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
