--Lua MAGE/BARD for Combat Engine (built from ObjectData tooltips)
--Resources: mana = UnitMana, focus = UnitSkill
--Long cooldown power-ups (Catalisis elemental, Solo: Ruido, Intensificacion, Pozo de energia) are not part of the rotation.

function CE_MAGE_BARD()
	local pm = UnitMana("player")
	local MaxPm = UnitMaxMana("player")
	local foco = UnitSkill("player")

	--Canalizacion de energia
	local CAN_ENE_SKILL, CAN_ENE_ID_1, CAN_ENE_ID_2 = Match_CE(490218)
	--Debilitar elemental
	local DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2 = Match_CE(1491445)
	local DEB_ELE_CD = CE_CD(DEB_ELE_SKILL, DEB_ELE_ID_1, DEB_ELE_ID_2)
	--Carga electrostatica
	local CAR_ELE_SKILL, CAR_ELE_ID_1, CAR_ELE_ID_2 = Match_CE(491156)
	local CAR_ELE_CD = CE_CD(CAR_ELE_SKILL, CAR_ELE_ID_1, CAR_ELE_ID_2)
	--Bola de fuego
	local BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2 = Match_CE(490204)
	local BOL_FUE_CD = CE_CD(BOL_FUE_SKILL, BOL_FUE_ID_1, BOL_FUE_ID_2)
	--Fenix elemental
	local FENIX_SKILL, FENIX_ID_1, FENIX_ID_2 = Match_CE(490239)
	local FENIX_CD = CE_CD(FENIX_SKILL, FENIX_ID_1, FENIX_ID_2)
	--Tormenta electrica
	local TOR_ELE_SKILL, TOR_ELE_ID_1, TOR_ELE_ID_2 = Match_CE(490244)
	local TOR_ELE_CD = CE_CD(TOR_ELE_SKILL, TOR_ELE_ID_1, TOR_ELE_ID_2)
	--Contrabajo
	local CON_SKILL, CON_ID_1, CON_ID_2 = Match_CE(1491444)
	local CON_CD = CE_CD(CON_SKILL, CON_ID_1, CON_ID_2)
	--Descarga
	local DES_SKILL, DES_ID_1, DES_ID_2 = Match_CE(490242)
	local DES_CD = CE_CD(DES_SKILL, DES_ID_1, DES_ID_2)
	--Lluvia de meteoritos
	local LLU_MET_SKILL, LLU_MET_ID_1, LLU_MET_ID_2 = Match_CE(490252)
	local LLU_MET_CD = CE_CD(LLU_MET_SKILL, LLU_MET_ID_1, LLU_MET_ID_2)
	--Campo estatico
	local CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2 = Match_CE(491172)
	local CAM_EST_CD = CE_CD(CAM_EST_SKILL, CAM_EST_ID_1, CAM_EST_ID_2)
	--Explosion electrica
	local EXP_ELE_SKILL, EXP_ELE_ID_1, EXP_ELE_ID_2 = Match_CE(491170)
	local EXP_ELE_CD = CE_CD(EXP_ELE_SKILL, EXP_ELE_ID_1, EXP_ELE_ID_2)
	--Ataque musical
	local ATA_MUS_SKILL, ATA_MUS_ID_1, ATA_MUS_ID_2 = Match_CE(1491443)
	local ATA_MUS_CD = CE_CD(ATA_MUS_SKILL, ATA_MUS_ID_1, ATA_MUS_ID_2)
	--Rugido
	local RUG_SKILL, RUG_ID_1, RUG_ID_2 = Match_CE(1492444)
	local RUG_CD = CE_CD(RUG_SKILL, RUG_ID_1, RUG_ID_2)
	--Descarga electrica
	local DES_ELE_SKILL, DES_ELE_ID_1, DES_ELE_ID_2 = Match_CE(491168)
	local DES_ELE_CD = CE_CD(DES_ELE_SKILL, DES_ELE_ID_1, DES_ELE_ID_2)

	if C_EngineSettings.Consumables then
		--Usar pocion del enano
		if foco <= 20 and CE_TARGET_IS_BOSS() and CE_UseItem(1244064) then
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and CE_UseItem(1244059) then
		--Usar frasco del espiritu elfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and CE_UseItem(1244063) then
		--Usar agua de los espiritus de antano
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		--Usar Phirius tipo E
		elseif pm <= MaxPm/10 and CE_UseItem(203503) then
		end
		CE_HEALING_ITEM()
	end

	local moving = CE_isMoving()
	local electrico = CE_BuffIdPlayer(502270)
	local aoe = _G.C_EngineSettings.AOE

	--BUFFOS
	--Canalizacion de energia
	if CAN_ENE_SKILL and CE_BuffIdPlayer(500296) == false then
		UseSkill(CAN_ENE_ID_1, CAN_ENE_ID_2);
	--FAST BUFFS
	--Debilitar elemental
	elseif _G.C_EngineSettings.FastBuffs and DEB_ELE_SKILL and DEB_ELE_CD <= 0.25 then
		UseSkill(DEB_ELE_ID_1, DEB_ELE_ID_2);
	--Carga electrostatica
	elseif _G.C_EngineSettings.FastBuffs and CAR_ELE_SKILL and CAR_ELE_CD <= 0.25 then
		UseSkill(CAR_ELE_ID_1, CAR_ELE_ID_2);
	--ROTACION
	--Bola de fuego
	elseif BOL_FUE_SKILL and BOL_FUE_CD <= 0.25 then
		UseSkill(BOL_FUE_ID_1, BOL_FUE_ID_2);
	--AOE
	--Fenix elemental
	elseif aoe and FENIX_SKILL and FENIX_CD <= 0.25 then
		UseSkill(FENIX_ID_1, FENIX_ID_2);
	--Tormenta electrica (aplica el debuff 500557)
	elseif aoe and TOR_ELE_SKILL and TOR_ELE_CD <= 0.25 and CE_DebuffIdTarget(500557) == false then
		UseSkill(TOR_ELE_ID_1, TOR_ELE_ID_2);
	--Descarga (entra en estado electrico)
	elseif aoe and DES_SKILL and DES_CD <= 0.25 and electrico == false then
		UseSkill(DES_ID_1, DES_ID_2);
	--Lluvia de meteoritos (version fuerte con 500557)
	elseif aoe and LLU_MET_SKILL and LLU_MET_CD <= 0.25 and CE_DebuffIdTarget(500557) and moving == false then
		UseSkill(LLU_MET_ID_1, LLU_MET_ID_2);
	--Campo estatico
	elseif aoe and CAM_EST_SKILL and CAM_EST_CD <= 0.25 then
		UseSkill(CAM_EST_ID_1, CAM_EST_ID_2);
	--SINGLE TARGET
	--Explosion electrica (golpe fuerte en estado electrico)
	elseif EXP_ELE_SKILL and EXP_ELE_CD <= 0.25 and electrico and moving == false then
		UseSkill(EXP_ELE_ID_1, EXP_ELE_ID_2);
	--Ataque musical (da el efecto 1505995)
	elseif ATA_MUS_SKILL and ATA_MUS_CD <= 0.25 and foco >= 5 and CE_BuffIdPlayer(1505995) == false and moving == false then
		UseSkill(ATA_MUS_ID_1, ATA_MUS_ID_2);
	--Rugido (consume 1505995)
	elseif RUG_SKILL and RUG_CD <= 0.25 and moving == false then
		UseSkill(RUG_ID_1, RUG_ID_2);
	--Descarga electrica (entra en estado electrico)
	elseif DES_ELE_SKILL and DES_ELE_CD <= 0.25 and electrico == false and moving == false then
		UseSkill(DES_ELE_ID_1, DES_ELE_ID_2);
	--Contrabajo (poco cooldown: al final para no bloquear la rotacion)
	elseif aoe and CON_SKILL and CON_CD <= 0.25 then
		UseSkill(CON_ID_1, CON_ID_2);
	end
end

function CE_MAGE_BARD_IMPORT()
	local Skills = { 1244064, 1244059, 1244063, 200192, 203503, 490218, 1491445, 491156, 490204, 490239, 490244, 490242, 490252, 491172, 491170, 1491443, 1492444, 491168, 1491444 }
	local conditions = {
		-- 1 Pocion del enano 1244064
		[1] = { [3]={ min="0", max="20", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 2 papas de col rizada 1244059
		[2] = { [12]={ id1="1500234", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 3 frasco del espiritu elfico 1244063
		[3] = { [12]={ id1="1500238", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 4 agua de los espiritus de antano 200192
		[4] = { [12]={ id1="500112", id2="0", id3="0", id4="0", status=true }, [17]={ id="1500238", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 5 Phirius tipo E 203503
		[5] = { [2]={ min="0", max="10", status=true }, [40]={ enable=true, status=true } },
		-- 6 Canalizacion de energia 490218
		[6] = { [12]={ id1="500296", id2="0", id3="0", id4="0", status=true } },
		-- 7 Debilitar elemental 1491445 (fast buffs)
		[7] = { [41]={ enable=true, status=true } },
		-- 8 Carga electrostatica 491156 (fast buffs)
		[8] = { [41]={ enable=true, status=true } },
		-- 9 Bola de fuego 490204
		[9] = {},
		-- 10 Fenix elemental 490239 (AOE)
		[10] = { [39]={ enable=true, status=true } },
		-- 11 Tormenta electrica 490244 (AOE, objetivo sin debuff 500557)
		[11] = { [33]={ id1="500557", id2="0", id3="0", id4="0", status=true }, [39]={ enable=true, status=true } },
		-- 12 Descarga 490242 (AOE, fuera de estado electrico)
		[12] = { [12]={ id1="502270", id2="0", id3="0", id4="0", status=true }, [39]={ enable=true, status=true } },
		-- 13 Lluvia de meteoritos 490252 (AOE, objetivo con debuff 500557)
		[13] = {
			[19]={ enable=true, status=true },
			[32]={ id1="500557", id2="0", id3="0", id4="0", status=true },
			[39]={ enable=true, status=true }
		},
		-- 14 Campo estatico 491172 (AOE)
		[14] = { [39]={ enable=true, status=true } },
		-- 15 Explosion electrica 491170 (en estado electrico)
		[15] = { [11]={ id1="502270", id2="0", id3="0", id4="0", status=true }, [19]={ enable=true, status=true } },
		-- 16 Ataque musical 1491443
		[16] = {
			[3]={ min="5", max="100", status=true },
			[12]={ id1="1505995", id2="0", id3="0", id4="0", status=true },
			[19]={ enable=true, status=true }
		},
		-- 17 Rugido 1492444
		[17] = { [19]={ enable=true, status=true } },
		-- 18 Descarga electrica 491168 (fuera de estado electrico)
		[18] = { [12]={ id1="502270", id2="0", id3="0", id4="0", status=true }, [19]={ enable=true, status=true } },
		-- 19 Contrabajo 1491444 (AOE, al final: poco cooldown)
		[19] = { [39]={ enable=true, status=true } }
	}
	local iss = {}
	local consumables = {
		[1244064] = true,
		[1244059] = true,
		[1244063] = true,
		[200192] = true,
		[203503] = true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
