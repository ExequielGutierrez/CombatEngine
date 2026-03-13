
--Lua WARRIOR/WARDEN BY NEORAXER 25-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_WARRIOR_WARDEN()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando GUERRERO/ MAGO")
	local ira = UnitMana("player")
	local pm = UnitSkill("player")
    local MaxPm = UnitMaxMana("player")
	
	--Agresividad
	local AGRE_SKILL, AGRE_ID_1, AGRE_ID_2 = Match_CE(490123);	
	--Escudo de zarzas
	local ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2 = Match_CE(493642);	
	--Credo de batalla
	local CRE_BAT_SKILL, CRE_BAT_ID_1, CRE_BAT_ID_2 = Match_CE(494624);	
	--Ataque sorpresa
	local ATA_SOR_SKILL, ATA_SOR_ID_1, ATA_SOR_ID_2 = Match_CE(494068);	
	local ATA_SOR_CD = CE_CD(ATA_SOR_SKILL, ATA_SOR_ID_1, ATA_SOR_ID_2);
	--Torbellino Salvaje
	local TOR_SAL_SKILL, TOR_SAL_ID_1, TOR_SAL_ID_2 = Match_CE(499986);	
	local TOR_SAL_CD = CE_CD(TOR_SAL_SKILL, TOR_SAL_ID_1, TOR_SAL_ID_2);	
	--Ataque Sagaz
	local ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2 = Match_CE(494973);	
	local ATA_SAG_CD = CE_CD(ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2);	
	--Debilitador de ataques
	local DEB_ATA_SKILL, DEB_ATA_ID_1, DEB_ATA_ID_2 = Match_CE(494032);	
	local DEB_ATA_CD = CE_CD(ATA_SAG_SKILL, DEB_ATA_ID_1, DEB_ATA_ID_2);	
	--Flanco abierto
	local FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2 = Match_CE(491136);	
	local FLA_ABI_CD = CE_CD(FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(494974);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Ataque táctico
	local ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2 = Match_CE(491142);
	local ATA_TAC_CD = CE_CD(ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2);
	--Corte cargado
	local COR_CARG_SKILL, COR_CARG_ID_1, COR_CARG_ID_2 = Match_CE(493395);
	local COR_CARG_CD = CE_CD(COR_CARG_SKILL, COR_CARG_ID_1, COR_CARG_ID_2);
	--Poder feroz -> + daño
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);		
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
    --Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(490095);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);
	--Frenesí
	local FREN_SKILL, FREN_ID_1, FREN_ID_2 = Match_CE(490493);
	local FREN_CD = CE_CD(FREN_SKILL, FREN_ID_1, FREN_ID_2);	
	--Despertar de la naturaleza
	local DES_NAT_SKILL, DES_NAT_ID_1, DES_NAT_ID_2 = Match_CE(499495);
	local DES_NAT_CD = CE_CD(DES_NAT_SKILL, DES_NAT_ID_1, DES_NAT_ID_2);		
	--Torbellino
	local TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2 = Match_CE(490133);
	local TORBELLINO_CD = CE_CD(TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2);
	--Escisión lunar
	local ESC_LUN_SKILL, ESC_LUN_ID_1, ESC_LUN_ID_2 = Match_CE(490121);
	local ESC_LUN_CD = CE_CD(ESC_LUN_SKILL, ESC_LUN_ID_1, ESC_LUN_ID_2);	
	--Ciclón devastador
	local CICLON_SKILL, CICLON_ID_1, CICLON_ID_2 = Match_CE(490147);
	local CICLON_CD = CE_CD(CICLON_SKILL, CICLON_ID_1, CICLON_ID_2);	
	--Temblor de aire
	local TEM_AIR_SKILL, TEM_AIR_ID_1, TEM_AIR_ID_2 = Match_CE(494625);
	local TEM_AIR_CD = CE_CD(TEM_AIR_SKILL, TEM_AIR_ID_1, TEM_AIR_ID_2);
	--Poder del espiritu del bosque
	local POD_ESP_BOS_SKILL, POD_ESP_BOS_ID_1, POD_ESP_BOS_ID_2 = Match_CE(493392);
	local POD_ESP_BOS_CD = CE_CD(POD_ESP_BOS_SKILL, POD_ESP_BOS_ID_1, POD_ESP_BOS_ID_2);
	
	
	
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
				
    --------------------------------------------------------------------------------------------------------------------------------------------
	--BUFFOS BASE
	
	--Escudo de zarzas
	if ESC_ZAR_SKILL and (CE_BuffIdPlayer(503958) == false) then
		UseSkill(ESC_ZAR_ID_1, ESC_ZAR_ID_2);
	--Credo de batalla
	elseif CRE_BAT_SKILL and (CE_BuffIdPlayer(505208) == false) then
		UseSkill(CRE_BAT_ID_1, CRE_BAT_ID_2);
	--Agresividad
    elseif AGRE_SKILL and (CE_BuffIdPlayer(500107) == false)
        then UseSkill(AGRE_ID_1, AGRE_ID_2);
	end
	
	
	--BUFFOS ON BOSS
	if CE_TARGET_IS_BOSS() then	
		--Frenesí
		if FREN_SKILL and FREN_CD <= 0.25 then
			UseSkill(FREN_ID_1, FREN_ID_2);
		--Despertar de la naturaleza
		elseif DES_NAT_SKILL and DES_NAT_CD <= 0.25 then
			UseSkill(DES_NAT_ID_1, DES_NAT_ID_2);
		end
	
	end
	
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		--Fiera
		if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		--Furioso
		elseif FUR_SKILL and FUR_CD <= 0.25 and ira <= 40 then
			UseSkill(FUR_ID_1, FUR_ID_2)
		--Poder feroz
		elseif POD_FER_SKILL and POD_FER_CD <= 0.25 then
			UseSkill(POD_FER_ID_1, POD_FER_ID_2);
		end	
	end
		--AOE
	if _G.C_EngineSettings.AOE then
		--Torbellino
		if TORBELLINO_SKILL and TORBELLINO_CD <= 0.25 and ira >= 50 then
			UseSkill(TORBELLINO_ID_1, TORBELLINO_ID_2);
		--Escisión lunar
		elseif ESC_LUN_SKILL and ESC_LUN_CD <= 0.25 and ira >= 50 then
			UseSkill(ESC_LUN_ID_1, ESC_LUN_ID_2);
		--Ciclón
		elseif CICLON_SKILL and CICLON_CD <= 0.25 and ira >= 35 then
			UseSkill(CICLON_ID_1, CICLON_ID_2);
		--Temblor de aire
		elseif TEM_AIR_SKILL and TEM_AIR_CD <= 0.25 and pm >= MaxPm/20 then
			UseSkill(TEM_AIR_ID_1, TEM_AIR_ID_2);
		--Poder del espiritu del bosque	
		elseif POD_ESP_BOS_SKILL and POD_ESP_BOS_CD <= 0.25 then
			UseSkill(POD_ESP_BOS_ID_1, POD_ESP_BOS_ID_2);
		end
	end
	
	--ROTACION--
	
	--Ataque sorpresa
	if ATA_SOR_CD <= 0.25 and CE_AFE(504540, 20) then
		UseSkill(ATA_SOR_ID_1, ATA_SOR_ID_2);
	--Debilitador de ataques
	elseif DEB_ATA_SKILL and DEB_ATA_CD <= 0.25 and CE_SELF_DEBUFF(501502) then
		UseSkill(DEB_ATA_ID_1, DEB_ATA_ID_2);
	--Torbellino Salvaje
	elseif TOR_SAL_SKILL and TOR_SAL_CD <= 0.25 and CE_AFE_2(504901, 20) and ira >= 20 then
		UseSkill(TOR_SAL_ID_1, TOR_SAL_ID_2);
	--Corte cargado
	elseif COR_CARG_SKILL and COR_CARG_CD <= 0.25 and _G.C_EngineSettings.AOE == false then
		UseSkill(COR_CARG_ID_1, COR_CARG_ID_2);
	--Tajo
	elseif TAJO_SKILL and TAJO_CD <= 0.25 and ira >=25 and (CE_SELF_DEBUFF(500081) == false) then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	--Ataque Sagaz	
	elseif ATA_SAG_SKILL and ATA_SAG_CD <= 0.25 and ira >= 25 and CE_SELF_DEBUFF(500081) and (CE_SELF_DEBUFF(501502) == false )then
		UseSkill(ATA_SAG_ID_1, ATA_SAG_ID_2);	
	--Flanco abierto
	elseif DEB_ATA_SKILL and DEB_ATA_CD <= 0.25 and CE_SELF_DEBUFF(501502) then
		UseSkill(DEB_ATA_ID_1, DEB_ATA_ID_2);
	--Ataque táctico
	elseif FLA_ABI_SKILL and FLA_ABI_CD <= 0.25 and ira >= 10 and CE_SELF_DEBUFF(500081) then
		UseSkill(FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Corte cargado
	elseif COR_CARG_SKILL and COR_CARG_CD <= 0.25 and _G.C_EngineSettings.AOE == false then
		UseSkill(COR_CARG_ID_1, COR_CARG_ID_2);
	elseif _G.C_EngineSettings.AOE and  POD_ESP_BOS_CD <= 0.25 then
		UseSkill(POD_ESP_BOS_ID_1, POD_ESP_BOS_ID_2);
	end
	
	
end
	
	
	