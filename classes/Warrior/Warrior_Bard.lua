
--Lua WARRIOR/WARDEN BY NEORAXER 25-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_WARRIOR_BARD()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando GUERRERO/ MAGO")
	local ira = UnitMana("player")
	local foco = UnitSkill("player")
    
	
	--Agresividad
	local AGRE_SKILL, AGRE_ID_1, AGRE_ID_2 = Match_CE(490123);	
	--Locura enfocada
	local LOC_ENF_SKILL, LOC_ENF_ID_1, LOC_ENF_ID_2 = Match_CE(1491209);
	--Fuga
	local FUGA_SKILL, FUGA_ID_1, FUGA_ID_2 = Match_CE(1491211);
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
    --Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(490095);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);
	--Ataque sorpresa
	local ATA_SOR_SKILL, ATA_SOR_ID_1, ATA_SOR_ID_2 = Match_CE(490129);
	local ATA_SOR_CD = CE_CD(ATA_SOR_SKILL, ATA_SOR_ID_1, ATA_SOR_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(490053);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Ataque táctico
	local ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2 = Match_CE(491142);
	local ATA_TAC_CD = CE_CD(ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2);
	--Ataque de sondeo
	local ATA_SON_SKILL, ATA_SON_ID_1, ATA_SON_ID_2 = Match_CE(1491540);
	local ATA_SON_CD = CE_CD(ATA_SON_SKILL, ATA_SON_ID_1, ATA_SON_ID_2);
	--Flanco abierto
	local FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2 = Match_CE(1491437);	
	local FLA_ABI_CD = CE_CD(FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Medidas fatales
	local MED_FAT_SKILL, MED_FAT_ID_1, MED_FAT_ID_2 = Match_CE(1491210);	
	local MED_FAT_CD = CE_CD(MED_FAT_SKILL, MED_FAT_ID_1, MED_FAT_ID_2);
	--Veneno rapaz
	local VEN_RAP_SKILL, VEN_RAP_ID_1, VEN_RAP_ID_2 = Match_CE(1491212);	
	local VEN_RAP_CD = CE_CD(VEN_RAP_SKILL, VEN_RAP_ID_1, VEN_RAP_ID_2);
	--Torbellino
	local TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2 = Match_CE(1491539);
	local TORBELLINO_CD = CE_CD(TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2);
	--Ciclón 
	local CICLON_SKILL, CICLON_ID_1, CICLON_ID_2 = Match_CE(1491541);
	local CICLON_CD = CE_CD(CICLON_SKILL, CICLON_ID_1, CICLON_ID_2);
	
	
	
	
	if C_EngineSettings.Consumables then
		--Usar poción del enano
		if ira <= 20 or foco <= 20 and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then	
		--Usar estimulante fuerte
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(501321) == false and  CE_UseItem(200173) and CE_BuffIdPlayer(1500237) == false then
		--Usar Frasco de agilidad elfica
		elseif CE_TARGET_IS_BOSS() and (CE_BuffTimeLeftById(501321) == true) and  CE_UseItem(1244062) and CE_BuffIdPlayer(1500237) == false then
		--Usar costilla de primera
		elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end
				
    --------------------------------------------------------------------------------------------------------------------------------------------
	--BUFFOS BASE

	--Agresividad
    if AGRE_SKILL and (CE_BuffIdPlayer(500107) == false)
        then UseSkill(AGRE_ID_1, AGRE_ID_2);
	end
	
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		elseif FUR_SKILL and FUR_CD <= 0.25 and ira <= 40 then
			UseSkill(FUR_ID_1, FUR_ID_2)
		end	
	end

	
	--Locura enfocada
	if foco <= 20 and ira >= 60 and LOC_ENF_SKILL and (CE_BuffIdPlayer(1502054) == false) then 
		UseSkill(LOC_ENF_ID_1, LOC_ENF_ID_2);
	elseif ira <= 50 or foco >= 50 and CE_BuffIdPlayer(1502054) then
		CancelPlayerBuff(CE_GET_INDEX_BUFF(1502054));
	end
	
	--Fuga
	if FUGA_SKILL and foco >= 2 and (CE_BuffIdPlayer(1502058) == false) and _G.C_EngineSettings.AOE then
		UseSkill(FUGA_ID_1, FUGA_ID_2);
	end
	
	
	
	--ROTACION--
	
	--Embestida
	if ATA_SOR_SKILL and ATA_SOR_CD <= 0.25 then
		UseSkill(ATA_SOR_ID_1, ATA_SOR_ID_2);
		--Ciclón devastador
	elseif CICLON_SKILL and CICLON_CD <= 0.25 and ira >= 35 and _G.C_EngineSettings.AOE and CE_WEAPON_TYPE("axe") and UnitName("target") == CE_toName(139892) then
		UseSkill(CICLON_ID_1, CICLON_ID_2);
		--Veneno rapaz
	elseif VEN_RAP_SKILL and VEN_RAP_CD <= 0.25 and foco >= 20 and (CE_DebuffIdTarget(1502061) == false) then
		UseSkill(VEN_RAP_ID_1, VEN_RAP_ID_2)
	--Tajo
	elseif TAJO_SKILL and TAJO_CD <= 0.25 and ira >= 25 and (CE_SELF_DEBUFF(500081) == false) then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	--Ciclón devastador
	elseif CICLON_SKILL and CICLON_CD <= 0.25 and ira >= 35 and _G.C_EngineSettings.AOE and CE_WEAPON_TYPE("axe") then
		UseSkill(CICLON_ID_1, CICLON_ID_2);
	--Medidas fatales
	elseif MED_FAT_SKILL and MED_FAT_CD <= 0.25 and foco >= 25 and CE_DebuffIdTarget(501503) then
		UseSkill(MED_FAT_ID_1, MED_FAT_ID_2);
	--Ataque de sondeo
	elseif ATA_SON_SKILL and ATA_SON_CD <= 0.25 and ira >= 20 and CE_SELF_DEBUFF(500081) and (CE_SELF_DEBUFF(501502) == false) then
		UseSkill(ATA_SON_ID_1, ATA_SON_ID_2);
	--Flanco abierto
	elseif FLA_ABI_SKILL and FLA_ABI_CD <= 0.25 and CE_SELF_DEBUFF(501502) and ira >= 10 and (CE_SELF_DEBUFF(501503) == false) then
		UseSkill(FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Torbellino
	elseif TORBELLINO_SKILL and TORBELLINO_CD <= 0.25 and ira >= 50 and _G.C_EngineSettings.AOE then
		UseSkill(TORBELLINO_ID_1, TORBELLINO_ID_2);
	--Veneno rapaz
	elseif VEN_RAP_SKILL and VEN_RAP_CD <= 0.25 and foco >= 20 then
		UseSkill(VEN_RAP_ID_1, VEN_RAP_ID_2);
	end 
	
	
	
	
end

