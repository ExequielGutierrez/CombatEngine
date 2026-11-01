--Lua MAGE/ROGUE BY NEORAXER 15-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
function CE_MAGE_ROGUE()
	local mana = UnitMana("player")
	local energia = UnitSkill("player")
	----------------SKILLS------------------
	--Regalo del Barón
	local REG_BAR_SKILL, REG_BAR_ID_1, REG_BAR_ID_2 = Match_CE(493264)
	--Invocar Sombra
	local INV_SOM_SKILL, INV_SOM_ID_1, INV_SOM_ID_2 = Match_CE(492632)
	local INV_SOM_CD = CE_CD(INV_SOM_SKILL, INV_SOM_ID_1, INV_SOM_ID_2)
	--Manto ignifugo
	local MAN_IGN_SKILL, MAN_IGN_ID_1, MAN_IGN_ID_2 = Match_CE(490248)
	--Mortaja légubre
	local MOR_LUG_SKILL, MOR_LUG_ID_1, MOR_LUG_ID_2 = Match_CE(492927)
	--Sombra del varón
	local SOM_VAR_SKILL, SOM_VAR_ID_1, SOM_VAR_ID_2 = Match_CE(499604)
	--Ritual del Colmillo
	local RIT_COL_SKILL, RIT_COL_ID_1, RIT_COL_ID_2 = Match_CE(491581)
	--Canalización de energía
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(490218)
	--Descarga eléctrica
	local DES_ELE_SKILL, DES_ELE_ID_1, DES_ELE_ID_2 = Match_CE(491168)
	local DES_ELE_CD = CE_CD(DES_ELE_SKILL, DES_ELE_ID_1, DES_ELE_ID_2)
	--Carga electrostática
	local CAR_ELEC_SKILL, CAR_ELEC_ID_1, CAR_ELEC_ID_2 = Match_CE(491156)
	local CAR_ELEC_CD = CE_CD(CAR_ELEC_SKILL, CAR_ELEC_ID_1, CAR_ELEC_ID_2)
	--Campo estático
	local CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2 = Match_CE(491172)
	local CAM_EST_CD = CE_CD(CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2)
	--Beso del vampiro
	local BES_VAM_SKILL, BES_VAM_ID_1, BES_VAM_ID_2 = Match_CE(491345)
	local BES_VAM_CD = CE_CD(BES_VAM_SKILL, BES_VAM_ID_1, BES_VAM_ID_2)
	--Colmillos malditos
	local COL_MAL_SKILL, COL_MAL_ID_1, COL_MAL_ID_2 = Match_CE(491578)
	local COL_MAL_CD = CE_CD(COL_MAL_SKILL, COL_MAL_ID_1, COL_MAL_ID_2)
	--Arrojar
	local ARR_SKILL, ARR_ID_1, ARR_ID_2 = Match_CE(490309)
	local ARR_CD = CE_CD(ARR_SKILL, ARR_ID_1, ARR_ID_2)
	----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if energia <= 20 and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and CE_UseItem(1244059) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and CE_UseItem(1244063) then
		--Usar agua de los espíritus de antaño
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		end
		CE_HEALING_ITEM()
	end
	----------------ROTACION------------------
	--Regalo del Barón
	if CE_BuffIdPlayer(1500629) == false then
		UseSkill(REG_BAR_ID_1, REG_BAR_ID_2)
	--Invocar Sombra
	elseif INV_SOM_SKILL and INV_SOM_CD <= 0.25 then
		UseSkill(INV_SOM_ID_1, INV_SOM_ID_2)
	--Manto ignifugo
	elseif MAN_IGN_SKILL and CE_BuffIdPlayer(500366) == false then
		UseSkill(MAN_IGN_ID_1, MAN_IGN_ID_2)
	--Mortaja légubre
	elseif MOR_LUG_SKILL and CE_BuffIdPlayer(1500626) == false then
		UseSkill(MOR_LUG_ID_1, MOR_LUG_ID_2)
	--Sombra del varón
	elseif SOM_VAR_SKILL and CE_BuffIdPlayer(1500640) == false then
		UseSkill(SOM_VAR_ID_1, SOM_VAR_ID_2)
	--Ritual del Colmillo
	elseif RIT_COL_SKILL and CE_BuffIdPlayer(502036) == false then
		UseSkill(RIT_COL_ID_1, RIT_COL_ID_2)
	--Canalización de energía
	elseif CAN_ENE_SKILL and CE_BuffIdPlayer(500296) == false then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2)
	--Descarga eléctrica
	elseif DES_ELE_SKILL and DES_ELE_CD <= 0.25 and not CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500605) == false then
		UseSkill(DES_ELE_ID_1, DES_ELE_ID_2)
	--Carga electrostática
	elseif CAR_ELEC_SKILL and CAR_ELEC_CD <= 0.25 and CE_TARGET_IS_BOSS() then
		UseSkill(CAR_ELEC_ID_1, CAR_ELEC_ID_2)
	--Campo estático
	elseif CAM_EST_SKILL and CAM_EST_CD <= 0.25 and not CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(501554) and _G.C_EngineSettings.AOE then
		UseSkill(CAM_EST_ID_1, CAM_EST_ID_2)
	--Beso del vampiro
	elseif BES_VAM_SKILL and BES_VAM_CD <= 0.25 and CE_DebuffIdTarget(501960) and energia >= 25 then
		UseSkill(BES_VAM_ID_1, BES_VAM_ID_2)
	--Colmillos malditos
	elseif COL_MAL_SKILL and COL_MAL_CD <= 0.25 and energia >= 20 and CE_BuffIdPlayer(502036) then
		UseSkill(COL_MAL_ID_1, COL_MAL_ID_2)
	--Arrojar
	elseif ARR_SKILL and ARR_CD <= 0.25 then
		UseSkill(ARR_ID_1, ARR_ID_2)
	end
end
function CE_MAGE_ROGUE_IMPORT()
	--Preset base by Riechan (MAGETHIEF)
	local Skills = { 492927, 493030, 495161, 490218, 490248, 499604, 493264, 491156, 491348, 497977, 490243, 490244, 490239, 490204, 492632, 491345, 491578, 490252, 1490305, 491171, 491172 }
	local conditions = {
		-- 1 Shadow Shroud 492927
		[1] = {
			[12]={ id1="1500626", id2="0", id3="0", id4="0", status=true }
		},
		-- 2 Shadow Protection 493030
		[2] = {
			[12]={ id1="503274", id2="0", id3="0", id4="0", status=true }
		},
		-- 3 Midnight Ritual 495161
		[3] = {
			[12]={ id1="502036", id2="0", id3="0", id4="0", status=true }
		},
		-- 4 Energy Influx 490218
		[4] = {
			[12]={ id1="500296", id2="0", id3="0", id4="0", status=true }
		},
		-- 5 Fire Ward 490248
		[5] = {
			[12]={ id1="500366", id2="0", id3="0", id4="0", status=true }
		},
		-- 6 Shadow of the Baron 499604
		[6] = {
			[12]={ id1="1500640", id2="0", id3="0", id4="0", status=true }
		},
		-- 7 Gift of the Baron 493264
		[7] = {
			[12]={ id1="1500629", id2="0", id3="0", id4="0", status=true }
		},
		-- 8 Electrostatic Charge 491156
		[8] = {
			[12]={ id1="1500605", id2="0", id3="0", id4="0", status=true }
		},
		-- 9 Demoralize 491348
		[9] = {
			[2]={ min="5", max="100", status=true },
			[29]={ enable=true, status=true },
			[33]={ id1="1500622", id2="0", id3="0", id4="0", status=true }
		},
		-- 10 Elemental Weakness 497977
		[10] = {
			[2]={ min="1", max="100", status=true },
			[29]={ enable=true, status=true },
			[33]={ id1="620189", id2="0", id3="0", id4="0", status=true }
		},
		-- 11 Earth Splitting Explosion 490243
		[11] = {
			[43]={ enable=true, status=true },
			[2]={ min="5", max="100", status=true },
			[45]={ enable=true, status=true },
			[39]={ enable=true, status=true },
			[12]={ id1="1502519", id2="0", id3="0", id4="0", status=true }
		},
		-- 12 Thunderstorm 490244
		[12] = {
			[2]={ min="2", max="100", status=true },
			[12]={ id1="1500605", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 13 Elemental Phoenix 490239
		[13] = {
			[2]={ min="1", max="100", status=true },
			[45]={ enable=true, status=true }
		},
		-- 14 Fireball 490204
		[14] = {
			[2]={ min="1", max="100", status=true },
			[29]={ enable=true, status=true }
		},
		-- 15 Summon Shadows 492632
		[15] = {},
		-- 16 Kiss of the Vampire 491345
		[16] = {
			[5]={ min="25", max="100", status=true }
		},
		-- 17 Cursed Fangs 491578
		[17] = {
			[5]={ min="20", max="100", status=true },
			[29]={ enable=true, status=true }
		},
		-- 18 Meteor Shower 490252
		[18] = {
			[34]={ id1="1500621", id2="0", id3="0", id4="0", status=true },
			[45]={ enable=true, status=true }
		},
		-- 19 Purgatory Darkness 1490305
		[19] = {
			[5]={ min="15", max="100", status=true },
			[45]={ enable=true, status=true }
		},
		-- 20 Electric Compression 491171
		[20] = {
			[11]={ id1="502270", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		},
		-- 21 Static Field 491172
		[21] = {
			[11]={ id1="501554", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true },
			[45]={ enable=true, status=true }
		}
	}
	local iss = {
		[490243] = true,
	}
	local consumables = {}
	local equips = {}
	local disabled = {
		[2] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions, equips, disabled)
end