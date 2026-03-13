--Lua MAGE/KNIGHT BY NEORAXER 19-05-2025
--V1.0 Alta calidad para Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

local juicio = true
local flag_juicio = "flag"

--Temporizador en cero
local function FLAG_JUICIO_FUNCTION()
	TimerQueue[flag_juicio] = nil
	juicio = true
end

function CE_MAGE_KNIGHT()
	local pm = UnitMana("player")
	local speed_a, speed_b = GetPlayerAbility('MAGIC_CASTSPEED')
	local speed = speed_a + speed_b

	--Iluminación
	local ILUM_SKILL, ILUM_ID_1, ILUM_ID_2 = Match_CE(493036)
	local ILUM_CD = CE_CD(ILUM_SKILL, ILUM_ID_1, ILUM_ID_2)
	--Golpe de luz sagrada
	local GOL_LUZ_SKILL, GOL_LUZ_ID_1, GOL_LUZ_ID_2 = Match_CE(493331)
	local GOL_LUZ_CD = CE_CD(GOL_LUZ_SKILL, GOL_LUZ_ID_1, GOL_LUZ_ID_2)
	--Estrellas de la luz
	local EST_LUZ_SKILL, EST_LUZ_ID_1, EST_LUZ_ID_2 = Match_CE(499613)
	local EST_LUZ_CD = CE_CD(EST_LUZ_SKILL, EST_LUZ_ID_1, EST_LUZ_ID_2)
	--Llama
	local LLAMA_SKILL, LLAMA_ID_1, LLAMA_ID_2 = Match_CE(491150)
	local LLAMA_CD = CE_CD(LLAMA_SKILL, LLAMA_ID_1, LLAMA_ID_2)
	--Tormenta
	local TORM_SKILL, TORM_ID_1, TORM_ID_2 = Match_CE(490244)
	local TORM_CD = CE_CD(TORM_SKILL, TORM_ID_1, TORM_ID_2)
	--Comprensión eléctrica
	local COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2 = Match_CE(491171)
	local COM_ELE_CD = CE_CD(COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2)
	--Explosión eléctrica
	local EXP_ELE_SKILL, EXP_ELE_ID_1, EXP_ELE_ID_2 = Match_CE(491170)
	local EXP_ELE_CD = CE_CD(EXP_ELE_SKILL, EXP_ELE_ID_1, EXP_ELE_ID_2)
	--Campo estático
	local CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2 = Match_CE(491172)
	local CAM_EST_CD = CE_CD(CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2)
	--Descarga
	local DES_SKILL, DES_ID_1, DES_ID_2 = Match_CE(1492480)
	local DES_CD = CE_CD(DES_SKILL, DES_ID_1, DES_ID_2)
	--Bola de fuego
	local BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2 = Match_CE(1490295)
	local BOL_FUE_CD = CE_CD(BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2)
	--Debilidad elemental
	local DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2 = Match_CE(497977)
	local DEB_ELE_CD = CE_CD(DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2)
	--Armadura reforzada
	local ARM_REF_SKILL, ARM_REF_ID_1, ARM_REF_ID_2 = Match_CE(490152)
	--Manto ignífugo
	local MAN_IGN_SKILL, MAN_IGN_ID_1, MAN_IGN_ID_2 = Match_CE(490248)
	--Canalización de energía
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(493323)
	--Mensajero de la luz
	local MEN_LUZ_SKILL, MEN_LUZ_ID_1, MEN_LUZ_ID_2 = Match_CE(491599)

	----------------CONSUMIBLES------------------
	if C_EngineSettings.Consumables then
		--Usar papas de col rizada
		if CE_TARGET_IS_BOSS() and not CE_BuffIdPlayer(1500234) and CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and not CE_BuffIdPlayer(1500238) and CE_UseItem(1244063) then
		--Usar agua de los espíritus de antaño
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and not CE_BuffIdPlayer(500112) and CE_UseItem(200192) then
		--Usar Phirius tipo E
		elseif pm < 10000 and CE_UseItem(203503) then
		end
		CE_HEALING_ITEM()
	end

	--Armadura reforzada
	if ARM_REF_SKILL and not CE_BuffIdPlayer(500141) then
		UseSkill(ARM_REF_ID_1, ARM_REF_ID_2)
	--Manto ignífugo
	elseif MAN_IGN_SKILL and not CE_BuffIdPlayer(500366) then
		UseSkill(MAN_IGN_ID_1, MAN_IGN_ID_2)
	--Canalización de energía
	elseif CAN_ENE_SKILL and not CE_BuffIdPlayer(503541) then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2)
	--Mensajero de la luz
	elseif MEN_LUZ_SKILL and not CE_BuffIdPlayer(506424) then
		UseSkill(MEN_LUZ_ID_1, MEN_LUZ_ID_2)
	--Comprensión eléctrica
	elseif COM_ELE_SKILL and COM_ELE_CD <= COMBATENGINE_GLOBAL_CD and CE_BuffIdPlayer(502270) and not CE_BuffIdPlayer(501554) then
		UseSkill(COM_ELE_ID_1, COM_ELE_ID_2)
	-- 10 Golpe de luz sagrada 493331
	elseif GOL_LUZ_SKILL and GOL_LUZ_CD <= COMBATENGINE_GLOBAL_CD and (not CE_BuffIdPlayer( 620182 ) and CE_AFE_2( 620182, 10 ) and not IsCasting) and CE_isMoving() == false and juicio and not TimerQueue[flag_juicio] then
		UseSkill(GOL_LUZ_ID_1, GOL_LUZ_ID_2)
		TimerQueue[flag_juicio] = { GetTime() + 4, FLAG_JUICIO_FUNCTION }
		juicio = false
	-- 11 Iluminación 493036
	elseif ILUM_SKILL and ILUM_CD <= COMBATENGINE_GLOBAL_CD then
		SpellTargetUnit("mouseover")
		UseSkill(ILUM_ID_1, ILUM_ID_2)
	-- 12 Estrellas de luz 499613
	elseif EST_LUZ_SKILL and EST_LUZ_CD <= COMBATENGINE_GLOBAL_CD and not CE_BuffIdPlayer(623213) then
		UseSkill(EST_LUZ_ID_1, EST_LUZ_ID_2)
	-- 13 División de la tierra 490243
	elseif (IsSpellUsable(490243)) and C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490243));
	-- 14 Explosión eléctrica 491170
	elseif EXP_ELE_SKILL and EXP_ELE_CD <= COMBATENGINE_GLOBAL_CD and CE_BuffIdPlayer(502270) then
		UseSkill(EXP_ELE_ID_1, EXP_ELE_ID_2)
	-- 15 Descarga 1492480
	elseif DES_SKILL and DES_CD <= COMBATENGINE_GLOBAL_CD and CE_BuffIdPlayer(623213) then
		UseSkill(DES_ID_1, DES_ID_2)
	-- 16 Escudo ardiente 1490295
	elseif BOL_FUE_SKILL and BOL_FUE_CD <= COMBATENGINE_GLOBAL_CD and CE_BuffIdPlayer(502270) and CE_isShield() then
		UseSkill(BOL_FUE_ID_1, BOL_FUE_ID_2)
	-- 17 Tormenta 490244
	elseif TORM_SKILL and TORM_CD <= COMBATENGINE_GLOBAL_CD then
		SpellTargetUnit("mouseover")
		UseSkill(TORM_ID_1, TORM_ID_2)
	-- 18 Estrellas de la luz 499613
	elseif EST_LUZ_SKILL and EST_LUZ_CD <= COMBATENGINE_GLOBAL_CD and not CE_TARGET_IS_BOSS() then
		UseSkill(EST_LUZ_ID_1, EST_LUZ_ID_2)
	-- 19 Llama 491150
	elseif LLAMA_SKILL and LLAMA_CD <= COMBATENGINE_GLOBAL_CD and CE_TARGET_IS_BOSS() then
		UseSkill(LLAMA_ID_1, LLAMA_ID_2)
	end
end

function CE_MAGE_KNIGHT_IMPORT()
	local Skills = { 1244059, 1244063, 200192, 203503, 490152, 490248, 493323, 491599, 491171, 493331, 493036, 499613, 490243, 491170, 1492480, 1490295, 490244, 499613, 491150 }
	local conditions = {
		{ -- 1 Usar papas de col rizada 1244059
			[12]={ id1="1500234", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true } 
		},
		{ -- 2 Usar frasco del espíritu élfico 1244063
			[12]={ id1="1500238", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true } 
		},
		{ -- 3 Usar agua de los espíritus de antaño 200192
			[12]={ id1="1500238", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true } 
		},
		{ -- 4 Usar Phirius tipo E 203503
			[2]={ max="10", min="0", status=true }
		},
		{ -- 5 Armadura reforzada 490152
			[12]={ id1="500141", id2="0", id3="0", id4="0", status=true }
		},
		{ -- 6 Manto ignífugo 490248
			[12]={ id1="500366", id2="0", id3="0", id4="0", status=true }
		},
		{ -- 7 Canalización de energía 493323
			[12]={ id1="503541", id2="0", id3="0", id4="0", status=true }
		},
		{ -- 8 Mensajero de la luz 491599
			[12]={ id1="506424", id2="0", id3="0", id4="0", status=true },
			[43]={ enable=true, status=true } 
		},
		{ -- 9 Comprensión eléctrica 491171
			[11]={ id1="502270", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="501554", id2="0", id3="0", id4="0", status=true } 
		},
		{ -- 10 Golpe de luz sagrada 493331
			[12]={ id1="620182", id2="0", id3="0", id4="0", status=true },
			[17]={ id="620182", status=true, time="10" } 
		},
		{ -- 11 Iluminación 493036
			[39]={ enable=true, status=true }, [43]={ enable=true, status=true }
		},
		{ -- 12 Estrellas de luz 499613
			[12]={ id1="623213", id2="0", id3="0", id4="0", status=true }
		},
		{ -- 13 División de la tierra 490243
		},
		{ -- 14 Explosión eléctrica 491170
			[11]={ id1="502270", id2="0", id3="0", id4="0", status=true },
			[12]={ id1="0", id2="0", id3="0", id4="0", status=true },
			[26]={ status=true, time="1" } 
		},
		{ -- 15 Descarga 1492480
			[11]={ id1="623213", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true } 
		},
		{ -- 16 Escudo ardiente 1490295 
		},
		{ -- 17 Tormenta 490244
			[43]={ enable=true, status=true }
		},
		{ -- 18 Estrellas de la luz 499613
			[45]={ enable=true, status=true }
		},
		{ -- 19 Llama 491150
			[29]={ enable=true, status=true }
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