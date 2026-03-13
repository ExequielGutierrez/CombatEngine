
--Lua Rouge/MAGE BY NEORAXER 20-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_WARDEN_MAGE()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	
	local pm = UnitMana("player")
	local ira = UnitSkill("player")
    local MaxPm = UnitMaxMana("player")
    local hp = UnitHealth("player")
    local MaxHp = UnitMaxHealth("player")
	
	--Caminante del roble
	local CAM_ROB_SKILL, CAM_ROB_ID_1, CAM_ROB_ID_2 = Match_CE(493343);
	--Escudo de zarzas
	local ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2 = Match_CE(493642);	
	--Protección de la naturaleza
	local PRO_NAT_SKILL, PRO_NAT_ID_1, PRO_NAT_ID_2 = Match_CE(493348);		
	--Corazón del roble -> res 2 golpes
	local COR_ROB_SKILL, COR_ROB_ID_1, COR_ROB_ID_2 = Match_CE(491668);
	local COR_ROB_CD = CE_CD(COR_ROB_SKILL, COR_ROB_ID_1, COR_ROB_ID_2);	
	--Guia elfica -> restore pm
	local GUI_ELF_SKILL, GUI_ELF_ID_1, GUI_ELF_ID_2 = Match_CE(493405);
	local GUI_ELF_CD = CE_CD(GUI_ELF_SKILL, GUI_ELF_ID_1, GUI_ELF_ID_2);			
	--Poder feroz -> + daño
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);
	--Explosión de poder
	local EXP_POD_SKILL, EXP_POD_ID_1, EXP_POD_ID_2 = Match_CE(499892);
	local EXP_POD_CD = CE_CD(EXP_POD_SKILL, EXP_POD_ID_1, EXP_POD_ID_2);
	--Mejora eterea
	local MEJ_ETE_SKILL, MEJ_ETE_ID_1, MEJ_ETE_ID_2 = Match_CE(498214);
	local MEJ_ETE_CD = CE_CD(MEJ_ETE_SKILL, MEJ_ETE_ID_1, MEJ_ETE_ID_2);
	--Absorción de energia
	local ABS_ENE_SKILL, ABS_ENE_ID_1, ABS_ENE_ID_2 = Match_CE(493644);
	local ABS_ENE_CD = CE_CD(ABS_ENE_SKILL, ABS_ENE_ID_1, ABS_ENE_ID_2);	
	--Zarzas Freneticas
	local ZAR_FRE_SKILL, ZAR_FRE_ID_1, ZAR_FRE_ID_2 = Match_CE(493391);
	local ZAR_FRE_CD = CE_CD(ZAR_FRE_SKILL, ZAR_FRE_ID_1, ZAR_FRE_ID_2);
	--Vides espinozas
	local VID_ESP_SKILL, VID_ESP_ID_1, VID_ESP_ID_2 = Match_CE(493393);
	local VID_ESP_CD = CE_CD(VID_ESP_SKILL, VID_ESP_ID_1, VID_ESP_ID_2);
	--Corte Cruzado
	local COR_CRU_SKILL, COR_CRU_ID_1, COR_CRU_ID_2 = Match_CE(493394);
	local COR_CRU_CD = CE_CD(COR_CRU_SKILL, COR_CRU_ID_1, COR_CRU_ID_2);
	--Corte de viento
	local COR_VIE_SKILL, COR_VIE_ID_1, COR_VIE_ID_2 = Match_CE(499895);
	local COR_VIE_CD = CE_CD(COR_VIE_SKILL, COR_VIE_ID_1, COR_VIE_ID_2);
	--Corte cargado
	local COR_CARG_SKILL, COR_CARG_ID_1, COR_CARG_ID_2 = Match_CE(493395);
	local COR_CARG_CD = CE_CD(COR_CARG_SKILL, COR_CARG_ID_1, COR_CARG_ID_2);
	--Oración élfica
	local ORA_ELF_SKILL, ORA_ELF_ID_1, ORA_ELF_ID_2 = Match_CE(493398);
	local ORA_ELF_CD = CE_CD(ORA_ELF_SKILL, ORA_ELF_ID_1, ORA_ELF_ID_2);
	--Huida apurada
	local HUI_APU_SKILL, HUI_APU_ID_1, HUI_APU_ID_2 = Match_CE(494616);
	local HUI_APU_CD = CE_CD(HUI_APU_SKILL, HUI_APU_ID_1, HUI_APU_ID_2);
	--Puñalada de cepalo
	local PUN_CEP_SKILL, PUN_CEP_ID_1, PUN_CEP_ID_2 = Match_CE(498199);
	--Interferencia mágica
	local INT_MAG_SKILL, INT_MAG_ID_1, INT_MAG_ID_2 = Match_CE(493386);
	
		
		
	--BUFFOS--
	
	--Caminante del roble
	if CAM_ROB_SKILL and (CE_READ_PET(102324) == false) then
		UseSkill(CAM_ROB_ID_1, CAM_ROB_ID_2);
	--Escudo de zarzas
	elseif ESC_ZAR_SKILL and (CE_BuffIdPlayer(503958) == false) then
		UseSkill(ESC_ZAR_ID_1, ESC_ZAR_ID_2);
	--Protección de la naturaleza
	elseif PRO_NAT_SKILL and (CE_BuffIdPlayer(503581) == false) then
		UseSkill(PRO_NAT_ID_1, PRO_NAT_ID_2);
	end



	--BUFFOS OFENSIVOS--

	--Poder feroz
	if POD_FER_SKILL and POD_FER_CD <= 0.25 and (_G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS()) then
		UseSkill(POD_FER_ID_1, POD_FER_ID_2);
	--Explosión de poder
	elseif EXP_POD_SKILL and EXP_POD_CD <= 0.25 and (_G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS()) then
		UseSkill(EXP_POD_ID_1, EXP_POD_ID_2);
	--Mejora eterea
	elseif MEJ_ETE_SKILL and MEJ_ETE_CD <= 0.25 and CE_TARGET_IS_BOSS() then
		UseSkill(MEJ_ETE_ID_1, MEJ_ETE_ID_2);
		
	end

	
	-- HABILIDADES DE RESTAURACIÓN
	
	--Guia elfica
	if GUI_ELF_SKILL and GUI_ELF_CD <= 0.25 and pm <= MaxPm/3 then
		UseSkill(GUI_ELF_ID_1, GUI_ELF_ID_2);
	--Corazón del roble
	elseif COR_ROB_SKILL and COR_ROB_CD <= 0.25 and hp <= MaxHp/4 then
		UseSkill(COR_ROB_ID_1, COR_ROB_ID_2);	
	--Oracion elfica
	elseif CE_READ_PET(102324) and ORA_ELF_SKILL and ORA_ELF_CD <= 0.25 and UnitHealth("pet") <= UnitMaxHealth("pet")/2 then
		UseSkill(ORA_ELF_ID_1, ORA_ELF_ID_2);
	--Huida apurada
	elseif CE_READ_PET(102324) and HUI_APU_SKILL and HUI_APU_CD <= 0.25 and UnitHealth("pet") <= UnitMaxHealth("pet")/5 then
		UseSkill(HUI_APU_ID_1, HUI_APU_ID_2);
	end
	
	
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar costilla de primera
		if (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/3 and CE_UseItem(203503) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end
	

--Puñalada de cepalo
    if CE_READ_PET(102324) and PUN_CEP_SKILL then
        UsePetAction(5);
	end
	--Interferencia mágica
    if CE_READ_PET(102324) and INT_MAG_SKILL and CE_TARGET_IS_BOSS() then
        UsePetAction(6);
	end



	if CE_READ_PET(102324) then
		--Absorción de energia
		if ABS_ENE_SKILL and ABS_ENE_CD <= 0.25 and CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(504137) == false) then
			UseSkill(ABS_ENE_ID_1, ABS_ENE_ID_2); 
		--Vides esínozas
		elseif VID_ESP_SKILL and VID_ESP_CD <= 0.25 then
			UseSkill(VID_ESP_ID_1, VID_ESP_ID_2) 
		--Zarzas Freneticas
		elseif ZAR_FRE_SKILL and ZAR_FRE_CD <= 0.25 and pm > 1000 and _G.C_EngineSettings.AOE then
			UseSkill(ZAR_FRE_ID_1, ZAR_FRE_ID_2);		
		--Corte Cruzado
		elseif COR_CRU_SKILL and COR_CRU_CD <= 0.25 and _G.C_EngineSettings.AOE then
			UseSkill(COR_CRU_ID_1, COR_CRU_ID_2)
		--Corte de viento
		elseif COR_VIE_SKILL and COR_VIE_CD <= 0.25 then
			UseSkill(COR_VIE_ID_1, COR_VIE_ID_2)
		--Corte cargado
		elseif COR_CARG_SKILL and COR_CARG_CD <= 0.25 and pm > 1000 then
			UseSkill(COR_CARG_ID_1, COR_CARG_ID_2);
		end
	end
end






