
--Lua WARRIOR/WARDEN BY NEORAXER 25-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_WARRIOR_WARDEN()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando GUERRERO/ MAGO")
	local ira = UnitMana("player")
	local pm = UnitSkill("player")
    local MaxPm = UnitMaxMana("player")

	--Poder feroz
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);
	--Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(490095);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);
	--Berserk salvaje
	local BER_SAL_SKILL, BER_SAL_ID_1, BER_SAL_ID_2 = Match_CE(499495);
	local BER_SAL_CD = CE_CD(BER_SAL_SKILL, BER_SAL_ID_1, BER_SAL_ID_2);
	--Soldados, a la carga!
	local SOL_CAR_SKILL, SOL_CAR_ID_1, SOL_CAR_ID_2 = Match_CE(495187);
	local SOL_CAR_CD = CE_CD(SOL_CAR_SKILL, SOL_CAR_ID_1, SOL_CAR_ID_2);
	--Ataque en carga
	local ATA_CAR_SKILL, ATA_CAR_ID_1, ATA_CAR_ID_2 = Match_CE(490129);
	local ATA_CAR_CD = CE_CD(ATA_CAR_SKILL, ATA_CAR_ID_1, ATA_CAR_ID_2);
	--Ciclon devastador
	local CICLON_SKILL, CICLON_ID_1, CICLON_ID_2 = Match_CE(490147);
	local CICLON_CD = CE_CD(CICLON_SKILL, CICLON_ID_1, CICLON_ID_2);
	--Temblor de aire
	local TEM_AIR_SKILL, TEM_AIR_ID_1, TEM_AIR_ID_2 = Match_CE(494625);
	local TEM_AIR_CD = CE_CD(TEM_AIR_SKILL, TEM_AIR_ID_1, TEM_AIR_ID_2);
	--Corte de moral
	local COR_MOR_SKILL, COR_MOR_ID_1, COR_MOR_ID_2 = Match_CE(1491760);
	local COR_MOR_CD = CE_CD(COR_MOR_SKILL, COR_MOR_ID_1, COR_MOR_ID_2);
	--Torbellino salvaje
	local TOR_SAL_SKILL, TOR_SAL_ID_1, TOR_SAL_ID_2 = Match_CE(1493775);
	local TOR_SAL_CD = CE_CD(TOR_SAL_SKILL, TOR_SAL_ID_1, TOR_SAL_ID_2);
	--Ataque sagaz
	local ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2 = Match_CE(494973);
	local ATA_SAG_CD = CE_CD(ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2);
	--Debilitador de ataques
	local DEB_ATA_SKILL, DEB_ATA_ID_1, DEB_ATA_ID_2 = Match_CE(494032);
	local DEB_ATA_CD = CE_CD(DEB_ATA_SKILL, DEB_ATA_ID_1, DEB_ATA_ID_2);
	--Flanco abierto
	local FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2 = Match_CE(491136);
	local FLA_ABI_CD = CE_CD(FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(494974);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Corte cargado
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(493395);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2);

	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if ira <= 20 and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then	
		--Usar estimulante fuerte
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(501321) == false and  CE_UseItem(200173) and CE_BuffIdPlayer(1500237) == false then
		--Usar Frasco de agilidad elfica
		elseif CE_TARGET_IS_BOSS() and (CE_BuffTimeLeftById(501321) == true) and  CE_UseItem(1244062) and CE_BuffIdPlayer(1500237) == false then
		--Usar costilla de primera
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/3 and CE_UseItem(203503) then
		end
		CE_HEALING_ITEM()
	end

	--ROTACION (misma prioridad que el preset custom WARRIORWARDEN)
	--Poder feroz
	if POD_FER_SKILL and POD_FER_CD <= 0.25 then
		UseSkill(POD_FER_ID_1, POD_FER_ID_2);
	--Fiera
	elseif FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 and ira <= 100 then
		UseSkill(FIERA_ID_1, FIERA_ID_2);
	--Berserk salvaje
	elseif BER_SAL_SKILL and BER_SAL_CD <= 0.25 and CE_BuffIdPlayer(623004) == false then
		UseSkill(BER_SAL_ID_1, BER_SAL_ID_2);
	--Soldados, a la carga!
	elseif SOL_CAR_SKILL and SOL_CAR_CD <= 0.25 and ira >= 0 and ira <= 50 then
		UseSkill(SOL_CAR_ID_1, SOL_CAR_ID_2);
	--Ataque en carga
	elseif ATA_CAR_SKILL and ATA_CAR_CD <= 0.25 then
		UseSkill(ATA_CAR_ID_1, ATA_CAR_ID_2);
	--Ciclon devastador
	elseif CICLON_SKILL and CICLON_CD <= 0.25 and ira >= 35 and ira <= 100 and _G.C_EngineSettings.AOE then
		UseSkill(CICLON_ID_1, CICLON_ID_2);
	--Temblor de aire
	elseif TEM_AIR_SKILL and TEM_AIR_CD <= 0.25 and _G.C_EngineSettings.AOE then
		UseSkill(TEM_AIR_ID_1, TEM_AIR_ID_2);
	--Corte de moral
	elseif COR_MOR_SKILL and COR_MOR_CD <= 0.25 and _G.C_EngineSettings.AOE and CE_COND63({conditions = {[63] = {status = true}}}) then
		UseSkill(COR_MOR_ID_1, COR_MOR_ID_2);
	--Torbellino salvaje
	elseif TOR_SAL_SKILL and TOR_SAL_CD <= 0.25 and ira >= 20 and ira <= 200 then
		UseSkill(TOR_SAL_ID_1, TOR_SAL_ID_2);
	--Ataque sagaz
	elseif ATA_SAG_SKILL and ATA_SAG_CD <= 0.25 and ira >= 20 and ira <= 200 and CE_DebuffIdTarget(501502) == false then
		UseSkill(ATA_SAG_ID_1, ATA_SAG_ID_2);
	--Debilitador de ataques
	elseif DEB_ATA_SKILL and DEB_ATA_CD <= 0.25 and CE_DebuffIdTarget(501502) then
		UseSkill(DEB_ATA_ID_1, DEB_ATA_ID_2);
	--Flanco abierto
	elseif FLA_ABI_SKILL and FLA_ABI_CD <= 0.25 and ira >= 10 and ira <= 200 and CE_DebuffIdTarget(501502) then
		UseSkill(FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Tajo
	elseif TAJO_SKILL and TAJO_CD <= 0.25 and ira >= 25 and ira <= 500 then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	--Corte cargado
	elseif COR_CAR_SKILL and COR_CAR_CD <= 0.25 then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);
	end

end

function CE_WARRIOR_WARDEN_IMPORT()
	--Skills          [1]     [2]     [3]     [4]     [5]     [6]     [7]     [8]      [9]      [10]    [11]    [12]    [13]    [14]
	local Skills = { 493406, 490095, 499495, 495187, 490129, 490147, 494625, 1491760, 1493775, 494973, 494032, 491136, 494974, 493395 }
	local conditions = {
		-- 1 Poder feroz 493406
		[1] = {},
		-- 2 Fiera 490095
		[2] = { [6]={ max="100", min="25", status=true } },
		-- 3 Berserk salvaje 499495
		[3] = { [12]={ id1="623004", id2="0", id3="0", id4="0", status=true } },
		-- 4 Soldados, a la carga! 495187
		[4] = { [6]={ max="50", min="0", status=true } },
		-- 5 Ataque en carga 490129
		[5] = {},
		-- 6 Ciclon devastador 490147
		[6] = { [6]={ max="100", min="35", status=true }, [39]={ enable=true, status=true } },
		-- 7 Temblor de aire 494625
		[7] = { [39]={ enable=true, status=true } },
		-- 8 Corte de moral 1491760
		[8] = { [39]={ enable=true, status=true }, [63]={ enable=true, status=true } },
		-- 9 Torbellino salvaje 1493775
		[9] = { [6]={ max="200", min="20", status=true } },
		-- 10 Ataque sagaz 494973
		[10] = {
			[6]={ max="200", min="20", status=true },
			[33]={ id1="501502", id2="0", id3="0", id4="0", status=true }
		},
		-- 11 Debilitador de ataques 494032
		[11] = { [32]={ id1="501502", id2="0", id3="0", id4="0", status=true } },
		-- 12 Flanco abierto 491136
		[12] = {
			[6]={ max="200", min="10", status=true },
			[32]={ id1="501502", id2="0", id3="0", id4="0", status=true }
		},
		-- 13 Tajo 494974
		[13] = { [6]={ max="500", min="25", status=true } },
		-- 14 Corte cargado 493395
		[14] = {}
	}
	local iss = {}
	local consumables = {}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
