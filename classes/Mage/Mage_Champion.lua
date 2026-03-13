--Lua MAGE/WARRIOR BY NEORAXER 17-05-2025
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
function CE_MAGE_CHAMPION()
	--DEFAULT_CHAT_FRAME:AddMessage("Usando MAGO/PICA")
	local pm = UnitMana("player")
	local ira = UnitSkill("player")
	local speed_a, speed_b = GetPlayerAbility('MAGIC_CASTSPEED')
	local speed = speed_a + speed_b
	local MaxPm = UnitMaxMana("player")
	----------------SKILLS------------------
	--Descarga
	local DES_SKILL, DES_ID_1, DES_ID_2 = Match_CE(1490362)
	local DES_CD = CE_CD(DES_SKILL, DES_ID_1, DES_ID_2)
	--Explosión eléctrica
	local EXP_ELE_SKILL, EXP_ELE_ID_1, EXP_ELE_ID_2 = Match_CE(498824)
	local EXP_ELE_CD = CE_CD(EXP_ELE_SKILL, EXP_ELE_ID_1, EXP_ELE_ID_2)
	--Campo estático
	local CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2 = Match_CE(498868)
	local CAM_EST_CD = CE_CD(CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2)
	--Secuestro de voltaje
	local SECUESTRO_SKILL, SECUESTRO_ID_1, SECUESTRO_ID_2 = Match_CE(498864)
	local SECUESTRO_CD = CE_CD(SECUESTRO_SKILL, SECUESTRO_ID_1, SECUESTRO_ID_2)
	-----BUFFOS-----
	--Manto ignifugo
	local MAN_IGN_SKILL, MAN_IGN_ID_1, MAN_IGN_ID_2 = Match_CE(490248)
	--Canalización de energía
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(490218)
	-----BUFFOS RAPIDOS----
	--Poder de electrólisis
	local ELECTROLISIS_SKILL, ELECTROLISIS_ID_1, ELECTROLISIS_ID_2 = Match_CE(498869)
	local ELECTROLISIS_CD = CE_CD(ELECTROLISIS_SKILL, ELECTROLISIS_ID_1, ELECTROLISIS_ID_2)
	--Carga electrostática
	local CAR_ELE_SKILL, CAR_ELE_ID_1, CAR_ELE_ID_2 = Match_CE(491156)
	local CAR_ELE_CD = CE_CD(CAR_ELE_SKILL, CAR_ELE_ID_1, CAR_ELE_ID_2)
	--Descarga cerebral
	local CEREBRAL_SKILL, CEREBRAL_ID_1, CEREBRAL_ID_2 = Match_CE(498825)
	local CEREBRAL_CD = CE_CD(CEREBRAL_SKILL, CEREBRAL_ID_1, CEREBRAL_ID_2)
	--Tormenta de iones
	local IONES_SKILL, IONES_ID_1, IONES_ID_2 = Match_CE(498873)
	local IONES_CD = CE_CD(IONES_SKILL, IONES_ID_1, IONES_ID_2)
	--Tormenta electrica
	local STORM_SKILL, STORM_ID_1, STORM_ID_2 = Match_CE(490244)
	local STORM_CD = CE_CD(STORM_SKILL, STORM_ID_1, STORM_ID_2)
	--Lluvia de meteoriros
	local LLUVIA_SKILL, LLUVIA_ID_1, LLUVIA_ID_2 = Match_CE(490252)
	local LLUVIA_CD = CE_CD(LLUVIA_SKILL, LLUVIA_ID_1, LLUVIA_ID_2)
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
	--Manto ignifugo
	if MAN_IGN_SKILL and CE_BuffIdPlayer(500366) == false then
		UseSkill(MAN_IGN_ID_1, MAN_IGN_ID_2)
	--Canalización de energía
	elseif CAN_ENE_SKILL and CE_BuffIdPlayer(500296) == false then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2)
	end
	---------------FAST BUFFS------------
	if C_EngineSettings.FastBuffs then
		--Poder de electrólisis
		if ira <= 10 and ELECTROLISIS_CD <= 0.25 and pm > MaxPm/4 then
			UseSkill(ELECTROLISIS_ID_1, ELECTROLISIS_ID_2)
		--Carga electrostática
		elseif CAR_ELE_CD <= 0.25 then
			UseSkill(CAR_ELE_ID_1, CAR_ELE_ID_2)
		--Descarga cerebral
		elseif CEREBRAL_CD <= 0.25 and ira >= 15 then
			UseSkill(CEREBRAL_ID_1, CEREBRAL_ID_2)
		--Tormenta de iones
		elseif IONES_CD <= 0.25 and ira > 10 and not CE_BuffIdPlayer(621634) then
			UseSkill(IONES_ID_1, IONES_ID_2)
		end
	end
	----------------ROTACION------------------
	--Descarga eléctrica
	if DES_CD <= 0.25 and (not CE_DebuffIdTarget(621628) or (not CE_TARGET_IS_BOSS() and not CE_BuffIdPlayer(621629))) then
		UseSkill(DES_ID_1, DES_ID_2)
	else
		if CE_TARGET_IS_BOSS() then
			--Explosión eléctrica
			UseSkill(EXP_ELE_ID_1, EXP_ELE_ID_2)
		elseif _G.C_EngineSettings.AOE then
			--Secuestro de voltaje
			if CE_BuffIdPlayer(621629) and COMBATENGINE_CASTING == false then
				UseSkill(SECUESTRO_ID_1, SECUESTRO_ID_2)
			--Lluvia de meteoritos
			elseif COMBATENGINE_CASTING == false and CE_DebuffIdTarget(500557) then
				SpellTargetUnit("mouseover")
				UseSkill(LLUVIA_ID_1, LLUVIA_ID_2)
			--Tormenta eléctrica
			elseif STORM_CD <= 0.3 and not CE_DebuffIdTarget(500557) and COMBATENGINE_CASTING == false then
				SpellTargetUnit("mouseover")
				UseSkill(STORM_ID_1, STORM_ID_2)
			--Campo estático
			elseif CAM_EST_CD <= 0.25 then
				UseSkill(CAM_EST_ID_1, CAM_EST_ID_2)
			end
		else
			UseSkill(EXP_ELE_ID_1, EXP_ELE_ID_2)
		end
	end
end

function CE_MAGE_CHAMPION_IMPORT()
	local Skills = {1244059,1244063,200192,203503,490248,490218,498869,491156,498825,498873,1490362,498824,498864,490252,490244,498868}
	local conditions = {
		-- 1 Usar papas de col rizada 1244059
		{
			[12]={id1="1500234",id2="0",id3="0",id4="0",status=true},
			[29]={enable=true,status=true}
		},
		-- 2 Usar frasco del espíritu élfico 1244063
		{
			[12]={id1="1500238",id2="0",id3="0",id4="0",status=true},
			[29]={enable=true,status=true}
		},
		-- 3 Usar agua de los espíritus de antaño 200192
		{
			[12]={id1="1500238",id2="0",id3="0",id4="0",status=true},
			[29]={enable=true,status=true}
		},
		-- 4 Usar Phirius tipo E 203503
		{[2]={max="10",min="0",status=true}},
		-- 5 Manto ignifugo 490248
		{[12]={id1="500366",id2="0",id3="0",id4="0",status=true}},
		-- 6 Canalización de energía 490218
		{[12]={id1="500296",id2="0",id3="0",id4="0",status=true}},
		-- 7 Poder de electrólisis 498869
		{},
		-- 8 Carga electrostática 491156
		{},
		-- 9 Descarga cerebral 498825
		{[6]={max="100",min="15",status=true}},
		-- 10 Tormenta de iones 498873
		{[12]={id1="621634",id2="0",id3="0",id4="0",status=true}},
		-- 11 Descarga eléctrica 1490362
		{},
		-- 12 Explosión eléctrica 498824
		{[12]={id1="621624",id2="0",id3="0",id4="0",status=true}},
		-- 13 Secuestro de voltaje 498864
		{[11]={id1="621629",id2="0",id3="0",id4="0",status=true}},
		-- 14 Lluvia de meteoritos 490252
		{
			[32]={id1="500557",id2="0",id3="0",id4="0",status=true},
			[43]={enable=true,status=true}
		},
		-- 15 Tormenta eléctrica 490244
		{
			[33]={id1="500557",id2="0",id3="0",id4="0",status=true},
			[43]={enable=true,status=true}
		},
		-- 16 Campo estático 498868
		{}
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