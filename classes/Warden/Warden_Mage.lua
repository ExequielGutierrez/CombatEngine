
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
	--Puñalada de cepalo
	local PUN_CEP_SKILL, PUN_CEP_ID_1, PUN_CEP_ID_2 = Match_CE(498199);
	--Interferencia mágica
	local INT_MAG_SKILL, INT_MAG_ID_1, INT_MAG_ID_2 = Match_CE(493386);
	
		
		
	--BUFFOS--
	
	--Caminante del roble
	if CAM_ROB_SKILL and (CE_READ_PET(102324) == false) then
		UseSkill(CAM_ROB_ID_1, CAM_ROB_ID_2);
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






function CE_WARDEN_MAGE_IMPORT()
	--Consumables first, then rotation in Lua order (pet conditions and pet actions cannot be expressed)
	local Skills = { 1244060, 203503, 200173, 1244062, 493343, 493348, 493406, 499892, 493405, 491668, 493644, 493393, 493391, 493394, 499895, 493395 }
	local conditions = {
		-- 1 costilla 1244060
		[1] = { [12]={ id1="1500235", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 2 Phirius 203503
		[2] = { [2]={ max="33", min="0", status=true }, [40]={ enable=true, status=true } },
		-- 3 estimulante fuerte 200173
		[3] = { [12]={ id1="1500237", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 4 agilidad elfica 1244062
		[4] = { [12]={ id1="501321", id2="0", id3="0", id4="0", status=true }, [17]={ id="501321", status=true, time="0" }, [29]={ enable=true, status=true }, [40]={ enable=true, status=true } },
		-- 5 Caminante del roble 493343
		[5] = {},
		-- 6 Proteccion de la naturaleza 493348
		[6] = { [12]={ id1="503581", id2="0", id3="0", id4="0", status=true } },
		-- 7 Poder feroz 493406
		[7] = { [41]={ enable=true, status=true } },
		-- 8 Explosion de poder 499892
		[8] = { [41]={ enable=true, status=true } },
		-- 9 Guia elfica 493405
		[9] = { [2]={ max="33", min="0", status=true } },
		-- 10 Corazon del roble 491668
		[10] = { [1]={ max="25", min="0", status=true } },
		-- 11 Absorcion de energia 493644
		[11] = { [12]={ id1="504137", id2="0", id3="0", id4="0", status=true }, [29]={ enable=true, status=true } },
		-- 12 Vides espinosas 493393
		[12] = {},
		-- 13 Zarzas freneticas 493391
		[13] = { [2]={ max="100", min="10", status=true }, [39]={ enable=true, status=true } },
		-- 14 Corte cruzado 493394
		[14] = { [39]={ enable=true, status=true } },
		-- 15 Corte de viento 499895
		[15] = {},
		-- 16 Corte cargado 493395
		[16] = { [2]={ max="100", min="10", status=true } }
	}
	local iss = {}
	local consumables = {
		[200173] = true,
		[1244062] = true,
		[1244060] = true,
		[203503] = true
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
