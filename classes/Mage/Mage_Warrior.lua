--Lua MAGE/WARRIOR BY NEORAXER 24-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
function CE_MAGE_WARRIOR()
	--DEFAULT_CHAT_FRAME:AddMessage("Usando MAGO/PICA")
	local pm = UnitMana("player")
	local ira = UnitSkill("player")
	local speed_a, speed_b = GetPlayerAbility('MAGIC_CASTSPEED')
	local speed = speed_a + speed_b
	----------------SKILLS------------------
	--Bola de fuego
	local BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2 = Match_CE(490204)
	local BOL_FUE_CD = CE_CD(BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2)
	--Llama
	local LLAMA_SKILL, LLAMA_ID_1, LLAMA_ID_2 = Match_CE(493316)
	local LLAMA_CD = CE_CD(LLAMA_SKILL, LLAMA_ID_1, LLAMA_ID_2)
	--Descarga electrica
	local RAY_ELE_SKILL, RAY_ELE_ID_1, RAY_ELE_ID_2 = Match_CE(493317)
	local RAY_ELE_CD = CE_CD(RAY_ELE_SKILL, RAY_ELE_ID_1, RAY_ELE_ID_2)
	--Tormenta
	local TORM_SKILL, TORM_ID_1, TORM_ID_2 = Match_CE(1490679)
	local TORM_CD = CE_CD(TORM_SKILL, TORM_ID_1, TORM_ID_2)
	--Comprensión electrica
	local COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2 = Match_CE(491171)
	local COM_ELE_CD = CE_CD(COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2)
	--Explosión eléctrica
	local EXP_ELE_SKILL, EXP_ELE_ID_1, EXP_ELE_ID_2 = Match_CE(491170)
	local EXP_ELE_CD = CE_CD(EXP_ELE_SKILL, EXP_ELE_ID_1, EXP_ELE_ID_2)
	--Campo estático
	local CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2 = Match_CE(1491031)
	local CAM_EST_CD = CE_CD(CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2)
	--Descarga
	local DES_SKILL, DES_ID_1, DES_ID_2 = Match_CE(490242)
	local DES_CD = CE_CD(DES_SKILL, DES_ID_1, DES_ID_2)
	-----BUFFOS-----
	--Talento mágico
	local TAL_MAG_SKILL, TAL_MAG_ID_1, TAL_MAG_ID_2 = Match_CE(491562)
	--Manto ignifugo
	local MAN_IGN_SKILL, MAN_IGN_ID_1, MAN_IGN_ID_2 = Match_CE(490248)
	--Canalización de energía
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(490218)
	--Sabiduría y valor
	local SAB_VAL_SKILL, SAB_VAL_ID_1, SAB_VAL_ID_2 = Match_CE(499589)
	-----BUFFOS RAPIDOS----
	--Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(492942)
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2)
	--Furioso
	local FURIOSO_SKILL, FURIOSO_ID_1, FURIOSO_ID_2 = Match_CE(1492482)
	local FURIOSO_CD = CE_CD(FURIOSO_SKILL, FURIOSO_ID_1, FURIOSO_ID_2)
	--Carga electrostática
	local CAR_ELE_SKILL, CAR_ELE_ID_1, CAR_ELE_ID_2 = Match_CE(491156)
	local CAR_ELE_CD = CE_CD(CAR_ELE_SKILL, CAR_ELE_ID_1, CAR_ELE_ID_2)
	--ira de mana
	local IRA_MAN_SKILL, IRA_MAN_ID_1, IRA_MAN_ID_2 = Match_CE(491565)
	local IRA_MAN_CD = CE_CD(IRA_MAN_SKILL, IRA_MAN_ID_1, IRA_MAN_ID_2)
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
	------BUFFOS-----
	--Talento mágico
	if TAL_MAG_SKILL and CE_BuffIdPlayer(501947) == false then
		UseSkill(TAL_MAG_ID_1, TAL_MAG_ID_2)
	--Manto ignifugo
	elseif MAN_IGN_SKILL and CE_BuffIdPlayer(500366) == false then
		UseSkill(MAN_IGN_ID_1, MAN_IGN_ID_2)
	--Canalización de energía
	elseif CAN_ENE_SKILL and CE_BuffIdPlayer(500296) == false then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2)
	--Sabiduría y valor
	elseif SAB_VAL_SKILL and CE_BuffIdPlayer(623148) == false then
		UseSkill(SAB_VAL_ID_1, SAB_VAL_ID_2)
	--Comprensión electrica
	elseif COM_ELE_SKILL and COM_ELE_CD <= 0.1 and CE_BuffIdPlayer(502270) and (CE_BuffIdPlayer(501554) == false) then
		UseSkill(COM_ELE_ID_1, COM_ELE_ID_2)
	end
	---------------FAST BUFFS------------
	if C_EngineSettings.FastBuffs then
		--Ira de mana
		if IRA_MAN_SKILL and IRA_MAN_CD <= 0.1 and ira >= 50 then
			UseSkill(IRA_MAN_ID_1, IRA_MAN_ID_2)
		--Fiera
		elseif FIERA_SKILL and FIERA_CD <= 0.1 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		--Furioso
		elseif FURIOSO_SKILL and FURIOSO_CD <= 0.1 and ira < 20 then
			UseSkill(FURIOSO_ID_1, FURIOSO_ID_2)
		--Carga electrostática
		elseif CAR_ELE_SKILL and CAR_ELE_CD <= 0.1 then
			UseSkill(CAR_ELE_ID_1, CAR_ELE_ID_2)
		end
	end
	--Descarga electrica
	if CE_AFE(503533, 11) then
		if RAY_ELE_SKILL and RAY_ELE_CD <= 0.1 and pm > 360 then
			UseSkill(RAY_ELE_ID_1, RAY_ELE_ID_2)
		end
	end
	----------------ROTACION------------------
	--Bola de fuego
	if BOL_FUE_SKILL and BOL_FUE_CD <= 0.15 and (CE_BuffIdPlayer(623146) == false) then
		UseSkill(BOL_FUE_ID_1, BOL_FUE_ID_2)
	--Llama
	elseif LLAMA_SKILL and LLAMA_CD <= 0.15 and ira >= 5 and speed >= 160 and pm > 200 and (CE_isMoving() == false or CE_BuffIdPlayer(623146)) then
		UseSkill(LLAMA_ID_1, LLAMA_ID_2)
	--Explosión eléctrica
	elseif EXP_ELE_SKILL and CE_BuffIdPlayer(502270) and (CE_isMoving() == false or CE_BuffIdPlayer(623146)) then
		UseSkill(EXP_ELE_ID_1, EXP_ELE_ID_2)
	--Descarga
	elseif DES_SKILL and DES_CD <= 0.15 and (CE_BuffIdPlayer(502270) == false) and C_EngineSettings.AOE then
		UseSkill(DES_ID_1, DES_ID_2)
	--Tormenta
	elseif TORM_SKILL and TORM_CD <= 0.25 and C_EngineSettings.AOE and (CE_isMoving() == false) then
		SpellTargetUnit("mouseover")
		UseSkill(TORM_ID_1, TORM_ID_2)
	--Campo estático
	elseif CAM_EST_SKILL and ira >= 10 and CAM_EST_CD <= 0.25 and pm > 140 and CE_BuffIdPlayer(501554) and C_EngineSettings.AOE then
		UseSkill(CAM_EST_ID_1, CAM_EST_ID_2)
	end
end
function CE_MAGE_WARRIOR_IMPORT()
	local Skills = { 1244064, 1244059, 1244063, 200192, 203503, 491562, 490248, 490218, 499589, 491171, 491565, 492942, 1492482, 491156, 493317, 490204, 493316, 491170, 490242, 1490679, 1491031 }
	local conditions = {
		-- 1 Poción del enano 1244064
		{ [6]={ max="20", min="0", status=true }, [29]={ enable=true, status=true } },
		-- 2 Papas de col rizada 1244059
		{
			[12]={ id1="1500234", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 3 Frasco del espíritu élfico 1244063
		{
			[12]={ id1="1500238", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 4 Agua de los espíritus de antaño 200192
		{
			[12]={ id1="1500238", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 5 Usar Phirius tipo E 203503
		{ [2]={ max="10", min="0", status=true } },
		-- 6 Talento mágico 491562
		{ [12]={ id1="501947", id2="0", id3="0", id4="0", status=true } },
		-- 7 Manto ignifugo 490248
		{ [12]={ id1="500366", id2="0", id3="0", id4="0", status=true } },
		-- 8 Canalización de energía 490218
		{ [12]={ id1="500296", id2="0", id3="0", id4="0", status=true } },
		-- 9 Sabiduría y valor 499589
		{ [12]={ id1="623148", id2="0", id3="0", id4="0", status=true } },
		-- 10 Comprensión electrica 491171
		{
			[11]={ id1="502270", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="501554", id2="0", id3="0", id4="0", status=true }
		},
		-- 11 Ira de mana 491565
		{ [6]={ max="100", min="50", status=true }, [41]={ enable=true, status=true } },
		-- 12 Fiera 492942
		{ [6]={ max="100", min="25", status=true }, [41]={ enable=true, status=true } },
		-- 13 Furioso 1492482
		{ [6]={ max="20", min="0", status=true }, [41]={ enable=true, status=true } },
		-- 14 Carga electrostática 491156
		{ },
		-- 15 Descarga electrica 493317
		{ },
		-- 16 Bola de fuego 490204
		{ [12]={ id1="623146", id2="0", id3="0", id4="0", status=true } },
		-- 17 Llama 493316493316
		{
			[6]={ max="100", min="5", status=true },
			[11]={ id1="623146", id2="0", id3="0", id4="0", status=true }
		},
		-- 18 Explosión eléctrica 491170
		{ [11]={ id1="502270", id2="", id3="0", id4="0", status=true } },
		-- 19 Descarga 490242
		{
			[12]={ id1="502270", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 20 Tormenta 1490679
		{ [39]={ enable=true, status=true }, [43]={ enable=true, status=true } },
		-- 21 Campo estático 1491031
		{
			[6]={ max="100", min="10", status=true },
			[11]={ id1="501554", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		}
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