--Lua MAGE/WARRIOR BY NEORAXER 17-05-2025
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
function CE_MAGE_WARDEN()
	local pm = UnitMana("player")
	local speed_a, speed_b = GetPlayerAbility('MAGIC_CASTSPEED')
	local speed = speed_a + speed_b

	--Debilidad elemental
	local DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2 = Match_CE(497977)
	local DEB_ELE_CD = CE_CD(DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2)
	--Tormenta
	local TORM_SKILL, TORM_ID_1, TORM_ID_2 = Match_CE(490244)
	local TORM_CD = CE_CD(TORM_SKILL, TORM_ID_1, TORM_ID_2)
	--Bola de fuego
	local BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2 = Match_CE(494075)
	local BOL_FUE_CD = CE_CD(BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2)
	--Tierra Gamebunda
	local GROANING_SKILL, GROANING_ID_1, GROANING_ID_2 = Match_CE(494330)
	local GROANING_CD = CE_CD(GROANING_SKILL, GROANING_ID_1, GROANING_ID_2)
	--Campo estático
	local CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2 = Match_CE(491172)
	local CAM_EST_CD = CE_CD(CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2)
	--Oleada Terrestre
	local OLE_TERR_SKILL, OLE_TERR_ID_1, OLE_TERR_ID_2 = Match_CE(494049)
	local OLE_TERR_CD = CE_CD(OLE_TERR_SKILL, OLE_TERR_ID_1, OLE_TERR_ID_2)
	--Manto ignifugo
	local MAN_IGN_SKILL, MAN_IGN_ID_1, MAN_IGN_ID_2 = Match_CE(490248)
	--Canalización de energía
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(490218)
	--Escudo de zarzas
	local ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2 = Match_CE(493642)
	--Carga electrostática
	local CAR_ELE_SKILL, CAR_ELE_ID_1, CAR_ELE_ID_2 = Match_CE(491156)
	local CAR_ELE_CD = CE_CD(CAR_ELE_SKILL, CAR_ELE_ID_1, CAR_ELE_ID_2)
	--Poder feroz
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(1490308)
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2)
	--Marcas de la tierra
	local MARCAS_SKILL, MARCAS_ID_1, MARCAS_ID_2 = Match_CE(494926)
	local MARCAS_CD = CE_CD(MARCAS_SKILL, MARCAS_ID_1, MARCAS_ID_2)
	--Comprensión electrica
	local COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2 = Match_CE(491171)
	local COM_ELE_CD = CE_CD(COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2)

	----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar papas de col rizada
		if CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and CE_UseItem(1244063) then
		--Usar agua de los espíritus de antaño
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		--Usar Phirius tipo E
		elseif pm < 10000 and CE_UseItem(203503) then
		end
		CE_HEALING_ITEM()
	end

	-----BUFFOS-----
	--Manto ignifugo
	if MAN_IGN_SKILL and CE_BuffIdPlayer(500366) == false then
		UseSkill(MAN_IGN_ID_1, MAN_IGN_ID_2)
	--Canalización de energía
	elseif CAN_ENE_SKILL and CE_BuffIdPlayer(500296) == false then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2)
	--Escudo de zarzas
	elseif ESC_ZAR_SKILL and (CE_BuffIdPlayer(503958) == false) then
		UseSkill(ESC_ZAR_ID_1, ESC_ZAR_ID_2)
	end

	---------------FAST BUFFS------------
	if C_EngineSettings.FastBuffs then
		--Poder feroz
		if POD_FER_SKILL and POD_FER_CD <= 0.25 and (_G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS()) then
			UseSkill(POD_FER_ID_1, POD_FER_ID_2)
		--Marcas de la tierra
		elseif MARCAS_SKILL and MARCAS_CD <= 0.25 and (_G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS()) then
			UseSkill(MARCAS_ID_1, MARCAS_ID_2)
		end
	end

	--Rotación de Ataque
	-- 11 Carga electrostática 491156
	if CAR_ELE_SKILL and CAR_ELE_CD <= 0.1 and not CE_BuffIdPlayer(502270) then
		UseSkill(CAR_ELE_ID_1, CAR_ELE_ID_2)
	-- 12 Debilidad elemental 497977
	elseif DEB_ELE_SKILL and DEB_ELE_CD <= 0.1 and not CE_DebuffIdTarget(620189) then
		UseSkill(DEB_ELE_ID_1, DEB_ELE_ID_2)
	-- 13 Tormenta 490244
	elseif TORM_SKILL and TORM_CD <= 0.25 then
		SpellTargetUnit("mouseover")
		UseSkill(TORM_ID_1, TORM_ID_2)
	-- 14 Bola de fuego 494075
	elseif BOL_FUE_SKILL and BOL_FUE_CD <= 0.25 then
		UseSkill(BOL_FUE_ID_1, BOL_FUE_ID_2)
	-- 15 Tierra gemebunda 494330
	elseif GROANING_SKILL and GROANING_CD <= 0.25 then
		UseSkill(GROANING_ID_1, GROANING_ID_2)
	-- 16 Campo estático 491172
	elseif CAM_EST_SKILL and CAM_EST_CD <= 0.25 and CE_BuffIdPlayer(501554) then
		UseSkill(CAM_EST_ID_1, CAM_EST_ID_2)
	-- 17 Comprensión electrica 491171
	elseif COM_ELE_SKILL and COM_ELE_CD <= 0.25 and CE_BuffIdPlayer(502270) and not CE_DebuffIdTarget(501554) then
		UseSkill(COM_ELE_ID_1, COM_ELE_ID_2)
	-- 18 Oleada Terrestre 494049
	elseif OLE_TERR_SKILL and OLE_TERR_CD <= 0.25 then
		UseSkill(OLE_TERR_ID_1, OLE_TERR_ID_2)
	end
end

function CE_MAGE_WARDEN_IMPORT()
	local Skills = { 1244059, 1244063, 200192, 203503, 490248, 499618, 490218, 493642, 491168, 1490308, 494926, 497977, 490244, 494075, 494330, 491172, 491171, 494049 }
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
		-- 5 Manto ignifugo 490248
		{ [12]={ id1="500366", id2="0", id3="0", id4="0", status=true } },
		-- 6 Cetro de tierra 499618
		{ [12]={ id1="623216", id2="0", id3="0", id4="0", status=true } },
		-- 7 Canalización de energía 490218
		{ [12]={ id1="500296", id2="0", id3="0", id4="0", status=true } },
		-- 8 Escudo de zarzas 493642
		{ [12]={ id1="503958", id2="0", id3="0", id4="0", status=true } },
		-- 9 Descarga electrica 491168
		{ [12]={ id1="502270", id2="0", id3="0", id4="0", status=true } },
		-- 10 Poder feroz 1490308
		{
			[12]={ id1="1500640", id2="0", id3="0", id4="0", status=true },
			[41]={ enable=true, status=true }
		},
		-- 11 Marcas de la tierra 494926
		{
			[12]={ id1="505690", id2="0", id3="0", id4="0", status=true },
			[41]={ enable=true, status=true }
		},
		-- 12 Debilidad elemental 497977
		{ [33]={ id1="620189", id2="0", id3="0", id4="0", status=true } },
		-- 13 Tormenta 490244
		{ [43]={ enable=true, status=true } },
		-- 14 Bola de fuego 494075
		{ [26]={ status=true, time="1" } },
		-- 15 Tierra gemebunda 494330
		{ [39]={ enable=true, status=true } },
		-- 16 Campo estático 491172
		{
			[11]={ id1="501554", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 17 Comprensión electrica 491171
		{
			[11]={ id1="502270", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="501554", id2="0", id3="0", id4="0", status=true }
		},
		-- 18 Oleada Terrestre 494049
		{}
	}
	local iss = {
		[495482] = true,
		[495481] = true,
		[495562] = true,
		[495716] = true,
		[495731] = true,
		[496106] = true,
		[497913] = true,
		[498341] = true,
		[850148] = true,
		[490243] = true,
		[490226] = true,
		[497767] = true,
		[490231] = true,
		[495727] = true,
		[497722] = true,
		[497852] = true,
		[1490925] = true,
	}
	local consumables = {
		[1244064] = true,
		[1244059] = true,
		[1244063] = true,
		[200192] = true,
		[203503] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end