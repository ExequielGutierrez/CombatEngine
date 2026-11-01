--Lua MAGE/PRIEST BY NEORAXER 15-03-2024
--V1.0 Alta calidad para Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_MAGE_DRUID()
	local mana = UnitMana("player")
	local cargado = 502270
	local Comp_elect = 501554
	local Esen_ond = 1500861
	local speed_a, speed_b = GetPlayerAbility('MAGIC_CASTSPEED')

	----------------SKILLS------------------
	-- Percepción 494052
	local PER_SKILL, PER_ID_1, PER_ID_2 = Match_CE(494052)
	local PER_CD = CE_CD(PER_SKILL, PER_ID_1, PER_ID_2)
	-- Manto ignífugo 490248
	local MANT_IGN_SKILL, MANT_IGN_ID_1, MANT_IGN_ID_2 = Match_CE(490248)
	local MANT_IGN_CD = CE_CD(MANT_IGN_SKILL, MANT_IGN_ID_1, MANT_IGN_ID_2)
	-- Canalización de energía 493323
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(490218)
	-- Debilidad elemental 497977
	local DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2 = Match_CE(497977)
	local DEB_ELE_CD = CE_CD(DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2)
	-- Carga electrostática 491156
	local ELE_CHARGE_SKILL, ELE_CHARGE_ID_1, ELE_CHARGE_ID_2 = Match_CE(491156)
	local ELE_CHARGE_CD = CE_CD(ELE_CHARGE_SKILL, ELE_CHARGE_ID_1, ELE_CHARGE_ID_2)
	-- Mística elfa 494928
	local ELV_SKILL, ELV_ID_1, ELV_ID_2 = Match_CE(494928)
	local ELV_CD = CE_CD(ELV_SKILL, ELV_ID_1, ELV_ID_2)
	-- Guardián verde 494331
	local GREEN_SKILL, GREEN_ID_1, GREEN_ID_2 = Match_CE(494331)
	local GREEN_CD = CE_CD(GREEN_SKILL, GREEN_ID_1, GREEN_ID_2)
	-- Plegaria de concentración 493530
	local CON_PRA_SKILL, CON_PRA_ID_1, CON_PRA_ID_2 = Match_CE(493530)
	local CON_PRA_CD = CE_CD(CON_PRA_SKILL, CON_PRA_ID_1, CON_PRA_ID_2)
	-- Bendición salvaje 493531
	local SAV_BLE_SKILL, SAV_BLE_ID_1, SAV_BLE_ID_2 = Match_CE(493531)
	local SAV_BLE_CD = CE_CD(SAV_BLE_SKILL, SAV_BLE_ID_1, SAV_BLE_ID_2)
	-- Campo estático 491172
	local CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2 = Match_CE(491172)
	local CAM_EST_CD = CE_CD(CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2)
	-- Llamado cósmico 499623
	local COS_SKILL, COS_ID_1, COS_ID_2 = Match_CE(499623)
	local COS_CD = CE_CD(COS_SKILL, COS_ID_1, COS_ID_2)
	-- Terremoto 1491830
	local EAR_SKILL, EAR_ID_1, EAR_ID_2 = Match_CE(1491830)
	local EAR_CD = CE_CD(EAR_SKILL, EAR_ID_1, EAR_ID_2)
	-- Espada de la tierra 494053
	local MOTH_SKILL, MOTH_ID_1, MOTH_ID_2 = Match_CE(494053)
	local MOTH_CD = CE_CD(MOTH_SKILL, MOTH_ID_1, MOTH_ID_2)
	-- Espada subterránea 494564
	local SUBT_SKILL, SUBT_ID_1, SUBT_ID_2 = Match_CE(494564)
	local SUBT_CD = CE_CD(SUBT_SKILL, SUBT_ID_1, SUBT_ID_2)

	----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		-- Usar papas de col rizada
		if CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and CE_UseItem(1244059) then
		-- Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and CE_UseItem(1244063) then
		-- Usar agua de los espíritus de antaño
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		-- Usar Phirius tipo E
		elseif mana < 10000 and CE_UseItem(203503) then
		end
		CE_HEALING_ITEM()
	end

	----------------ROTACIÓN------------------
	-- Percepción
	if PER_SKILL and CE_BuffIdPlayer(504561) == false then
		UseSkill(PER_ID_1, PER_ID_2)
	-- Mística elfa
	elseif ELV_SKILL and CE_BuffIdPlayer(505914) == false then
		UseSkill(ELV_ID_1, ELV_ID_2)
	-- Guardián verde
	elseif GREEN_SKILL and CE_BuffIdPlayer(1502869) == false then
		UseSkill(GREEN_ID_1, GREEN_ID_2)
	-- Plegaria de concentración
	elseif CON_PRA_SKILL and CE_BuffIdPlayer(503799) == false and not UnitInParty("player") then
		UseSkill(CON_PRA_ID_1, CON_PRA_ID_2)
	-- Bendición salvaje
	elseif SAV_BLE_SKILL and CE_BuffIdPlayer(620454) == false and not UnitInParty("player") then
		UseSkill(SAV_BLE_ID_1, SAV_BLE_ID_2)
	-- Canalización de energía -- Energy Influx
	elseif CAN_ENE_SKILL and CE_BuffIdPlayer(500296) == false then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2)
	-- Carga electrostática
	elseif ELE_CHARGE_SKILL and CE_BuffIdPlayer(620209) == false then
		UseSkill(ELE_CHARGE_ID_1, ELE_CHARGE_ID_2)
	-- Debilidad elemental
	elseif DEB_ELE_SKILL and DEB_ELE_CD <= 0.25 and (CE_DebuffIdTarget(620189) == false) then
		UseSkill(DEB_ELE_ID_1, DEB_ELE_ID_2)
	-- Llamado cósmico
	elseif COS_SKILL and COS_CD <= 0.25 and C_EngineSettings.AOE and CE_SELF_BUFF(1502870, 10, true) then
		SpellTargetUnit("mouseover")
		UseSkill(COS_ID_1, COS_ID_2)
	-- Explosión de división de la tierra ISS 80
	elseif IsSpellUsable(490243) and mana > 10000 and CE_BuffIdPlayer(1500743) == false and C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490243))
	-- Terremoto
	elseif EAR_SKILL and EAR_CD <= 0.25 and C_EngineSettings.AOE then
		SpellTargetUnit("mouseover")
		UseSkill(EAR_ID_1, EAR_ID_2)
	-- Campo estático
	elseif (C_EngineSettings.AOE and CAM_EST_SKILL and CE_isMoving()) or (IsShiftKeyDown() == true and CE_BuffIdPlayer(Comp_elect)) then
		UseSkill(CAM_EST_ID_1, CAM_EST_ID_2)
	-- Espada subterránea
	elseif SUBT_SKILL and SUBT_CD <= 0.25 then
		UseSkill(SUBT_ID_1, SUBT_ID_2)
	-- Espada de la tierra
	elseif MOTH_SKILL and MOTH_CD <= 0.25 then
		UseSkill(MOTH_ID_1, MOTH_ID_2)
	end
end

function CE_MAGE_DRUID_IMPORT()
	--Preset base by Riechan (MAGEDRUID)
	local Skills = { 494052, 494331, 494928, 490218, 493530, 493531, 499621, 497767, 1244059, 495727, 499621, 490218, 491156, 491171, 497977, 490243, 1491833, 1491830, 499623, 491172, 490204, 494564, 494053 }
	local conditions = {
		-- 1 Perception 494052
		[1] = {
			[12]={ id1="504561", id2="0", id3="0", id4="0", status=true }
		},
		-- 2 Green Guardian 494331
		[2] = {
			[12]={ id1="1502869", id2="0", id3="0", id4="0", status=true }
		},
		-- 3 Elven Mystic 494928
		[3] = {
			[12]={ id1="505914", id2="0", id3="0", id4="0", status=true }
		},
		-- 4 Energy Influx 490218
		[4] = {
			[12]={ id1="500296", id2="0", id3="0", id4="0", status=true }
		},
		-- 5 Concentration Prayer 493530
		[5] = {
			[12]={ id1="503799", id2="0", id3="0", id4="0", status=true }
		},
		-- 6 Savage Blessing 493531
		[6] = {
			[12]={ id1="620454", id2="0", id3="0", id4="0", status=true }
		},
		-- 7 Infiltration Spirit 499621
		[7] = {
			[14]={ id1="1502879", id2="0", id3="0", id4="0", status=true },
			[15]={ id="1502870", stack="10", orMore=true, self=false, status=true },
			[41]={ enable=true, status=true }
		},
		-- 8 Divine Escape 497767
		[8] = {
			[28]={ enable=true, status=true },
			[29]={ enable=true, status=true }
		},
		-- 9 Spicy Kale Chips 1244059
		[9] = {
			[40]={ enable=true, status=true },
			[12]={ id1="1500234", id2="0", id3="0", id4="0", status=true },
			[29]={ enable=true, status=true }
		},
		-- 10 The Sage 495727
		[10] = {
			[12]={ id1="1500369", id2="0", id3="0", id4="0", status=true },
			[41]={ enable=true, status=true }
		},
		-- 11 Infiltration Spirit 499621
		[11] = {
			[15]={ id="1502870", stack="10", orMore=false, self=false, status=true },
			[41]={ enable=true, status=true }
		},
		-- 12 Energy Influx 490218
		[12] = {
			[12]={ id1="500296", id2="0", id3="0", id4="0", status=true }
		},
		-- 13 Electrostatic Charge 491156
		[13] = {
			[12]={ id1="1500605", id2="0", id3="0", id4="0", status=true }
		},
		-- 14 Electric Compression 491171
		[14] = {
			[11]={ id1="502270", id2="0", id3="0", id4="0", status=true },
			[45]={ enable=true, status=true }
		},
		-- 15 Elemental Weakness 497977
		[15] = {
			[29]={ enable=true, status=true },
			[33]={ id1="620189", id2="0", id3="0", id4="0", status=true }
		},
		-- 16 Earth Splitting Explosion 490243
		[16] = {
			[43]={ enable=true, status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 17 Singularity 1491833
		[17] = {
			[34]={ id1="500557", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 18 Earthquake 1491830
		[18] = {
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 19 Cosmic Call 499623
		[19] = {
			[43]={ enable=true, status=true },
			[15]={ id="1502870", stack="15", orMore=true, self=false, status=true },
			[39]={ enable=true, status=true },
			[19]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 20 Static Field 491172
		[20] = {
			[11]={ id1="501554", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true },
			[48]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 21 Fireball 490204
		[21] = {},
		-- 22 Subterraneous Blade 494564
		[22] = {},
		-- 23 Mother Earth's Blade 494053
		[23] = {}
	}
	local iss = {
		[497767] = true,
		[495727] = true,
		[490243] = true,
	}
	local consumables = {
		[1244059] = true,
	}
	local equips = {}
	local disabled = {
		[7] = true,
		[11] = true,
		[14] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions, equips, disabled)
end