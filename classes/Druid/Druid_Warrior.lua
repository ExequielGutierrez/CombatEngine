
--Lua ROUGE/WARLOCK BY NEORAXER 04-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_DRUID_WARRIOR()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/ Brujo")
	local pm = UnitMana("player")
	local ira = UnitSkill("player")	
    local MaxPm = UnitMaxMana("player")
    local hp = UnitHealth("player")
    local MaxHp = UnitMaxHealth("player")
	
	
	--Plegaria de concentración
	local PLE_CON_SKILL, PLE_CON_ID_1, PLE_CON_ID_2 = Match_CE(493530);
    --Bendición salvaje
    local BEN_SAL_SKILL, BEN_SAL_ID_1, BEN_SAL_ID_2 = Match_CE(493531);
	--Ayuda urgente
	local AYU_URG_SKILL, AYU_URG_ID_1, AYU_URG_ID_2 = Match_CE(494017);
    --Despertar de la naturaleza
    local DES_NAT_SKILL, DES_NAT_ID_1, DES_NAT_ID_2 = Match_CE(494364);
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
	--Foco de la madre naturaleza
	local FOC_MAD_SKILL, FOC_MAD_ID_1, FOC_MAD_ID_2 = Match_CE(493548);
	local FOC_MAD_CD = CE_CD(FOC_MAD_SKILL, FOC_MAD_ID_1, FOC_MAD_ID_2);
	--Fiera
	local FIE_SKILL, FIE_ID_1, FIE_ID_2 = Match_CE(490095);
	local FIE_CD = CE_CD(FIE_SKILL, FIE_ID_1, FIE_ID_2);
	--Vitalización corporal
	local VIT_COR_SKILL, VIT_COR_ID_1, VIT_COR_ID_2 = Match_CE(493532);
	local VIT_COR_CD = CE_CD(VIT_COR_SKILL, VIT_COR_ID_1, VIT_COR_ID_2);
	--Bendición de la naturaleza
	local BEN_NAT_SKILL, BEN_NAT_ID_1, BEN_NAT_ID_2 = Match_CE(494930);
	local BEN_NAT_CD = CE_CD(BEN_NAT_SKILL, BEN_NAT_ID_1, BEN_NAT_ID_2);
	--Ataque natural
	local ATA_NAT_SKILL, ATA_NAT_ID_1, ATA_NAT_ID_2 = Match_CE(494016);
	local ATA_NAT_CD = CE_CD(ATA_NAT_SKILL, ATA_NAT_ID_1, ATA_NAT_ID_2);
	--Furia
	local FURIA_SKILL, FURIA_ID_1, FURIA_ID_2 = Match_CE(494365);
	local FURIA_CD = CE_CD(FURIA_SKILL, FURIA_ID_1, FURIA_ID_2);
	--Cruce de espinas
	local CRU_ESP_SKILL, CRU_ESP_ID_1, CRU_ESP_ID_2 = Match_CE(499956);
	local CRU_ESP_CD = CE_CD(CRU_ESP_SKILL, CRU_ESP_ID_1, CRU_ESP_ID_2);
	--Perforación del corazón
	local PER_COR_SKILL, PER_COR_ID_1, PER_COR_ID_2 = Match_CE(494216);
	local PER_COR_CD = CE_CD(PER_COR_SKILL, PER_COR_ID_1, PER_COR_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(494949);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Ataque
	local ATAQUE_SKILL, ATAQUE_ID_1, ATAQUE_ID_2 = Match_CE(540000);
	local ATAQUE_CD = CE_CD(ATAQUE_SKILL, ATAQUE_ID_1, ATAQUE_ID_2);
	--Torbellino
	local TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2 = Match_CE(490133);
	local TORBELLINO_CD = CE_CD(TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2);
	--florecer de la vida
	local FLO_VID_SKILL, FLO_VID_ID_1, FLO_VID_ID_2 = Match_CE(493527);
	local FLO_VID_CD = CE_CD(FLO_VID_SKILL, FLO_VID_ID_1, FLO_VID_ID_2);
	
	
	   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if ira <= 20 and CE_UseItem(1244064) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/100 * 10 and CE_UseItem(203503) then
		end
		CE_HEALING_ITEM()
	end


	--Furioso--
	if FUR_SKILL and FUR_CD <= 0.25 and ira <= 20 and C_EngineSettings.FastBuffs then
		UseSkill(FUR_ID_1, FUR_ID_2);
	--Despertar ed la naturaleza
	elseif DES_NAT_SKILL and CE_BuffIdPlayer(505157) == false then
		UseSkill(DES_NAT_ID_1, DES_NAT_ID_2);
	--Ayuda Urgente
	elseif AYU_URG_SKILL and CE_BuffIdPlayer(504526) == false then
		UseSkill(AYU_URG_ID_1, AYU_URG_ID_2);
	--Florecer de la vida
	elseif FLO_VID_SKILL and FLO_VID_CD <= 0.25 and CE_BuffIdPlayer(503795) == false and hp < MaxHp/2 and pm > 1200 then
		UseSkill(FLO_VID_ID_1, FLO_VID_ID_2);
	end


	--BUFFS BOSS--

	--Foco de la madre naturaleza
	if CE_TARGET_IS_BOSS() or C_EngineSettings.FastBuffs then
		if FOC_MAD_SKILL and FOC_MAD_CD <= 0.25 then
			UseSkill(FOC_MAD_ID_1, FOC_MAD_ID_2);
		end
	end

	--Bendición de la naturaleza
	if BEN_NAT_SKILL and BEN_NAT_CD <= 0.25 and ira >= 15 and C_EngineSettings.FastBuffs then
		UseSkill(BEN_NAT_ID_1, BEN_NAT_ID_2);
	--Fiera
	elseif FIE_SKILL and FIE_CD <= 0.25 and ira >= 25 and C_EngineSettings.FastBuffs then
		UseSkill(FIE_ID_1, FIE_ID_2);
	--Torbellino
	elseif TORBELLINO_SKILL and TORBELLINO_CD <= 0.25 and ira >= 50 and _G.C_EngineSettings.AOE then
		UseSkill(TORBELLINO_ID_1, TORBELLINO_ID_2);	
	--Ataque natural
	elseif ATA_NAT_SKILL and ATA_NAT_CD <= 0.25 and ira >= 15 and  _G.C_EngineSettings.AOE then
		UseSkill(ATA_NAT_ID_1, ATA_NAT_ID_2);
	--Furia
	elseif FURIA_SKILL and FURIA_CD <= 0.25 and ira >= 20 and CE_BuffIdPlayer(503827) then
		UseSkill(FURIA_ID_1, FURIA_ID_2);
	--Cruce de espinas
	elseif CRU_ESP_SKILL and CRU_ESP_CD <= 0.25 and CE_BuffIdPlayer(503827) and ira >= 30 then
		UseSkill(CRU_ESP_ID_1, CRU_ESP_ID_2);
	--Perforación del corazón
	elseif PER_COR_SKILL and PER_COR_CD <= 0.25 then
		UseSkill(PER_COR_ID_1, PER_COR_ID_2);
	--Tajo
	elseif TAJO_SKILL and TAJO_CD <= 0.25 and ira >= 15 then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	--Ataque
	elseif ATAQUE_SKILL then
		UseSkill(ATAQUE_ID_1, ATAQUE_ID_2);
	end



end


