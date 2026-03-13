--Lua MAGE/WARLOCK BY NEORAXER 19-05-2025
local delay = false
function CE_MAGE_WARLOCK()
	local pm = UnitMana("player")
	local foco = UnitSkill("player")
	local MaxPm = UnitMaxMana("player")
	--Bola de fuego
	local BOLA_FUE_SKILL, BOLA_FUE_ID_1, BOLA_FUE_ID_2 = Match_CE(1493654);
	local BOLA_FUE_CD = CE_CD(BOLA_FUE_SKILL, BOLA_FUE_ID_1, BOLA_FUE_ID_2);
	--Descarga electrica
	local DESCARGA_SKILL, DESCARGA_ID_1, DESCARGA_ID_2 = Match_CE(491168);
	local DESCARGA_CD = CE_CD(DESCARGA_SKILL, DESCARGA_ID_1, DESCARGA_ID_2);
	--Tormenta
	local TORMENTA_SKILL, TORMENTA_ID_1, TORMENTA_ID_2 = Match_CE(1493655);
	local TORMENTA_CD = CE_CD(TORMENTA_SKILL, TORMENTA_ID_1, TORMENTA_ID_2);
	--Lluvia de meteoritos
	local LLUVIA_SKILL, LLUVIA_ID_1, LLUVIA_ID_2 = Match_CE(1491817);
	local LLUVIA_CD = CE_CD(LLUVIA_SKILL, LLUVIA_ID_1, LLUVIA_ID_2);
	--Debilidad elemental
	local DEBILIDAD_SKILL, DEBILIDAD_ID_1, DEBILIDAD_ID_2 = Match_CE(497977);
	local DEBILIDAD_CD = CE_CD(DEBILIDAD_SKILL, DEBILIDAD_ID_1, DEBILIDAD_ID_2);
	--Estallido de sombra
	local EXP_REMP_SKILL, EXP_REMP_ID_1, EXP_REMP_ID_2 = Match_CE(498759);
	local EXP_REMP_CD = CE_CD(EXP_REMP_SKILL, EXP_REMP_ID_1, EXP_REMP_ID_2);
	--Pozo de energía
	local POZO_SKILL, POZO_ID_1, POZO_ID_2 = Match_CE(620209);
	local POZO_CD = CE_CD(POZO_SKILL, POZO_ID_1, POZO_ID_2);
	--Carga Electroestática
	local CARGA_SKILL, CARGA_ID_1, CARGA_ID_2 = Match_CE(620209);
	local CARGA_CD = CE_CD(CARGA_SKILL, CARGA_ID_1, CARGA_ID_2);
	--Intensificación
	local INTEN_SKILL, INTEN_ID_1, INTEN_ID_2 = Match_CE(1491841);
	local INTEN_CD = CE_CD(INTEN_SKILL, INTEN_ID_1, INTEN_ID_2);
	--Canalizaci�n de energ�a
	local CANA_SKILL, CANA_ID_1, CANA_ID_2 = Match_CE(490218);
	--Manto ignifugo
	local MANTO_SKILL, MANTO_ID_1, MANTO_ID_2 = Match_CE(490248);
	--Magia negra olvidada
	local MAGIA_SKILL, MAGIA_ID_1, MAGIA_ID_2 = Match_CE(499814);
	--Transici�m del alma
	local TRANS_SKILL, TRANS_ID_1, TRANS_ID_2 = Match_CE(498757);
	--Carga comnada 497958
	local CARGA_COM_SKILL, CARGA_COM_ID_1, CARGA_COM_ID_2 = Match_CE(497958);
	local CARGA_COM_CD = CE_CD(CARGA_COM_SKILL, CARGA_COM_ID_1, CARGA_COM_ID_2);
	------------------- BUFFS -----------------
	--Transición del alma
	if not CE_BuffIdPlayer(623434) and delay == false then
		UseSkill(TRANS_ID_1, TRANS_ID_2);
		delay = true
	end
	if delay and not TimerQueue["Transicion"] then
		TimerQueue["Transicion"] = { GetTime() + 1, function()
			delay = false
		end }
	end
	--Canalización de energía
	if not CE_BuffIdPlayer(500296) then
		UseSkill(CANA_ID_1, CANA_ID_2);
	--Manto ignifugo
	elseif not CE_BuffIdPlayer(500366) then
		UseSkill(MANTO_ID_1, MANTO_ID_2);
	--Magia negra olvidada
	elseif not CE_BuffIdPlayer(1502832) then
		UseSkill(MAGIA_ID_1, MAGIA_ID_2);
	end
	------------------ Comidas -----------------
	if C_EngineSettings.Consumables then
		--Usar papas de col rizada
		if CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and CE_UseItem(1244059) then
		--Usar poción del enano
		elseif foco <= 20 and CE_UseItem(1244064) then
		--Usar frasco del espíritu élfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and CE_UseItem(1244063) then
		--Usar agua de los espíritus de antaño
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		--Usar Phirius tipo E
		elseif pm < 10000 and CE_UseItem(203503) then
		end
		CE_HEALING_ITEM()
	end
	--------------- Buffos rápidos ----------------
	if C_EngineSettings.FastBuffs then
		if not CE_BuffIdPlayer(500369) and POZO_CD <= COMBATENGINE_GLOBAL_CD then
			UseSkill(POZO_ID_1, POZO_ID_2);
		elseif not CE_BuffIdPlayer(620209) and CARGA_CD <= COMBATENGINE_GLOBAL_CD then
			UseSkill(CARGA_ID_1, CARGA_ID_2);
		elseif not CE_BuffIdPlayer(620177) and INTEN_CD <= COMBATENGINE_GLOBAL_CD then
			UseSkill(INTEN_ID_1, INTEN_ID_2);
		end
	end
	--------------- Rotación ----------------
	--Carga combada
	if not CE_BuffIdPlayer(501575) and CARGA_COM_CD <= COMBATENGINE_GLOBAL_CD then
		UseSkill(CARGA_COM_ID_1, CARGA_COM_ID_2);
	--Lluvia de meteoritos
	elseif CE_DebuffIdTarget(500557) and pm > MaxPm/5 and C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() and not COMBATENGINE_CASTING then
		SpellTargetUnit("mouseover");
		UseSkill(LLUVIA_ID_1, LLUVIA_ID_2);
	--Bola de fuego
	elseif BOLA_FUE_CD <= COMBATENGINE_GLOBAL_CD then
		UseSkill(BOLA_FUE_ID_1, BOLA_FUE_ID_2);
	--Descarga eléctrica
	elseif not CE_BuffIdPlayer(621505) then
		UseSkill(DESCARGA_ID_1, DESCARGA_ID_2);
	--Tormenta
	elseif not CE_DebuffIdTarget(500557) and C_EngineSettings.AOE and TORMENTA_CD <= COMBATENGINE_GLOBAL_CD and not CE_TARGET_IS_BOSS() and not COMBATENGINE_CASTING then
		SpellTargetUnit("mouseover");
		UseSkill(TORMENTA_ID_1, TORMENTA_ID_2);
	--Debilidad elemental
	elseif CE_TARGET_IS_BOSS() and not CE_DebuffIdTarget(620189) then
		UseSkill(DEBILIDAD_ID_1, DEBILIDAD_ID_2);
	--Estallido de sombra
	elseif CE_BuffIdPlayer(621505) and CE_BuffIdPlayer(621505) and not COMBATENGINE_CASTING and foco >= 10 then
		UseSkill(EXP_REMP_ID_1, EXP_REMP_ID_2);
	end
end
function CE_MAGE_WARLOCK_IMPORT()
	local Skills = {1244059,1244063,200192,203503,623434,500296,500366,1502832,490251,491156,497976,497958,1491817,1493654,491168,1493655,497977,498759}
	local conditions = {
		{-- 1 Usar papas de col rizada 1244059
			[12]={id1="1500234",id2="0",id3="0",id4="0",status=true},
			[29]={enable=true,status=true}
		},
		{-- 2 Usar frasco del espíritu élfico 1244063
			[12]={id1="1500238",id2="0",id3="0",id4="0",status=true},
			[29]={enable=true,status=true}
		},
		{-- 3 Usar agua de los espíritus de antaño 200192
			[12]={id1="1500238",id2="0",id3="0",id4="0",status=true},
			[29]={enable=true,status=true}
		},
		{-- 4 Usar Phirius tipo E 203503
			[2]={max="10",min="0",status=true}
		},
		{-- 5 Transición del alma 623434
			[12]={id1="623434",id2="0",id3="0",id4="0",status=true},
			[26]={status=true,time="1"}
		},
		{-- 6 Canalización de energía 500296
			[12]={id1="500296",id2="0",id3="0",id4="0",status=true}
		},
		{-- 7 Manto ignifugo 500366
			[12]={id1="500366",id2="0",id3="0",id4="0",status=true}
		},
		{-- 8 Magia negra olvidada 1502832
			[12]={id1="1502832",id2="0",id3="0",id4="0",status=true}
		},
		{-- 9 Pozo de energía 490251
			[41]={enable=true,status=true}
		},
		{-- 10 Carga electrostática 491156
			[41]={enable=true,status=true}
		},
		{-- 11 Intensificación 497976
			[41]={enable=true,status=true}
		},
		{-- 12 Carga combada 497958
			[12]={id1="501575",id2="0",id3="0",id4="0",status=true},
			[41]={enable=true,status=true}
		},
		{-- 13 Lluvia de meteoritos 1491817
			[2]={max="100",min="5",status=true},
			[39]={enable=true,status=true},
			[45]={enable=true,status=true}
		},
		{-- 14 Bola de fuego 1493654
		},
		{-- 15 Descarga eléctrica 491168
			[12]={id1="621505",id2="0",id3="0",id4="0",status=true}
		},
		{-- 16 Tormenta 1493655
			[39]={enable=true,status=true},[43]={enable=true,status=true}
		},
		{-- 17 Debilidad elemental 497977
			[33]={id1="620189",id2="0",id3="0",id4="0",status=true}
		},
		{-- 18 Estallido de sombra 498759
			[3]={max="100",min="15",status=true},[19]={enable=true,status=true}
		}
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
		[1490925]=true
	}
	local consumables = {
		[1244064]=true,
		[1244059]=true,
		[1244063]=true,
		[200192]=true,
		[203503]=true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end