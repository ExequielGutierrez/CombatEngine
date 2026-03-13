
--Lua WARRIOR/SCOUT BY NEORAXER 25-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_WARRIOR_SCOUT()

    --DEFAULT_CHAT_FRAME:AddMessage("Usando GUERRERO/ MAGO")
	local ira = UnitMana("player")
	local foco = UnitSkill("player")
    	
	
	--Apuntar a la herida
	local APU_HER_SKILL, APU_HER_ID_1, APU_HER_ID_2 = Match_CE(491451);	
	local APU_HER_CD = CE_CD(APU_HER_SKILL, APU_HER_ID_1, APU_HER_ID_2);	
	--Aliento de espada
	local ALI_ESP_SKILL, ALI_ESP_ID_1, ALI_ESP_ID_2 = Match_CE(492615);	
	local ALI_ESP_CD = CE_CD(ALI_ESP_SKILL, ALI_ESP_ID_1, ALI_ESP_ID_2);
	--Ataque Sagaz
	local ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2 = Match_CE(491133);	
	local ATA_SAG_CD = CE_CD(ATA_SAG_SKILL, ATA_SAG_ID_1, ATA_SAG_ID_2);	
	--Flanco abierto
	local FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2 = Match_CE(491136);	
	local FLA_ABI_CD = CE_CD(FLA_ABI_SKILL, FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Ataque táctico
	local ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2 = Match_CE(491142);
	local ATA_TAC_CD = CE_CD(ATA_TAC_SKILL, ATA_TAC_ID_1, ATA_TAC_ID_2);
    --Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
	--El último duelo
	local ULT_DUE_SKILL, ULT_DUE_ID_1, ULT_DUE_ID_2 = Match_CE(493247);
	local ULT_DUE_CD = CE_CD(ULT_DUE_SKILL, ULT_DUE_ID_1, ULT_DUE_ID_2);
	--Rompecráneos
	local ROM_CRA_SKILL, ROM_CRA_ID_1, ROM_CRA_ID_2 = Match_CE(499625);
	local ROM_CRA_CD = CE_CD(ROM_CRA_SKILL, ROM_CRA_ID_1, ROM_CRA_ID_2);
    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(1490275);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);
	--Tajo
	local TAJO_SKILL, TAJO_ID_1, TAJO_ID_2 = Match_CE(1490276);
	local TAJO_CD = CE_CD(TAJO_SKILL, TAJO_ID_1, TAJO_ID_2);
	--Torbellino
	local TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2 = Match_CE(490133);
	local TORBELLINO_CD = CE_CD(TORBELLINO_SKILL, TORBELLINO_ID_1, TORBELLINO_ID_2);
	--Escisión lunar
	local ESC_LUN_SKILL, ESC_LUN_ID_1, ESC_LUN_ID_2 = Match_CE(491453);
	local ESC_LUN_CD = CE_CD(ESC_LUN_SKILL, ESC_LUN_ID_1, ESC_LUN_ID_2);	
	--Ciclón devastador
	local CICLON_SKILL, CICLON_ID_1, CICLON_ID_2 = Match_CE(490147);
	local CICLON_CD = CE_CD(CICLON_SKILL, CICLON_ID_1, CICLON_ID_2);	
	--Agresividad
	local AGRE_SKILL, AGRE_ID_1, AGRE_ID_2 = Match_CE(490123);		
	--Furioso
	local FUR_SKILL, FUR_ID_1, FUR_ID_2 = Match_CE(490492);
	local FUR_CD = CE_CD(FUR_SKILL, FUR_ID_1, FUR_ID_2);
    --Fiera
	local FIERA_SKILL, FIERA_ID_1, FIERA_ID_2 = Match_CE(490095);
	local FIERA_CD = CE_CD(FIERA_SKILL, FIERA_ID_1, FIERA_ID_2);
	--Frenesí
	local FREN_SKILL, FREN_ID_1, FREN_ID_2 = Match_CE(490493);
	local FREN_CD = CE_CD(FREN_SKILL, FREN_ID_1, FREN_ID_2);	

	
	
	
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
	if AGRE_SKILL and (CE_BuffIdPlayer(500107) == false)
        then UseSkill(AGRE_ID_1, AGRE_ID_2);	
	--Furioso
	end
	
	
	--BUFFOS ON BOSS
	if CE_TARGET_IS_BOSS() then	
		if FREN_SKILL and FREN_CD <= 0.25 then
			UseSkill(FREN_ID_1, FREN_ID_2);
		end
	
	end
	
	--Fast Buffs
	if _G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS() then
		if FIERA_SKILL and FIERA_CD <= 0.25 and ira >= 25 then
			UseSkill(FIERA_ID_1, FIERA_ID_2)
		elseif FUR_SKILL and FUR_CD <= 0.25 and ira <= 40 then
			UseSkill(FUR_ID_1, FUR_ID_2)
		end	
	end
	
	
	--ROTACION--
	--AOE
	if _G.C_EngineSettings.AOE then
		--Torbellino
		if TORBELLINO_SKILL and TORBELLINO_CD <= 0.25 and ira >= 50 then
			UseSkill(TORBELLINO_ID_1, TORBELLINO_ID_2);
		--Escisión lunar
		elseif ESC_LUN_SKILL and ESC_LUN_CD <= 0.25 and ira >= 40 then
			UseSkill(ESC_LUN_ID_1, ESC_LUN_ID_2);
		--Ciclón
		elseif CICLON_SKILL and CICLON_CD <= 0.25 and ira >= 35 and IsSpellUsable(490130) then
			UseSkill(CICLON_ID_1, CICLON_ID_2);
		end
	end
	
	
	--Apuntar a la herida
	if APU_HER_CD <= 0.25 then
		UseSkill(APU_HER_ID_1, APU_HER_ID_2);
	--Aliento de espada
	elseif ALI_ESP_CD <= 0.25 and foco >= 15 then
		UseSkill(ALI_ESP_ID_1, ALI_ESP_ID_2);
	--Ataque Sagaz
	elseif ATA_SAG_SKILL and ATA_SAG_CD <= 0.25 and CE_SELF_DEBUFF(500081) and (CE_SELF_DEBUFF(501502) == false) and ira >= 20 then
		UseSkill(ATA_SAG_ID_1, ATA_SAG_ID_2);
	--Flanco abierto
	elseif FLA_ABI_SKILL and FLA_ABI_CD <= 0.25 and CE_SELF_DEBUFF(501502) and ira >= 10 then
		UseSkill(FLA_ABI_ID_1, FLA_ABI_ID_2);
	--Ataque táctico
	elseif ATA_TAC_SKILL and ATA_TAC_CD <= 0.25 and CE_SELF_DEBUFF(500081) and ira >= 15 then
		UseSkill(ATA_TAC_ID_1, ATA_TAC_ID_2);
	--El último duelo
	elseif ULT_DUE_SKILL and ULT_DUE_CD <= 0.25 and ira >= 20 then
		UseSkill(ULT_DUE_ID_1, ULT_DUE_ID_2);

	--Tiro
	--elseif TIR_SKILL and TIR_CD <= 0.25 then
	--	UseSkill(TIR_ID_1, TIR_ID_2);
	--Tajo
	elseif TAJO_CD <= 0.25 and ira >= 10 and (CE_SELF_DEBUFF(500081) == false) then
		UseSkill(TAJO_ID_1, TAJO_ID_2);
	--Golpe a las articulaciones
	elseif GOL_ART_CD <= 0.25 and foco >= 15 then
		UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
	--Rompecráneos
	elseif ROM_CRA_CD <= 0.25 then
		UseSkill(ROM_CRA_ID_1, ROM_CRA_ID_2);
	--Tajo
	--elseif TAJO_SKILL and TAJO_CD <= 0.25 and ira >= 10 then
	--	UseSkill(TAJO_ID_1, TAJO_ID_2);
	end
	
end
	
	
	