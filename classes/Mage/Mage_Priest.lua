--Lua MAGE/PRIEST BY NEORAXER 17-05-2025
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
function CE_MAGE_PRIEST()
	--DEFAULT_CHAT_FRAME:AddMessage("Usando MAGO/PICA")
	local mana = UnitMana("player")
	local cargado = 502270
	local Comp_elect = 501554
	local Esen_ond = 1500861
	local speed_a, speed_b = GetPlayerAbility('MAGIC_CASTSPEED')
	----------------SKILLS------------------
	--Manto ignifugo
	local MAN_IGN_SKILL, MAN_IGN_ID_1, MAN_IGN_ID_2 = Match_CE(490248);
	--Dominio de la marea
	local DOM_MAR_SKILL, DOM_MAR_ID_1, DOM_MAR_ID_2 = Match_CE(499607);
	--Gracia vital
	local GRA_VIT_SKILL, GRA_VIT_ID_1, GRA_VIT_ID_2 = Match_CE(490290);
	--Agua bendita de manantial
	local AGU_BEN_SKILL, AGU_BEN_ID_1, AGU_BEN_ID_2 = Match_CE(490298);
	--Ataque amplificado
	local ATA_AMP_SKILL, ATA_AMP_ID_1, ATA_AMP_ID_2 = Match_CE(490491);
	--Barrera mágica
	local BAR_MAG_SKILL, BAR_MAG_ID_1, BAR_MAG_ID_2 = Match_CE(491166);
	--Canalización de energía
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(490218);
	--Escencia de onda
	local ESC_OND_SKILL, ESC_OND_ID_1, ESC_OND_ID_2 = Match_CE(499609);
	local ESC_OND_CD = CE_CD(ESC_OND_SKILL, ESC_OND_ID_1, ESC_OND_ID_2);
	--Absorbción mágica
	local ABS_MAG_SKILL, ABS_MAG_ID_1, ABS_MAG_ID_2 = Match_CE(493265);
	local ABS_MAG_CD = CE_CD(ABS_MAG_SKILL, ABS_MAG_ID_1, ABS_MAG_ID_2);
	--Debilidad elemental
	local DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2 = Match_CE(497977);
	local DEB_ELE_CD = CE_CD(DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2);
	--Marea creciente
	local MAR_CRE_SKILL, MAR_CRE_ID_1, MAR_CRE_ID_2 = Match_CE(499608);
	local MAR_CRE_CD = CE_CD(MAR_CRE_SKILL, MAR_CRE_ID_1, MAR_CRE_ID_2);
	--Tormenta
	local TORM_SKILL, TORM_ID_1, TORM_ID_2 = Match_CE(490244);
	local TORM_CD = CE_CD(TORM_SKILL, TORM_ID_1, TORM_ID_2);
	--Campo estático
	local CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2 = Match_CE(491172);
	local CAM_EST_CD = CE_CD(CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2);
	--Comprensión electrica
	local COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2 = Match_CE(491171);
	local COM_ELE_CD = CE_CD(COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2);
	--Ekectric Ourburst
	local ELE_OUT_SKILL, ELE_OUT_ID_1, ELE_OUT_ID_2 = Match_CE(491589);
	local ELE_OUT_CD = CE_CD(ELE_OUT_SKILL, ELE_OUT_ID_1, ELE_OUT_ID_2);
	--Explosión de la marea
	local EXP_MAR_SKILL, EXP_MAR_ID_1, EXP_MAR_ID_2 = Match_CE(491590);
	local EXP_MAR_CD = CE_CD(EXP_MAR_SKILL, EXP_MAR_ID_1, EXP_MAR_ID_2);
	--Vortex
	local VORT_SKILL, VORT_ID_1, VORT_ID_2 = Match_CE(492928);
	local VORT_CD = CE_CD(VORT_SKILL, VORT_ID_1, VORT_ID_2);
	----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar papas de col rizada
		if CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los espíritus de antaño
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		--Usar Phirius tipo E
		elseif mana < 10000 and CE_UseItem(203503) then
		end
		CE_HEALING_ITEM()
	end
	---------------FAST BUFFS------------
	if C_EngineSettings.FastBuffs then
		--Escencia de onda
		if ESC_OND_SKILL and ESC_OND_CD <= 0.1 then
			UseSkill(ESC_OND_ID_1, ESC_OND_ID_2);
		--Absorbcion m�gica
		elseif ABS_MAG_SKILL and ABS_MAG_CD <= 0.1 then
			UseSkill(ABS_MAG_ID_1, ABS_MAG_ID_2);
		end
	end
	----------------ROTACION------------------
	--Manto ignifugo
	if MAN_IGN_SKILL and CE_BuffIdPlayer(500366) == false then
		UseSkill(MAN_IGN_ID_1, MAN_IGN_ID_2);
	--Dominio de la marea
	elseif DOM_MAR_SKILL and CE_BuffIdPlayer(1500714) == false then
		UseSkill(DOM_MAR_ID_1, DOM_MAR_ID_2);
	--Canalización de energia
	elseif CAN_ENE_SKILL and CE_BuffIdPlayer(500296) == false then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2);
	--Comprension electrica
	elseif COM_ELE_SKILL and CE_BuffIdPlayer(502270) and CE_BuffIdPlayer(501554) == false then
		UseSkill(COM_ELE_ID_1, COM_ELE_ID_2);
	--Debilidad elemental
	elseif DEB_ELE_SKILL and DEB_ELE_CD <= 0.1 and CE_DebuffIdTarget(620189) == false then
		UseSkill(DEB_ELE_ID_1, DEB_ELE_ID_2);
	--Marea Creciente
	elseif MAR_CRE_SKILL and MAR_CRE_CD <= 0.1 then
		UseSkill(MAR_CRE_ID_1, MAR_CRE_ID_2);
	--Tormenta
	elseif TORM_SKILL and TORM_CD <= 0.1 and C_EngineSettings.AOE then
		SpellTargetUnit("mouseover")
		UseSkill(TORM_ID_1, TORM_ID_2);
	--Explosion de division de la tierra
	elseif (IsSpellUsable(490243)) and mana > 5000 and CE_BuffIdPlayer(1500743) == false and C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490243));
	--Campo estático
	elseif C_EngineSettings.AOE and CAM_EST_SKILL and CE_isMoving() or ((IsShiftKeyDown() == true) and CE_BuffIdPlayer(Comp_elect)) then
		UseSkill(CAM_EST_ID_1, CAM_EST_ID_2) ;
	--Electric Outburst
	elseif ELE_OUT_SKILL and ELE_OUT_CD <= 0.1 and mana > 2000 and (C_EngineSettings.AOE or (CE_DebuffIdTarget(620189) == false)) then
		UseSkill(ELE_OUT_ID_1, ELE_OUT_ID_2);
	--Explosion de la marea
	elseif EXP_MAR_SKILL and EXP_MAR_CD <= 0.1 and CE_TARGET_IS_BOSS() and CE_DebuffIdTarget(1502932) and speed_b >= 78 then
		UseSkill(EXP_MAR_ID_1, EXP_MAR_ID_2);
	--Vortex
	elseif VORT_SKILL and CE_isMoving() == false and mana > 2000 and C_EngineSettings.AOE then
		UseSkill(VORT_ID_1, VORT_ID_2);
	end
end
function CE_MAGE_PRIEST_IMPORT()
	local Skills = { 1244059, 1244063, 200192, 203503, 499609,493265,490248,499607,490218,491171,497977,499608,490244,490243,491172, 492928, 491589, 491590 }
	local conditions = {
		-- 1 Usar papas de col rizada 1244059
		{
			[12]={ id1="1500234", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 2 Usar frasco del espíritu élfico 1244063
		{
			[12]={ id1="1500238", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 3 Usar agua de los espíritus de antaño 200192
		{
			[12]={ id1="1500238", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 4 Usar Phirius tipo E 203503
		{ [2]={ max="10", min="0", status=true } },
		-- 5 Escencia de onda 499609
		{
			[2]={ max="100", min="10", status=true },
			[12]={ id1="1500861", id2="0", id3="0", id4="0", status=true },
			[41]={ enable=true, status=true }
		},
		-- 6 Absorbcion mágica 493265
		{ [33]={ id1="503713", id2="0", id3="0", id4="0", status=true } },
		-- 7 Manto ignifugo 490248
		{ [12]={ id1="500366", id2="0", id3="0", id4="0", status=true } },
		-- 8 Dominio de la marea 499607
		{ [12]={ id1="1500714", id2="0", id3="0", id4="0", status=true } },
		-- 9 Canalización de energia 490218
		{ [12]={ id1="500296", id2="0", id3="0", id4="0", status=true } },
		-- 10 Comprension electrica 491171
		{
			[11]={ id1="502270", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="501554", id2="0", id3="0", id4="0", status=true }
		},
		-- 11 Debilidad elemental 497977
		{ [33]={ id1="620189", id2="0", id3="0", id4="0", status=true } },
		-- 12 Marea Creciente 499608
		{ },
		-- 13 Tormenta 490244
		{ [19]={ enable=true, status=true }, [43]={ enable=true, status=true } },
		-- 14 Explosion de division de la tierra 490243
		{ },
		-- 15 Campo estático 491172
		{ [26]={ status=true, time="1" } },
		-- 16 Vortex 492928
		{ },
		-- 17 Electric Outburst 491589
		{ },
		-- 18 Explosion de la marea 491590
		{ [39]={ enable=true, status=true } }
	}
	local iss = {
		[495482]=true,
		[495481]=true,
		[495562]=true,
		[495716]=true,
		[495731]=true,
		[496106]=true,
		[497913]=true,
		[498341]=true,
		[850148]=true,
		[490243]=true,
		[490226]=true,
		[497767]=true,
		[490231]=true,
		[495727]=true,
		[497722]=true,
		[497852]=true,
		[1490925]=true,
	}
	local consumables = {
		[1244064]=true,
		[1244059]=true,
		[1244063]=true,
		[200192]=true,
		[203503]=true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end