--Lua MAGE/ROGUE BY NEORAXER 15-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
function CE_MAGE_ROGUE()
	local mana = UnitMana("player")
	local energia = UnitSkill("player")
	----------------SKILLS------------------
	--Manto ignifugo
	local MAN_IGN_SKILL, MAN_IGN_ID_1, MAN_IGN_ID_2 = Match_CE(490248)
	--Mortaja légubre
	local MOR_LUG_SKILL, MOR_LUG_ID_1, MOR_LUG_ID_2 = Match_CE(492927)
	--Sombra del varón
	local SOM_VAR_SKILL, SOM_VAR_ID_1, SOM_VAR_ID_2 = Match_CE(499604)
	--Protección de las sombras
	local PRO_SOM_SKILL, PRO_SOM_ID_1, PRO_SOM_ID_2 = Match_CE(493030)
	--Ritual del Colmillo
	local RIT_COL_SKILL, RIT_COL_ID_1, RIT_COL_ID_2 = Match_CE(491581)
	--Canalización de energía
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(490218)
	--Descarga eléctrica
	local DES_ELE_SKILL, DES_ELE_ID_1, DES_ELE_ID_2 = Match_CE(491168)
	local DES_ELE_CD = CE_CD(DES_ELE_SKILL, DES_ELE_ID_1, DES_ELE_ID_2)
	--Comprensión eléctrica
	local COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2 = Match_CE(491171)
	local COM_ELE_CD = CE_CD(COM_ELE_SKILL, COM_ELE_ID_1, COM_ELE_ID_2)
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
	--Manto ignifugo
	if MAN_IGN_SKILL and CE_BuffIdPlayer(500366) == false then
		UseSkill(MAN_IGN_ID_1, MAN_IGN_ID_2)
	--Mortaja légubre
	elseif MOR_LUG_SKILL and CE_BuffIdPlayer(1500626) == false then
		UseSkill(MOR_LUG_ID_1, MOR_LUG_ID_2)
	--Sombra del varón
	elseif SOM_VAR_SKILL and CE_BuffIdPlayer(1500640) == false then
		UseSkill(SOM_VAR_ID_1, SOM_VAR_ID_2)
	--Protección de las sombras
	elseif PRO_SOM_SKILL and CE_BuffIdPlayer(503274) == false then
		UseSkill(PRO_SOM_ID_1, PRO_SOM_ID_2)
	--Ritual del Colmillo
	elseif RIT_COL_SKILL and CE_BuffIdPlayer(502036) == false then
		UseSkill(RIT_COL_ID_1, RIT_COL_ID_2)
	--Canalización de energía
	elseif CAN_ENE_SKILL and CE_BuffIdPlayer(500296) == false then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2)
	--Descarga eléctrica
	elseif DES_ELE_SKILL and DES_ELE_CD <= 0.25 and not CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500605) == false then
		UseSkill(DES_ELE_ID_1, DES_ELE_ID_2)
	--Comprensión eléctrica
	elseif COM_ELE_SKILL and COM_ELE_CD <= 0.25 and not CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(501554) == false and CE_BuffIdPlayer(1500605) then
		UseSkill(COM_ELE_ID_1, COM_ELE_ID_2)
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
	local Skills = { 1244064, 1244059, 1244063, 200192, 490248, 492927, 499604, 493030, 491581, 490218, 491168, 491171, 491156, 491172, 491345, 491578, 490309 }
	local conditions = {
	-- 1 Poción del enano 1244064
	{ [5]={ max="20", min="0", status=true }, [29]={ enable=true, status=true } },
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
	-- 5 Manto ignifugo 490248
	{ [12]={ id1="500366", id2="0", id3="0", id4="0", status=true } },
	-- 6 Mortaja légubre 492927
	{
	  [5]={ max="200", min="30", status=true },
	  [12]={ id1="1500626", id2="0", id3="0", id4="0", status=true } 
	},
	-- 7 Sombra del varón 499604
	{
	  [5]={ max="200", min="50", status=true },
	  [12]={ id1="1500640", id2="0", id3="0", id4="0", status=true } 
	},
	-- 8 Protección de las sombras 493030
	{ [12]={ id1="503274", id2="0", id3="0", id4="0", status=true } },
	-- 9 Ritual del Colmillo 491581
	{ [12]={ id1="502036", id2="0", id3="0", id4="0", status=true } },
	-- 10 Canalización de energía 490218
	{ [12]={ id1="500296", id2="0", id3="0", id4="0", status=true } },
	-- 11 Descarga eléctrica 491168
	{
	  [12]={ id1="1500605", id2="0", id3="0", id4="0", status=true },
	  [45]={ enable=true, status=true } 
	},
	-- 12 Comprensión eléctrica 491171
	{
	[11]={ id1="1500605", id2="0", id3="0", id4="0", status=true },
	[12]={ id1="501554", id2="0", id3="0", id4="0", status=true },
	[45]={ enable=true, status=true } 
	},
	-- 13 Carga electrostática 491156
	{ [29]={ enable=true, status=true } },
	-- 14 Campo estático 491172
	{
	[11]={ id1="502036", id2="0", id3="0", id4="0", status=true },
	[26]={ status=true, time="1" },
	[39]={ enable=true, status=true },
	[45]={ enable=true, status=true } 
	},
	-- 15 Beso del vampiro 491345
	{
	[5]={ max="200", min="25", status=true },
	[32]={ id1="501960", id2="0", id3="0", id4="0", status=true } 
	},
	-- 16 Colmillos malditos 491578
	{ [5]={ max="200", min="20", status=true } },
	-- 17 Arrojar 490309
	{  }
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
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end