--Lua MAGE/SCOUT BY NEORAXER 17-05-2025
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com
local flag = 1;
function CE_MAGE_SCOUT()
	local pm = UnitMana("player")
	local foco = UnitSkill("player")
	--Rosa de fuego
	local ROSA_FUE_SKILL, ROSA_FUE_ID_1, ROSA_FUE_ID_2 = Match_CE(491343);
	local ROSA_FUE_CD = CE_CD(ROSA_FUE_SKILL, ROSA_FUE_ID_1, ROSA_FUE_ID_2);
	--Explosión de rosa de fuego
	local EXP_ROSA_SKILL, EXP_ROSA_ID_1, EXP_ROSA_ID_2 = Match_CE(493029);
	local EXP_ROSA_CD = CE_CD(EXP_ROSA_SKILL, EXP_ROSA_ID_1, EXP_ROSA_ID_2);
	--Tiro
	local TIRO_SKILL, TIRO_ID_1, TIRO_ID_2 = Match_CE(499598);
	local TIRO_CD = CE_CD(TIRO_SKILL, TIRO_ID_1, TIRO_ID_2);
	--Tormenta electrica
	local TORM_SKILL, TORM_ID_1, TORM_ID_2 = Match_CE(490244);
	local TORM_CD = CE_CD(TORM_SKILL, TORM_ID_1, TORM_ID_2);
	--Debilidad elemental
	local DEBILIDAD_SKILL, DEBILIDAD_ID_1, DEBILIDAD_ID_2 = Match_CE(497977);
	local DEBILIDAD_CD = CE_CD(DEBILIDAD_SKILL, DEBILIDAD_ID_1, DEBILIDAD_ID_2);
	--Arquería mágica
	local ARQ_SKILL, ARQ_ID_1, ARQ_ID_2 = Match_CE(499597);
	--Carga electrostática
	local CARGA_SKILL, CARGA_ID_1, CARGA_ID_2 = Match_CE(491156);
	local CARGA_CD = CE_CD(CARGA_SKILL, CARGA_ID_1, CARGA_ID_2);
	--Poder del viento
	local PODER_SKILL, PODER_ID_1, PODER_ID_2 = Match_CE(492926);
	local PODER_CD = CE_CD(PODER_SKILL, PODER_ID_1, PODER_ID_2);
	--Pet
	local PET_SKILL, PET_ID_1, PET_ID_2 = Match_CE(491577);
	--Explosión eléctrica
	local EXPL_ELEC_SKILL, EXPL_ELEC_ID_1, EXPL_ELEC_ID_2 = Match_CE(491170);
	local EXPL_ELEC_CD = CE_CD(EXPL_ELEC_SKILL, EXPL_ELEC_ID_1, EXPL_ELEC_ID_2);
	--Comprensión eléctrica
	local COMPR_SKILL, COMPR_ID_1, COMPR_ID_2 = Match_CE(491171);
	local COMPR_CD = CE_CD(COMPR_SKILL, COMPR_ID_1, COMPR_ID_2);
	--Descarga eléctrica
	local DESCARGA_SKILL, DESCARGA_ID_1, DESCARGA_ID_2 = Match_CE(491168);
	local DESCARGA_CD = CE_CD(DESCARGA_SKILL, DESCARGA_ID_1, DESCARGA_ID_2);
	--Campo estático
	local CAMPO_SKILL, CAMPO_ID_1, CAMPO_ID_2 = Match_CE(491172);
	local CAMPO_CD = CE_CD(CAMPO_SKILL, CAMPO_ID_1, CAMPO_ID_2);
	--Flecha de fuego
	local FF_SKILL, FF_ID_1, FF_ID_2 = Match_CE(491573);
	--Manto ignifugo
	local MANTO_SKILL, MANTO_ID_1, MANTO_ID_2 = Match_CE(490248);
	--Canalización de energía
	local CANA_SKILL, CANA_ID_1, CANA_ID_2 = Match_CE(490218);
	--Tormenta de rosa de fuego
	local TORM_ROSA_SKILL, TORM_ROSA_ID_1, TORM_ROSA_ID_2 = Match_CE(493028);
	local TORM_ROSA_CD = CE_CD(TORM_ROSA_SKILL, TORM_ROSA_ID_1, TORM_ROSA_ID_2);
	------------------- BUFFS -----------------
	--Arquería mágica
	if not CE_BuffIdPlayer(623185) and foco > 10 then
		UseSkill(ARQ_ID_1, ARQ_ID_2);
	--Mascota
	elseif not CE_READ_PET(491577) and not CE_BuffIdPlayer(623178) and not CE_isMoving() then
		UseSkill(PET_ID_1, PET_ID_2);
		return
	--Flecha de fuego
	elseif not CE_BuffIdPlayer(501955) then
		UseSkill(FF_ID_1, FF_ID_2);
	--Manto ignifugo
	elseif not CE_BuffIdPlayer(500366) then
		UseSkill(MANTO_ID_1, MANTO_ID_2);
	--Canalización de energía
	elseif not CE_BuffIdPlayer(500296) then
		UseSkill(CANA_ID_1, CANA_ID_2);
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
		if CARGA_CD <= 0.25 then
			UseSkill(CARGA_ID_1, CARGA_ID_2);
		elseif PODER_CD <= 0.25 and foco >= 50 then
			UseSkill(PODER_ID_1, PODER_ID_2);
		end
	end
	--prioridad tiro
	if C_EngineSettings.AOE and CE_DebuffIdTarget(501814) and TIRO_CD <= 0.25 then
		UseSkill(TIRO_ID_1, TIRO_ID_2);
	end
	--------------- Rotación ----------------
	--Debuf elemental
	if CE_TARGET_IS_BOSS() then
		if not CE_DebuffIdTarget(620189) and DEBILIDAD_CD <= 0.25 then
			UseSkill(DEBILIDAD_ID_1, DEBILIDAD_ID_2);
		end
	end
	--Tormenta de rosa de fuego
	if not CE_DebuffIdTarget(501814) then
		UseSkill(TORM_ROSA_ID_1, TORM_ROSA_ID_2);
	end
	--Rosa de fuego
	if not CE_DebuffIdTarget(501814) then
		UseSkill(ROSA_FUE_ID_1, ROSA_FUE_ID_2);
	--Tiro
	elseif not C_EngineSettings.AOE and CE_DebuffIdTarget(501814) == false and TIRO_CD <= 0.25 then
		UseSkill(TIRO_ID_1, TIRO_ID_2);
	--Explosion de division de la tierra ISS 80
	elseif (IsSpellUsable(490243)) and C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490243));
	--Explosión de rosa de fuego
	elseif EXP_ROSA_CD <= 0.25 and CE_DebuffIdTarget(501814) and foco >= 10 then
		UseSkill(EXP_ROSA_ID_1, EXP_ROSA_ID_2);
	--Tormenta
	elseif C_EngineSettings.AOE and TORM_CD <= 0.25 and not CE_isMoving() then
		SpellTargetUnit("mouseover")
		UseSkill(TORM_ID_1, TORM_ID_2);
	--Combo eléctrico
	elseif C_EngineSettings.AOE and CE_DebuffIdTarget(501814) and TIRO_CD <= 0.25 then
		UseSkill(TIRO_ID_1, TIRO_ID_2);
		flag = 1;
	elseif C_EngineSettings.AOE and CE_BuffIdPlayer(501554) and flag == 1 then
		UseSkill(CAMPO_ID_1, CAMPO_ID_2); -- campo estático
		flag = 0;
	elseif CE_BuffIdPlayer(502270) and EXPL_ELEC_CD <= 0.25 and (C_EngineSettings.AOE == false) and not CE_isMoving() then
		UseSkill(EXPL_ELEC_ID_1, EXPL_ELEC_ID_2); --explosión electrica
	elseif not CE_BuffIdPlayer(502270) and DESCARGA_CD <= 0.25 and not CE_isMoving() then
		UseSkill(DESCARGA_ID_1, DESCARGA_ID_2); -- descarga electrica
	elseif C_EngineSettings.AOE and CE_BuffIdPlayer(502270) and CE_BuffIdPlayer(501554) == false and COMPR_CD <= 0.25 then
		UseSkill(COMPR_ID_1, COMPR_ID_2);	-- comprensión electrica
	end
end
function CE_MAGE_SCOUT_IMPORT()
	local Skills = {1244059,1244063,200192,203503,499597,491577,491573,490248,490218,491156,497977,493028,491343,499598,490244,491170,491168,491171,491172}
	local conditions ={
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
		-- 5 Arquería mágica 499597
		{[12]={id1="623185",id2="0",id3="0",id4="0",status=true}},
		-- 6 Mascota 491577
		{
			[12]={id1="623178",id2="0",id3="0",id4="0",status=true},
			[26]={status=true,time="3"}
		},
		-- 7 Flecha de fuego 491573
		{[12]={id1="501955",id2="0",id3="0",id4="0",status=true}},
		-- 8 Manto ignifugo 490248
		{[12]={id1="500366",id2="0",id3="0",id4="0",status=true}},
		-- 9 Canalización de energía 490218
		{[12]={id1="500296",id2="0",id3="0",id4="0",status=true}},
		-- 10 Carga electrostática 491156
		{[12]={id1="502270",id2="0",id3="0",id4="0",status=true}},
		-- 11 Debilidad elemental 497977
		{[33]={id1="620189",id2="0",id3="0",id4="0",status=true}},
		-- 12 Tormenta de rosa de fuego 493028
		{[3]={max="200",min="15",status=true}},
		-- 13 Rosa de fuego 491343
		{},
		-- 14 Tiro 499598
		{},
		-- 15 Tormenta 490244
		{[43]={enable=true,status=true}},
		-- 16 Explosión electrica 491170
		{[11]={id1="502270",id2="0",id3="0",id4="0",status=true}},
		-- 17 Descarga electrica 491168
		{},
		-- 18 Comprensión electrica 491171
		{
			[11]={id1="502270",id2="0",id3="0",id4="0",status=true},
			[12]={id1="620209",id2="0",id3="0",id4="0",status=true}
		},
		-- 19 Campo estático 491172
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